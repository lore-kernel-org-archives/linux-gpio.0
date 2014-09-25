From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH 1/2] gpiolib: irqchip: use irq_find_mapping while removing irqchip
Date: Thu, 25 Sep 2014 19:09:23 +0300
Message-ID: <1411661364-19620-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:59720 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752130AbaIYQJh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Sep 2014 12:09:37 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Yalin.Wang@sonymobile.com, linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>

There is no guarantee that VIRQs will be allocated sequentially
for gpio irqchip in gpiochip_irqchip_add().
Therefore, it's unsafe to dispose VIRQ in gpiochip_irqchip_remove()
basing on index relatively to stored irq_base value.

Hence, use irq_find_mapping for VIRQ finding  in gpiochip_irqchip_remove()
instead of irq_base + index.

Reported-by: Wang, Yalin <Yalin.Wang@sonymobile.com>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 15cc0bb..f6bf368 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -524,7 +524,8 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 	/* Remove all IRQ mappings and delete the domain */
 	if (gpiochip->irqdomain) {
 		for (offset = 0; offset < gpiochip->ngpio; offset++)
-			irq_dispose_mapping(gpiochip->irq_base + offset);
+			irq_dispose_mapping(
+				irq_find_mapping(gpiochip->irqdomain, offset));
 		irq_domain_remove(gpiochip->irqdomain);
 	}
 
-- 
1.9.1

