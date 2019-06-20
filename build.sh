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
echo " ";
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9 ~/Toolchain/64
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9 ~/Toolchain/32
echo " ";
echo " ";
##########################################
export ARCH=arm64
export CROSS_COMPILE_ARM32=~/Toolchain/32/bin/arm-linux-androideabi-
export CROSS_COMPILE=~/Toolchain/64/bin/aarch64-linux-android-
##########################################
echo " Creating directories ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
mkdir outputdTissot-4.9-Custom-Hybrid

mkdir ~/Moun_Kernel

mkdir ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid
echo " Started Building the Kernels ! ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";

##########################################

echo " Started Building Tissot-4.9-Custom-Hybrid ! ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
make -C $(pwd) O=outputdTissot-4.9-Custom-Hybrid tissot_defconfig
make -j$(nproc) -C $(pwd) O=outputdTissot-4.9-Custom-Hybrid
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

cp -r template/. ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid

cp outputdTissot-4.9-Custom-Hybrid/arch/arm64/boot/Image.gz ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid/kernel/Image.gz
cp outputdTissot-4.9-Custom-Hybrid/arch/arm64/boot/dts/qcom/msm8953-qrd-sku3-tissot-nontreble.dtb ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid/dtb-nontreble
cp outputdTissot-4.9-Custom-Hybrid/arch/arm64/boot/dts/qcom/msm8953-qrd-sku3-tissot-treble.dtb ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid/dtb-treble

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
cd ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid
zip -r9 Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid.zip * -x Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid.zip

echo " uploading to Mega "; 
megamkdir /Root/XDA/Moun_Kernel_Tissot/$KV
megaput --path /Root/XDA/Moun_Kernel_Tissot/$KV ~/Moun_Kernel/Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid/Moun_Kernel_V$KV-Tissot-4.9-Custom-Hybrid.zip


echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
echo " ";
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
