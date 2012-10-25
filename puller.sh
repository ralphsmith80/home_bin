#!/bin/bash

workspace=/Users/ralphs/Workspace

for d in $workspace/*; do
	if [[ $d == $workspace/nvm || $d == $workspace/gitosis-admin ]]
	then
		# echo "skipping $d"
		continue
	fi
	# ( [ -d $d ] && cd $d && echo "pulling $d" )
    ( [ -d $d ] && cd $d && [ -d .git ] && echo -n "### pulling `basename "$d"` " && git pull )
    ( [ -d $d ] && cd $d && [ -d .svn ] && echo "### updating `basename "$d"` " && svn up ) || true
done
echo 'done!!'
