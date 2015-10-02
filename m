From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH 1/2] pinctrl: at91-pio4: Use irq_set_handler_locked()
Date: Fri, 2 Oct 2015 15:50:45 +0200
Message-ID: <abf74f93ec58e3b321dce23af3fa5af1ffa2e070.1443793711.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:54307 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752496AbbJBNu1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 09:50:27 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, s.hauer@pengutronix.de, alexandre.belloni@free-electrons.com, Nicolas Ferre <nicolas.ferre@atmel.com>

Use irq_set_handler_locked() as it avoids a redundant lookup of the irq
descriptor.
This adaptation landed on the pinctrl-at91.c driver while this one was being
developped: synchronize with this enhancement and avoid the following
compilation error:

../drivers/pinctrl/pinctrl-at91-pio4.c: In function 'atmel_gpio_irq_set_type':
../drivers/pinctrl/pinctrl-at91-pio4.c:173:3: error: implicit declaration of
function '__irq_set_handler_locked' [-Werror=implicit-function-declaration]
   __irq_set_handler_locked(d->irq, handle_edge_irq);
      ^

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 5e2189f17fe1..1f1a64ef3559 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -170,23 +170,23 @@ static int atmel_gpio_irq_set_type(struct irq_data *d, unsigned type)
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_RISING;
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_FALLING;
 		break;
 	case IRQ_TYPE_EDGE_BOTH:
-		__irq_set_handler_locked(d->irq, handle_edge_irq);
+		irq_set_handler_locked(d, handle_edge_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_BOTH;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_LOW;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		__irq_set_handler_locked(d->irq, handle_level_irq);
+		irq_set_handler_locked(d, handle_level_irq);
 		reg |= ATMEL_PIO_CFGR_EVTSEL_HIGH;
 		break;
 	case IRQ_TYPE_NONE:
-- 
2.1.3

