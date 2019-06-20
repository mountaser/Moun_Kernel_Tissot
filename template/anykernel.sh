# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Moun Kernel by Mountaser Halak @ xda-developers
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=1
device.name1=tissot
supported.versions=10
'; } # end properties

# shell variables
block=/dev/block/platform/soc/7824900.sdhci/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel install
dump_boot;

# begin ramdisk changes

# sepolicy
$bin/magiskpolicy --load sepolicy --save sepolicy \
  "allow init rootfs file execute_no_trans" \
;

# If the kernel image and dtbs are separated in the zip
decompressed_image=/tmp/anykernel/kernel/Image
compressed_image=$decompressed_image.gz
if [ -f $compressed_image ]; then
  # Hexpatch the kernel if Magisk is installed ('skip_initramfs' -> 'want_initramfs')
  if [ -d $ramdisk/.backup -o -d $ramdisk/.magisk ]; then
    ui_print " "; ui_print "Magisk detected! Patching kernel so reflashing Magisk is not necessary...";
    $bin/magiskboot --decompress $compressed_image $decompressed_image;
    $bin/magiskboot --hexpatch $decompressed_image 736B69705F696E697472616D667300 77616E745F696E697472616D667300;
    $bin/magiskboot --compress=gzip $decompressed_image $compressed_image;

  fi;

  ui_print "Checking for Project Treble...";
  if [ "$(file_getprop /system_root/system/build.prop ro.treble.enabled)" = "true" ]; then
    ui_print "Treble Status: Supported";
    dtb=/tmp/anykernel/dtb-treble;
  else
    ui_print "Treble Status: Not supported";
    dtb=/tmp/anykernel/dtb-nontreble;
  fi;

  # Concatenate all of the dtbs to the kernel
  cat $compressed_image $dtb/*.dtb > /tmp/anykernel/Image.gz-dtb;
fi;

if [ -d $ramdisk/.backup ]; then
  ui_print " "; ui_print "Patching ramdisk...";
  patch_cmdline "skip_override" "skip_override";
else
  patch_cmdline "skip_override" "";
fi;

# Clean up other kernels' ramdisk overlay.d files
rm -rf $ramdisk/overlay.d
# Add our ramdisk files if Magisk is installed
if [ -d $ramdisk/.backup ]; then
	ui_print " "; ui_print "Installing Spectrum"
	mv /tmp/anykernel/overlay.d $ramdisk/overlay.d
	cp -f /system_root/init.rc $ramdisk/overlay.d
	sleep 2
		insert_line $ramdisk/overlay.d/init.rc "init.spectrum.rc" after 'import /init.usb.rc' "import /init.spectrum.rc"
		ui_print "Spectrum installed succesfully"
    set_perm_recursive 0 0 750 750 $ramdisk/*
fi;

# end ramdisk changes

write_boot;
## end install
ui_print "Moun Kernel is installed succesfully"
ui_print "Don't flash Magisk its already fully restored"

