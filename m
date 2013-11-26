From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: lynxpoint: lock IRQs when starting them
Date: Tue, 26 Nov 2013 11:23:39 +0100
Message-ID: <1385461419-5979-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:60688 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755045Ab3KZKXp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 05:23:45 -0500
Received: by mail-la0-f43.google.com with SMTP id n7so4028080lam.16
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 02:23:44 -0800 (PST)
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
ChangeLog v1->v2:
- Explicitly call .enable()/.disable() callbacks from the
  startup()/shutdown() callbacks to satisfy implicit semantics.
---
 drivers/gpio/gpio-lynxpoint.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index a0804740a0b7..70831e4b2c8b 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -301,6 +301,26 @@ static void lp_irq_disable(struct irq_data *d)
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
+	lp_irq_enable(d);
+	return 0;
+}
+
+static void lp_irq_shutdown(struct irq_data *d)
+{
+	struct lp_gpio *lg = irq_data_get_irq_chip_data(d);
+
+	lp_irq_disable(d);
+	gpio_unlock_as_irq(&lg->chip, irqd_to_hwirq(d));
+}
+
 static struct irq_chip lp_irqchip = {
 	.name = "LP-GPIO",
 	.irq_mask = lp_irq_mask,
@@ -308,6 +328,8 @@ static struct irq_chip lp_irqchip = {
 	.irq_enable = lp_irq_enable,
 	.irq_disable = lp_irq_disable,
 	.irq_set_type = lp_irq_type,
+	.irq_startup = lp_irq_startup,
+	.irq_shutdown = lp_irq_shutdown,
 	.flags = IRQCHIP_SKIP_SET_WAKE,
 };
 
-- 
1.8.3.1

