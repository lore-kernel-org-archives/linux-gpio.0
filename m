From: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 1/9] arm: select different compiler flags for ARM CortexM3
Date: Tue, 23 Jun 2015 23:19:39 +0200
Message-ID: <1435094387-20146-2-git-send-email-pawelo@king.net.pl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from fish.king.net.pl ([79.190.246.46]:37007 "EHLO king.net.pl"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S934066AbbFWVue (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 23 Jun 2015 17:50:34 -0400
In-Reply-To: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan Lynch <nathan_lynch@mentor.com>, Nicolas
Cc: Paul Osmialowski <pawelo@king.net.pl>, Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>

This one is inspired by two commits published on Emcraft git repo:

https://github.com/EmcraftSystems/linux-emcraft.git

1) 6302b692f570ff9d5645a6e72c11f87b0c1aa409
 RT #62654. Fixed kernel crashes while running httpd by enabling
 "-mfix-cortex-m3-ldrd" compiler option, which prevents compiler from
 generating code like 'ldrd Ra, Rb, [Ra, #Imm]' - according to the 602117
 Cortex-M3 Errata it may result in incorrect base register when interrupted
 or faulted.

by: Yuri Tikhonov <yur@emcraft.com>

2) 359d3cda84c01c0f3fae1a519b97a31f318f57ab
 RT #62654. Removed "--march=..." leaving only "-mcpu=cortex-m3" to make
 sure only the correct instructions will be generated.

by: Sergei Poselenov <sposelenov@emcraft.com>

I reworked these patches to make them less intrusive.

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 arch/arm/Kconfig    |  2 +-
 arch/arm/Makefile   |  1 +
 arch/arm/mm/Kconfig | 11 ++++++++++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index a750c14..8e3a833 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -32,7 +32,7 @@ config ARM
 	select HANDLE_DOMAIN_IRQ
 	select HARDIRQS_SW_RESEND
 	select HAVE_ARCH_AUDITSYSCALL if (AEABI && !OABI_COMPAT)
-	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7) && !CPU_32v6
+	select HAVE_ARCH_BITREVERSE if (CPU_32v7M || CPU_32v7M3 || CPU_32v7) && !CPU_32v6
 	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL && !CPU_ENDIAN_BE32
 	select HAVE_ARCH_KGDB if !CPU_ENDIAN_BE32
 	select HAVE_ARCH_SECCOMP_FILTER if (AEABI && !OABI_COMPAT)
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 07ab3d2..a7e1007 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -58,6 +58,7 @@ endif
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
 # testing for a specific architecture or later rather impossible.
+arch-$(CONFIG_CPU_32v7M3)	=-D__LINUX_ARM_ARCH__=7 -mcpu=cortex-m3 -Wa,-mcpu=cortex-m3
 arch-$(CONFIG_CPU_32v7M)	=-D__LINUX_ARM_ARCH__=7 -march=armv7-m -Wa,-march=armv7-m
 arch-$(CONFIG_CPU_32v7)		=-D__LINUX_ARM_ARCH__=7 $(call cc-option,-march=armv7-a,-march=armv5t -Wa$(comma)-march=armv7-a)
 arch-$(CONFIG_CPU_32v6)		=-D__LINUX_ARM_ARCH__=6 $(call cc-option,-march=armv6,-march=armv5t -Wa$(comma)-march=armv6)
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 7c6b976..d19cb4d 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -401,12 +401,18 @@ config CPU_V7
 # ARMv7M
 config CPU_V7M
 	bool
-	select CPU_32v7M
+	select CPU_32v7M if !CPU_CORTEXM3
+	select CPU_32v7M3 if CPU_CORTEXM3
 	select CPU_ABRT_NOMMU
 	select CPU_CACHE_NOP
 	select CPU_PABRT_LEGACY
 	select CPU_THUMBONLY
 
+# ARM CortexM3
+config CPU_CORTEXM3
+	bool
+	select CPU_V7M
+
 config CPU_THUMBONLY
 	bool
 	# There are no CPUs available with MMU that don't implement an ARM ISA:
@@ -457,6 +463,9 @@ config CPU_32v7
 config CPU_32v7M
 	bool
 
+config CPU_32v7M3
+	bool
+
 # The abort model
 config CPU_ABRT_NOMMU
 	bool
-- 
2.3.6

