#!/bin/sh

#python
python=$(python -c"from sys import version_info; print(version_info[0])")
echo "> python: $python "
sleep 3