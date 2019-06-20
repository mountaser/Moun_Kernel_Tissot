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
supported.versions=9
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
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;


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

list="init.rc";
for rdfile in $list; do
  rddir=$(dirname $rdfile);
  mkdir -p $overlay/$rddir;
  test ! -f $overlay/$rdfile && cp -rp /system/$rdfile $overlay/$rddir/;
done;

insert_line $overlay/init.rc "init.spectrum.rc" before "import /init.usb.rc" "import /init.spectrum.rc";

# fix selinux denials for /init.*.sh
"$bin/magiskpolicy" --load "/system/sepolicy" --save "$overlay/sepolicy" \
"allow init rootfs file execute_no_trans" \
"allow toolbox toolbox capability sys_admin" \
"allow toolbox property_socket sock_file write" \
"allow toolbox default_prop property_service set" \
"allow toolbox init unix_stream_socket connectto" \
"allow toolbox init fifo_file { getattr write }"

# end ramdisk changes

write_boot;
## end install

