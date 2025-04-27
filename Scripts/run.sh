filename=iscas85_c7552

mkdir -p Results/magic
mkdir -p Results/micro_ins_compact
mkdir -p Results/micro_ins_naive
mkdir -p Results/schedule_stats

echo "Generating $filename benchmark..."
./bin/abc <<EOF >/dev/null
read ./BENCH/iscas/$filename.v
strash
read_genlib ./lib/nor_2.genlib
map
write_bench ./BENCH/netlist/$filename.txt
quit
EOF
rm abc.history
echo "Generation successful!"

echo "Reformating $filename netlist..."
python3 ./Scripts/reformat_1.py BENCH/netlist/$filename.txt
echo "Reformating successful!"

echo "Generating Results..."
gcc ./NOR-to-crossbar.c -o ./bin/main
./bin/main ./BENCH/netlist/$filename.txt
echo "Result generation successful!"

echo "Reformating ${filename}_magic.v..."
python3 ./Scripts/reformat_2.py ./BENCH/iscas/$filename.v ./Results/magic/${filename}_magic.v
echo "Reformating successful!"
