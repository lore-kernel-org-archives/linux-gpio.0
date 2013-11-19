From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: bcm-kona: lock IRQs when starting them
Date: Tue, 19 Nov 2013 14:17:31 +0100
Message-ID: <1384867051-31066-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:63932 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004Ab3KSNRu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2013 08:17:50 -0500
Received: by mail-we0-f179.google.com with SMTP id q59so5477319wes.24
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2013 05:17:49 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Markus Mayer <markus.mayer@linaro.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Christian Daudt <csd@broadcom.com>

This uses the new API for tagging GPIO lines as in use by
IRQs. This enforces a few semantic checks on how the underlying
GPIO line is used.

Cc: Markus Mayer <markus.mayer@linaro.org>
Cc: Christian Daudt <csd@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-bcm-kona.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 72c927dc3be1..dee6d03a7959 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -449,12 +449,32 @@ static void bcm_kona_gpio_irq_handler(unsigned int irq, struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static unsigned int bcm_kona_gpio_irq_startup(struct irq_data *d)
+{
+	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
+
+	if (gpio_lock_as_irq(&kona_gpio->gpio_chip, d->hwirq))
+		dev_err(kona_gpio->gpio_chip.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			d->hwirq);
+	return 0;
+}
+
+static void bcm_kona_gpio_irq_shutdown(struct irq_data *d)
+{
+	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
+
+	gpio_unlock_as_irq(&kona_gpio->gpio_chip, d->hwirq);
+}
+
 static struct irq_chip bcm_gpio_irq_chip = {
 	.name = "bcm-kona-gpio",
 	.irq_ack = bcm_kona_gpio_irq_ack,
 	.irq_mask = bcm_kona_gpio_irq_mask,
 	.irq_unmask = bcm_kona_gpio_irq_unmask,
 	.irq_set_type = bcm_kona_gpio_irq_set_type,
+	.irq_startup = bcm_kona_gpio_irq_startup,
+	.irq_shutdown = bcm_kona_gpio_irq_shutdown,
 };
 
 static struct __initconst of_device_id bcm_kona_gpio_of_match[] = {
-- 
1.8.3.1

