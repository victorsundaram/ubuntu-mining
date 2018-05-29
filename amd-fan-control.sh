#!/bin/bash
#Script i use to control AMD Fan on my Vega, they are stable when the value is set > 150
/opt/rocm/bin/rocm-smi -d 0 --setfan 150
/opt/rocm/bin/rocm-smi -d 1 --setfan 150
/opt/rocm/bin/rocm-smi -d 2 --setfan 150
/opt/rocm/bin/rocm-smi -d 3 --setfan 150
/opt/rocm/bin/rocm-smi -d 4 --setfan 150
/opt/rocm/bin/rocm-smi -d 5 --setfan 150
exit 0