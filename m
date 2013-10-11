From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] pinctrl: nomadik: mark GPIO lines used for IRQ
Date: Fri, 11 Oct 2013 11:32:29 +0200
Message-ID: <1381483949-12208-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:50679 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751528Ab3JKJcg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2013 05:32:36 -0400
Received: by mail-wg0-f54.google.com with SMTP id m15so3936811wgh.33
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2013 02:32:35 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

When an IRQ is started on a GPIO line, mark this GPIO as IRQ in
the gpiolib so we can keep track of the usage centrally.

Cc: Enric Balletbo i Serra <eballetbo@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-nomadik.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
index d7c3ae3..7111c3b 100644
--- a/drivers/pinctrl/pinctrl-nomadik.c
+++ b/drivers/pinctrl/pinctrl-nomadik.c
@@ -634,6 +634,10 @@ static unsigned int nmk_gpio_irq_startup(struct irq_data *d)
 {
 	struct nmk_gpio_chip *nmk_chip = irq_data_get_irq_chip_data(d);
 
+	if (gpio_lock_as_irq(&nmk_chip->chip, d->hwirq))
+		dev_err(nmk_chip->chip.dev,
+			"unable to lock HW IRQ %lu for IRQ\n",
+			d->hwirq);
 	clk_enable(nmk_chip->clk);
 	nmk_gpio_irq_unmask(d);
 	return 0;
@@ -645,6 +649,7 @@ static void nmk_gpio_irq_shutdown(struct irq_data *d)
 
 	nmk_gpio_irq_mask(d);
 	clk_disable(nmk_chip->clk);
+	gpio_unlock_as_irq(&nmk_chip->chip, d->hwirq);
 }
 
 static struct irq_chip nmk_gpio_irq_chip = {
-- 
1.8.3.1

