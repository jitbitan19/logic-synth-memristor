/*************************************************************************
  This program takes a NOT/NOR netlist that is generated as the output
  of the ABC tool, and generates statistics for memristor crossbar
  mapping using both ASAP and ALAP schedules. The program has to be
  invoked as:
  $ ./a  <file-name>

  There are some constraints on the input file format.
  a) There must be a dot ('.') in the first column of the last line
     of the file.
  b) Arbitrary variable names are not allowed; variables can only
     start with either 'n' or 'x' followed by a number. For example,
     n15, n3, x1, x235, etc.
***********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include <stdbool.h>
#include <sys/stat.h>

#define MAXGATES 5000
#define MAXFANIN 5
#define MAXLEVEL 500
#define MAXPI 100
#define MAX_GATES_LEVEL 5000
#define MAX_LEVELS 500
#define MAXROW 5000
#define MAXCOL 500
#define MAXCPY 100
#define OUTBIAS 10000

typedef struct memristive_gate
{                                          // A simpler gate structure to hold the mappings
  int fanin;                               // Number of inputs
  struct memristive_gate *input[MAXFANIN]; // A 2D array to hold the input locations
  int value;                               // Value of the gate
  int idx;                                 // Row index in the crossbar
  int jdx;                                 // Col index in the crossbar
  int state;                               // Output of the gate
  int asap_level;                          // Scheduling level of the gate (ASAP)
  bool is_copy;                            // Indicative if that gate is a copied output
} memristive_gate;

typedef struct
{                             // Table gate structuure
  int fanin;                  // Number of inputs
  int input[MAXFANIN];        // An array to hold the input lines
  int out;                    // The output line for the gate.
  int asap_level;             // ASAP (As Soon As Possible) schedule level for the gate.
  int alap_level;             // ALAP (As Late As Possible) schedule level for the gate.
  int list_level;             // List-based scheduling level.
  int mobility;               // Difference between alap_level and asap_level
  int output_gates[MAXGATES]; // Stores indices of gates that use this gate's output
  int output_count;           // Number of gates in output_gates array
  bool is_output;             // Indicates whether the gate is an output line
  memristive_gate *gate_map;  // Pointer to the actual mapping
} table_gate;

// Global Variables
table_gate gates[MAXGATES];               // Array to hold all the gates in the circuit.
table_gate tgate;                         // Temporary variable used to store gate data while parsing.
memristive_gate crossbar[MAXROW][MAXCOL]; // The crossbar array to hold the memristors
memristive_gate *tmem;                    // A temp pointer to a memristive gate in a crossbar
int primary_inputs[MAXPI];                // Array to store primary input identifiers.
char buffer[20];                          // To store temporary formatted names
int num_ip = 0;                           // Number of primary inputs.
int num_op = 0;                           // Number of outputs
int num_gates = 0;                        // Number of gates;
int tempvar = 1;                          // Temporary lines start as -1, -2, etc.
FILE *file;                               // A file pointer that will point to the netlist file being read.
int primary_input_values[MAXPI];          // Stores the values for the primary inputs
int gate_values[MAXGATES];                // Stores the values for the gates
int max_asap = 0;                         // Total no of asap levels for the given netlist
int max_alap = 0;                         // Total no of alap levels for the given netlist
int max_list = 0;                         // Total no of list levels for the given netlist
int max_idx = 0;                          // Total used rows of the memristor crossbar
int max_jdx = 0;                          // Total used cols of the memristor crossbar
char bench_name[25];                      // Name of the current benchmark file

// Functions prototypes
int cmp_level(const void *a, const void *b);
void assign_random_binary_values();
void find_primary_inputs();
void map_level_to_crossbar(int level);
void print_stat();
void print_gates();
void print_gates();
void parse_gates();
void find_gate_outputs();
void print_gate_outputs();
int count_v(char x[]);
void get_vars(char x[], int varid[], int nv);
int isPI(int lineid);
int isPO(int lineid);
int get_asap_level(int lineid);
int get_list_level(int lineid);
int get_alap_level(int lineid);
void compute_asap_level();
void compute_alap_level();
int all_alap_labeled();
void update_alap(int index, int lineid);
void compute_list_level();
int list_schedule_possible(int maxlevel, int maxgates);
void naive_map();
void compact_map();
void show_crossbar(int);
void name_format(memristive_gate *);
void gen_nor_module();
void wire_format(int);
void get_bench_name(const char *, char *);

/*************** MAIN FUNCTION ********************/
int main(int argc, char *argv[])
{

  // char dir[100] = "BENCH/iscas_bench/";
  // char *ext = ".txt";
  // strcpy(bench_name, argv[1]);

  // strcat(dir, argv[1]);
  // strcat(dir, ext);
  // file = fopen(dir, "r");

  file = fopen(argv[1], "r");
  get_bench_name(argv[1], bench_name);

  int i;
  parse_gates();
  fclose(file);

  // find_gate_outputs();
  // print_gate_outputs();

  for (i = 0; i < num_gates; i++)
  {
    gates[i].asap_level = -1;
    gates[i].alap_level = -1;
    gates[i].list_level = -1;
  }

  compute_asap_level();
  compute_alap_level();
  compute_list_level();

  // find_primary_inputs();
  // assign_random_binary_values();

  // initialize the gate_values array to -1
  for (int i = 0; i < MAXGATES; i++)
    gate_values[i] = -1;

  // printf("\n\n");
  // For each level, perform the two-stage crossbar mapping.
  // for (int level = 1; level <= max_asap; level++)
  // 	map_level_to_crossbar(level);

  // print_gates();
  print_stat();

  gen_nor_module();
  naive_map();
  compact_map();
}

/*******************************************************
  Generates the NOR/NOT mapped verilog module for given
  the gate configuration and inter-relations
*******************************************************/
void gen_nor_module()
{
  char result_file_path[100];
  sprintf(result_file_path, "Results/magic/%s_magic.v", bench_name);
  file = fopen(result_file_path, "w");

  fprintf(file, "// NOR_NOT mapped module module_name\n\n");
  qsort(gates, num_gates, sizeof(table_gate), cmp_level);

  // Module declr 1
  // printf("module NOR_2 (\n");
  // for (int i = 0; i < num_ip; i++)
  //   printf("  ip_%d,\n", i + 1);
  // for (int i = 0; i < num_op - 1; i++)
  //   printf("  op_%d,\n", i + 1);
  // printf("  op_%d\n", num_op);
  // printf(");\n\n");

  // for (int i = 0; i < num_ip; i++)
  //   printf("input  i%d;\n", i + 1);
  // for (int i = 0; i < num_op - 1; i++)
  //   printf("output i%d;\n", i + 1);
  // printf("output i%d;\n\n", num_op);

  // Module declr 2
  fprintf(file, "module module_name (\n");
  for (int i = 0; i < num_ip; i++)
    fprintf(file, "  input  ip_%d,\n", i + 1);
  for (int i = 0; i < num_op - 1; i++)
    fprintf(file, "  output op_%d,\n", i + 1);
  fprintf(file, "  output op_%d\n);\n", num_op);
  fprintf(file, "\n");

  for (int i = num_op + 1; i <= num_gates; i++)
    fprintf(file, "  wire wr_%d;\n", i);
  fprintf(file, "\n");

  for (int i = 0; i < num_gates; i++)
  {
    char temp = ')';
    int ip1 = gates[i].input[0];
    int ip2 = gates[i].input[1];
    wire_format(gates[i].out);

    if (gates[i].fanin == 1)
    {
      sprintf(buffer, "g%d", i + 1);
      fprintf(file, "  not %5s", buffer);
      wire_format(gates[i].out);
      fprintf(file, "( %-7s,", buffer);
      wire_format(ip1);
      fprintf(file, " %8s %-7s );\n", " ", buffer);
    }
    else
    {
      sprintf(buffer, "g%d", i + 1);
      fprintf(file, "  nor %5s(", buffer);
      wire_format(gates[i].out);
      fprintf(file, " %-7s,", buffer);
      wire_format(ip1);
      fprintf(file, " %-7s,", buffer);
      wire_format(ip2);
      fprintf(file, " %-7s );\n", buffer);
    }
  }
  fprintf(file, "\nendmodule\n");
  fclose(file);
}

/*******************************************************
  Maps the given gate configuration into a crossbar
  using naive mapping. Modifies the global crossbar
  2D array for memristor placement.
*******************************************************/
void naive_map()
{
  max_idx = 0, max_jdx = 0;
  for (int i = 0; i < MAXROW; i++)
  {
    for (int j = 0; j < MAXCOL; j++)
    {

      crossbar[i][j].value = -1;
      crossbar[i][j].idx = -1;
      crossbar[i][j].jdx = -1;
      crossbar[i][j].asap_level = -1;
      crossbar[i][j].fanin = 0;
    }
  }
  for (int i = 0; i < num_gates; i++)
    gates[i].gate_map = NULL;
  qsort(gates, num_gates, sizeof(table_gate), cmp_level);

  int inv_map[MAXGATES];
  for (int i = 0; i < MAXGATES; i++)
    inv_map[gates[i].out] = i;

  max_jdx = num_ip - 1;
  for (int j = 0; j < num_ip; j++)
  {
    crossbar[0][j].value = MAXGATES + j;
    crossbar[0][j].idx = 0;
    crossbar[0][j].jdx = j;
  }

  for (int i = 0; i < num_gates; i++)
  {
    max_jdx++;
    int ip1 = gates[i].input[0], ip2 = -1;
    if (gates[i].fanin > 1)
      ip2 = gates[i].input[1];

    crossbar[0][max_jdx].fanin = gates[i].fanin;
    crossbar[0][max_jdx].value = gates[i].out;
    crossbar[0][max_jdx].jdx = max_jdx;
    crossbar[0][max_jdx].idx = max_idx;
    crossbar[0][max_jdx].asap_level = gates[i].asap_level;
    gates[i].gate_map = &crossbar[0][max_jdx];

    if (ip1 >= MAXGATES)
      crossbar[0][max_jdx].input[0] = &crossbar[0][ip1 - MAXGATES];
    else if (ip1 < MAXGATES)
    {
      // printf("%d, %d\n ", gates[i].out, gates[inv_map[ip1]].gate_map->jdx);
      crossbar[0][max_jdx].input[0] = gates[inv_map[ip1]].gate_map;
    }

    if (ip2 >= MAXGATES)
      crossbar[0][max_jdx].input[1] = &crossbar[0][ip2 - MAXGATES];
    else if (ip2 > 0)
      crossbar[0][max_jdx].input[1] = gates[inv_map[ip2]].gate_map;
  }

  show_crossbar(1);
}

/*******************************************************
  Maps the given gate configuration into a crossbar
  using compact mapping. Modifies the global crossbar
  2D array for memristor placement.
*******************************************************/
void compact_map()
{
  max_idx = 0, max_jdx = 0;
  for (int i = 0; i < MAXROW; i++)
  {
    for (int j = 0; j < MAXCOL; j++)
    {

      crossbar[i][j].value = -1;
      crossbar[i][j].idx = -1;
      crossbar[i][j].jdx = -1;
      crossbar[i][j].asap_level = -1;
      crossbar[i][j].fanin = 0;
    }
  }
  for (int i = 0; i < num_gates; i++)
    gates[i].gate_map = NULL;
  qsort(gates, num_gates, sizeof(table_gate), cmp_level);

  int inv_map[MAXGATES];
  for (int i = 0; i < MAXGATES; i++)
    inv_map[gates[i].out] = i;
  int av_row[MAXROW];
  memset(av_row, 0, sizeof(av_row));

  for (int i = 0; i < num_ip; i++)
  {
    crossbar[i][0].value = MAXGATES + i;
    crossbar[i][0].idx = i;
    crossbar[i][0].jdx = 0;
    av_row[i] = 1;
  }
  max_idx = num_ip - 1;

  for (int i = 0; i < num_gates; i++)
  {
    int ip1 = gates[i].input[0], ip2;

    if (gates[i].fanin == 1) // NOT Gate
    {
      int map_idx = (ip1 >= MAXGATES) ? ip1 - MAXGATES : gates[inv_map[ip1]].gate_map->idx;
      int map_jdx = av_row[map_idx]++;
      tmem = &crossbar[map_idx][map_jdx];
      tmem->idx = map_idx;
      tmem->jdx = map_jdx;
      tmem->fanin = 1;
      tmem->value = gates[i].out;
      tmem->asap_level = gates[i].asap_level;
      tmem->input[0] = (ip1 >= MAXGATES) ? &crossbar[ip1 - MAXGATES][0] : gates[inv_map[ip1]].gate_map;
      gates[i].gate_map = tmem;

      if (map_jdx > max_jdx)
        max_jdx = map_jdx;
    }
    else // NOR Gate
    {
      ip2 = gates[i].input[1];
      int temp_idx = (ip1 >= MAXGATES) ? (ip1 - MAXGATES) : gates[inv_map[ip1]].gate_map->idx;
      int temp_jdx = (ip1 >= MAXGATES) ? 0 : gates[inv_map[ip1]].gate_map->jdx;
      int temp_udx = (ip2 >= MAXGATES) ? (ip2 - MAXGATES) : gates[inv_map[ip2]].gate_map->idx;
      int temp_vdx = (ip2 >= MAXGATES) ? 0 : gates[inv_map[ip2]].gate_map->jdx;

      int map_idx, map_jdx;
      if (temp_idx == temp_udx)
      {
        map_idx = temp_idx;
        map_jdx = av_row[temp_idx]++;
      }
      else
      {
        map_idx = temp_udx;
        map_jdx = av_row[map_idx]++;

        tmem = &crossbar[map_idx][map_jdx];
        tmem->is_copy = true;
        tmem->input[0] = &crossbar[temp_idx][temp_jdx];
        tmem->value = crossbar[temp_idx][temp_jdx].value;
        tmem->idx = map_idx;
        tmem->jdx = map_jdx;

        temp_idx = map_idx;
        temp_jdx = map_jdx;
        map_jdx = av_row[map_idx]++;
      }

      tmem = &crossbar[map_idx][map_jdx];
      tmem->asap_level = gates[i].asap_level;
      tmem->value = gates[i].out;
      tmem->idx = map_idx;
      tmem->jdx = map_jdx;
      tmem->fanin = 2;
      tmem->input[0] = &crossbar[temp_idx][temp_jdx];
      tmem->input[1] = &crossbar[temp_udx][temp_vdx];
      gates[i].gate_map = tmem;

      if (map_idx > max_idx)
        max_idx = map_idx;
      if (map_jdx > max_jdx)
        max_jdx = map_jdx;
    }
  }

  show_crossbar(0);
}

/*******************************************************
  Shows the memristor placement in the global crossbar
  array in the micro-operation file format with metrics
*******************************************************/
void show_crossbar(int flag)
{
  char result_file_path[100];
  if (flag)
    sprintf(result_file_path, "Results/micro_ins_naive/%s_naive.txt", bench_name);
  else
    sprintf(result_file_path, "Results/micro_ins_compact/%s_compact.txt", bench_name);
  file = fopen(result_file_path, "w");

  int curr_level = 0;
  for (int l = 0; l < max_asap; l++)
  {
    for (int i = 0; i <= max_idx; i++)
    {
      for (int j = 0; j <= max_jdx; j++)
      {
        if (crossbar[i][j].value == -1 || crossbar[i][j].value >= MAXGATES)
          continue;
        if (crossbar[i][j].is_copy || crossbar[i][j].asap_level != l)
          continue;

        if (crossbar[i][j].asap_level > curr_level)
        {
          curr_level = crossbar[i][j].asap_level;
          fprintf(file, "# Level: %2d _____________________________________\n", curr_level);
        }

        fprintf(file, "%4d %5s ", crossbar[i][j].idx, "False");
        memristive_gate *ip1 = crossbar[i][j].input[0];
        memristive_gate *ip2 = crossbar[i][j].input[1];

        fprintf(file, "%4d ", ip1->jdx);
        name_format(ip1);
        fprintf(file, "%9s ", buffer);

        if (crossbar[i][j].fanin > 1)
        {
          fprintf(file, "%4d", ip2->jdx);
          name_format(ip2);
          fprintf(file, "%9s ", buffer);
        }
        else
          fprintf(file, "%14s", " ");

        fprintf(file, "%4d ", crossbar[i][j].jdx);
        fprintf(file, "True\n");
      }
    }
  }
  fprintf(file, "\n");
  fprintf(file, "Metrics\n");
  fprintf(file, "-------\n");
  fprintf(file, "Primary Inputs    : %d\n", num_ip);
  fprintf(file, "Levels            : %d\n", curr_level);
  fprintf(file, "Read Operations   : %d\n", max_asap);
  fprintf(file, "Write Operations  : %d\n", 2 * max_asap + 1);
  fprintf(file, "Evaluation Cycles : %d\n", max_asap);
  fprintf(file, "Total Cycles      : %d\n", 4 * max_asap + 1);
  fprintf(file, "Crossbar Size     : %dx%d\n", max_idx + 1, max_jdx + 1);
  fprintf(file, "---------------------------\n\n\n");

  fclose(file);
}

/*******************************************************
  A dummy function that formates the wire/input/output
  names for the micro-operation generation
*******************************************************/
void name_format(memristive_gate *mem)
{
  if (mem->value >= MAXGATES)
    sprintf(buffer, "/%d", mem->value - MAXGATES);
  else if (mem->is_copy)
    name_format(mem->input[0]);
  else
    sprintf(buffer, "%dx%d", mem->idx, mem->jdx);
}

/*******************************************************
  A dummy function that formates the wire/input/output
  names for the module
*******************************************************/
void wire_format(int ip)
{
  if (ip >= MAXGATES)
    sprintf(buffer, "ip_%d", ip - MAXGATES + 1);
  else if (ip > num_op)
    sprintf(buffer, "wr_%d", ip);
  else
    sprintf(buffer, "op_%d", ip);
}

void get_bench_name(const char *path, char *out)
{
  const char *slash = strrchr(path, '/');
  const char *filename = slash ? slash + 1 : path;
  const char *dot = strrchr(filename, '.');
  size_t len = dot ? (size_t)(dot - filename) : strlen(filename);
  strncpy(out, filename, len);
  out[len] = '\0';
}

int cmp_level(const void *a, const void *b)
{
  const table_gate *p1 = a, *p2 = b;
  if (p1->asap_level < p2->asap_level)
    return -1;
  if (p1->asap_level > p2->asap_level)
    return 1;
  return 0;
}

void assign_random_binary_values()
{
  srand(time(NULL)); // Seed the random number generator with the current time

  // printf("Assigning random binary values to primary inputs:\n");
  for (int i = 0; i < num_ip; i++)
  {
    int random_value = rand() % 2;          // Generate a random binary value (0 or 1)
    primary_input_values[i] = random_value; // Store the value in the array

    // printf("Primary input %d assigned value: %d\n", primary_inputs[i] - MAXGATES, random_value);
  }
}

void find_primary_inputs()
{
  int k;
  // will find the primary inputs for a given netlist , they would have number greater than MAXGATES
  for (k = 0; k < num_gates; k++)
  {
    // now check the inputs of the gates for any value greater than MAXGATES and store it
    for (int j = 0; j < gates[k].fanin; j++)
    {
      if (gates[k].input[j] >= MAXGATES)
      { // however only update it if it is not already present in the primary_inputs array
        int found = 0;
        for (int i = 0; i < num_ip; i++)
        {
          if (primary_inputs[i] == gates[k].input[j])
          {
            found = 1;
            break;
          }
        }
        if (found == 0)
        {
          primary_inputs[num_ip++] = gates[k].input[j];
        }
      }
    }
  }
  // printf("\n");
  // printf("no of primary inputs is %d \n", num_ip);
  // // print the primary inputs after subtracting MAXGATES from them
  // for (int i = 0; i < num_ip; i++)
  // {
  // 	printf("%d ", primary_inputs[i] - MAXGATES);
  // }
  // printf("\n");
}

void map_level_to_crossbar(int level)
{
  // collect all the gates belonging to the current level
  int num_gates = 0; // num_gates: Number of gates in the current level.
  int gates_in_level[MAX_GATES_LEVEL];
  for (int i = 0; i < num_gates; i++)
  {
    if (gates[i].asap_level == level)
    {
      gates_in_level[num_gates++] = i;
    }
  }
  // we can now proceed to map these gates to the crossbar
  for (int i = 0; i < num_gates; i++)
  {
    int gate_index = gates_in_level[i]; // gate_index: Index of the current gate in the gates array
    if (gates[gate_index].fanin == 1)
    {
      // NOT gate
      printf("Gate %d: NOT gate\n", gates[gate_index].out);
      // also want to print for the current gate, which gates inputs it to
      printf("Gate %d inputs from: ", gates[gate_index].out);
      for (int j = 0; j < gates[gate_index].fanin; j++)
      {
        printf("Gate %d ", gates[gate_index].input[j]);
      }
      printf("\n");
    }
    else
    {
      // NOR gate
      printf("Gate %d: NOR gate\n", gates[gate_index].out);
      // also want to print for the current gate, which gates inputs it to
      printf("Gate %d inputs from: ", gates[gate_index].out);
      for (int j = 0; j < gates[gate_index].fanin; j++)
      {
        printf("Gate %d ", gates[gate_index].input[j]);
      }
      printf("\n");
    }
  }
  // We will now print the micro-operation summary for the current level in two stages 1-initialisation 2-evaluation
  // 1-initialisation: for any gate we will check its inputs (the input memristors) and use its stored value
  // (either primary_input_values or gate_values) and set the output memristor to V0
  printf("Initialisation stage for level %d:\n", level);
  for (int i = 0; i < num_gates; i++)
  {
    int gate_index = gates_in_level[i];
    printf("Gate %d: ", gates[gate_index].out);
    for (int j = 0; j < gates[gate_index].fanin; j++)
    {
      int input = gates[gate_index].input[j];
      int input_value;
      if (input >= MAXGATES)
      {
        // Primary input
        input_value = primary_input_values[input - MAXGATES];
      }
      else
      {
        // Gate output
        input_value = gate_values[input];
      }
      printf("Input %d: %d ", input, input_value);
    }
    printf("Output %d: V0\n", gates[gate_index].out);
  }
  // 2-Evaluation phase , now again for each gate in the level we will perform NOR or NOT operation (based on the current gate) on the input values and storte them in output memristors and print the values
  printf("Evaluation stage for level %d:\n", level);
  for (int i = 0; i < num_gates; i++)
  {
    int gate_index = gates_in_level[i];
    printf("Gate %d: ", gates[gate_index].out);
    int output_value;
    if (gates[gate_index].fanin == 1)
    {
      // NOT gate
      int input = gates[gate_index].input[0];
      int input_value;
      if (input >= MAXGATES)
      {
        // Primary input
        input_value = primary_input_values[input - MAXGATES];
      }
      else
      {
        // Gate output
        input_value = gate_values[input];
      }
      output_value = !input_value;
      printf("Input %d: %d Output %d: %d\n", input, input_value, gates[gate_index].out, output_value);
    }
    else
    {
      // NOR gate
      int input1 = gates[gate_index].input[0];
      int input2 = gates[gate_index].input[1];
      int input1_value, input2_value;
      if (input1 >= MAXGATES)
      {
        // Primary input
        input1_value = primary_input_values[input1 - MAXGATES];
      }
      else
      {
        // Gate output
        input1_value = gate_values[input1];
      }
      if (input2 >= MAXGATES)
      {
        // Primary input
        input2_value = primary_input_values[input2 - MAXGATES];
      }
      else
      {
        // Gate output
        input2_value = gate_values[input2];
      }
      output_value = !(input1_value || input2_value);
      printf("Input %d: %d Input %d: %d Output %d: %d\n", input1, input1_value, input2, input2_value, gates[gate_index].out, output_value);
    }
    gate_values[gates[gate_index].out] = output_value;
  }

  // Summary of the mapping:
  printf("------------------------------------------------------------\n");
  printf("For level %d : %d rows x 3 columns\n\n", level, num_gates);
}

/***********************************************
  Print the final statistics from the schedule
***********************************************/
void print_stat() // The print_stat function calculates and prints various statistics about the scheduling methods.
{                 // maxl: Tracks the maximum level.
  char result_file_path[100];
  sprintf(result_file_path, "Results/schedule_stats/%s_stats.txt", bench_name);
  file = fopen(result_file_path, "w");

  int i, j, maxl, count, maxgates, gates_level;
  int gate_count[MAXLEVEL];
  int cross_rows[500];                                            // Tracks the rows in a crossbar array for the memristors.
  int asap_not, asap_nor, alap_not, alap_nor, list_not, list_nor; // Counters for NOT and NOR gates in different schedules
  int asap_memr_serial, alap_memr_serial, list_memr_serial;
  int time_serial, time_parallel; // Time steps required in serial and parallel execution models.

  //************* FOR ASAP SCHEDULE ***********
  maxl = 0;
  asap_not = 0;
  asap_nor = 0; // This block finds the maximum ASAP level (maxl), and counts how many NOT (asap_not) and NOR (asap_nor) gates are present in the ASAP schedule.
  for (i = 0; i < num_gates; i++)
  {
    if (gates[i].asap_level > maxl)
      maxl = gates[i].asap_level;

    if (gates[i].fanin == 1)
      asap_not++;
    else
      asap_nor++;
  }
  // The array gate_count[] stores how many gates exist at each level.
  for (i = 0; i < maxl; i++) // It is initialized, and then populated based on the asap_level of each gate.
    gate_count[i] = 0;

  for (i = 0; i < num_gates; i++)
    gate_count[gates[i].asap_level - 1]++;

  maxgates = 0; // maxgates: keeps track of the maximum number of gates at any level in the ASAP schedule.
  for (i = 0; i < maxl; i++)
    if (gate_count[i] > maxgates)
      maxgates = gate_count[i];

  fprintf(file, "ASAP SCHEDULE:"); // The code prints the gate distribution across levels, the number of levels, and the maximum number of gates in a level for the ASAP schedule.
  fprintf(file, "\n=============");

  fprintf(file, "\nGate distribution across levels:\n  ");
  for (i = 0; i < maxl; i++)
    fprintf(file, "%d ", gate_count[i]);

  fprintf(file, "\nNumber of levels: %d, MaxGates: %d", maxl, maxgates);

  // ** Now count the number of memristors and crossbar columns **
  for (i = 0; i < maxgates; i++) // Initialize the cross_rows array to track how many crossbar rows are used for memristors at each level. Each entry in cross_rows represents a "row" in the crossbar where memristors are assigned. Initially, all rows are set to 0, meaning no memristor is assigned yet.
    cross_rows[i] = 0;           // maxgates: is the maximum number of gates at any level, and each gate can take up a certain number of rows in the crossbar based on the gate's fan-in (input size).
  for (i = 1; i <= maxl; i++)    // Loop through levels. This block assigns memristors to the cross_rows array based on the fan-in of the gates.
  {
    gates_level = 0;                // gates_level: This is a counter that tracks how many gates you are placing at each level.
    for (j = 0; j < num_gates; j++) // Loop through all gates
    {
      if (gates[j].asap_level == i) // If gate is at current level
      {
        if (gates[j].fanin == 1)            // If it's a NOT gate (1 input)
        {                                   // cross_rows[gates_level]: This array tracks how many rows of the crossbar are being used at each level, based on the type of gates.
          if (cross_rows[gates_level] == 2) // If row is already used by a NOR gate
            cross_rows[gates_level] = 3;    // Set as 3, meaning both gate types use this row
          else
            cross_rows[gates_level] = 1; // Set as 1, meaning only a NOT gate uses this row
          gates_level++;
        }
        if (gates[j].fanin == 2) // If it's a NOR gate (2 inputs)
        {
          if (cross_rows[gates_level] == 1) // If row is already used by a NOT gate
            cross_rows[gates_level] = 3;    // Set as 3, meaning both gate types use this row
          else
            cross_rows[gates_level] = 2; // Set as 2, meaning only a NOR gate uses this row
          gates_level++;
        }
      }
    }
  }

  asap_memr_serial = 0; //  Counting Total Memristors (Serial Configuration)
  for (i = 0; i < maxgates; i++)
    if (cross_rows[i] == 1)
      asap_memr_serial += 2;
    else
      asap_memr_serial += 3;
  fprintf(file, "\nNumber of memristors: %d", asap_memr_serial);

  time_parallel = 2 * maxl;
  time_serial = asap_not + asap_nor + maxl;
  fprintf(file, "\nTime steps (serial): %d, Time steps (parallel): %d",
          time_serial, time_parallel);

  fprintf(file, "\nCrossbar size (serial): %d x %d", maxgates, 3); // Crossbar Size in Parallel Configuration
  count = 0;
  for (i = 0; i < maxgates; i++)
    if (cross_rows[i] == 1)
      count++; // No. of columns less reqd.
  fprintf(file, "\nCrossbar size (parallel): %d x %d", maxgates, (3 * maxgates) - count);

  //************* FOR ALAP SCHEDULE ***********

  maxl = 0;
  alap_not = 0;
  alap_nor = 0;
  for (i = 0; i < num_gates; i++)
  {
    if (gates[i].alap_level > maxl)
      maxl = gates[i].alap_level;

    if (gates[i].fanin == 1)
      alap_not++;
    else
      alap_nor++;
  }

  for (i = 0; i < maxl; i++)
    gate_count[i] = 0;

  for (i = 0; i < num_gates; i++)
    gate_count[gates[i].alap_level - 1]++;

  maxgates = 0;
  for (i = 0; i < maxl; i++)
    if (gate_count[i] > maxgates)
      maxgates = gate_count[i];

  fprintf(file, "\n\nALAP SCHEDULE:");
  fprintf(file, "\n=============");
  fprintf(file, "\nGate distribution across levels:\n  ");
  for (i = 0; i < maxl; i++)
    fprintf(file, "%d ", gate_count[i]);

  fprintf(file, "\nNumber of levels: %d, MaxGates: %d", maxl, maxgates);

  // ** Now count the number of memristors and crossbar columns **
  for (i = 0; i < maxgates; i++)
    cross_rows[i] = 0;

  for (i = 1; i <= maxl; i++)
  {
    gates_level = 0;
    for (j = 0; j < num_gates; j++)
    {
      if (gates[j].alap_level == i)
      {
        if (gates[i].fanin == 1) // NOT -- map to row "gate_count"
        {
          if (cross_rows[gates_level] == 2)
            cross_rows[gates_level] = 3;
          else
            cross_rows[gates_level] = 1;
          gates_level++;
        }
        if (gates[i].fanin == 2) // NOR -- map to row "gate_count"
        {
          if (cross_rows[gates_level] == 1)
            cross_rows[gates_level] = 3;
          else
            cross_rows[gates_level] = 2;
          gates_level++;
        }
      }
    }
  }

  alap_memr_serial = 0;
  for (i = 0; i < maxgates; i++)
    if (cross_rows[i] == 1)
      alap_memr_serial += 2;
    else
      alap_memr_serial += 3;
  fprintf(file, "\nNumber of memristors: %d", alap_memr_serial);

  time_parallel = 2 * maxl;
  time_serial = alap_not + alap_nor + maxl;
  fprintf(file, "\nTime steps (serial): %d, Time steps (parallel): %d",
          time_serial, time_parallel);

  fprintf(file, "\nCrossbar size (serial): %d x %d", maxgates, 3);
  count = 0;
  for (i = 0; i < maxgates; i++)
    if (cross_rows[i] == 1)
      count++; // No. of columns less reqd.
  fprintf(file, "\nCrossbar size (parallel): %d x %d\n", maxgates, (3 * maxgates) - count);

  //************* FOR LIST SCHEDULE ***********
  maxl = 0;
  list_not = 0;
  list_nor = 0;
  for (i = 0; i < num_gates; i++)
  {
    if (gates[i].list_level > maxl)
      maxl = gates[i].list_level;

    if (gates[i].fanin == 1)
      list_not++;
    else
      list_nor++;
  }

  for (i = 0; i < maxl; i++)
    gate_count[i] = 0;

  for (i = 0; i < num_gates; i++)
    gate_count[gates[i].list_level - 1]++;

  maxgates = 0;
  for (i = 0; i < maxl; i++)
    if (gate_count[i] > maxgates)
      maxgates = gate_count[i];

  fprintf(file, "\nLIST SCHEDULE:");
  fprintf(file, "\n=============");

  fprintf(file, "\nGate distribution across levels:\n  ");
  for (i = 0; i < maxl; i++)
    fprintf(file, "%d ", gate_count[i]);

  fprintf(file, "\nNumber of levels: %d, MaxGates: %d", maxl, maxgates);

  // ** Now count the number of memristors and crossbar columns **
  for (i = 0; i < maxgates; i++)
    cross_rows[i] = 0;

  for (i = 1; i <= maxl; i++)
  {
    gates_level = 0;
    for (j = 0; j < num_gates; j++)
    {
      if (gates[j].list_level == i)
      {
        if (gates[i].fanin == 1) // NOT -- map to row "gate_count"
        {
          if (cross_rows[gates_level] == 2)
            cross_rows[gates_level] = 3;
          else
            cross_rows[gates_level] = 1;
          gates_level++;
        }
        if (gates[i].fanin == 2) // NOR -- map to row "gate_count"
        {
          if (cross_rows[gates_level] == 1)
            cross_rows[gates_level] = 3;
          else
            cross_rows[gates_level] = 2;
          gates_level++;
        }
      }
    }
  }

  list_memr_serial = 0;
  for (i = 0; i < maxgates; i++)
    if (cross_rows[i] == 1)
      list_memr_serial += 2;
    else
      list_memr_serial += 3;
  fprintf(file, "\nNumber of memristors: %d", list_memr_serial);

  time_parallel = 2 * maxl;
  time_serial = list_not + list_nor + maxl;
  fprintf(file, "\nTime steps (serial): %d, Time steps (parallel): %d",
          time_serial, time_parallel);

  fprintf(file, "\nCrossbar size (serial): %d x %d", maxgates, 3);
  count = 0;
  for (i = 0; i < maxgates; i++)
    if (cross_rows[i] == 1)
      count++; // No. of columns less reqd.
  fprintf(file, "\nCrossbar size (parallel): %d x %d", maxgates, (3 * maxgates) - count);

  fclose(file);
}

/*****************************************
  Print the gate table
*****************************************/
void print_gates()
{
  printf("Benchmark: %s", bench_name);
  int i, j;

  for (i = 0; i < num_gates; i++) // The loop runs through all the gates (num_gates is the number of gates). For each gate, it prints its relevant details.
  {
    printf("\n");
    if (gates[i].fanin == 1)
      printf("NOT: ");
    if (gates[i].fanin == 2)
      printf("NOR: ");

    printf("%5d : ", gates[i].out);

    for (j = 0; j < gates[i].fanin; j++)
      printf(" %5d", gates[i].input[j]);
    if (gates[i].fanin == 1)
      printf("      ");

    printf(" : ASAP-%2d, ALAP-%2d, MOB-%2d", gates[i].asap_level, gates[i].alap_level, gates[i].mobility);
  }
  printf("\n----------------------------------------------------\n");
}

/***********************************************
  Parse the file as generated by the ABC tool,
  and populate the gate table.
***********************************************/
void parse_gates()
{
  char line[50];
  int varid[10], nvar;

  for (;;)
  {
    fgets(line, sizeof(line), file);

    if (line[0] == '.')
      break;

    nvar = count_v(line); // count how many variables (i.e. n or x)
    get_vars(line, varid, nvar);

    switch (nvar)
    {
    case 2: // NOT gate
      gates[num_gates].fanin = 1;
      gates[num_gates].out = varid[0] >= OUTBIAS ? varid[0] - OUTBIAS : varid[0];
      gates[num_gates].input[0] = varid[1] >= OUTBIAS ? varid[1] - OUTBIAS : varid[1];
      if (varid[0] >= OUTBIAS)
        gates[num_gates].is_output = 1, num_op++;

      if (gates[num_gates].input[0] >= MAXGATES && gates[num_gates].input[0] - MAXGATES + 1 > num_ip)
        num_ip = gates[num_gates].input[0] - MAXGATES + 1;
      num_gates++;
      break;

    case 3: // 2-input NOR
      gates[num_gates].fanin = 2;
      gates[num_gates].out = varid[0] >= OUTBIAS ? varid[0] - OUTBIAS : varid[0];
      gates[num_gates].input[0] = varid[1] >= OUTBIAS ? varid[1] - OUTBIAS : varid[1];
      gates[num_gates].input[1] = varid[2] >= OUTBIAS ? varid[2] - OUTBIAS : varid[2];
      if (varid[0] >= OUTBIAS)
        gates[num_gates].is_output = 1, num_op++;

      if (gates[num_gates].input[0] >= MAXGATES && gates[num_gates].input[0] - MAXGATES + 1 > num_ip)
        num_ip = gates[num_gates].input[0] - MAXGATES + 1;
      if (gates[num_gates].input[1] >= MAXGATES && gates[num_gates].input[1] - MAXGATES + 1 > num_ip)
        num_ip = gates[num_gates].input[1] - MAXGATES + 1;

      num_gates++;
      break;

    case 4: // Two 2-input NOR gates in cascade
      gates[num_gates].fanin = 2;
      gates[num_gates].out = -(tempvar++);
      gates[num_gates].input[0] = varid[2];
      gates[num_gates].input[1] = varid[3];
      num_gates++;
      gates[num_gates].fanin = 2;
      gates[num_gates].out = varid[0];
      gates[num_gates].input[0] = varid[1];
      gates[num_gates].input[1] = -(tempvar - 1);
      num_gates++;
      break;

    case 5: // Three 2-input NOR gates in two levels
      gates[num_gates].fanin = 2;
      gates[num_gates].out = -(tempvar++);
      gates[num_gates].input[0] = varid[1];
      gates[num_gates].input[1] = varid[2];
      num_gates++;
      gates[num_gates].fanin = 2;
      gates[num_gates].out = -(tempvar++);
      gates[num_gates].input[0] = varid[3];
      gates[num_gates].input[1] = varid[4];
      num_gates++;
      gates[num_gates].fanin = 2;
      gates[num_gates].out = varid[0];
      gates[num_gates].input[0] = -(tempvar - 2);
      gates[num_gates].input[1] = -(tempvar - 1);
      num_gates++;
      break;

    default:
      printf("** Invalid variables on line: %s\n", line);
      exit;
    }
  }
}

void find_gate_outputs()
{
  for (int i = 0; i < num_gates; i++)
  { // Outer loop: iterate over all gates
    for (int k = 0; k < num_gates; k++)
    { // Middle loop: iterate over all gates to find matching outputs
      if (k == i)
        continue; // Skip the current outer loop gate

      for (int j = 0; j < gates[k].fanin; j++)
      { // Inner loop: iterate over inputs of current gate
        int current_input = gates[k].input[j];

        if (gates[i].out == current_input)
        { // Check if output matches current input
          // Store the index of gate `k` as an output of gate `i`
          gates[i].output_gates[gates[i].output_count++] = gates[k].out;
        }
      }
    }
  }
}

void print_gate_outputs()
{
  for (int i = 0; i < num_gates; i++)
  {
    printf("Gate %d outputs to: ", gates[i].out);
    if (gates[i].output_count > 0)
    {
      for (int j = 0; j < gates[i].output_count; j++)
      {
        printf("Gate %d ", gates[i].output_gates[j]);
      }
    }
    else
    {
      printf("No outputs");
    }
    printf("\n");
  }
}

/******************************************************
    Count the number of variables in line in x[]
******************************************************/
int count_v(char x[])
{
  int i, k, count;

  k = strlen(x);
  count = 0;

  for (i = 0; i < k; i++)
    if ((x[i] == 'n') || (x[i] == 'x'))
      count++;

  return count;
}

/*******************************************************
  Read the string x[], and store the ids of all the
  variables in the array varid[]. If a variable starts
  with 'x', MAXGATES is added to its id.
  For n20, the integer 20 is stored in varid[];
  for x20, the integer 5020 is stored in varid[]
*******************************************************/
void get_vars(char x[], int varid[], int nv)
{
  int i, tval, count, nx_flag;

  i = 0;
  count = 0;
  do
  {
    while (!isdigit(x[i]))
      i++;

    if (x[i - 1] == 'x')
      nx_flag = 1;
    else
      nx_flag = 0;

    tval = 0;
    while (isdigit(x[i]))
    {
      tval = tval * 10 + (x[i] - '0');
      i++;
    }

    if (nx_flag == 1)
      tval = MAXGATES + tval;
    varid[count++] = tval;
  } while (count < nv);
}

/*************************************************
  Tests whether a givel line is a PI. If so, it
  returns 1; else returns 0.
*************************************************/
int isPI(int lineid)
{
  int i;

  for (i = 0; i < num_gates; i++)
    if (gates[i].out == lineid) // Not a PI
      return 0;

  return 1;
}

/*************************************************
  Tests whether a givel line is a PO. If so, it
  returns 1; else returns 0.
*************************************************/
int isPO(int lineid)
{
  int i, j;

  for (i = 0; i < num_gates; i++)
  {
    for (j = 0; j < gates[i].fanin; j++)
      if (gates[i].input[j] == lineid) // Not a PO
        return 0;
  }

  return 1;
}

/**************************************************
  Return the level of a given gate/PI identified
  by an id (integer); returns -1 if the id has
  not yet been assigned a level.
**************************************************/
int get_asap_level(int lineid)
{
  int i;

  if (isPI(lineid))
    return 0;

  for (i = 0; i < num_gates; i++)
    if (gates[i].out == lineid)
      return (gates[i].asap_level);

  printf("\n*** ERROR in get_asap_level ***\n");
  exit;
}

/**************************************************
  Return the level of a given gate/PI identified
  by an id (integer); returns -1 if the id has
  not yet been assigned a level.
**************************************************/
int get_list_level(int lineid)
{
  int i;

  if (isPI(lineid))
    return 0;

  for (i = 0; i < num_gates; i++)
    if (gates[i].out == lineid)
      return (gates[i].list_level);

  printf("\n*** ERROR in get_list_level ***\n");
  exit;
}

/**************************************************
  Return the level of a given gate/PI identified
  by an id (integer); returns -1 if the id has
  not yet been assigned a level.
**************************************************/
int get_alap_level(int lineid)
{
  int i;

  if (isPO(lineid))
    return 0;

  for (i = 0; i < num_gates; i++)
    if (gates[i].out == lineid)
      return (gates[i].alap_level);

  printf("\n*** ERROR in get_alap_level ***\n");
  exit;
}

/*****************************************************
  Fill up the gate levels for ASAP scheduling
*****************************************************/
void compute_asap_level()
{
  int i, t1, t2, max, count = 0;

  while (count < num_gates) // Till all gates are levelized
  {
    for (i = 0; i < num_gates; i++)
    {
      if (gates[i].fanin == 1) // NOT gate
      {
        t1 = get_asap_level(gates[i].input[0]);
        if (t1 != -1)
        {
          gates[i].asap_level = t1 + 1;
          if (t1 + 1 > max_asap)
            max_asap = t1 + 1;
          count++;
        }
      }

      if (gates[i].fanin == 2)
      {
        t1 = get_asap_level(gates[i].input[0]);
        t2 = get_asap_level(gates[i].input[1]);

        if (t1 > t2)
          max = t1;
        else
          max = t2;

        if ((t1 != -1) && (t2 != -1))
        {
          gates[i].asap_level = max + 1;
          if (max + 1 > max_asap)
            max_asap = max + 1;
          count++;
        }
      }
    }
  }
}

/*****************************************************
  Fill up the gate levels for ALAP scheduling
*****************************************************/
void compute_alap_level()
{
  int i, iter, maxl;

  for (i = 0; i < num_gates; i++)
    if (isPO(gates[i].out))
      gates[i].alap_level = 1;

  while (!all_alap_labeled()) // Till all gates are levelized
  {
    for (i = 0; i < num_gates; i++)
      update_alap(i, gates[i].out);
  }

  for (iter = 0; iter < 10; iter++)
    for (i = 0; i < num_gates; i++)
      update_alap(i, gates[i].out);

  // Correct ALAP levels
  maxl = 0;
  for (i = 0; i < num_gates; i++)
    if (gates[i].alap_level > maxl)
      maxl = gates[i].alap_level;
  // printf("\n*** %d ***", maxl);
  for (i = 0; i < num_gates; i++)
    gates[i].alap_level = maxl - gates[i].alap_level + 1;
}

/****************************************************
  Test whether all the gates have been labeled using
  ALAP scheduling.
****************************************************/
int all_alap_labeled()
{
  int i, flag;

  flag = 0;

  for (i = 0; i < num_gates; i++)
    if (gates[i].alap_level == -1)
      return 0;

  return 1;
}

/***************************************************
  Update the labels of the gates during creation
  of the ALAP schedule.
***************************************************/
void update_alap(int index, int lineid)
{
  int j, k;

  for (j = 0; j < num_gates; j++)
  {
    for (k = 0; k < gates[j].fanin; k++)
    {
      if (lineid == gates[j].input[k])
        if (gates[j].alap_level != -1)
          if (gates[index].alap_level <= gates[j].alap_level)
            gates[index].alap_level = gates[j].alap_level + 1;
    }
  }
}

/*****************************************************
  Fill up the gate levels for LIST scheduling
*****************************************************/
void compute_list_level()
{
  int i, j, level, maxl = 0;
  int maxgates; /* Max number of gates in a level */

  // First compute the mobilities
  for (i = 0; i < num_gates; i++)
  {
    gates[i].mobility = gates[i].alap_level - gates[i].asap_level;
    if (gates[i].asap_level > maxl)
      maxl = gates[i].asap_level;
  }

  // Sort gates by their mobility (smallest first)
  for (i = 0; i < (num_gates - 1); i++)
    for (j = 0; j < (num_gates - i - 1); j++)
      if (gates[j].mobility > gates[j + 1].mobility)
      {
        tgate = gates[j];
        gates[j] = gates[j + 1];
        gates[j + 1] = tgate;
      }

  for (maxgates = 2; maxgates < 20; maxgates++) /** Check for the smallest **/
  {
    for (i = 0; i < num_gates; i++)
      gates[i].list_level = -1; /** Reinitialize levels to -1 **/

    if (list_schedule_possible(maxl, maxgates))
      break;
  }
  // printf("\n*** MAXGATES=%d****\n", maxgates);
}

/**********************************************************
  This function tries to determine if a list schedule with
  minimum number of time steps "maxlevel" is possible with
  "maxgates" number of gates in any level. Returns "1" if
  it is possible; else it returns "0"
**********************************************************/
int list_schedule_possible(int maxlevel, int maxgates)
{
  int i, j;
  int gatesinlevel, ngates, max, t1, t2;
  int flag, max_level_assigned;

  ngates = 0;
  max_level_assigned = 0;

  while (ngates < num_gates)
  {
    gatesinlevel = 0;
    flag = 0; // Track if any changes occur in present iteration
    for (i = 0; i < num_gates; i++)
    {

      if (gates[i].fanin == 1) // NOT gate
      {
        t1 = get_list_level(gates[i].input[0]);
        if (t1 != -1)
        {
          gates[i].list_level = t1 + 1;
          if (max_level_assigned < t1 + 1)
            max_level_assigned = t1 + 1;
          gatesinlevel++;
          ngates++;
          flag = 1;
          if (gatesinlevel == maxgates)
            break; // Current level filled up
        }
      }

      if (gates[i].fanin == 2)
      {
        t1 = get_list_level(gates[i].input[0]);
        t2 = get_list_level(gates[i].input[1]);

        if (t1 > t2)
          max = t1;
        else
          max = t2;

        if ((t1 != -1) && (t2 != -1))
        {
          gates[i].list_level = max + 1;
          if (max_level_assigned < max + 1)
            max_level_assigned = max + 1;
          gatesinlevel++;
          ngates++;
          flag = 1;
          if (gatesinlevel == maxgates)
            break; // Current level filled up
        }
      }
    }
    if (flag == 0)
      return 0; // List schedule could not be formed

  } // END OF WHILE

  if (max_level_assigned == maxlevel)
    return 1;
  else
    return 0;
}