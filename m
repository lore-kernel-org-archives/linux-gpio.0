From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 5/5] MIPS: ralink: we require gpiolib
Date: Fri, 10 Oct 2014 22:28:50 +0200
Message-ID: <1412972930-16777-5-git-send-email-blogic@openwrt.org>
References: <1412972930-16777-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from static.88-198-24-112.clients.your-server.de ([88.198.24.112]:49294
	"EHLO nbd.name" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755108AbaJJUze (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Oct 2014 16:55:34 -0400
In-Reply-To: <1412972930-16777-1-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org, linux-gpio@vger.kernel.org

Select ARCH_REQUIRE_GPIOLIB by default when building a kernel for RALINK.

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 arch/mips/Kconfig                        |    1 +
 arch/mips/include/asm/mach-ralink/gpio.h |   24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ralink/gpio.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2d255e8..380cce3 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -453,6 +453,7 @@ config RALINK
 	select RESET_CONTROLLER
 	select PINCTRL
 	select PINCTRL_RT2880
+	select ARCH_REQUIRE_GPIOLIB
 
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
diff --git a/arch/mips/include/asm/mach-ralink/gpio.h b/arch/mips/include/asm/mach-ralink/gpio.h
new file mode 100644
index 0000000..f68ee16
--- /dev/null
+++ b/arch/mips/include/asm/mach-ralink/gpio.h
@@ -0,0 +1,24 @@
+/*
+ *  Ralink SoC GPIO API support
+ *
+ *  Copyright (C) 2008-2009 Gabor Juhos <juhosg@openwrt.org>
+ *  Copyright (C) 2008 Imre Kaloz <kaloz@openwrt.org>
+ *
+ *  This program is free software; you can redistribute it and/or modify it
+ *  under the terms of the GNU General Public License version 2 as published
+ *  by the Free Software Foundation.
+ *
+ */
+
+#ifndef __ASM_MACH_RALINK_GPIO_H
+#define __ASM_MACH_RALINK_GPIO_H
+
+#define ARCH_NR_GPIOS	128
+#include <asm-generic/gpio.h>
+
+#define gpio_get_value	__gpio_get_value
+#define gpio_set_value	__gpio_set_value
+#define gpio_cansleep	__gpio_cansleep
+#define gpio_to_irq	__gpio_to_irq
+
+#endif /* __ASM_MACH_RALINK_GPIO_H */
-- 
1.7.10.4

