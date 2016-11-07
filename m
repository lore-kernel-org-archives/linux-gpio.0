From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 12/15] pinctrl-sx150x: Simplify interrupt handler
Date: Mon,  7 Nov 2016 08:53:20 -0800
Message-ID: <1478537603-23653-13-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

Make use of for_each_set_bit macro and reduce boilerplate code.

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index f2ec072..78e15c9 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -465,11 +465,9 @@ static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
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
@@ -479,15 +477,11 @@ static irqreturn_t sx150x_irq_thread_fn(int irq, void *dev_id)
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
