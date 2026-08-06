#!/bin/bash

echo "========== World Writable Files =========="

find / -type f -perm -002 2>/dev/null
