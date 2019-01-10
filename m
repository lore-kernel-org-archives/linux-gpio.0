From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] ARM: config: Update SPEAr 3xx defconfig
Date: Thu, 10 Jan 2019 15:39:16 +0100
Message-ID: <20190110143917.9054-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Viresh Kumar <viresh.linux@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

This config is updates to the latest structure of the
Kconfig menus so we can apply DRM driver changes on top.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/configs/spear3xx_defconfig | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
index 2c5e8df33191..6753b373bee8 100644
--- a/arch/arm/configs/spear3xx_defconfig
+++ b/arch/arm/configs/spear3xx_defconfig
@@ -1,21 +1,21 @@
 CONFIG_SYSVIPC=y
+CONFIG_PREEMPT=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_PARTITION_ADVANCED=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_PLAT_SPEAR=y
 CONFIG_ARCH_SPEAR3XX=y
 CONFIG_MACH_SPEAR300=y
 CONFIG_MACH_SPEAR310=y
 CONFIG_MACH_SPEAR320=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=y
 CONFIG_NET=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_MTD=y
-CONFIG_MTD_OF_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_FSMC=y
@@ -32,8 +32,6 @@ CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_SMSC is not set
 CONFIG_STMMAC_ETH=y
 # CONFIG_WLAN is not set
-CONFIG_INPUT_FF_MEMLESS=y
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 # CONFIG_KEYBOARD_ATKBD is not set
 CONFIG_KEYBOARD_SPEAR=y
 # CONFIG_INPUT_MOUSE is not set
@@ -78,8 +76,8 @@ CONFIG_JFFS2_FS=y
 CONFIG_NLS_DEFAULT="utf8"
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=m
-CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_FS=y
+CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_INFO=y
-- 
2.19.2
