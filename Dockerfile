FROM kebblar/jdk18-utf8-debug-maven
COPY sample-1.0-SNAPSHOT-fat.jar /home
ENTRYPOINT java -jar /home/sample-1.0-SNAPSHOT-fat.jar
