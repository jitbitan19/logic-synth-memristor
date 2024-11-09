/*************************************************************************
  This program takes a NOT/NOR netlist that is generated as the output
  of the ABC tool, and generates statistics for memristor crossbar
  mapping using both ASAP and ALAP schedules. The program has to be
  invoked as:
	 ./a.out  <file-name>

  There are some constraints on the input file format.
  a) There must be a dot ('.') in the first column of the last line
	 of the file.
  b) Arbitrary variable names are not allowed; variables can only
	 start with either 'n' or 'x' followed by a number. For example,
	 n15, n3, x1, x235, etc.
***********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <ctype.h>

#define MAXGATES 5000
#define MAXFANIN 5
#define MAXLEVEL 500
#define MAXPI 100

typedef struct
{
	int fanin;			 // 1 for NOT
	int input[MAXFANIN]; // maximum 5 inputs
	int out;			 // output line
	int asap_level;
	int alap_level;
	int mobility;
	int list_level;
} table_gate;

table_gate gates[MAXGATES], tgate;

int primary_inputs[MAXPI];
int nPI = 0;

int ng = 0; // number of gates;

int tempvar = 1; // temporary lines start as -1, -2, etc.

FILE *netlist;

/*************** MAIN FUNCTION ********************/
int main(int argc, char *argv[])
{

	const char *file_name = "BENCH/xor5_d.txt";
	netlist = fopen(file_name, "r");

	FILE *output_file = freopen("fo.txt", "w", stdout);

	int i;
	parse_gates();

	for (i = 0; i < ng; i++)
	{
		gates[i].asap_level = -1;
		gates[i].alap_level = -1;
		gates[i].list_level = -1;
	}

	compute_asap_level();
	compute_alap_level();
	compute_list_level();

	printf("\n************ BENCHMARK: %s *************", argv[1]);
	print_gates();

	print_stat();

	fclose(netlist);
	fclose(output_file);
}

/***********************************************
  Print the final statistics from the schedule
***********************************************/
void print_stat()
{
	int i, j, maxl, count, maxgates, gates_level;
	int gate_count[MAXLEVEL];
	int cross_rows[500];
	int asap_not, asap_nor, alap_not, alap_nor, list_not, list_nor;
	int asap_memr_serial, alap_memr_serial, list_memr_serial;
	int time_serial, time_parallel;

	//************* FOR ASAP SCHEDULE ***********
	maxl = 0;
	asap_not = 0;
	asap_nor = 0;
	for (i = 0; i < ng; i++)
	{
		if (gates[i].asap_level > maxl)
			maxl = gates[i].asap_level;

		if (gates[i].fanin == 1)
			asap_not++;
		else
			asap_nor++;
	}

	for (i = 0; i < maxl; i++)
		gate_count[i] = 0;

	for (i = 0; i < ng; i++)
		gate_count[gates[i].asap_level - 1]++;

	maxgates = 0;
	for (i = 0; i < maxl; i++)
		if (gate_count[i] > maxgates)
			maxgates = gate_count[i];

	printf("\nASAP SCHEDULE:");
	printf("\n=============");

	printf("\nGate distribution across levels:\n  ");
	for (i = 0; i < maxl; i++)
		printf("%d ", gate_count[i]);

	printf("\nNumber of levels: %d, MaxGates: %d", maxl, maxgates);

	// ** Now count the number of memristors and crossbar columns **
	for (i = 0; i < maxgates; i++)
		cross_rows[i] = 0;

	for (i = 1; i <= maxl; i++)
	{
		gates_level = 0;
		for (j = 0; j < ng; j++)
		{
			if (gates[j].asap_level == i)
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

	asap_memr_serial = 0;
	for (i = 0; i < maxgates; i++)
		if (cross_rows[i] == 1)
			asap_memr_serial += 2;
		else
			asap_memr_serial += 3;
	printf("\nNumber of memristors: %d", asap_memr_serial);

	time_parallel = 2 * maxl;
	time_serial = asap_not + asap_nor + maxl;
	printf("\nTime steps (serial): %d, Time steps (parallel): %d",
		   time_serial, time_parallel);

	printf("\nCrossbar size (serial): %d x %d", maxgates, 3);
	count = 0;
	for (i = 0; i < maxgates; i++)
		if (cross_rows[i] == 1)
			count++; // No. of columns less reqd.
	printf("\nCrossbar size (parallel): %d x %d", maxgates, (3 * maxgates) - count);

	//************* FOR ALAP SCHEDULE ***********

	maxl = 0;
	alap_not = 0;
	alap_nor = 0;
	for (i = 0; i < ng; i++)
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

	for (i = 0; i < ng; i++)
		gate_count[gates[i].alap_level - 1]++;

	maxgates = 0;
	for (i = 0; i < maxl; i++)
		if (gate_count[i] > maxgates)
			maxgates = gate_count[i];

	printf("\n\nALAP SCHEDULE:");
	printf("\n=============");
	printf("\nGate distribution across levels:\n  ");
	for (i = 0; i < maxl; i++)
		printf("%d ", gate_count[i]);

	printf("\nNumber of levels: %d, MaxGates: %d", maxl, maxgates);

	// ** Now count the number of memristors and crossbar columns **
	for (i = 0; i < maxgates; i++)
		cross_rows[i] = 0;

	for (i = 1; i <= maxl; i++)
	{
		gates_level = 0;
		for (j = 0; j < ng; j++)
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
	printf("\nNumber of memristors: %d", alap_memr_serial);

	time_parallel = 2 * maxl;
	time_serial = alap_not + alap_nor + maxl;
	printf("\nTime steps (serial): %d, Time steps (parallel): %d",
		   time_serial, time_parallel);

	printf("\nCrossbar size (serial): %d x %d", maxgates, 3);
	count = 0;
	for (i = 0; i < maxgates; i++)
		if (cross_rows[i] == 1)
			count++; // No. of columns less reqd.
	printf("\nCrossbar size (parallel): %d x %d\n", maxgates, (3 * maxgates) - count);

	//************* FOR LIST SCHEDULE ***********
	maxl = 0;
	list_not = 0;
	list_nor = 0;
	for (i = 0; i < ng; i++)
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

	for (i = 0; i < ng; i++)
		gate_count[gates[i].list_level - 1]++;

	maxgates = 0;
	for (i = 0; i < maxl; i++)
		if (gate_count[i] > maxgates)
			maxgates = gate_count[i];

	printf("\nLIST SCHEDULE:");
	printf("\n=============");

	printf("\nGate distribution across levels:\n  ");
	for (i = 0; i < maxl; i++)
		printf("%d ", gate_count[i]);

	printf("\nNumber of levels: %d, MaxGates: %d", maxl, maxgates);

	// ** Now count the number of memristors and crossbar columns **
	for (i = 0; i < maxgates; i++)
		cross_rows[i] = 0;

	for (i = 1; i <= maxl; i++)
	{
		gates_level = 0;
		for (j = 0; j < ng; j++)
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
	printf("\nNumber of memristors: %d", list_memr_serial);

	time_parallel = 2 * maxl;
	time_serial = list_not + list_nor + maxl;
	printf("\nTime steps (serial): %d, Time steps (parallel): %d",
		   time_serial, time_parallel);

	printf("\nCrossbar size (serial): %d x %d", maxgates, 3);
	count = 0;
	for (i = 0; i < maxgates; i++)
		if (cross_rows[i] == 1)
			count++; // No. of columns less reqd.
	printf("\nCrossbar size (parallel): %d x %d", maxgates, (3 * maxgates) - count);
}

/*****************************************
  Print the gate table
*****************************************/
void print_gates()
{
	int i, j;

	for (i = 0; i < ng; i++)
	{
		printf("\n");
		if (gates[i].fanin == 1)
			printf("NOT: ");
		if (gates[i].fanin == 2)
			printf("NOR: ");

		printf("%5d : ", gates[i].out);

		for (j = 0; j < gates[i].fanin; j++)
			printf("%5d", gates[i].input[j]);

		printf(" : ASAP- %d, ALAP- %d, MOB- %d", gates[i].asap_level, gates[i].alap_level,
			   gates[i].mobility);
	}
	printf("\n---------------------\n");
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
		fgets(line, sizeof(line), netlist);

		if (line[0] == '.')
			break;

		nvar = count_v(line); // count how many variables (i.e. n or x)
		get_vars(line, varid, nvar);

		switch (nvar)
		{
		case 2: // NOT gate
			gates[ng].fanin = 1;
			gates[ng].out = varid[0];
			gates[ng].input[0] = varid[1];
			ng++;
			break;

		case 3: // 2-input NOR
			gates[ng].fanin = 2;
			gates[ng].out = varid[0];
			gates[ng].input[0] = varid[1];
			gates[ng].input[1] = varid[2];
			ng++;
			break;

		case 4: // Two 2-input NOR gates in cascade
			gates[ng].fanin = 2;
			gates[ng].out = -(tempvar++);
			gates[ng].input[0] = varid[2];
			gates[ng].input[1] = varid[3];
			ng++;
			gates[ng].fanin = 2;
			gates[ng].out = varid[0];
			gates[ng].input[0] = varid[1];
			gates[ng].input[1] = -(tempvar - 1);
			ng++;
			break;

		case 5: // Three 2-input NOR gates in two levels
			gates[ng].fanin = 2;
			gates[ng].out = -(tempvar++);
			gates[ng].input[0] = varid[1];
			gates[ng].input[1] = varid[2];
			ng++;
			gates[ng].fanin = 2;
			gates[ng].out = -(tempvar++);
			gates[ng].input[0] = varid[3];
			gates[ng].input[1] = varid[4];
			ng++;
			gates[ng].fanin = 2;
			gates[ng].out = varid[0];
			gates[ng].input[0] = -(tempvar - 2);
			gates[ng].input[1] = -(tempvar - 1);
			ng++;
			break;

		default:
			printf("** Invalid variables on line: %s\n", line);
			exit;
		}
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
  with 'x', 5000 is added to its id.
  For n20, the integer 20 is stored in varid[];
  for x20, the integer 5020 is stored in varid[]
*******************************************************/
get_vars(char x[], int varid[], int nv)
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
			tval = 5000 + tval;
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

	for (i = 0; i < ng; i++)
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

	for (i = 0; i < ng; i++)
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

	for (i = 0; i < ng; i++)
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

	for (i = 0; i < ng; i++)
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

	for (i = 0; i < ng; i++)
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

	while (count < ng) // Till all gates are levelized
	{
		for (i = 0; i < ng; i++)
		{
			if (gates[i].fanin == 1) // NOT gate
			{
				t1 = get_asap_level(gates[i].input[0]);
				if (t1 != -1)
				{
					gates[i].asap_level = t1 + 1;
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

	for (i = 0; i < ng; i++)
		if (isPO(gates[i].out))
			gates[i].alap_level = 1;

	while (!all_alap_labeled()) // Till all gates are levelized
	{
		for (i = 0; i < ng; i++)
			update_alap(i, gates[i].out);
	}

	for (iter = 0; iter < 10; iter++)
		for (i = 0; i < ng; i++)
			update_alap(i, gates[i].out);

	// Correct ALAP levels
	maxl = 0;
	for (i = 0; i < ng; i++)
		if (gates[i].alap_level > maxl)
			maxl = gates[i].alap_level;
	printf("\n*** %d ***", maxl);
	for (i = 0; i < ng; i++)
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

	for (i = 0; i < ng; i++)
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

	for (j = 0; j < ng; j++)
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
	for (i = 0; i < ng; i++)
	{
		gates[i].mobility = gates[i].alap_level - gates[i].asap_level;
		if (gates[i].asap_level > maxl)
			maxl = gates[i].asap_level;
	}

	// Sort gates by their mobility (smallest first)
	for (i = 0; i < (ng - 1); i++)
		for (j = 0; j < (ng - i - 1); j++)
			if (gates[j].mobility > gates[j + 1].mobility)
			{
				tgate = gates[j];
				gates[j] = gates[j + 1];
				gates[j + 1] = tgate;
			}

	for (maxgates = 2; maxgates < 20; maxgates++) /** Check for the smallest **/
	{
		for (i = 0; i < ng; i++)
			gates[i].list_level = -1; /** Reinitialize levels to -1 **/

		if (list_schedule_possible(maxl, maxgates))
			break;
	}
	printf("\n*** MAXGATES=%d****\n", maxgates);
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

	while (ngates < ng)
	{
		gatesinlevel = 0;
		flag = 0; // Track if any changes occur in present iteration
		for (i = 0; i < ng; i++)
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
