import re
import sys

file_name = f"BENCH/iscas/{sys.argv[1]}.v"

# Read the Verilog file (replace 'your_file.v' with your actual filename)
with open(file_name, "r") as f:
    verilog_code = f.read()

    # Extract module name
    module_match = re.search(r"module\s+(\w+)\s*\(([^;]+)\);", verilog_code)
    module_name = module_match.group(1) if module_match else None

    inputs_match = re.search(r"input\s+([^;]+);", verilog_code)
    inputs = [x.strip() for x in inputs_match.group(1).split(",")]

    outputs_match = re.search(r"output\s+([^;]+);", verilog_code)
    outputs = [x.strip() for x in outputs_match.group(1).split(",")]

bench_name = sys.argv[1].split("/")[-1].split(".")[0]
print(bench_name)

print("module_name =", repr(module_name))
print("inputs =", inputs)
print("outputs =", outputs)

magic_file_name = f"Results/magic/{sys.argv[1]}_magic.v"
with open(magic_file_name) as f:
    verilog_code = f.read()

    verilog_code = re.sub(r"\bmodule_name\b", module_name, verilog_code)

    for idx, name in enumerate(inputs, 1):
        verilog_code = re.sub(rf"\bip_{idx}\b\s*", f"{name:<7}", verilog_code)

    for idx, name in enumerate(outputs, 1):
        verilog_code = re.sub(rf"\bop_{idx}\b\s*", f"{name:<7}", verilog_code)


print(verilog_code)
