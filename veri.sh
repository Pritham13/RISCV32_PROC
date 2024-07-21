#!/usr/bin/zsh

echo "Enter the tb name";
read tb;
iverilog $tb;
./a.out;
vcd=$(grep ".vcd" $tb | cut -d'"' -f2);
echo $vcd;

gtkwave $vcd;
echo $vcd;
rm $vcd;
