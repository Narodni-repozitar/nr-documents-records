#!/bin/bash
#
# Copyright (c) 2022 CESNET
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT


set -e

deactivate || true

test -d .venv-model-builder && rm -rf .venv-model-builder
python3.10 -m venv .venv-model-builder

source .venv-model-builder/bin/activate

pip install -U pip setuptools wheel
pip install -e nr-documents-records-model-builder

(
  cd nr-documents-records
  rm -rf nr_documents_records
  oarepo-compile-model ../models/nr-documents-records.yaml
)

cp -r models nr-vocabularies-model-builder/
