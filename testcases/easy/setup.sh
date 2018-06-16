#!/bin/bash

# Uncomment when debugging the testcase script
#set -x
#set -v


# Update the affinity of the internal kernel threads
./misc/update-affinity.sh

# Set "max locked memory" to unlimited
ulimit -l unlimited
ulimit
