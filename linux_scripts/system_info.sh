#!/bin/bash
echo "Gathering system information..."
lscpu && free -h && df -h
echo "Information collected!"