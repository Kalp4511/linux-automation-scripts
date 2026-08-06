#!/bin/bash

find /tmp -type f -mtime +7 -delete

echo "Temporary files older than 7 days removed."
