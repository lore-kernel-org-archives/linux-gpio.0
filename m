From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: mcp23s08: delete req/rel_resource callbacks
Date: Tue, 22 Mar 2016 14:31:14 +0100
Message-ID: <1458653474-7185-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35320 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752154AbcCVNbU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2016 09:31:20 -0400
Received: by mail-lb0-f174.google.com with SMTP id bc4so161889833lbc.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2016 06:31:19 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Phil Reid <preid@electromag.com.au>

When using the GPIOLIB_IRQCHIP the gpiolib provides a
straight-forward implementation of request/release resources,
rely on that instead.

Cc: Phil Reid <preid@electromag.com.au>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mcp23s08.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index ae61bc2d9d25..c882c2be5a0e 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -435,29 +435,6 @@ static void mcp23s08_irq_bus_unlock(struct irq_data *data)
 	mutex_unlock(&mcp->irq_lock);
 }
 
-static int mcp23s08_irq_reqres(struct irq_data *data)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
-	struct mcp23s08 *mcp = gpiochip_get_data(gc);
-
-	if (gpiochip_lock_as_irq(&mcp->chip, data->hwirq)) {
-		dev_err(mcp->chip.parent,
-			"unable to lock HW IRQ %lu for IRQ usage\n",
-			data->hwirq);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static void mcp23s08_irq_relres(struct irq_data *data)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
-	struct mcp23s08 *mcp = gpiochip_get_data(gc);
-
-	gpiochip_unlock_as_irq(&mcp->chip, data->hwirq);
-}
-
 static struct irq_chip mcp23s08_irq_chip = {
 	.name = "gpio-mcp23xxx",
 	.irq_mask = mcp23s08_irq_mask,
@@ -465,8 +442,6 @@ static struct irq_chip mcp23s08_irq_chip = {
 	.irq_set_type = mcp23s08_irq_set_type,
 	.irq_bus_lock = mcp23s08_irq_bus_lock,
 	.irq_bus_sync_unlock = mcp23s08_irq_bus_unlock,
-	.irq_request_resources = mcp23s08_irq_reqres,
-	.irq_release_resources = mcp23s08_irq_relres,
 };
 
 static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
-- 
2.4.3

