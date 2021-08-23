#!/bin/bash

version=$(git ls-remote --tags https://github.com/keyspot/cli-tool.git | tail -n 1 | sed 's/.*refs\/tags\///g')

url64="https://github.com/KeySpot/cli-tool/releases/download/$version/cli-tool_${version:1}_Windows_x86_64.tar.gz"
url32="https://github.com/KeySpot/cli-tool/releases/download/$version/cli-tool_${version:1}_Windows_i386.tar.gz"

manifest="{\n\t\"version\": \"1.0.25\",\n\t\"description\": \"KeySpot CLI tool for accessing records and injecting variables into an environment without needing .env files.\",\n\t\"homepage\": \"https://keyspot.app\",\n\t\"license\": \"MIT\",\n\t\"architecture\": {\n\t\t\"64bit\": {\n\t\t\t\"url\": \"$url64\",\n\t\t\t\"bin\": [ [ \"cli-tool.exe\", \"keyspot.exe\" ] ]\n\t\t},\n\t\t\"32bit\": {\n\t\t\t\"url\": \"$url32\",\n\t\t\t\"bin\": [ [ \"cli-tool.exe\", \"keyspot.exe\" ] ]\n\t\t}\n\t},\n\t\"autoupdate\": {\n\t\t\"architecture\": {\n\t\t\t\"64bit\": {\n\t\t\t\t\"url\": \"$url64\"\n\t\t\t},\n\t\t\t\"32bit\": {\n\t\t\t\t\"url\": \"$url32\"\n\t\t\t}\n\t\t}\n\t}\n}"

echo -e $manifest > keyspot.json

git add .
git commit -m "$version"
git push origin main