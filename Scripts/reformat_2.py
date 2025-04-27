import re
import sys

# Read reference Verilog file
with open(sys.argv[1], "r") as f:
    verilog_code = f.read()

    # Extract module name
    module_match = re.search(r"module\s+(\w+)\s*\(([^;]+)\);", verilog_code)
    module_name = module_match.group(1) if module_match else None

    # Extract input names
    inputs_match = re.search(r"input\s+([^;]+);", verilog_code)
    inputs = [x.strip() for x in inputs_match.group(1).split(",")]
    # input_matches = re.findall(r"input\s+([^;]+);", verilog_code, re.DOTALL)
    # inputs = []
    # for match in input_matches:
    #     # Remove newlines and extra spaces, then split by comma
    #     cleaned = match.replace("\n", " ").replace("\r", " ")
    #     inputs += [x.strip() for x in cleaned.split(",") if x.strip()]

    # Extract output names
    outputs_match = re.search(r"output\s+([^;]+);", verilog_code)
    outputs = [x.strip() for x in outputs_match.group(1).split(",")]
    # output_matches = re.findall(r"output\s+([^;]+);", verilog_code, re.DOTALL)
    # outputs = []
    # for match in output_matches:
    #     cleaned = match.replace("\n", " ").replace("\r", " ")
    #     outputs += [x.strip() for x in cleaned.split(",") if x.strip()]

# Get base file name (not used further)
bench_name = sys.argv[1].split("/")[-1].split(".")[0]
# print(len(inputs))

# Read target file to modify
with open(sys.argv[2]) as f:
    verilog_code = f.read()

    # Replace module name placeholder
    verilog_code = re.sub(r"\bmodule_name\b", module_name, verilog_code)

    # Replace input placeholders
    for idx, name in enumerate(inputs, 1):
        verilog_code = re.sub(rf"\bip_{idx}\b\s*", f"{name:<7}", verilog_code)

    # Replace output placeholders
    for idx, name in enumerate(outputs, 1):
        verilog_code = re.sub(rf"\bop_{idx}\b\s*", f"{name:<7}", verilog_code)

# Write updated code back to file
with open(sys.argv[2], "w") as f:
    f.write(verilog_code)
