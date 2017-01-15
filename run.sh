#!/bin/bash

set -x

APP=xwl-weixin
VERSION=1.0-SNAPSHOT
JAR=$APP-$VERSION-jar-with-dependencies.jar

JAR_PATH=$(curl "http://101.200.176.31:8181/nexus/service/local/artifact/maven/resolve?r=snapshots&g=com.xunwulian&a=$APP&v=$VERSION&c=jar-with-dependencies" | grep repositoryPath | sed 's/\s*<[^>]*>//g')

NEXUS="http://101.200.176.31:8181/nexus/content/repositories/snapshots/$JAR_PATH"

wget $NEXUS -O $JAR

java -jar $JAR -a zxtd | tee log.txt
