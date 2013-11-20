From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: lynxpoint: lock IRQs when starting them
Date: Wed, 20 Nov 2013 15:42:29 +0100
Message-ID: <1384958549-23722-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:58114 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750860Ab3KTOmg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2013 09:42:36 -0500
Received: by mail-we0-f175.google.com with SMTP id p61so4524797wes.20
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2013 06:42:35 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This uses the new API for tagging GPIO lines as in use by
IRQs. This enforces a few semantic checks on how the underlying
GPIO line is used.

Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-lynxpoint.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index f1ca9d5880b6..8c7634250aff 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -301,6 +301,24 @@ static void lp_irq_disable(struct irq_data *d)
 	spin_unlock_irqrestore(&lg->lock, flags);
 }
 
+static unsigned int lp_irq_startup(struct irq_data *d)
+{
+	struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
+
+	if (gpio_lock_as_irq(&lg->chip, irqd_to_hwirq(d)))
+		dev_err(lg->chip.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			irqd_to_hwirq(d));
+	return 0;
+}
+
+static void lp_irq_shutdown(struct irq_data *d)
+{
+	struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
+
+	gpio_unlock_as_irq(&lg->chip, irqd_to_hwirq(d));
+}
+
 static struct irq_chip lp_irqchip = {
 	.name = "LP-GPIO",
 	.irq_mask = lp_irq_mask,
@@ -308,6 +326,8 @@ static struct irq_chip lp_irqchip = {
 	.irq_enable = lp_irq_enable,
 	.irq_disable = lp_irq_disable,
 	.irq_set_type = lp_irq_type,
+	.irq_startup = lp_irq_startup,
+	.irq_shutdown = lp_irq_shutdown,
 	.flags = IRQCHIP_SKIP_SET_WAKE,
 };
 
-- 
1.8.3.1

