From: Daniel Drake <drake@endlessm.com>
Subject: [PATCH] pinctrl/amd: fix masking of GPIO interrupts
Date: Mon,  2 Oct 2017 12:00:54 +0800
Message-ID: <20171002040054.2604-1-drake@endlessm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:45489 "EHLO
        mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750740AbdJBEBD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2017 00:01:03 -0400
Received: by mail-pf0-f179.google.com with SMTP id z84so2325398pfi.2
        for <linux-gpio@vger.kernel.org>; Sun, 01 Oct 2017 21:01:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: ken.xue@amd.com, shyam-sundar.s-k@amd.com, nehal-bakulchandra.shah@amd.com, linus.walleij@linaro.org
Cc: linux@endlessm.com, linux-gpio@vger.kernel.org

On Asus laptop models X505BA, X505BP, X542BA and X542BP, the i2c-hid
touchpad (using a GPIO for interrupts) becomes unresponsive after a
few minutes of usage, or after placing two fingers on the touchpad,
which seems to have the effect of queuing up a large amount of input
data to be transferred.

When the touchpad is in unresponsive state, we observed that the GPIO
level-triggered interrupt is still at it's active level, however the
pinctrl-amd driver is not receiving/dispatching more interrupts at this
point.

After the initial interrupt arrives, amd_gpio_irq_mask() is called
however we then see amd_gpio_irq_handler() being called repeatedly for
the same irq; the interrupt mask is not taking effect because of the
following sequence of events:
 - amd_gpio_irq_handler fires, reads and caches pin reg
 - amd_gpio_irq_handler calls generic_handle_irq()
 - During IRQ handling, amd_gpio_irq_mask() is called and modifies pin reg
 - amd_gpio_irq_handler clears interrupt by writing cached value

The stale cached value written at the final stage undoes the masking.
Fix this by re-reading the register before clearing the interrupt.

I also spotted that the interrupt-clearing code can race against
amd_gpio_irq_mask() / amd_gpio_irq_unmask(), so add locking there.
Presumably this race was leading to the loss of interrupts.

After these changes, the touchpad appears to be working fine.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 3f6b34febbf1..433af328d981 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -534,8 +534,16 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 				continue;
 			irq = irq_find_mapping(gc->irqdomain, irqnr + i);
 			generic_handle_irq(irq);
-			/* Clear interrupt */
+
+			/* Clear interrupt.
+			 * We must read the pin register again, in case the
+			 * value was changed while executing
+			 * generic_handle_irq() above.
+			 */
+			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
+			regval = readl(regs + i);
 			writel(regval, regs + i);
+			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 			ret = IRQ_HANDLED;
 		}
 	}
-- 
2.11.0

