From: robert.middleton@rm5248.com
Subject: [PATCH] gpio:mcp23s08 Fixed missing interrupts
Date: Sat, 11 Feb 2017 15:02:35 -0500
Message-ID: <1486843355-2386-2-git-send-email-robert.middleton@rm5248.com>
References: <1486843355-2386-1-git-send-email-robert.middleton@rm5248.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub5.mail.dreamhost.com ([208.113.200.129]:37368 "EHLO
        homiemail-a79.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751052AbdBKUDW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 Feb 2017 15:03:22 -0500
In-Reply-To: <1486843355-2386-1-git-send-email-robert.middleton@rm5248.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Robert Middleton <robert.middleton@rm5248.com>

From: Robert Middleton <robert.middleton@rm5248.com>

When an interrupt occurs on an MCP23S08 chip, the INTF register will only contain one bit as causing the interrupt.  If more than two pins change at the same time on the chip, this causes one of the pins to not be reported.  This patch fixes the logic for checking if a pin has changed, so that multiple pins will always cause more than one change.
---
 drivers/gpio/gpio-mcp23s08.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 99d37b5..b7ceee3 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -337,7 +337,7 @@ mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 static irqreturn_t mcp23s08_irq(int irq, void *data)
 {
 	struct mcp23s08 *mcp = data;
-	int intcap, intf, i;
+	int intcap, intf, i, gpio, gpio_cache;
 	unsigned int child_irq;
 
 	mutex_lock(&mcp->lock);
@@ -356,14 +356,30 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	}
 
 	mcp->cache[MCP_INTCAP] = intcap;
+
+	/* This clears the interrupt */
+	gpio = mcp->ops->read(mcp, MCP_GPIO);
+	if (gpio < 0) {
+		mutex_unlock(&mcp->lock);
+		return IRQ_HANDLED;
+	}
+	gpio_cache = mcp->cache[MCP_GPIO];
+	mcp->cache[MCP_GPIO] = gpio;
 	mutex_unlock(&mcp->lock);
 
 
 	for (i = 0; i < mcp->chip.ngpio; i++) {
-		if ((BIT(i) & mcp->cache[MCP_INTF]) &&
-		    ((BIT(i) & intcap & mcp->irq_rise) ||
-		     (mcp->irq_fall & ~intcap & BIT(i)) ||
-		     (BIT(i) & mcp->cache[MCP_INTCON]))) {
+		/* We must check all of the inputs on the chip,
+		 * otherwise we may not notice a change on >=2 pins
+		 */
+		int bit_changed = (BIT(i) & gpio_cache) !=
+			(BIT(i) & mcp->cache[MCP_GPIO]);
+		int defval_changed = (BIT(i) & mcp->cache[MCP_GPIO]) !=
+			(BIT(i) & mcp->cache[MCP_DEFVAL]);
+		if ((bit_changed && (BIT(i) & mcp->irq_rise)) ||
+			(bit_changed && (~BIT(i) & mcp->irq_fall)) ||
+			((BIT(i) & mcp->cache[MCP_INTCON]) && 
+			defval_changed)) {
 			child_irq = irq_find_mapping(mcp->chip.irqdomain, i);
 			handle_nested_irq(child_irq);
 		}
-- 
2.1.4

