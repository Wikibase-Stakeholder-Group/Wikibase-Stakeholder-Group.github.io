#!/bin/bash

# If you don't want to worry about installing the right
# ruby and jekyll versions, you can use this docker
# setup for testing the website.

docker run --rm \
    --volume="$PWD:/srv/jekyll:Z" \
    --publish 4000:4000 \
    jekyll/jekyll:3.8 \
    jekyll serve