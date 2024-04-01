#!/bin/bash

# Check if the script is being run on Windows
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  LIBS="-lWs2_32"
else
  LIBS=""
fi

if type "clang" > /dev/null 2>&1; then
  clang *.c -Werror -O0 -g -o tinyosc $LIBS
else
  gcc *.c -Werror -std=c99 -O0 -g -o tinyosc $LIBS
fi
