#!/usr/bin/env fish

set -x CONTAINER_NAME mvn-container
set -x CONTAINER_VERSION 3.6.0-jdk-11-slim
set -x ARCHETYPE_VERSION 1.3.21
set -x GROUP_ID io.pivotal.shinyay
set -x ARTIFACT_ID kotlin-app

docker volume create --name maven-repo
docker run -it --rm --name $CONTAINER_NAME -v (pwd):/usr/src/mymaven -v maven-repo:/root/.m2 -w /usr/src/mymaven maven:$CONTAINER_VERSION \
   mvn archetype:generate -DarchetypeGroupId=org.jetbrains.kotlin -DarchetypeArtifactId=kotlin-archetype-jvm -DarchetypeVersion=$ARCHETYPE_VERSION \
      -DinteractiveMode=false \
      -DgroupId=$GROUP_ID \
      -DartifactId=$ARTIFACT_ID

