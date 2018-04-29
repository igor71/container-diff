#! /bin/bash
#
# Ask the user for input Docker image name or ID
#
# jq app need to be installed in orderto make this script work
#
echo Please enter Docker Image ID 
read varname
docker history $varname -q \
  | while read image_id; do \
    echo "$image_id"; \
    if [ "$image_id" != "<missing>" ]; then \
      docker inspect "$image_id" --format '{{json .RootFS.Layers}}' | jq .; \
    fi; \
  done
