#!/bin/bash
#Script i use to control AMD Fan on my Vega, they are stable when the value is set > 150 (value range 0-255)
/opt/rocm/bin/rocm-smi -d 0 --setfan 175
exit 0