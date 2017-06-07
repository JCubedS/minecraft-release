#!/bin/sh

set -ex

java -Xms2048m -Xmx4096m -XX:PermSize=256m -jar forge-*-universal.jar nogui
