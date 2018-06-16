#!bin/bash

UCORE_DIR=/home/kzf/osLab/ucore_plus
export SKI_DIR=/home/kzf/SKI/ski

echo "Preparing snapshot...", $UCORE_DIR

SKI_TRACE_INSTRUCTIONS_ENABLED=0 SKI_TRACE_MEMORY_ACCESSES_ENABLED=0 SKI_KERNEL_FILENAME=$UCORE_DIR/ucore/obj/kernel.img SKI_VM_FILENAME=$UCORE_DIR/ucore/obj/sfs.img SKI_TESTCASE_DIR=~/SKI/ski/testcases/fsstress/ SKI_OUTPUT_DIR=$SKI_DIR/results/test1-snapshot ./create-snapshot.sh | tee -a test1-snapshot.log

echo "Snapshot created, now start running SKI..."
