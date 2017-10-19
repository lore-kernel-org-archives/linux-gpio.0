From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] blackfin: Fix local <asm/gpio.h> includes
Date: Thu, 19 Oct 2017 15:18:36 +0200
Message-ID: <20171019131836.28634-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:52854 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752639AbdJSNSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Oct 2017 09:18:41 -0400
Received: by mail-lf0-f65.google.com with SMTP id b190so9557670lfg.9
        for <linux-gpio@vger.kernel.org>; Thu, 19 Oct 2017 06:18:41 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Steven Miao <realmz6@gmail.com>, Huanhuan Feng <huanhuan.feng@analog.com>

When making the pin control submenu globally visible, all kinds
of oddities appear, in blackfin a few files were #including
<linux/gpio.h> and relying on that to pull in <asm/gpio.h>.

This was not working when pin control but not GPIOLIB was
selected resulting in a breakage in allmodconfig. The code these
files were using was still there and defined in <asm/gpio.h>
just not pulle in from just including <linux/gpio.h>

Simply add the required includes explicitly in the blackfin
kernel core and everything compiles fine.

Delete the use of the incorrect <linux/gpio.h> where possible.

Add stubs to <asm/gpio.h> for the functions called from PM:
these should probably also depend on !PINCTRL but since the
global CONFIG_PM symbol is used to compile PM support,
we need some more intrusive thing here, to be tested by
Blackfin maintainers.

Cc: Steven Miao <realmz6@gmail.com>
Cc: Huanhuan Feng <huanhuan.feng@analog.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/blackfin/include/asm/gpio.h          | 20 ++++++++++++++++++++
 arch/blackfin/kernel/bfin_gpio.c          |  3 +++
 arch/blackfin/kernel/debug-mmrs.c         |  2 +-
 arch/blackfin/mach-common/ints-priority.c |  2 +-
 arch/blackfin/mach-common/pm.c            |  2 +-
 5 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/blackfin/include/asm/gpio.h b/arch/blackfin/include/asm/gpio.h
index 99d338ca2ea4..a2579321c7f1 100644
--- a/arch/blackfin/include/asm/gpio.h
+++ b/arch/blackfin/include/asm/gpio.h
@@ -183,6 +183,26 @@ static inline int irq_to_gpio(unsigned irq)
 {
 	return irq - GPIO_IRQ_BASE;
 }
+
+#else /* CONFIG_PINCTRL */
+
+/*
+ * CONFIG_PM is not working with pin control and should probably
+ * avoid being selected when pin control is active, but so far,
+ * these stubs are here to make allyesconfig and allmodconfig
+ * compile properly. These functions are normally backed by the
+ * CONFIG_ADI_GPIO custom GPIO implementation.
+ */
+
+static inline int bfin_pm_standby_setup(void)
+{
+	return 0;
+}
+
+static inline void bfin_pm_standby_restore(void)
+{
+}
+
 #endif /* CONFIG_PINCTRL */
 
 #include <asm/irq.h>
diff --git a/arch/blackfin/kernel/bfin_gpio.c b/arch/blackfin/kernel/bfin_gpio.c
index c5d31287de01..63da80bbadf6 100644
--- a/arch/blackfin/kernel/bfin_gpio.c
+++ b/arch/blackfin/kernel/bfin_gpio.c
@@ -15,6 +15,9 @@
 /* FIXME: consumer API required for gpio_set_value() etc, get rid of this */
 #include <linux/gpio.h>
 #include <linux/irq.h>
+#include <asm/gpio.h>
+#include <asm/irq_handler.h>
+#include <asm/portmux.h>
 
 #if ANOMALY_05000311 || ANOMALY_05000323
 enum {
diff --git a/arch/blackfin/kernel/debug-mmrs.c b/arch/blackfin/kernel/debug-mmrs.c
index f31ace221392..194773ce109e 100644
--- a/arch/blackfin/kernel/debug-mmrs.c
+++ b/arch/blackfin/kernel/debug-mmrs.c
@@ -10,7 +10,6 @@
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
 
 #include <asm/blackfin.h>
 #include <asm/gptimers.h>
@@ -20,6 +19,7 @@
 #include <asm/bfin_serial.h>
 #include <asm/bfin5xx_spi.h>
 #include <asm/bfin_twi.h>
+#include <asm/gpio.h>
 
 /* Common code defines PORT_MUX on us, so redirect the MMR back locally */
 #ifdef BFIN_PORT_MUX
diff --git a/arch/blackfin/mach-common/ints-priority.c b/arch/blackfin/mach-common/ints-priority.c
index 13e94bf9d8ba..e81a5b7dabdc 100644
--- a/arch/blackfin/mach-common/ints-priority.c
+++ b/arch/blackfin/mach-common/ints-priority.c
@@ -18,7 +18,6 @@
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/syscore_ops.h>
-#include <linux/gpio.h>
 #include <asm/delay.h>
 #ifdef CONFIG_IPIPE
 #include <linux/ipipe.h>
@@ -28,6 +27,7 @@
 #include <asm/irq_handler.h>
 #include <asm/dpmc.h>
 #include <asm/traps.h>
+#include <asm/gpio.h>
 
 /*
  * NOTES:
diff --git a/arch/blackfin/mach-common/pm.c b/arch/blackfin/mach-common/pm.c
index 5ece38a5b758..f57b5fe5355e 100644
--- a/arch/blackfin/mach-common/pm.c
+++ b/arch/blackfin/mach-common/pm.c
@@ -15,12 +15,12 @@
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 
 #include <asm/cplb.h>
 #include <asm/dma.h>
 #include <asm/dpmc.h>
 #include <asm/pm.h>
+#include <asm/gpio.h>
 
 #ifdef CONFIG_BF60x
 struct bfin_cpu_pm_fns *bfin_cpu_pm;
-- 
2.13.6

