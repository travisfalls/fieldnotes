#!/usr/bin/env bash
set -euo pipefail
cp -R "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../fixtures/legacy/." .
