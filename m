From: robert.middleton@rm5248.com
Subject: [PATCH v2] gpio:mcp23s08 Fixed missing interrupts
Date: Wed, 22 Feb 2017 10:34:18 -0500
Message-ID: <1487777658-12951-2-git-send-email-robert.middleton@rm5248.com>
References: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:57334 "EHLO
        hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932746AbdBVPgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 10:36:06 -0500
Received: from homiemail-a117.g.dreamhost.com (sub5.mail.dreamhost.com [208.113.200.129])
        by hapkido.dreamhost.com (Postfix) with ESMTP id 96B25CF861
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 07:36:04 -0800 (PST)
In-Reply-To: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Robert Middleton <robert.middleton@rm5248.com>

From: Robert Middleton <robert.middleton@rm5248.com>

When an interrupt occurs on an MCP23S08 chip, the INTF register will only
contain one bit as causing the interrupt.  If more than two pins change at
the same time on the chip, this causes one of the pins to not be reported.
This patch fixes the logic for checking if a pin has changed, so that
multiple pins will always cause more than one change.

Signed-off-by: Robert Middleton <robert.middleton@rm5248.com>
---
 drivers/gpio/gpio-mcp23s08.c | 66 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 99d37b5..4e03919 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -337,8 +337,10 @@ mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
 static irqreturn_t mcp23s08_irq(int irq, void *data)
 {
 	struct mcp23s08 *mcp = data;
-	int intcap, intf, i;
+	int intcap, intf, i, gpio, gpio_orig, intcap_mask;
 	unsigned int child_irq;
+	bool intf_set, intcap_changed, gpio_bit_changed,
+		defval_changed, gpio_set;
 
 	mutex_lock(&mcp->lock);
 	intf = mcp->ops->read(mcp, MCP_INTF);
@@ -356,14 +358,68 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	}
 
 	mcp->cache[MCP_INTCAP] = intcap;
+
+	/* This clears the interrupt(configurable on S18) */
+	gpio = mcp->ops->read(mcp, MCP_GPIO);
+	if (gpio < 0) {
+		mutex_unlock(&mcp->lock);
+		return IRQ_HANDLED;
+	}
+	gpio_orig = mcp->cache[MCP_GPIO];
+	mcp->cache[MCP_GPIO] = gpio;
 	mutex_unlock(&mcp->lock);
 
+	if (mcp->cache[MCP_INTF] == 0) {
+		/* There is no interrupt pending */
+		return IRQ_HANDLED;
+	}
+
+	dev_dbg(mcp->chip.parent,
+		"intcap 0x%04X intf 0x%04X gpio_orig 0x%04X gpio 0x%04X\n",
+		intcap, intf, gpio_orig, gpio);
 
 	for (i = 0; i < mcp->chip.ngpio; i++) {
-		if ((BIT(i) & mcp->cache[MCP_INTF]) &&
-		    ((BIT(i) & intcap & mcp->irq_rise) ||
-		     (mcp->irq_fall & ~intcap & BIT(i)) ||
-		     (BIT(i) & mcp->cache[MCP_INTCON]))) {
+		/* We must check all of the inputs on the chip,
+		 * otherwise we may not notice a change on >=2 pins.
+		 *
+		 * On at least the mcp23s17, INTCAP is only updated
+		 * one byte at a time(INTCAPA and INTCAPB are
+		 * not written to at the same time - only on a per-bank
+		 * basis).
+		 *
+		 * INTF only contains the single bit that caused the
+		 * interrupt per-bank.  On the mcp23s17, there is
+		 * INTFA and INTFB.  If two pins are changed on the A
+		 * side at the same time, INTF will only have one bit
+		 * set.  If one pin on the A side and one pin on the B
+		 * side are changed at the same time, INTF will have
+		 * two bits set.  Thus, INTF can't be the only check
+		 * to see if the input has changed.
+		 */
+
+		intf_set = BIT(i) & mcp->cache[MCP_INTF];
+		if (i < 8 && intf_set)
+			intcap_mask = 0x00FF;
+		else if (i >= 8 && intf_set
+			intcap_mask = 0xFF00;
+		else
+			intcap_mask = 0x00;
+
+		intcap_changed = (intcap_mask &
+			(BIT(i) & mcp->cache[MCP_INTCAP])) !=
+			(intcap_mask & (BIT(i) & gpio_orig));
+		gpio_set = BIT(i) & mcp->cache[MCP_GPIO];
+		gpio_bit_changed = (BIT(i) & gpio_orig) !=
+			(BIT(i) & mcp->cache[MCP_GPIO]);
+		defval_changed = (BIT(i) & mcp->cache[MCP_INTCON]) &&
+			((BIT(i) & mcp->cache[MCP_GPIO]) !=
+			(BIT(i) & mcp->cache[MCP_DEFVAL]));
+
+		if (((gpio_bit_changed || intcap_changed) &&
+			(BIT(i) & mcp->irq_rise) && gpio_set) ||
+		    ((gpio_bit_changed || intcap_changed) &&
+			(BIT(i) & mcp->irq_fall) && !gpio_set) ||
+		    defval_changed) {
 			child_irq = irq_find_mapping(mcp->chip.irqdomain, i);
 			handle_nested_irq(child_irq);
 		}
-- 
2.1.4

