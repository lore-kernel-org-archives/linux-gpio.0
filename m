From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: ftgpio010: Fix some more registers
Date: Thu, 30 Nov 2017 22:17:18 +0100
Message-ID: <20171130211718.8074-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44063 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750890AbdK3VTY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 16:19:24 -0500
Received: by mail-lf0-f66.google.com with SMTP id x204so9458111lfa.11
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 13:19:23 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

There is a register for "bypass" which seems to not be
used for anything in some silicon designs, but may be used
in others, and there is both a raw and masked interrupt
status register.

Define them all for clarity, no semantic changes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ftgpio010.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 7b3394fdc624..aa825925db52 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -21,12 +21,14 @@
 #define GPIO_DATA_OUT		0x00
 #define GPIO_DATA_IN		0x04
 #define GPIO_DIR		0x08
+#define GPIO_BYPASS_IN		0x0C
 #define GPIO_DATA_SET		0x10
 #define GPIO_DATA_CLR		0x14
 #define GPIO_PULL_EN		0x18
 #define GPIO_PULL_TYPE		0x1C
 #define GPIO_INT_EN		0x20
-#define GPIO_INT_STAT		0x24
+#define GPIO_INT_STAT_RAW	0x24
+#define GPIO_INT_STAT_MASKED	0x28
 #define GPIO_INT_MASK		0x2C
 #define GPIO_INT_CLR		0x30
 #define GPIO_INT_TYPE		0x34
@@ -147,7 +149,7 @@ static void ftgpio_gpio_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(irqchip, desc);
 
-	stat = readl(g->base + GPIO_INT_STAT);
+	stat = readl(g->base + GPIO_INT_STAT_RAW);
 	if (stat)
 		for_each_set_bit(offset, &stat, gc->ngpio)
 			generic_handle_irq(irq_find_mapping(gc->irq.domain,
-- 
2.14.3

