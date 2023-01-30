#! /bin/bash
read -p 'Commit tile: ' device
git add -A
git commit -m 'update'
git push
