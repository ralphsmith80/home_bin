#!/bin/bash

workspace=/Users/ralphs/Workspace

for d in $workspace/*; do
(
	if [[ $d == $workspace/nvm || $d == $workspace/gitosis-admin ]]
	then
		# echo "skipping $d"
		continue
	fi
	# ( [ -d $d ] && cd $d && echo "pulling $d" ); sleep 2
    ( [ -d $d ] && cd $d && [ -d .git ] && echo -ne "### pulling `basename "$d"` \n" && git pull )
    ( [ -d $d ] && cd $d && [ -d .svn ] && echo -e "### updating `basename "$d"` \n" && svn up ) || true
) &
done
wait
echo 'done!!'
