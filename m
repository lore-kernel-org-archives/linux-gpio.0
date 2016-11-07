From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 14/15] pinctrl-sx150x: Remove magic numbers from sx150x_irq_set_type
Date: Mon,  7 Nov 2016 08:53:22 -0800
Message-ID: <1478537603-23653-15-git-send-email-andrew.smirnov@gmail.com>
References: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35426 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932684AbcKGQyS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 11:54:18 -0500
In-Reply-To: <1478537603-23653-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linus.walleij@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org, cphealy@gmail.com

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 drivers/pinctrl/pinctrl-sx150x.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 798a8bb..56abe36 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -47,6 +47,8 @@ enum {
 enum {
 	SX150X_789_REG_MISC_AUTOCLEAR_OFF = 1 << 0,
 	SX150X_MAX_REGISTER = 0xad,
+	SX150X_IRQ_TYPE_EDGE_RISING = 0x1,
+	SX150X_IRQ_TYPE_EDGE_FALLING = 0x2,
 };
 
 struct sx150x_123_pri {
@@ -441,6 +443,21 @@ static void sx150x_irq_unmask(struct irq_data *d)
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
@@ -453,12 +470,11 @@ static int sx150x_irq_set_type(struct irq_data *d, unsigned int flow_type)
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

