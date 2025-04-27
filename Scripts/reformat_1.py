import sys

# Read all lines from input file
with open(sys.argv[1], "r") as file:
    lines = file.readlines()

input_map = {}
output_map = {}
wire_map = {}
output_lines = []
input_count = 0
output_count_start = 10001
output_count = output_count_start

# Map inputs and outputs
for line in lines:
    line = line.strip()
    if line.startswith("INPUT("):
        var = line[line.find("(") + 1 : line.find(")")]
        input_map[var] = f"x{input_count}"
        input_count += 1
    elif line.startswith("OUTPUT("):
        var = line[line.find("(") + 1 : line.find(")")]
        output_map[var] = f"n{output_count}"
        output_count += 1
    elif line.startswith("#"):
        continue
    else:
        break

# Init wire count
wire_count = (output_count - output_count_start) + 1

# Process logic assignments
for line in lines:
    line = line.strip()
    if (
        not line
        or line.startswith("#")
        or line.startswith("INPUT(")
        or line.startswith("OUTPUT(")
    ):
        continue

    left, right = line.split("=")
    left = left.strip()
    right = right.strip()

    assert right.startswith("LUT"), f"Unexpected format in line: {line}"

    # Get variables in LUT
    vars_part = right[right.find("(") + 1 : right.find(")")]
    vars_list = [v.strip() for v in vars_part.split(",")]

    # Map to new variable names
    mapped_vars = []
    for var in vars_list:
        if var in input_map:
            mapped_vars.append(input_map[var])
        elif var in wire_map:
            mapped_vars.append(wire_map[var])
        elif var in output_map:
            mapped_vars.append(output_map[var])
        else:
            raise ValueError(f"Variable {var} not found in mappings!")

    # Assign new name
    if left in output_map:
        new_name = output_map[left]
    else:
        new_name = f"n{wire_count}"
        wire_map[left] = new_name
        wire_count += 1

    # Format output line
    if len(mapped_vars) == 1:
        expr = f"{mapped_vars[0]}'"
        output_line = f"{new_name:>6} =  {expr}"
    elif len(mapped_vars) == 2:
        expr = f"({mapped_vars[0]}'{mapped_vars[1]}')"
        output_line = f"{new_name:>6} = {expr}"
    else:
        raise ValueError(f"Unsupported number of variables in LUT: {vars_list}")

    output_lines.append(output_line)

output_lines.append(".")

# Write result back to file
with open(sys.argv[1], "w") as f:
    f.write("\n".join(output_lines))
