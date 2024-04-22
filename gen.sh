#!/bin/bash

# Copyright Istio Authors

#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

set -eu

# Sync API versions
scripts/sync.sh

# Generate all protos
buf generate --template buf.gen-golang.yaml

# These folders have the full plugins used, as they are full CRDs.
buf generate --template buf.gen-crd.yaml \
  --path analysis \
  --path authentication \
  --path extensions \
  --path meta \
  --path networking \
  --path security \
  --path telemetry \
  --path type

buf generate --template buf.gen-docs.yaml \
  --path analysis \
  --path authentication \
  --path extensions \
  --path mcp \
  --path mesh \
  --path meta \
  --path networking \
  --path operator \
  --path security \
  --path telemetry \
  --path type
