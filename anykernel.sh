# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Sploitpay Kernel for Exynos 9810 devices
do.devicecheck=1
do.modules=0
do.cleanup=0
do.cleanuponabort=0
device.name1=starlte
device.name2=star2lte
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/by-name/BOOT;
is_slot_device=0;
ramdisk_compression=auto;
device_name=$(file_getprop /default.prop ro.product.device);

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init*;
set_perm 0 0 750 $ramdisk/*.rc;


# Unpack boot image
dump_boot;

# Check device dtb
mv -f $home/*${device_name}*/Image $home/Image;
mv -f $home/*${device_name}*/dtb.img $split_img/extra;

write_boot;
## end install

