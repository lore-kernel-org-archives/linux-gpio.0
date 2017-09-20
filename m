From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] gpio: Wakeup gpio controller when it is used as IRQ controller
Date: Wed, 20 Sep 2017 09:14:45 +0200
Message-ID: <09258550e475aa7135db7b91bb96deeaf900f8c2.1505891674.git.michal.simek@xilinx.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:36145 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751861AbdITHOu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Sep 2017 03:14:50 -0400
Received: by mail-wr0-f195.google.com with SMTP id g50so944982wra.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Sep 2017 00:14:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: Borsodi Petr <Petr.Borsodi@i.cz>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

From: Borsodi Petr <Petr.Borsodi@i.cz>

There is a problem with GPIO driver when used as IRQ controller.
It is not working because the module is sleeping (clock is disabled).
The patch enables clocks when IP is used as IRQ controller.

Signed-off-by: Borsodi Petr <Petr.Borsodi@i.cz>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Based on discussion with Linus here https://lkml.org/lkml/2017/8/22/400
---
 drivers/gpio/gpiolib.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index eb80dac4e26a..17258ad1fadb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1676,14 +1676,22 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 static int gpiochip_irq_reqres(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	int ret;
 
 	if (!try_module_get(chip->gpiodev->owner))
 		return -ENODEV;
 
+	ret = pm_runtime_get_sync(chip->parent);
+	if (ret < 0) {
+		module_put(chip->gpiodev->owner);
+		return ret;
+	}
+
 	if (gpiochip_lock_as_irq(chip, d->hwirq)) {
 		chip_err(chip,
 			"unable to lock HW IRQ %lu for IRQ\n",
 			d->hwirq);
+		pm_runtime_put(chip->parent);
 		module_put(chip->gpiodev->owner);
 		return -EINVAL;
 	}
@@ -1695,6 +1703,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
 	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
 
 	gpiochip_unlock_as_irq(chip, d->hwirq);
+	pm_runtime_put(chip->parent);
 	module_put(chip->gpiodev->owner);
 }
 
-- 
1.9.1

