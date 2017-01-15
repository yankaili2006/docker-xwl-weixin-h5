#!/bin/bash

set -x

APP=xwl-weixin
VERSION=1.0-SNAPSHOT
WAR=$APP-$VERSION.war

WAR_PATH=$(curl "http://101.200.176.31:8181/nexus/service/local/artifact/maven/resolve?r=snapshots&g=com.xunwulian&a=$APP&v=$VERSION&p=war" | grep repositoryPath | sed 's/\s*<[^>]*>//g')

NEXUS="http://101.200.176.31:8181/nexus/content/repositories/snapshots/$WAR_PATH"

wget $NEXUS -O $WAR

mkdir -p $APP

unzip -o $WAR -d $APP

sh ./bin/startup.sh

tail -f logs/catalina.out
