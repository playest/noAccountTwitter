#! /bin/sh

set -e

find . -maxdepth 1 -type 'd' | grep '^./' | cut -d '/' -f 2- | grep -v '^\.' | xargs -L 1 -P 8 ./loadLastTweets.sh
