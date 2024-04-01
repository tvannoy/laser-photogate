#!/usr/bin/env bash
#
# Download datasheets that are listed in datasheets.md
# Right now, only PDF URLs are supported.
# Datasheet PDFs are not tracked in git.

readarray -t datasheet_urls  < <(grep -E 'https://.*\.pdf' -o datasheets.md)

for pdf in "${datasheet_urls[@]}"; do
    wget -N --directory-prefix datasheets "${pdf}"
done