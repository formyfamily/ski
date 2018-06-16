#!/bin/bash


# Script executed on the host before packing and sending the testcase to the VM
# Should return 0 if sucessfull, otherwise the run-create-snapshot.sh aborts

echo "Packing!!!"
make
MAKE_RESULT=$?
echo "!!!!!!", $MAKE_RESULT
exit $MAKE_RESULT

