#!/bin/sh

storage=$(df -h / | awk 'FNR==2{print $4}')

echo -e "{\"text\":\"" $storage"\"}"
