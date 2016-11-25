From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/5] gpio: pl061: move platform data into driver
Date: Fri, 25 Nov 2016 11:09:23 +0100
Message-ID: <1480068564-9447-4-git-send-email-linus.walleij@linaro.org>
References: <1480068564-9447-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34307 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752993AbcKYKJy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Nov 2016 05:09:54 -0500
Received: by mail-lf0-f52.google.com with SMTP id o141so46855743lff.1
        for <linux-gpio@vger.kernel.org>; Fri, 25 Nov 2016 02:09:53 -0800 (PST)
In-Reply-To: <1480068564-9447-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Baruch Siach <baruch@tkos.co.il>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, arm@vger.kernel.org, Russell King <linux@armlinux.org.uk>

No boardfile defines any PL061 platform data anymore: the
Integrator IM/PD-1 includes the file but is not making use
of the struct. Let's delete the include and all references,
then move the platform data into the driver for later
consolidation into the driver state container.

The only resource defined by the IM/PD-1 is the IRQ which
is passed through the AMBA PrimeCell bus abstraction
struct amba_device.

Cc: arm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks/Russell: I don't think this is any controversial
move, please ACK this if you're OK with it.
---
 arch/arm/mach-integrator/impd1.c |  1 -
 drivers/gpio/gpio-pl061.c        | 14 +++++++++++++-
 include/linux/amba/pl061.h       | 16 ----------------
 3 files changed, 13 insertions(+), 18 deletions(-)
 delete mode 100644 include/linux/amba/pl061.h

diff --git a/arch/arm/mach-integrator/impd1.c b/arch/arm/mach-integrator/impd1.c
index ed9a01484030..a109f6482413 100644
--- a/arch/arm/mach-integrator/impd1.c
+++ b/arch/arm/mach-integrator/impd1.c
@@ -21,7 +21,6 @@
 #include <linux/amba/bus.h>
 #include <linux/amba/clcd.h>
 #include <linux/amba/mmci.h>
-#include <linux/amba/pl061.h>
 #include <linux/io.h>
 #include <linux/platform_data/clk-integrator.h>
 #include <linux/slab.h>
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 47f397236417..cbcc631181e0 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -23,7 +23,6 @@
 #include <linux/gpio.h>
 #include <linux/device.h>
 #include <linux/amba/bus.h>
-#include <linux/amba/pl061.h>
 #include <linux/slab.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
@@ -39,6 +38,19 @@
 
 #define PL061_GPIO_NR	8
 
+struct pl061_platform_data {
+	/* number of the first GPIO */
+	unsigned	gpio_base;
+
+	/* number of the first IRQ.
+	 * If the IRQ functionality in not desired this must be set to 0.
+	 */
+	unsigned	irq_base;
+
+	u8		directions;	/* startup directions, 1: out, 0: in */
+	u8		values;		/* startup values */
+};
+
 #ifdef CONFIG_PM
 struct pl061_context_save_regs {
 	u8 gpio_data;
diff --git a/include/linux/amba/pl061.h b/include/linux/amba/pl061.h
deleted file mode 100644
index fb83c0453489..000000000000
--- a/include/linux/amba/pl061.h
+++ /dev/null
@@ -1,16 +0,0 @@
-#include <linux/types.h>
-
-/* platform data for the PL061 GPIO driver */
-
-struct pl061_platform_data {
-	/* number of the first GPIO */
-	unsigned	gpio_base;
-
-	/* number of the first IRQ.
-	 * If the IRQ functionality in not desired this must be set to 0.
-	 */
-	unsigned	irq_base;
-
-	u8		directions;	/* startup directions, 1: out, 0: in */
-	u8		values;		/* startup values */
-};
-- 
2.7.4

