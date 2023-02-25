#!/bin/sh

# SPDX-FileCopyrightText: David Fritzsche
# SPDX-License-Identifier: CC0-1.0

export CUSTOM_COMPILE_COMMAND="./lock-requirements.sh"

PYTHONWARNINGS=ignore pip-compile --unsafe-package='' --no-emit-index-url --resolver=backtracking "$@"
cat >constraints.txt <<EOF
# SPDX-FileCopyrightText: David Fritzsche
# SPDX-License-Identifier: CC0-1.0
#
# This file is autogenerated by lock-requirements.sh
# To update, run:
#
#    ./lock-requirements.sh
#
EOF
sed -E -e 's/(\[.*\])//g' -e  '/^ *#/d' -e '/^$/d' requirements.txt >> constraints.txt
