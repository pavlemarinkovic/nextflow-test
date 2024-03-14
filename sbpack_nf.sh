#!/usr/bin/env bash

cmd="$@"
image_home="/home/velseraqa"

for arg in "$@"; do
    if [[ $arg == "--workflow-path" ]]; then
        workflow_dir="$2"
        break
    fi
    shift
done

new_dir=$(basename "$workflow_dir")
cmd="${cmd//$workflow_dir/$new_dir}"

docker run -it --rm \
   -v "${HOME}/.sevenbridges/credentials:${image_home}/.sevenbridges/credentials:ro" \
   -v "${workflow_dir}:${image_home}/${new_dir}" \
   images.sbgenomics.com/pavle.marinkovic/sbpack:2 \
   bash -c "sbpack_nf ${cmd}"