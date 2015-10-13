firefox-xvfb-java-gradle-docker
----

Runs ANY Selenium-based application using Gradle. This base image can be used by ANY Java project that requires
running the application with a headless Firefox browser. That's ideal for automated test cases, Web Crawlers, etc.

Running
-----

Suppose you have the following java project with the following structure:

```
~/dev/github/public/quantogastei/commons on ⭠ master ⌚ 23:10:04
$ tree -L 3
.
├── build.gradle
├── README.md
├── settings.gradle
└── src
    └── main
        ├── java
        └── resources

```

Run the following:

```
cd /your/java/root/dir
$ docker run -ti --rm -v ${PWD}:/usr/bin/app marcellodesales/gradle-firefox gradle YOUR_GRADLE_COMMAND
```

For instance, you can run the `gradle jar` as follows:

```
~/dev/github/public/quantogastei/commons on ⭠ master! ⌚ 22:23:49
$ docker run -ti --rm -v ${PWD}:/usr/bin/app gradle-firefox gradle jar
Tue Oct 13 05:23:51 UTC 2015
Mozilla Firefox 41.0
Starting Xvfb ...
:compileJava
Download https://repo1.maven.org/maven2/commons-io/commons-io/2.4/commons-io-2.4.pom
Download https://repo1.maven.org/maven2/org/apache/commons/commons-parent/25/commons-parent-25.pom
Download https://repo1.maven.org/maven2/org/apache/apache/9/apache-9.pom
...
...
Download https://repo1.maven.org/maven2/com/google/code/gson/gson/2.3.1/gson-2.3.1.pom
Download https://repo1.maven.org/maven2/org/eclipse/jetty/websocket/websocket-common/9.2.11.v20150529/websocket-common-9.2.11.v20150529.jar
Download https://repo1.maven.org/maven2/org/eclipse/jetty/websocket/websocket-api/9.2.11.v20150529/websocket-api-9.2.11.v20150529.jar
Download https://repo1.maven.org/maven2/commons-codec/commons-codec/1.10/commons-codec-1.10.jar
Note: /usr/bin/app/src/main/java/com/quantogastei/utils/QGAddressing.java uses or overrides a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
:processResources UP-TO-DATE
:classes
:jar
Jar assembled at /usr/bin/app/build/libs/quantogastei-commons.jar

BUILD SUCCESSFUL

Total time: 14.443 secs

This build could be faster, please consider using the Gradle Daemon: https://docs.gradle.org/2.7/userguide/gradle_daemon.html
```

The artifacts are created inside the Docker Container and exposed through the `volume` used. That way, all the files from
the build are now available in both the built container, which was removed with `--rm`, and in the local file-system:

```
~/dev/github/public/quantogastei/commons on ⭠ master ⌚ 23:10:04
$ tree -L 3
.
├── build
│   ├── classes
│   │   └── main
│   ├── dependency-cache
│   ├── libs
│   │   └── quantogastei-commons.jar
│   ├── resources
│   │   └── main
│   └── tmp
│       ├── compileJava
│       └── jar
├── build.gradle
├── README.md
├── settings.gradle
└── src
    └── main
        ├── java
        └── resources
```
