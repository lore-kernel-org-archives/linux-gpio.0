From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] gpio: pl061: assign the apropriate handler for irqs
Date: Thu, 15 Oct 2015 17:01:24 +0200
Message-ID: <1444921284-18513-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36447 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752031AbbJOPBc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Oct 2015 11:01:32 -0400
Received: by lfeh64 with SMTP id h64so30686914lfe.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2015 08:01:31 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jogo@openwrt.org>, Stefan Agner <stefan@agner.ch>

The PL061 can handle level IRQs and edge IRQs, however it is
just utilizing handle_simple_irq() for all IRQs. Inspired by
Stefan Agners patch to vf610, this assigns the right handler
depending on what type is set up, and after this
handle_bad_irq() is only used as default and if the type is
not specified, as is done in the OMAP driver: defining the
IRQ type is really not optional for this driver.

Cc: Jonas Gorski <jogo@openwrt.org>
Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 179339739d60..d3ce82ebe650 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -181,7 +181,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev |= bit;
 		else
 			gpioiev &= ~bit;
-
+		irq_set_handler_locked(d, handle_level_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on %s level\n",
 			offset,
 			polarity ? "HIGH" : "LOW");
@@ -190,7 +190,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpiois &= ~bit;
 		/* Select both edges, setting this makes GPIOEV be ignored */
 		gpioibe |= bit;
-
+		irq_set_handler_locked(d, handle_edge_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on both edges\n", offset);
 	} else if ((trigger & IRQ_TYPE_EDGE_RISING) ||
 		   (trigger & IRQ_TYPE_EDGE_FALLING)) {
@@ -205,7 +205,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev |= bit;
 		else
 			gpioiev &= ~bit;
-
+		irq_set_handler_locked(d, handle_edge_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on %s edge\n",
 			offset,
 			rising ? "RISING" : "FALLING");
@@ -214,6 +214,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpiois &= ~bit;
 		gpioibe &= ~bit;
 		gpioiev &= ~bit;
+		irq_set_handler_locked(d, handle_bad_irq);
 		dev_warn(gc->dev, "no trigger selected for line %d\n",
 			 offset);
 	}
@@ -338,7 +339,7 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 
 	ret = gpiochip_irqchip_add(&chip->gc, &pl061_irqchip,
-				   irq_base, handle_simple_irq,
+				   irq_base, handle_bad_irq,
 				   IRQ_TYPE_NONE);
 	if (ret) {
 		dev_info(&adev->dev, "could not add irqchip\n");
-- 
2.4.3

