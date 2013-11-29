From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3] gpio: lock adnp IRQs when starting them
Date: Fri, 29 Nov 2013 10:48:18 +0100
Message-ID: <1385718498-28525-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:65378 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754006Ab3K2Js3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 04:48:29 -0500
Received: by mail-la0-f46.google.com with SMTP id eh20so6588811lab.19
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 01:48:27 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Lars Poeschel <poeschel@lemonage.de>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This uses the new API for tagging GPIO lines as in use by
IRQs. This enforces a few semantic checks on how the underlying
GPIO line is used.

Only compile tested on the lpc32xx.

Cc: Lars Poeschel <poeschel@lemonage.de>
Cc: Thierry Reding <thierry.reding@avionic-design.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Switch to using the startup()/shutdown() callbacks again.
  Still satisfy the mask/unmask semantics.
ChangeLog v1->v2:
- Use the .enable() callback from the irq_chip
- Call .unmask() from the .enable() callback to satisfy semantics.
---
 drivers/gpio/gpio-adnp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index b204033acaeb..a7b471977dc5 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -408,6 +408,27 @@ static void adnp_irq_bus_unlock(struct irq_data *data)
 	mutex_unlock(&adnp->irq_lock);
 }
 
+static unsigned int adnp_irq_startup(struct irq_data *data)
+{
+	struct adnp *adnp = irq_data_get_irq_chip_data(data);
+
+	if (gpio_lock_as_irq(&adnp->gpio, data->hwirq))
+		dev_err(adnp->gpio.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			data->hwirq);
+	/* Satisfy the .enable semantics by unmasking the line */
+	adnp_irq_unmask(data);
+	return 0;
+}
+
+static void adnp_irq_shutdown(struct irq_data *data)
+{
+	struct adnp *adnp = irq_data_get_irq_chip_data(data);
+
+	adnp_irq_mask(data);
+	gpio_unlock_as_irq(&adnp->gpio, data->hwirq);
+}
+
 static struct irq_chip adnp_irq_chip = {
 	.name = "gpio-adnp",
 	.irq_mask = adnp_irq_mask,
@@ -415,6 +436,8 @@ static struct irq_chip adnp_irq_chip = {
 	.irq_set_type = adnp_irq_set_type,
 	.irq_bus_lock = adnp_irq_bus_lock,
 	.irq_bus_sync_unlock = adnp_irq_bus_unlock,
+	.irq_startup = adnp_irq_startup,
+	.irq_shutdown = adnp_irq_shutdown,
 };
 
 static int adnp_irq_map(struct irq_domain *domain, unsigned int irq,
-- 
1.8.3.1

