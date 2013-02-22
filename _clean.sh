#!/bin/sh -e

(
cd $(dirname $0)
rm -rf _site _site_preview _site_preview_live .bundle _bundler vendor/bundle/
)
