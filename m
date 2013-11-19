From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: lock adnp IRQs when starting them
Date: Tue, 19 Nov 2013 13:40:27 +0100
Message-ID: <1384864827-29694-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:38919 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004Ab3KSMkg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 07:40:36 -0500
Received: by mail-we0-f170.google.com with SMTP id w61so3956995wes.15
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 04:40:35 -0800 (PST)
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
 drivers/gpio/gpio-adnp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index b204033acaeb..bf6fb54fa436 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -408,6 +408,24 @@ static void adnp_irq_bus_unlock(struct irq_data *data)
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
+	return 0;
+}
+
+static void adnp_irq_shutdown(struct irq_data *data)
+{
+	struct adnp *adnp = irq_data_get_irq_chip_data(data);
+
+	gpio_unlock_as_irq(&adnp->gpio, data->hwirq);
+}
+
 static struct irq_chip adnp_irq_chip = {
 	.name = "gpio-adnp",
 	.irq_mask = adnp_irq_mask,
@@ -415,6 +433,8 @@ static struct irq_chip adnp_irq_chip = {
 	.irq_set_type = adnp_irq_set_type,
 	.irq_bus_lock = adnp_irq_bus_lock,
 	.irq_bus_sync_unlock = adnp_irq_bus_unlock,
+	.irq_startup = adnp_irq_startup,
+	.irq_shutdown = adnp_irq_shutdown,
 };
 
 static int adnp_irq_map(struct irq_domain *domain, unsigned int irq,
-- 
1.8.3.1

