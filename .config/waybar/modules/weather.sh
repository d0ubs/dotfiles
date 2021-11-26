#!/bin/sh

weather=$(curl -s wttr.in/luxembourg-luxembourg?format="%C" 2>/dev/null)
temperature=$(curl -s wttr.in/luxembourg-luxembourg?format="%t" 2>/dev/null)

case $weather in

    ("Sunny")
        weather=""
        ;;
    ("Partly cloudy")
        weather=""
        ;;

    ("Overcast")
        weather=""
        ;;
    ("Mist")
        weather=":"
        ;;
    ("Patchy rain possible")
        weather=""
        ;;
    ("Light rain")
        weather=""
        ;;
    ("Light drizzle")
        weather=""
        ;;
    ("Clear")
        weather=""
        ;;
esac

echo -e "{\"text\":\""$temperature $weather"\"}"
