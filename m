From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH 1/2] pinctrl/amd: only handle irq if it is pending and unmasked
Date: Mon, 16 Jul 2018 18:57:18 -0600
Message-ID: <20180717005719.258905-1-djkurtz@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, Daniel Drake <drake@endlessm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

The AMD pinctrl driver demultiplexes GPIO interrupts and fires off their
individual handlers.

If one of these GPIO irqs is configured as a level interrupt, and its
downstream handler is a threaded ONESHOT interrupt, the GPIO interrupt
source is masked by handle_level_irq() until the eventual return of the
threaded irq handler.  During this time the level GPIO interrupt status
will still report as high until the actual gpio source is cleared - both
in the individual GPIO interrupt status bit (INTERRUPT_STS_OFF) and in
its corresponding "WAKE_INT_STATUS_REG" bit.

Thus, if another GPIO interrupt occurs during this time,
amd_gpio_irq_handler() will see that the (masked-and-not-yet-cleared)
level irq is still pending and incorrectly call its handler again.

To fix this, have amd_gpio_irq_handler() check for both interrupts status
and mask before calling generic_handle_irq().

Note: Is it possible that this bug was the source of the interrupt storm
on Ryzen when using chained interrupts before commit ba714a9c1dea85
("pinctrl/amd: Use regular interrupt instead of chained")?

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/pinctrl/pinctrl-amd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 04ae139671c8a8..b91db89eb9247c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -552,7 +552,8 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 		/* Each status bit covers four pins */
 		for (i = 0; i < 4; i++) {
 			regval = readl(regs + i);
-			if (!(regval & PIN_IRQ_PENDING))
+			if (!(regval & PIN_IRQ_PENDING) ||
+			    !(regval & BIT(INTERRUPT_MASK_OFF)))
 				continue;
 			irq = irq_find_mapping(gc->irq.domain, irqnr + i);
 			generic_handle_irq(irq);
-- 
2.18.0.203.gfac676dfb9-goog
