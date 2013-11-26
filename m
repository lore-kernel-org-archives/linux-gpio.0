From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: em: lock IRQs when starting them
Date: Tue, 26 Nov 2013 11:16:18 +0100
Message-ID: <1385460978-4122-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:39185 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755276Ab3KZKQ2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 05:16:28 -0500
Received: by mail-la0-f50.google.com with SMTP id el20so4169964lab.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 02:16:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Magnus Damm <damm@opensource.se>, Ian Molton <ian.molton@codethink.co.uk>, Simon Horman <horms+renesas@verge.net.au>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This uses the new API for tagging GPIO lines as in use by
IRQs. This enforces a few semantic checks on how the underlying
GPIO line is used.

Also assign the gpio_chip.dev pointer to be used for error
messages.

Cc: Magnus Damm <damm@opensource.se>
Cc: Ian Molton <ian.molton@codethink.co.uk>
Cc: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Satisfy implicit semantics by calling .enable and .disable
  callbacks in the startup/shutdown callbacks.
---
 drivers/gpio/gpio-em.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index ec190361bf2e..1cc53516e8b4 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -99,6 +99,27 @@ static void em_gio_irq_enable(struct irq_data *d)
 	em_gio_write(p, GIO_IEN, BIT(irqd_to_hwirq(d)));
 }
 
+static unsigned int em_gio_irq_startup(struct irq_data *d)
+{
+	struct em_gio_priv *p = irq_data_get_irq_chip_data(d);
+
+	if (gpio_lock_as_irq(&p->gpio_chip, irqd_to_hwirq(d)))
+		dev_err(p->gpio_chip.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			irqd_to_hwirq(d));
+	em_gio_irq_enable(d);
+	return 0;
+}
+
+static void em_gio_irq_shutdown(struct irq_data *d)
+{
+	struct em_gio_priv *p = irq_data_get_irq_chip_data(d);
+
+	em_gio_irq_disable(d);
+	gpio_unlock_as_irq(&p->gpio_chip, irqd_to_hwirq(d));
+}
+
+
 #define GIO_ASYNC(x) (x + 8)
 
 static unsigned char em_gio_sense_table[IRQ_TYPE_SENSE_MASK + 1] = {
@@ -328,6 +349,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	gpio_chip->request = em_gio_request;
 	gpio_chip->free = em_gio_free;
 	gpio_chip->label = name;
+	gpio_chip->dev = &pdev->dev;
 	gpio_chip->owner = THIS_MODULE;
 	gpio_chip->base = pdata->gpio_base;
 	gpio_chip->ngpio = pdata->number_of_pins;
@@ -339,6 +361,8 @@ static int em_gio_probe(struct platform_device *pdev)
 	irq_chip->irq_enable = em_gio_irq_enable;
 	irq_chip->irq_disable = em_gio_irq_disable;
 	irq_chip->irq_set_type = em_gio_irq_set_type;
+	irq_chip->irq_startup = em_gio_irq_startup;
+	irq_chip->irq_shutdown = em_gio_irq_shutdown;
 	irq_chip->flags	= IRQCHIP_SKIP_SET_WAKE;
 
 	p->irq_domain = irq_domain_add_simple(pdev->dev.of_node,
-- 
1.8.3.1

