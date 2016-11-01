From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 13/14] pinctrl-sx150x: Remove magic numbers from sx150x_irq_set_type
Date: Tue,  1 Nov 2016 08:57:47 -0700
Message-ID: <1478015868-10309-14-git-send-email-andrew.smirnov@gmail.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 31ed7e3..13afcb9 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -46,6 +46,8 @@ enum {
 enum {
 	SX150X_789_REG_MISC_AUTOCLEAR_OFF = 1 << 0,
 	SX150X_MAX_REGISTER = 0xad,
+	SX150X_IRQ_TYPE_EDGE_RISING = 0x1,
+	SX150X_IRQ_TYPE_EDGE_FALLING = 0x2,
 };
 
 struct sx150x_123_pri {
@@ -440,6 +442,21 @@ static void sx150x_irq_unmask(struct irq_data *d)
 	pctl->irq.masked &= ~BIT(n);
 }
 
+static void sx150x_irq_set_sense(struct sx150x_pinctrl *pctl,
+				 unsigned int line, unsigned int sense)
+{
+	/*
+	 * Every interrupt line is represented by two bits shifted
+	 * proportionally to the line number
+	 */
+	const unsigned int n = line * 2;
+	const unsigned int mask = ~((SX150X_IRQ_TYPE_EDGE_RISING |
+				     SX150X_IRQ_TYPE_EDGE_FALLING) << n);
+
+	pctl->irq.sense &= mask;
+	pctl->irq.sense |= sense << n;
+}
+
 static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
 	struct sx150x_pinctrl *pctl =
@@ -452,12 +469,11 @@ static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	n = d->hwirq;
 
 	if (flow_type & IRQ_TYPE_EDGE_RISING)
-		val |= 0x1;
+		val |= SX150X_IRQ_TYPE_EDGE_RISING;
 	if (flow_type & IRQ_TYPE_EDGE_FALLING)
-		val |= 0x2;
+		val |= SX150X_IRQ_TYPE_EDGE_FALLING;
 
-	pctl->irq.sense &= ~(3UL << (n * 2));
-	pctl->irq.sense |= val << (n * 2);
+	sx150x_irq_set_sense(pctl, n, val);
 	return 0;
 }
 
-- 
2.5.5
