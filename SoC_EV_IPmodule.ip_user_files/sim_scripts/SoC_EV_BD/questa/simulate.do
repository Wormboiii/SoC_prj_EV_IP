onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib SoC_EV_BD_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {SoC_EV_BD.udo}

run 1000ns

quit -force
