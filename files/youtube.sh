#!/bin/bash
if [ -z $1 ]; then
    echo "Please provide a query as an argument"
    echo "grapper for youtube music"
    echo -e "\n"
    echo let out\=\[\]\;
    echo let kek \= Array.from\(document.getElementsByClassName\(\"title style-scope ytmusic-responsive-list-item-renderer complex-string\"\)\)\;
    echo kek.forEach\(element \=\> out.push\(\(\"https\:\/\/www.youtube.com\/\" + \/watch\[\^\;\]\*amp\/.exec\(\/href=\"\[\^\;\]\*\/.exec\(element.__shady_native_innerHTML\)\)\).toString\(\)\)\)\;
    echo -E console.log\(out.join\(\'\\r\\n\'\)\)
    echo -e "\n"
    echo "Then save it to file and run it with path to the file as an argument"
    echo -e "\n"
    exit
fi

cat $@ | while read line || [[ -n $line ]];
do
    echo $line
    yt-dlp  $line -x
done
