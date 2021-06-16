#!/bin/bash

#*========*========*=======*=======*=======*=======*========*========*=======*=======*=======*
export BOOTJAR="FlameCord.jar"
export JVM_OPT2="-server \
-XX:+UseG1GC \
-XX:G1HeapRegionSize=4M \
-XX:+UnlockExperimentalVMOptions \
-XX:+ParallelRefProcEnabled \
-XX:+PerfDisableSharedMem \
-XX:+AlwaysPreTouch \
-XX:MaxInlineLevel=15"
#*========*========*=======*=======*=======*=======*========*========*=======*=======*=======*

groupadd -g 1000 abc
useradd  -M -u 1000 -g 1000 abc

cd /sync
chown abc:abc ${BOOTJAR}
chmod 766 ${BOOTJAR}

exec su abc -c "exec /opt/java/openjdk/bin/java -Xms${JVM_NUM} -Xmx${JVM_NUM} ${JVM_OPT2} -jar ${BOOTJAR}"

exit 0
export JVM_OPT2="-server \
-Duser.language=ja -Duser.country=JP -Duser.timezone=Asia/Tokyo \
-XX:+UseG1GC \
-XX:+ParallelRefProcEnabled \
-XX:MaxGCPauseMillis=200 \
-XX:+UnlockExperimentalVMOptions \
-XX:+DisableExplicitGC \
-XX:+AlwaysPreTouch \
-XX:G1NewSizePercent=40 \
-XX:G1MaxNewSizePercent=50 \
-XX:G1HeapRegionSize=16M \
-XX:G1ReservePercent=15 \
-XX:G1HeapWastePercent=5 \
-XX:G1MixedGCCountTarget=4 \
-XX:InitiatingHeapOccupancyPercent=20 \
-XX:G1MixedGCLiveThresholdPercent=90 \
-XX:G1RSetUpdatingPauseTimePercent=5 \
-XX:SurvivorRatio=32 \
-XX:+PerfDisableSharedMem \
-XX:MaxTenuringThreshold=1 \
-Dusing.aikars.flags=https://mcflags.emc.gs \
-Daikars.new.flags=true"

