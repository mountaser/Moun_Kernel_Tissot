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
echo " ";
echo " ";
echo " ";
echo " ";
echo " Setting up the compiler ";
rm -rf ~/Toolchain
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
mkdir outputdTissotTreble

mkdir ~/Moun_Kernel

mkdir ~/Moun_Kernel/Moun_Kernel_V$KV-TissotTreble
echo " Started Building the Kernels ! ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";

##########################################

echo " Started Building TissotTreble ! ";
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
make -C $(pwd) O=outputdTissotTreble custom_tissot-perf_defconfig
make -j8 -C $(pwd) O=outputdTissotTreble
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


cp outputdTissotTreble/arch/arm64/boot/Image.gz-dtb ~/Moun_Kernel/Moun_Kernel_V$KV-TissotTreble/Image.gz-dtb

cp -r template/. ~/Moun_Kernel/Moun_Kernel_V$KV-TissotTreble

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
cd ~/Moun_Kernel/Moun_Kernel_V$KV-TissotTreble
zip -r9 Moun_Kernel_V$KV-TissotTreble.zip * -x Moun_Kernel_V$KV-TissotTreble.zip

echo " uploading to Mega "; 

megaput --path /Root/XDA/Moun_Kernel_Tissot/$KV ~/Moun_Kernel/Moun_Kernel_V$KV-TissotTreble/Moun_Kernel_V$KV-TissotTreble.zip


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
