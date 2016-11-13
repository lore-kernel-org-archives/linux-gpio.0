From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: tag line labels used for interrupts
Date: Mon, 14 Nov 2016 00:09:07 +0100
Message-ID: <1479078547-20069-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35695 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752814AbcKMXJM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2016 18:09:12 -0500
Received: by mail-lf0-f47.google.com with SMTP id b14so46695720lfg.2
        for <linux-gpio@vger.kernel.org>; Sun, 13 Nov 2016 15:09:12 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

When a GPIO line is marked as used for an interrupt, it is
helpful to set the label to "interrupt" so we know what is
going on when inspecting the lines.

If a GPIO is already properly named by gpiod_get*() we don't
need to do this. It only happens when a line is used from
the irqchip side of a GPIO driver without communicating
with the GPIO side, such as when gpiochip is used as interrupt
provider in the device tree.

If the line is still marked as used by "interrupt" when we
unmark it as used by an interrupt, also remove this label
from the descriptor.

Also shape up the code around unmarking IRQ lines.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 26ce0743adae..865bca880bd7 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2688,6 +2688,15 @@ int gpiochip_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
 	}
 
 	set_bit(FLAG_USED_AS_IRQ, &desc->flags);
+
+	/*
+	 * If the consumer has not set up a label (such as when the
+	 * IRQ is referenced from .to_irq()) we set up a label here
+	 * so it is clear this is used as an interrupt.
+	 */
+	if (!desc->label)
+		desc_set_label(desc, "interrupt");
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gpiochip_lock_as_irq);
@@ -2702,10 +2711,17 @@ EXPORT_SYMBOL_GPL(gpiochip_lock_as_irq);
  */
 void gpiochip_unlock_as_irq(struct gpio_chip *chip, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
+	struct gpio_desc *desc;
+
+	desc = gpiochip_get_desc(chip, offset);
+	if (IS_ERR(desc))
 		return;
 
-	clear_bit(FLAG_USED_AS_IRQ, &chip->gpiodev->descs[offset].flags);
+	clear_bit(FLAG_USED_AS_IRQ, &desc->flags);
+
+	/* If we only had this marking, erase it */
+	if (desc->label && !strcmp(desc->label, "interrupt"))
+		desc_set_label(desc, NULL);
 }
 EXPORT_SYMBOL_GPL(gpiochip_unlock_as_irq);
 
-- 
2.7.4

