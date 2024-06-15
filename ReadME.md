# risc-me

For tb generator <br/> 
```
iverilog -o ./tb/alu_tb ./src/alu.v ./test/alu_tb.v -I ./src 
```

For vcd generator <br/>
```
vvp ./tb/alu_tb -o ./vcd
```