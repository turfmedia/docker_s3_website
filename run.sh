#!/bin/bash

ruby ./watcher.rb &
jekyll serve -s /website/ --host 0.0.0.0