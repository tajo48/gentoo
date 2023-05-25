#! /bin/bash

#prompts
read -p 'Commit tile: ' updateMessage
remote=$(git remote)'\nall'
chosenRemote=$(echo -e "$remote" | fzf)

#commit
git commit -am "$updateMessage"

#push
if [ "$chosenRemote" == "all" ];
then
  echo "Pushing to all remotes"
  git remote | xargs -L1 git push --all
exit 0
fi
git push --all $chosenRemote 
