#!/bin/bash

echo "========== System Users =========="

cut -d: -f1 /etc/passwd

echo

echo "Total Users:"

wc -l /etc/passwd
