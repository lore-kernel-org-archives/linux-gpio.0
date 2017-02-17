From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/1] gpio: altera: Use handle_level_irq when configured as a level_high
Date: Fri, 17 Feb 2017 17:12:32 +0800
Message-ID: <1487322752-31896-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:37993 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755263AbdBQJMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2017 04:12:41 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: thloh@altera.com, linus.walleij@linaro.org, gnurou@gmail.com, preid@electromag.com.au, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

When a threaded irq handler is chained attached to one of the gpio
pins when configure for level irq the altera_gpio_irq_leveL_high_handler
does not mask the interrupt while being handled by the chained irq.
This resulting in the threaded irq not getting enough cycles to complete
quickly enough before the irq was disabled as faulty.
It looks like handle_level_irq should be used in this situation
instead of handle_simple_irq.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpio-altera.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 5bddbd5..d67dcca 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -310,7 +310,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
 	altera_gc->interrupt_trigger = reg;
 
 	ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_irq_chip, 0,
-		handle_simple_irq, IRQ_TYPE_NONE);
+		altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
+		handle_level_irq : handle_simple_irq, IRQ_TYPE_NONE);
 
 	if (ret) {
 		dev_err(&pdev->dev, "could not add irqchip\n");
-- 
1.8.3.1

