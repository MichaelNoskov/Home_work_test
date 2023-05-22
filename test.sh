#!/bin/bash

echo "Тест на копирование файлов был запущен"

mkdir "input"
mkdir "output"

echo "Созданы тестовые дирректории"

text1="awdawdad awdwad awdawaw adwawwaawaw awdawdwa awddadwa awd"
text2=""
text3="12345"
text4="awSEFSEFSEawdad awdwad awdawaw adw#@@^^%*awwa\nawaw awdawdwa awddadwa awd\n"

echo $text1 > input/file.txt
touch input/file.pdf
echo $text3 > input/file.docx
echo $text4 > input/file

echo "Созданы тестовые файлы"

chmod +x script.sh

echo "Запускаем тестирование..."

./script.sh input output > /dev/null

if [[ -f input/file.txt && -f input/file.pdf && -f input/file.docx && -f input/file && `cat input/file.txt`==$text1 && `cat input/file.pdf`==$text2 && `cat input/file.docx`==$text3 && `cat input/file`==$text4 ]]
then
    echo Скрипт успешно прошёл проверку, файлы были скопированы
    rm -rf input
    rm -rf output
    exit 0
else
    echo Что-то пошло не так, скрипт не прошёл проверку
    rm -rf input
    rm -rf output
    exit 1
fi
