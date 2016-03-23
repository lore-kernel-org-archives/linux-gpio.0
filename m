From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: [PATCH 1/1] gpio: mcp23s08: Add support for level triggered interrupts
Date: Wed, 23 Mar 2016 18:01:27 +0100
Message-ID: <1458752487-32767-1-git-send-email-alexander.stein@systec-electronic.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:56233 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753038AbcCWRBi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Mar 2016 13:01:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The interrupt for the corresponding pin is configured to trigger when the
pin state changes compared to a preconfigured state (Bit set in INTCON).
This state is set by setting/clearing the bit in DEFVAL.
In the interrupt handler we need also to check if the bit in INTCON is set
for level triggered interrupts.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
---
 drivers/gpio/gpio-mcp23s08.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index c882c2b..ac22efc 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -362,7 +362,8 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	for (i = 0; i < mcp->chip.ngpio; i++) {
 		if ((BIT(i) & mcp->cache[MCP_INTF]) &&
 		    ((BIT(i) & intcap & mcp->irq_rise) ||
-		     (mcp->irq_fall & ~intcap & BIT(i)))) {
+		     (mcp->irq_fall & ~intcap & BIT(i)) ||
+		     (BIT(i) & mcp->cache[MCP_INTCON]))) {
 			child_irq = irq_find_mapping(mcp->chip.irqdomain, i);
 			handle_nested_irq(child_irq);
 		}
@@ -408,6 +409,12 @@ static int mcp23s08_irq_set_type(struct irq_data *data, unsigned int type)
 		mcp->cache[MCP_INTCON] &= ~BIT(pos);
 		mcp->irq_rise &= ~BIT(pos);
 		mcp->irq_fall |= BIT(pos);
+	} else if (type & IRQ_TYPE_LEVEL_HIGH) {
+		mcp->cache[MCP_INTCON] |= BIT(pos);
+		mcp->cache[MCP_DEFVAL] &= ~BIT(pos);
+	} else if (type & IRQ_TYPE_LEVEL_LOW) {
+		mcp->cache[MCP_INTCON] |= BIT(pos);
+		mcp->cache[MCP_DEFVAL] |= BIT(pos);
 	} else
 		return -EINVAL;
 
-- 
2.7.3

