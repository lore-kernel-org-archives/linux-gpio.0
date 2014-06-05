From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Subject: [PATCH] gpio-pxa: gpio0 and gpio1 support on dt
Date: Thu,  5 Jun 2014 14:13:23 -0500
Message-ID: <1401995603-25997-1-git-send-email-andrew.ruder@elecsyscorp.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:57522 "EHLO
	new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752486AbaFETXB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Jun 2014 15:23:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, gnurou@gmail.com, linus.walleij@linaro.org, Andrew Ruder <andrew.ruder@elecsyscorp.com>

pxa_gpio_probe() has some issues supporting the gpio0 and gpio1
interrupts under device-tree - it never actually sets up the chain
handler to get interrupts on edge detect for GPIO0 and GPIO1.

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---
 drivers/gpio/gpio-pxa.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 42e6e64..19f1a95 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -649,6 +649,11 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 						 handle_edge_irq);
 			set_irq_flags(irq, IRQF_VALID | IRQF_PROBE);
 		}
+	} else {
+		if (irq0 > 0)
+			irq_set_chained_handler(irq0, pxa_gpio_demux_handler);
+		if (irq1 > 0)
+			irq_set_chained_handler(irq1, pxa_gpio_demux_handler);
 	}
 
 	irq_set_chained_handler(irq_mux, pxa_gpio_demux_handler);
-- 
1.9.0.rc3.12.gbc97e2d

