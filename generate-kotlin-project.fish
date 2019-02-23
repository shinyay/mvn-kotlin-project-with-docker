#!/usr/bin/env fish

docker run -it --rm --name my-maven-project -v (pwd):/usr/src/mymaven -w /usr/src/mymaven maven:3.6.0-jdk-11-slim \
   mvn archetype:generate -DarchetypeGroupId=org.jetbrains.kotlin -DarchetypeArtifactId=kotlin-archetype-jvm -DarchetypeVersion=1.3.21 \
      -DinteractiveMode=false \
      -DgroupId=io.pivotal.shinyay \
      -DartifactId=kotlin-app

