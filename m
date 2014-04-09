From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] gpio: tc3589x: get rid of static IRQ base
Date: Wed,  9 Apr 2014 13:48:59 +0200
Message-ID: <1397044139-19306-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:43981 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932482AbaDILtF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Apr 2014 07:49:05 -0400
Received: by mail-we0-f170.google.com with SMTP id w61so2364004wes.15
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2014 04:49:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>

The static IRQ base is not used on any platforms with this chip
(only Ux500). Get rid of it forever, and rely on dynamic IRQ
descriptor allocation.

Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-tc3589x.c | 10 +---------
 include/linux/mfd/tc3589x.h |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 113e50cb1f59..4b0d8ccbe561 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -32,9 +32,6 @@ struct tc3589x_gpio {
 	struct device *dev;
 	struct mutex irq_lock;
 	struct irq_domain *domain;
-
-	int irq_base;
-
 	/* Caches of interrupt control registers for bus_lock */
 	u8 regs[CACHE_NR_REGS][CACHE_NR_BANKS];
 	u8 oldregs[CACHE_NR_REGS][CACHE_NR_BANKS];
@@ -290,8 +287,6 @@ static struct irq_domain_ops tc3589x_irq_ops = {
 static int tc3589x_gpio_irq_init(struct tc3589x_gpio *tc3589x_gpio,
 				struct device_node *np)
 {
-	int base = tc3589x_gpio->irq_base;
-
 	/*
 	 * If this results in a linear domain, irq_create_mapping() will
 	 * take care of allocating IRQ descriptors at runtime. When a base
@@ -299,7 +294,7 @@ static int tc3589x_gpio_irq_init(struct tc3589x_gpio *tc3589x_gpio,
 	 * domain is instantiated.
 	 */
 	tc3589x_gpio->domain = irq_domain_add_simple(np,
-			tc3589x_gpio->chip.ngpio, base, &tc3589x_irq_ops,
+			tc3589x_gpio->chip.ngpio, 0, &tc3589x_irq_ops,
 			tc3589x_gpio);
 	if (!tc3589x_gpio->domain) {
 		dev_err(tc3589x_gpio->dev, "Failed to create irqdomain\n");
@@ -348,9 +343,6 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 	tc3589x_gpio->chip.of_node = np;
 #endif
 
-	tc3589x_gpio->irq_base = tc3589x->irq_base ?
-		tc3589x->irq_base + TC3589x_INT_GPIO(0) : 0;
-
 	/* Bring the GPIO module out of reset */
 	ret = tc3589x_set_bits(tc3589x, TC3589x_RSTCTRL,
 			       TC3589x_RSTCTRL_GPIRST, 0);
diff --git a/include/linux/mfd/tc3589x.h b/include/linux/mfd/tc3589x.h
index 6b8e1ff4672b..e6088c2e2092 100644
--- a/include/linux/mfd/tc3589x.h
+++ b/include/linux/mfd/tc3589x.h
@@ -111,7 +111,6 @@ enum tx3589x_block {
 #define TC3589x_INT_PORIRQ	7
 
 #define TC3589x_NR_INTERNAL_IRQS	8
-#define TC3589x_INT_GPIO(x)	(TC3589x_NR_INTERNAL_IRQS + (x))
 
 struct tc3589x {
 	struct mutex lock;
-- 
1.9.0

