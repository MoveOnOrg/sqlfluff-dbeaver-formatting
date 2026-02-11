#!/bin/bash
set -euo pipefail

# the temp file needed to allow sqlfluff direct edit access
temp_file_path=$1
sqlfluff_config_file_path=$2
sqlfluff_executable_file_path=$3


if [ ! -f "$temp_file_path" ]; then
  echo "Error: file not found or is not a regular file: $temp_file_path" >&2
  exit 1
fi

if [ ! -f "$sqlfluff_config_file_path" ]; then
  echo "Error: file not found or is not a regular file: $sqlfluff_config_file_path" >&2
  exit 1
fi

if [ ! -f "$sqlfluff_executable_file_path" ]; then
  echo "Error: file not found or is not a regular file: $sqlfluff_executable_file_path" >&2
  exit 1
fi


if eval $sqlfluff_executable_file_path --version >>/dev/null; then
  echo "" >>/dev/null
else
  echo "Error: sqlfluff is not installed"
  exit 1
fi

mkdir -p "~/tmp"

temp_sql_file="$HOME/tmp/sqlfluff-deveaver-staging.sql"

# The Dbeaver-provided file cannot be formatted with Sqlfluff, so copy it to another editable file
cp "$temp_file_path" "$temp_sql_file"

eval $sqlfluff_executable_file_path fix \
  --nocolor \
  --config "$sqlfluff_config_file_path" \
  --disable-progress-bar \
  --quiet \
  --FIX-EVEN-UNPARSABLE \
  "$temp_sql_file" >>/dev/null

cat $temp_sql_file
