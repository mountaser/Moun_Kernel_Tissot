#!/bin/bash
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo "::::    ::::   ::::::::  :::    ::: ::::    :::                    ";
echo "+:+:+: :+:+:+ :+:    :+: :+:    :+: :+:+:   :+:                    ";
echo "+:+ +:+:+ +:+ +:+    +:+ +:+    +:+ :+:+:+  +:+                    ";
echo "+#+  +:+  +#+ +#+    +:+ +#+    +:+ +#+ +:+ +#+                    ";
echo "+#+       +#+ +#+    +#+ +#+    +#+ +#+  +#+#+#                    ";
echo "#+#       #+# #+#    #+# #+#    #+# #+#   #+#+#                    ";
echo "###       ###  ########   ########  ###    ####                    ";
echo "                                                                   ";
echo ":::    ::: :::::::::: :::::::::  ::::    ::: :::::::::: :::        ";
echo ":+:   :+:  :+:        :+:    :+: :+:+:   :+: :+:        :+:        ";
echo "+:+  +:+   +:+        +:+    +:+ :+:+:+  +:+ +:+        +:+        ";
echo "+#++:++    +#++:++#   +#++:++#:  +#+ +:+ +#+ +#++:++#   +#+        ";
echo "+#+  +#+   +#+        +#+    +#+ +#+  +#+#+# +#+        +#+        ";
echo "#+#   #+#  #+#        #+#    #+# #+#   #+#+# #+#        #+#        ";
echo "###    ### ########## ###    ### ###    #### ########## ########## ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
read -p "Write the Kernel version: " KV
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " Cleaning old build directories ";
echo " ";
echo " ";
rm -rf ~/Moun_Kernel
echo " ";
echo " ";
echo " ";
echo " ";
echo " Setting up the compiler ";
echo " ";
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 ~/Toolchain
echo " ";
echo " ";
##########################################
export ARCH=arm64
export CROSS_COMPILE=~/Toolchain/bin/aarch64-linux-android-
##########################################
echo " Creating directories ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
mkdir outputdTissot
mkdir outputdTissotStock

mkdir ~/Moun_Kernel

mkdir ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot
mkdir ~/Moun_Kernel/Moun_Kernel_V$KV-TissotStock

echo " Started Building the Kernels ! ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";

##########################################

echo " Started Building Tissot ! ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
make -C $(pwd) O=outputdTissot custom_tissot-perf_defconfig
make -j32 -C $(pwd) O=outputdTissot

##########################################

echo " Started Building Tissot Stock! ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
make -C $(pwd) O=outputdTissotStock tissot-perf_defconfig
make -j32 -C $(pwd) O=outputdTissotStock

##########################################

echo " copying zImage and dtb and the template over to the output directory ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";


cp outputdTissot/arch/arm64/boot/Image.gz-dtb ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot/Image.gz-dtb
cp outputdTissotStock/arch/arm64/boot/Image.gz-dtb ~/Moun_Kernel/Moun_Kernel_V$KV-TissotStock/Image.gz-dtb

cp -r template/. ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot
cp -r template/. ~/Moun_Kernel/Moun_Kernel_V$KV-TissotStock

echo " Zipping Kernel Files ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";

##########################################
cd ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot
zip -r9 Moun_Kernel_V$KV-Tissot.zip * -x Moun_Kernel_V$KV-Tissot.zip

cd ~/Moun_Kernel/Moun_Kernel_V$KV-TissotStock
zip -r9 Moun_Kernel_V$KV-TissotStock.zip * -x Moun_Kernel_V$KV-TissotStock.zip


echo " uploading to Mega "; 
megamkdir /Root/XDA/Moun_Kernel_Tissot/V$KV
megaput --path /Root/XDA/Moun_Kernel_Tissot/V$KV ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot/Moun_Kernel_V$KV-Tissot.zip
megaput --path /Root/XDA/Moun_Kernel_Tissot/V$KV ~/Moun_Kernel/Moun_Kernel_V$KV-TissotStock/Moun_Kernel_V$KV-TissotStock.zip

echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo "::::    ::::   ::::::::  :::    ::: ::::    :::                    ";
echo "+:+:+: :+:+:+ :+:    :+: :+:    :+: :+:+:   :+:                    ";
echo "+:+ +:+:+ +:+ +:+    +:+ +:+    +:+ :+:+:+  +:+                    ";
echo "+#+  +:+  +#+ +#+    +:+ +#+    +:+ +#+ +:+ +#+                    ";
echo "+#+       +#+ +#+    +#+ +#+    +#+ +#+  +#+#+#                    ";
echo "#+#       #+# #+#    #+# #+#    #+# #+#   #+#+#                    ";
echo "###       ###  ########   ########  ###    ####                    ";
echo "                                                                   ";
echo ":::    ::: :::::::::: :::::::::  ::::    ::: :::::::::: :::        ";
echo ":+:   :+:  :+:        :+:    :+: :+:+:   :+: :+:        :+:        ";
echo "+:+  +:+   +:+        +:+    +:+ :+:+:+  +:+ +:+        +:+        ";
echo "+#++:++    +#++:++#   +#++:++#:  +#+ +:+ +#+ +#++:++#   +#+        ";
echo "+#+  +#+   +#+        +#+    +#+ +#+  +#+#+# +#+        +#+        ";
echo "#+#   #+#  #+#        #+#    #+# #+#   #+#+# #+#        #+#        ";
echo "###    ### ########## ###    ### ###    #### ########## ########## ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " Compiling and uploading is done !! ";
