#!/bin/sh

set -e

cp -f /Gemfile . && rm -f Gemfile.lock

JEKYLL_GITHUB_TOKEN=${INPUT_TOKEN} bundle exec jekyll build

bundle exec htmlproofer ./_site --check-html --disable-external
