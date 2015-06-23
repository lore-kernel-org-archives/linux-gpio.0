From: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 5/9] arm: twr-k70f120m: basic support for Kinetis TWR-K70F120M
Date: Tue, 23 Jun 2015 23:19:43 +0200
Message-ID: <1435094387-20146-6-git-send-email-pawelo__34307.928561657$1435096372$gmane$org@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fish.king.net.pl ([79.190.246.46]:37039 "EHLO king.net.pl"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755016AbbFWVwN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Jun 2015 17:52:13 -0400
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas
Cc: Paul Osmialowski <pawelo@king.net.pl>, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>

This one is inspired a serie by commits published on Emcraft git repo:

https://github.com/EmcraftSystems/linux-emcraft.git

Entry commit: f014da1df860ad702d923c95cb97e068bd302cb0
 RT75957. twr-k70f120m: basic support

by: Alexander Potashev <aspotashev@emcraft.com>

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 Documentation/devicetree/bindings/arm/fsl.txt |   6 +
 arch/arm/Kconfig                              |  14 ++-
 arch/arm/Kconfig-nommu                        |   1 +
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/kinetis-twr-k70f120m.dts    |  16 +++
 arch/arm/boot/dts/kinetis.dtsi                |   5 +
 arch/arm/mach-kinetis/Kconfig                 |   9 ++
 arch/arm/mach-kinetis/Makefile                |   5 +
 arch/arm/mach-kinetis/Makefile.boot           |   3 +
 arch/arm/mach-kinetis/include/mach/idle.h     |  33 +++++
 arch/arm/mach-kinetis/include/mach/kinetis.h  | 170 ++++++++++++++++++++++++++
 arch/arm/mach-kinetis/kinetis_platform.c      |  61 +++++++++
 arch/arm/mm/Kconfig                           |   1 +
 arch/arm/tools/mach-types                     |   1 +
 14 files changed, 325 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/kinetis-twr-k70f120m.dts
 create mode 100644 arch/arm/boot/dts/kinetis.dtsi
 create mode 100644 arch/arm/mach-kinetis/Kconfig
 create mode 100644 arch/arm/mach-kinetis/Makefile
 create mode 100644 arch/arm/mach-kinetis/Makefile.boot
 create mode 100644 arch/arm/mach-kinetis/include/mach/idle.h
 create mode 100644 arch/arm/mach-kinetis/include/mach/kinetis.h
 create mode 100644 arch/arm/mach-kinetis/kinetis_platform.c

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 2a3ba73..36179fd 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -135,3 +135,9 @@ LS2085A ARMv8 based Simulator model
 Required root node properties:
     - compatible = "fsl,ls2085a-simu", "fsl,ls2085a";
 
+Freescale Kinetis SoC Device Tree Bindings
+------------------------------------------
+
+TWR-K70F120M Kinetis K70 based development board.
+Required root node compatible properties:
+  - compatible = "fsl,kinetis-twr-k70f120m"
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 8ef8f8f..747cdea 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -877,6 +877,8 @@ source "arch/arm/mach-ixp4xx/Kconfig"
 
 source "arch/arm/mach-keystone/Kconfig"
 
+source "arch/arm/mach-kinetis/Kconfig"
+
 source "arch/arm/mach-ks8695/Kconfig"
 
 source "arch/arm/mach-meson/Kconfig"
@@ -971,6 +973,16 @@ config ARCH_EFM32
 	  Support for Energy Micro's (now Silicon Labs) efm32 Giant Gecko
 	  processors.
 
+config ARCH_KINETIS
+	bool "Freescale Kinetis MCU"
+	depends on ARM_SINGLE_ARMV7M
+	select CPU_CORTEXM3
+	select ARM_CPU_IDLE_QUIRKS
+	select ARMV7M_SYSTICK
+	select ZLIB_INFLATE_STACK_SAVING if ZLIB_INFLATE
+	help
+	  This enables support for the Freescale Kinetis MCUs
+
 config ARCH_LPC18XX
 	bool "NXP LPC18xx/LPC43xx"
 	depends on ARM_SINGLE_ARMV7M
@@ -1740,7 +1752,7 @@ source "mm/Kconfig"
 config FORCE_MAX_ZONEORDER
 	int "Maximum zone order" if ARCH_SHMOBILE_LEGACY
 	range 11 64 if ARCH_SHMOBILE_LEGACY
-	default "12" if SOC_AM33XX
+	default "12" if SOC_AM33XX || ARCH_KINETIS
 	default "9" if SA1111 || ARCH_EFM32
 	default "11"
 	help
diff --git a/arch/arm/Kconfig-nommu b/arch/arm/Kconfig-nommu
index 98220e8..2b08e7a 100644
--- a/arch/arm/Kconfig-nommu
+++ b/arch/arm/Kconfig-nommu
@@ -69,6 +69,7 @@ config ZLIB_INFLATE_STACK_SAVING
 
 config COPY_VECTOR_TABLE_TO_SRAM_ADDR
 	hex 'If non-zero, copy Vector Table to this SRAM Address' if CPU_V7M
+	default 0x20000000 if ARCH_KINETIS
 	default 0x00000000
 	depends on CPU_V7M
 	help
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a7e1007..761db56 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -171,6 +171,7 @@ machine-$(CONFIG_ARCH_IOP32X)		+= iop32x
 machine-$(CONFIG_ARCH_IOP33X)		+= iop33x
 machine-$(CONFIG_ARCH_IXP4XX)		+= ixp4xx
 machine-$(CONFIG_ARCH_KEYSTONE)		+= keystone
+machine-$(CONFIG_ARCH_KINETIS)		+= kinetis
 machine-$(CONFIG_ARCH_KS8695)		+= ks8695
 machine-$(CONFIG_ARCH_LPC18XX)		+= lpc18xx
 machine-$(CONFIG_ARCH_LPC32XX)		+= lpc32xx
diff --git a/arch/arm/boot/dts/kinetis-twr-k70f120m.dts b/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
new file mode 100644
index 0000000..edccf37
--- /dev/null
+++ b/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
@@ -0,0 +1,16 @@
+/*
+ * Device tree for TWR-K70F120M development board.
+ *
+ */
+
+/dts-v1/;
+#include "kinetis.dtsi"
+
+/ {
+	model = "Freescale TWR-K70F120M Development Kit";
+	compatible = "fsl,kinetis-twr-k70f120m";
+
+	memory {
+		reg = <0x8000000 0x8000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/kinetis.dtsi b/arch/arm/boot/dts/kinetis.dtsi
new file mode 100644
index 0000000..93d2a8a
--- /dev/null
+++ b/arch/arm/boot/dts/kinetis.dtsi
@@ -0,0 +1,5 @@
+/*
+ * Device tree for Freescale Kinetis SoC.
+ *
+ */
+#include "armv7-m.dtsi"
diff --git a/arch/arm/mach-kinetis/Kconfig b/arch/arm/mach-kinetis/Kconfig
new file mode 100644
index 0000000..300bcea
--- /dev/null
+++ b/arch/arm/mach-kinetis/Kconfig
@@ -0,0 +1,9 @@
+if ARCH_KINETIS
+
+config MACH_KINETIS
+	bool "Kinetis K70 based development board"
+	default y
+	help
+	  Say Y here if you are using Kinetis K70 based development board
+
+endif
diff --git a/arch/arm/mach-kinetis/Makefile b/arch/arm/mach-kinetis/Makefile
new file mode 100644
index 0000000..3746b3d
--- /dev/null
+++ b/arch/arm/mach-kinetis/Makefile
@@ -0,0 +1,5 @@
+#
+# Makefile for the Freescale Kinetis platform files
+#
+
+obj-$(CONFIG_MACH_KINETIS)	+= kinetis_platform.o
diff --git a/arch/arm/mach-kinetis/Makefile.boot b/arch/arm/mach-kinetis/Makefile.boot
new file mode 100644
index 0000000..3b442ab
--- /dev/null
+++ b/arch/arm/mach-kinetis/Makefile.boot
@@ -0,0 +1,3 @@
+   zreladdr-y	:= 0x08008000
+params_phys-y	:= 0x08000100
+initrd_phys-y	:= 0x08100000
diff --git a/arch/arm/mach-kinetis/include/mach/idle.h b/arch/arm/mach-kinetis/include/mach/idle.h
new file mode 100644
index 0000000..0aafefd
--- /dev/null
+++ b/arch/arm/mach-kinetis/include/mach/idle.h
@@ -0,0 +1,33 @@
+/*
+ * Based on original code by Vladimir Khusainov <vlad@emcraft.com>
+ *
+ * (C) Copyright 2011, 2012
+ * Emcraft Systems, <www.emcraft.com>
+ * Vladimir Khusainov <vlad@emcraft.com>
+ *
+ * Copyright (C) 2015 Paul Osmialowski <pawelo@king.net.pl>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+
+#ifndef _MACH_KINETIS_IDLE_H
+#define _MACH_KINETIS_IDLE_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/io.h>
+
+static inline void handle_cpu_idle_quirks(void)
+{
+	/*
+	 * This is a dirty hack that invalidates the I/D bus cache
+	 * on Kinetis K70. This must be done after arch idle.
+	 */
+	writel(readl(IOMEM(0xe0082000)) | 0x85000000, IOMEM(0xe0082000));
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /*_MACH_KINETIS_IDLE_H */
diff --git a/arch/arm/mach-kinetis/include/mach/kinetis.h b/arch/arm/mach-kinetis/include/mach/kinetis.h
new file mode 100644
index 0000000..54d0a8b
--- /dev/null
+++ b/arch/arm/mach-kinetis/include/mach/kinetis.h
@@ -0,0 +1,170 @@
+/*
+ * (C) Copyright 2012
+ * Emcraft Systems, <www.emcraft.com>
+ * Alexander Potashev <aspotashev@emcraft.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+
+#ifndef _MACH_KINETIS_KINETIS_H
+#define _MACH_KINETIS_KINETIS_H
+
+#include <asm/byteorder.h>
+
+/*
+ * This Kinetis port assumes that the CPU works in little-endian mode.
+ * Switching to big-endian will require different bit offsets in peripheral
+ * devices' registers. Also, some bit groups may lay on byte edges, so issue
+ * with big-endian cannot be fixed only by defining bit offsets differently
+ * for the big-endian mode.
+ */
+#ifndef __LITTLE_ENDIAN
+#error This Kinetis port assumes that the CPU works in little-endian mode
+#endif
+
+/*
+ * Peripheral memory map
+ */
+#define KINETIS_AIPS0PERIPH_BASE	0x40000000
+#define KINETIS_AIPS1PERIPH_BASE	0x40080000
+
+#ifndef __ASSEMBLY__
+
+#include <asm/types.h>
+
+/*
+ * Limits for the `kinetis_periph_enable()` function:
+ *     1. The number of SIM_SCGC[] registers
+ *     2. The number of bits in those registers
+ */
+#define KINETIS_SIM_CG_NUMREGS	7
+#define KINETIS_SIM_CG_NUMBITS	32
+
+/*
+ * System Integration Module (SIM) register map
+ *
+ * This map actually covers two hardware modules:
+ *     1. SIM low-power logic, at 0x40047000
+ *     2. System integration module (SIM), at 0x40048000
+ */
+struct kinetis_sim_regs {
+	u32 sopt1;	/* System Options Register 1 */
+	u32 rsv0[1024];
+	u32 sopt2;	/* System Options Register 2 */
+	u32 rsv1;
+	u32 sopt4;	/* System Options Register 4 */
+	u32 sopt5;	/* System Options Register 5 */
+	u32 sopt6;	/* System Options Register 6 */
+	u32 sopt7;	/* System Options Register 7 */
+	u32 rsv2[2];
+	u32 sdid;	/* System Device Identification Register */
+	u32 scgc[KINETIS_SIM_CG_NUMREGS];	/* Clock Gating Regs 1...7 */
+	u32 clkdiv1;	/* System Clock Divider Register 1 */
+	u32 clkdiv2;	/* System Clock Divider Register 2 */
+	u32 fcfg1;	/* Flash Configuration Register 1 */
+	u32 fcfg2;	/* Flash Configuration Register 2 */
+	u32 uidh;	/* Unique Identification Register High */
+	u32 uidmh;	/* Unique Identification Register Mid-High */
+	u32 uidml;	/* Unique Identification Register Mid Low */
+	u32 uidl;	/* Unique Identification Register Low */
+	u32 clkdiv3;	/* System Clock Divider Register 3 */
+	u32 clkdiv4;	/* System Clock Divider Register 4 */
+	u32 mcr;	/* Misc Control Register */
+};
+
+/*
+ * SIM registers base
+ */
+#define KINETIS_SIM_BASE		(KINETIS_AIPS0PERIPH_BASE + 0x00047000)
+#define KINETIS_SIM_PTR(reg) \
+	(&(((struct kinetis_sim_regs *)(KINETIS_SIM_BASE))->reg))
+#define KINETIS_SIM_RD(reg) readl_relaxed(KINETIS_SIM_PTR(reg))
+#define KINETIS_SIM_WR(reg, val) writel_relaxed((val), KINETIS_SIM_PTR(reg))
+#define KINETIS_SIM_SET(reg, mask) \
+	KINETIS_SIM_WR(reg, (KINETIS_SIM_RD(reg)) | (mask))
+#define KINETIS_SIM_RESET(reg, mask) \
+	KINETIS_SIM_WR(reg, (KINETIS_SIM_RD(reg)) & (~(mask)))
+#define KINETIS_SIM_ISSET(reg, mask) \
+	(KINETIS_SIM_RD(reg) & (mask))
+
+/*
+ * SIM registers
+ */
+/*
+ * System Options Register 2
+ */
+/* USB HS clock source select */
+#define KINETIS_SIM_SOPT2_USBHSRC_BITS	2
+#define KINETIS_SIM_SOPT2_USBHSRC_MSK	(3 << KINETIS_SIM_SOPT2_USBHSRC_BITS)
+#define KINETIS_SIM_SOPT2_USBHSRC_PLL0	(1 << KINETIS_SIM_SOPT2_USBHSRC_BITS)
+#define KINETIS_SIM_SOPT2_USBHSRC_PLL1	(2 << KINETIS_SIM_SOPT2_USBHSRC_BITS)
+
+/* USB FS clock source select */
+#define KINETIS_SIM_SOPT2_USBFSRC_BITS	22
+#define KINETIS_SIM_SOPT2_USBFSRC_MSK	(3 << KINETIS_SIM_SOPT2_USBFSRC_BITS)
+#define KINETIS_SIM_SOPT2_USBFSRC_PLL0	(1 << KINETIS_SIM_SOPT2_USBFSRC_BITS)
+#define KINETIS_SIM_SOPT2_USBFSRC_PLL1	(2 << KINETIS_SIM_SOPT2_USBFSRC_BITS)
+#define KINETIS_SIM_SOPT2_USBF_CLKSEL	(1 << 18)
+
+/*
+ * System Clock Divider Register 1
+ */
+/* Clock 1 output divider value (for the core/system clock) */
+#define KINETIS_SIM_CLKDIV1_OUTDIV1_BITS	28
+#define KINETIS_SIM_CLKDIV1_OUTDIV1_MSK \
+	(((1 << 4) - 1) << KINETIS_SIM_CLKDIV1_OUTDIV1_BITS)
+/* Clock 2 output divider value (for the peripheral clock) */
+#define KINETIS_SIM_CLKDIV1_OUTDIV2_BITS	24
+#define KINETIS_SIM_CLKDIV1_OUTDIV2_MSK \
+	(((1 << 4) - 1) << KINETIS_SIM_CLKDIV1_OUTDIV2_BITS)
+
+/*
+ * System Clock Divider Register 2
+ */
+/* USB HS clock divider fraction */
+#define KINETIS_SIM_CLKDIV2_USBHSFRAC_BIT	8
+#define KINETIS_SIM_CLKDIV2_USBHSFRAC_MSK \
+	(1 << KINETIS_SIM_CLKDIV2_USBHSFRAC_BIT)
+/* USB HS clock divider divisor */
+#define KINETIS_SIM_CLKDIV2_USBHSDIV_BIT	9
+#define KINETIS_SIM_CLKDIV2_USBHSDIV_MSK \
+	(7 << KINETIS_SIM_CLKDIV2_USBHSDIV_BIT)
+
+/* USB FS clock divider fraction */
+#define KINETIS_SIM_CLKDIV2_USBFSFRAC_BIT	0
+#define KINETIS_SIM_CLKDIV2_USBFSFRAC_MSK \
+	(1 << KINETIS_SIM_CLKDIV2_USBFSFRAC_BIT)
+/* USB FS clock divider divisor */
+#define KINETIS_SIM_CLKDIV2_USBFSDIV_BIT	1
+#define KINETIS_SIM_CLKDIV2_USBFSDIV_MSK \
+	(7 << KINETIS_SIM_CLKDIV2_USBFSDIV_BIT)
+
+/*
+ * System Clock Divider Register 3
+ */
+/* LCD Controller clock divider divisor */
+#define KINETIS_SIM_CLKDIV3_LCDCDIV_BITS	16
+#define KINETIS_SIM_CLKDIV3_LCDCDIV_BITWIDTH	12
+#define KINETIS_SIM_CLKDIV3_LCDCDIV_MSK \
+	(((1 << KINETIS_SIM_CLKDIV3_LCDCDIV_BITWIDTH) - 1) << \
+	KINETIS_SIM_CLKDIV3_LCDCDIV_BITS)
+/* LCD Controller clock divider fraction */
+#define KINETIS_SIM_CLKDIV3_LCDCFRAC_BITS	8
+#define KINETIS_SIM_CLKDIV3_LCDCFRAC_BITWIDTH	8
+#define KINETIS_SIM_CLKDIV3_LCDCFRAC_MSK \
+	(((1 << KINETIS_SIM_CLKDIV3_LCDCFRAC_BITWIDTH) - 1) << \
+	KINETIS_SIM_CLKDIV3_LCDCFRAC_BITS)
+
+/*
+ * Misc Control Register
+ */
+/* 60 MHz ULPI clock (ULPI_CLK) output enable */
+#define KINETIS_SIM_MCR_ULPICLKOBE_MSK	(1 << 30)
+/* Start LCDC display */
+#define KINETIS_SIM_MCR_LCDSTART_MSK	(1 << 16)
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _MACH_KINETIS_KINETIS_H */
diff --git a/arch/arm/mach-kinetis/kinetis_platform.c b/arch/arm/mach-kinetis/kinetis_platform.c
new file mode 100644
index 0000000..f1b6607
--- /dev/null
+++ b/arch/arm/mach-kinetis/kinetis_platform.c
@@ -0,0 +1,61 @@
+/*
+ * kinetis_platform.c - Freescale Kinetis K70F120M Development Board
+ *
+ * Based on legacy pre-OF code by Alexander Potashev <aspotashev@emcraft.com>
+ *
+ * (C) Copyright 2011, 2012
+ * Emcraft Systems, <www.emcraft.com>
+ * Alexander Potashev <aspotashev@emcraft.com>
+ *
+ * Copyright (C) 2015 Paul Osmialowski <pawelo@king.net.pl>
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/of_platform.h>
+#include <asm/v7m.h>
+#include <asm/mach-types.h>
+#include <asm/mach/arch.h>
+
+/*
+ * Map required regions.
+ * This being the no-MMU Linux, I am not mapping anything
+ * since all I/O registers are available at their physical addresses.
+ */
+static void __init kinetis_map_io(void)
+{
+}
+
+/*
+ * Freescale Kinetis platform initialization
+ */
+static void __init kinetis_init(void)
+{
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+}
+
+static const char *const kinetis_compat[] __initconst = {
+	"fsl,kinetis-twr-k70f120m",
+	NULL
+};
+
+/*
+ * Freescale Kinetis platform machine description
+ */
+DT_MACHINE_START(KINETIS, "Freescale Kinetis")
+	.dt_compat	= kinetis_compat,
+	.restart	= armv7m_restart,
+	/*
+	 * Physical address of the serial port used for the early
+	 * kernel debugging.
+	 * This address is actually never used in the MMU-less kernel
+	 * (since no mapping is needed to access this port),
+	 * but let's keep these fields filled out for consistency.
+	 */
+	.map_io		= kinetis_map_io,
+	.init_machine	= kinetis_init,
+MACHINE_END
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index d19cb4d..b611ac6 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -618,6 +618,7 @@ config CPU_V7M_NUM_IRQ
 	depends on CPU_V7M
 	default 90 if ARCH_STM32
 	default 38 if ARCH_EFM32
+	default 106 if ARCH_KINETIS
 	default 112 if SOC_VF610
 	default 240
 	help
diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
index 2ed1b8a..1d05516 100644
--- a/arch/arm/tools/mach-types
+++ b/arch/arm/tools/mach-types
@@ -554,6 +554,7 @@ smdk4412		MACH_SMDK4412		SMDK4412		3765
 marzen			MACH_MARZEN		MARZEN			3790
 krome			MACH_KROME		KROME			3797
 armadillo800eva		MACH_ARMADILLO800EVA	ARMADILLO800EVA		3863
+kinetis			MACH_KINETIS		KINETIS			3896
 mx53_umobo		MACH_MX53_UMOBO		MX53_UMOBO		3927
 mt4			MACH_MT4		MT4			3981
 u8520			MACH_U8520		U8520			3990
-- 
2.3.6

