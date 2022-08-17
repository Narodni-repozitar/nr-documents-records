#!/bin/bash
#
# Copyright (c) 2022 CESNET
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT


cd $(dirname $0)

source .venv/bin/activate

(
  cd nr-documents-records
  pip install -e '.[tests,elasticsearch7,postgresql]'
)