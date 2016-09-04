#!/usr/local/bin/ruby

while true do
  `rsync -avh --del /website/_site/ /mirror/`
  sleep 1
end