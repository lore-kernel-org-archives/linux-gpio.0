From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] RFT: gpio: pl061: assign the apropriate handler for irqs
Date: Thu, 24 Sep 2015 17:56:26 -0700
Message-ID: <1443142586-14416-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:34798 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752294AbbIYA4f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2015 20:56:35 -0400
Received: by padhy16 with SMTP id hy16so88357564pad.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2015 17:56:34 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jogo@openwrt.org>, Stefan Agner <stefan@agner.ch>

The PL061 can handle level IRQs and edge IRQs, however it is
just utilizing handle_simple_irq() for all IRQs. Inspired by
Stefan Agners patch to vf610, this assigns the right handler
depending on what type is set up, after this handle_simple_irq()
is only used as default and if the type is not specified.

Cc: Jonas Gorski <jogo@openwrt.org>
Cc: Stefan Agner <stefan@agner.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pl061.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 5b1461f6aeed..7dba5545b084 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -180,7 +180,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev |= bit;
 		else
 			gpioiev &= ~bit;
-
+		irq_set_handler_locked(d, handle_level_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on %s level\n",
 			offset,
 			polarity ? "HIGH" : "LOW");
@@ -189,7 +189,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpiois &= ~bit;
 		/* Select both edges, setting this makes GPIOEV be ignored */
 		gpioibe |= bit;
-
+		irq_set_handler_locked(d, handle_edge_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on both edges\n", offset);
 	} else if ((trigger & IRQ_TYPE_EDGE_RISING) ||
 		   (trigger & IRQ_TYPE_EDGE_FALLING)) {
@@ -204,7 +204,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 			gpioiev |= bit;
 		else
 			gpioiev &= ~bit;
-
+		irq_set_handler_locked(d, handle_edge_irq);
 		dev_dbg(gc->dev, "line %d: IRQ on %s edge\n",
 			offset,
 			rising ? "RISING" : "FALLING");
@@ -213,6 +213,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		gpiois &= ~bit;
 		gpioibe &= ~bit;
 		gpioiev &= ~bit;
+		irq_set_handler_locked(d, handle_simple_irq);
 		dev_warn(gc->dev, "no trigger selected for line %d\n",
 			 offset);
 	}
-- 
2.4.3

