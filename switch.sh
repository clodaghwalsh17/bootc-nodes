#!/bin/bash
ssh -t -o StrictHostKeyChecking=no root@$HOST "bootc switch $IMAGE && reboot"
if [ $? -eq 0 ]; then
echo "The host machine is ready with the new image"
fi