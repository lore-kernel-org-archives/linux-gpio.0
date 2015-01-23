From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V7 4/8] MIPS: Move Loongson GPIO driver to drivers/gpio
Date: Fri, 23 Jan 2015 16:56:08 +0800
Message-ID: <1422003369-3019-2-git-send-email-chenhc@lemote.com>
References: <1422003369-3019-1-git-send-email-chenhc@lemote.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtpbgau1.qq.com ([54.206.16.166]:45155 "EHLO smtpbgau1.qq.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752409AbbAWI6B (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 23 Jan 2015 03:58:01 -0500
In-Reply-To: <1422003369-3019-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, linux-gpio@vger.kernel.org, Huacai Chen <chenhc@lemote.com>

Move Loongson-2's GPIO driver to drivers/gpio and add Kconfig options.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/configs/lemote2f_defconfig               |    1 +
 arch/mips/loongson/common/Makefile                 |    1 -
 drivers/gpio/Kconfig                               |    6 ++++++
 drivers/gpio/Makefile                              |    1 +
 .../common/gpio.c => drivers/gpio/gpio-loongson.c  |    0
 5 files changed, 8 insertions(+), 1 deletions(-)
 rename arch/mips/loongson/common/gpio.c => drivers/gpio/gpio-loongson.c (100%)

diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index e51aad9..0cbc986 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -171,6 +171,7 @@ CONFIG_SERIAL_8250_FOURPORT=y
 CONFIG_LEGACY_PTY_COUNT=16
 CONFIG_HW_RANDOM=y
 CONFIG_RTC=y
+CONFIG_GPIO_LOONGSON=y
 CONFIG_THERMAL=y
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_VIDEO_DEV=m
diff --git a/arch/mips/loongson/common/Makefile b/arch/mips/loongson/common/Makefile
index d87e033..e70c33f 100644
--- a/arch/mips/loongson/common/Makefile
+++ b/arch/mips/loongson/common/Makefile
@@ -4,7 +4,6 @@
 
 obj-y += setup.o init.o cmdline.o env.o time.o reset.o irq.o \
     bonito-irq.o mem.o machtype.o platform.o
-obj-$(CONFIG_GPIOLIB) += gpio.o
 obj-$(CONFIG_PCI) += pci.o
 
 #
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 633ec21..3ac5473 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -475,6 +475,12 @@ config GPIO_GRGPIO
 	  Select this to support Aeroflex Gaisler GRGPIO cores from the GRLIB
 	  VHDL IP core library.
 
+config GPIO_LOONGSON
+	tristate "Loongson-2 GPIO support"
+	depends on CPU_LOONGSON2
+	help
+	  driver for GPIO functionality on Loongson-2F processors.
+
 config GPIO_TB10X
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 81755f1..caccfad 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)	+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)	+= gpio-kempld.o
 obj-$(CONFIG_ARCH_KS8695)	+= gpio-ks8695.o
 obj-$(CONFIG_GPIO_INTEL_MID)	+= gpio-intel-mid.o
+obj-$(CONFIG_GPIO_LOONGSON)	+= gpio-loongson.o
 obj-$(CONFIG_GPIO_LP3943)	+= gpio-lp3943.o
 obj-$(CONFIG_ARCH_LPC32XX)	+= gpio-lpc32xx.o
 obj-$(CONFIG_GPIO_LYNXPOINT)	+= gpio-lynxpoint.o
diff --git a/arch/mips/loongson/common/gpio.c b/drivers/gpio/gpio-loongson.c
similarity index 100%
rename from arch/mips/loongson/common/gpio.c
rename to drivers/gpio/gpio-loongson.c
-- 
1.7.7.3




