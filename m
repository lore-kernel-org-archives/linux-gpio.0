From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 11/14] pinctrl-sx150x: Simplify interrupt handler
Date: Tue,  1 Nov 2016 08:57:45 -0700
Message-ID: <1478015868-10309-12-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35572 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751914AbcKAP6N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2016 11:58:13 -0400
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>

Make use of for_each_set_bit macro and reduce boilerplate code.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index d2e2b13..741981d 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -464,11 +464,9 @@ static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 {
 	struct sx150x_pinctrl *pctl = (struct sx150x_pinctrl *)dev_id;
-	unsigned int nhandled = 0;
-	unsigned int sub_irq;
-	unsigned int n;
-	s32 err;
+	unsigned long n, status;
 	unsigned int val;
+	int err;
 
 	err = regmap_read(pctl->regmap, pctl->data->reg_irq_src, &val);
 	if (err < 0)
@@ -478,15 +476,11 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
 	if (err < 0)
 		return IRQ_NONE;
 
-	for (n = 0; n < pctl->data->ngpios; ++n) {
-		if (val & BIT(n)) {
-			sub_irq = irq_find_mapping(pctl->gpio.irqdomain, n);
-			handle_nested_irq(sub_irq);
-			++nhandled;
-		}
-	}
+	status = val;
+	for_each_set_bit(n, &status, pctl->data->ngpios)
+		handle_nested_irq(irq_find_mapping(pctl->gpio.irqdomain, n));
 
-	return (nhandled > 0 ? IRQ_HANDLED : IRQ_NONE);
+	return IRQ_HANDLED;
 }
 
 static void sx150x_irq_bus_lock(struct irq_data *d)
-- 
2.5.5

