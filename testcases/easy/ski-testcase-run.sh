#!/bin/bash
#
# Script executed after loading the testcase into the VM
#
#
# Options mostly useful to test on the testcase in the host (i.e., disables hypercalls or other SKI functionalities)
export USC_SKI_HYPERCALLS=${USC_SKI_HYPERCALLS-0}
export USC_SKI_ENABLED=${USC_SKI_ENABLED-1}
export USC_SKI_TOTAL_CPUS=4

VM_TEST_QUIT=${VM_TEST_QUIT-1}
EMPTY_TEST_FILENAME=${EMPTY_TEST_FILENAME-./empty}
DEBUG_BINARY=/root/usermode/simple-app/debug

exec >  >(xargs -d '\n' -n 1 ${DEBUG_BINARY})
exec 2> >(xargs -d '\n' -n 1 ${DEBUG_BINARY} >&2)

# Execute the setup script (also calls FS specific scripts)
log_msg "Running setup"
./setup.sh
log_msg "Finished setup"
 

log_msg "Running fsstress and the empty process"

# Call the empty process for the other two CPUs 
echo "Process 1: ${EMPTY_TEST_FILENAME}"
USC_SKI_ENABLED=${SKI_ENABLE} USC_SKI_FORK_ENABLED=1 USC_SKI_CPU_AFFINITY=1 USC_SKI_TEST_NUMBER=1 USC_SKI_SOFT_EXIT_BARRIER=1 USC_SKI_USER_BARRIER=0 USC_SKI_HYPERCALLS=1 ${EMPTY_TEST_FILENAME} &

wait

if [ "$VM_TEST_QUIT" -eq 1 ]
then
	# Special command to signal to SKI the end of the snapshot process
	$DEBUG_BINARY "Guest finished snapshot"
fi



