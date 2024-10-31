#!/usr/bin/zsh

# Check if a testbench file argument is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <testbench-file>"
  exit 1
fi

tb=$1

# Compile and run the testbench
iverilog "$tb"
./a.out

# Extract the VCD filename from the testbench file
vcd=$(grep ".vcd" "$tb" | cut -d'"' -f2)
echo "VCD file: $vcd"

# Open the VCD file in GTKWave, then remove it
gtkwave "$vcd"
rm "$vcd"

