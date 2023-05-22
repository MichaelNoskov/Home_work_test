#!/bin/bash

if [[ ! -n $1 || ! -n $2 ]]
then
	echo "не даны позиционые аргументы"
	exit 1
fi

if [[ ! -d $1 || ! -d $2 ]]
then
	echo "Это не папка"
	exit 2
fi
echo "начинаю копирование..."
rsync -avz --delete $1 $2
echo "копирование завершено..."

exit 0