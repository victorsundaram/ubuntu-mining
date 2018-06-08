#!/bin/bash
#rocm-smi --setsclk 0 (this comand will set Core State to lowest level)
#rocm-smi --setmclk 3 (this comand will set Memory State to maximum level)

/opt/rocm/bin/rocm-smi --setsclk 0
/opt/rocm/bin/rocm-smi --setmclk 3
exit 0