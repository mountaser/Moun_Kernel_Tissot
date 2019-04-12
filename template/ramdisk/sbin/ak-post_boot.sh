#!/system/bin/sh
BB=/sbin/busybox;
echo "[AK] Boot Script Started" | tee /dev/kmsg


# Mount root as RW to apply tweaks and settings Start
$BB mount -o remount,rw /
$BB mount -o rw,remount /system

sleep 5


#Build.prop
echo "net.rmnet0.dns1=1.1.1.1" >> /system/build.prop
echo "net.rmnet0.dns2=8.8.8.8" >> /system/build.prop
echo "net.dns1=1.1.1.1" >> /system/build.prop
echo "net.dns2=8.8.8.8" >> /system/build.prop


#Finish
echo "[AK] Exiting post-boot script" | tee /dev/kmsg
