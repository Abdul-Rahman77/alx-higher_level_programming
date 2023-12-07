#!/bin/bash
read -p "Filename: " pyfile
vi $pyfile
chmod u+x $pyfile
pycodestyle --first $pyfile
./$pyfile

read -p "$pyfile has a main? [yes/no]: " main
if [ "$main" = "yes" ]; then
	read -p "Enter task number: " task
	task="$task-main.py"
	vi $task
	chmod u+x $task
	./$task
fi
echo -e "\n\n======== Push or Correction =========\n"
read -p "Continue? [yes/no]: " cont
if [ "$cont" = "yes" ]; then
	git add .
	git commit -m "$pyfile task done"
	git push
elif [ "$cont" = "no" ]; then
	vi $pyfile
else
	echo -e "yes/no expected"
fi
clear
