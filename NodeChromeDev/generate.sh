#!/bin/bash
VERSION=$1
NAMESPACE=$2
AUTHORS=$3

echo FROM selenium/node-base:$VERSION > ./Dockerfile
cat ../NodeChrome/Dockerfile.txt >> ./Dockerfile
sed -i 's/CHROME_DRIVER_VERSION=2.29/CHROME_DRIVER_VERSION=2.30/' ./Dockerfile
sed -i 's/google-chrome-stable/google-chrome-unstable/' ./Dockerfile
sed -i 's|COPY chrome_launcher.sh /opt/google/chrome/google-chrome|COPY chrome_launcher.sh /opt/google/chrome-beta/google-chrome|' ./Dockerfile
sed -i 's|RUN chmod +x /opt/google/chrome/google-chrome|RUN chmod +x /opt/google/chrome-beta/google-chrome|' ./Dockerfile

cp ../NodeChrome/chrome_launcher.sh .
sed -i 's|export CHROME_VERSION_EXTRA="stable"|export CHROME_VERSION_EXTRA="unstable"|' ./chrome_launcher.sh
