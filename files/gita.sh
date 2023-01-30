#! /bin/bash
read -p 'Commit tile: ' update 
git add -A
git commit -m "$update"
git push
