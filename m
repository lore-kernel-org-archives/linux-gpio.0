From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH 2/2] pinctrl/amd: use byte access to clear irq/wake status bits
Date: Mon, 16 Jul 2018 18:57:19 -0600
Message-ID: <20180717005719.258905-2-djkurtz@chromium.org>
References: <20180717005719.258905-1-djkurtz@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717005719.258905-1-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, Daniel Drake <drake@endlessm.com>, Thomas Gleixner <tglx@linutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Commit 6afb10267c1692 ("pinctrl/amd: fix masking of GPIO interrupts")
changed to the clearing of interrupt status bits to a RMW in a critical
section.  This works, but is a bit overkill.

The relevant interrupt/wake status bits are in the Most Significant Byte
of a 32-bit word.  These two are the only write-able bits in this byte.

Therefore, it should be safe to just write these bits back as a byte
access without any additional locking.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
---
 drivers/pinctrl/pinctrl-amd.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index b91db89eb9247c..52efe77ffb9991 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -558,15 +558,11 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 			irq = irq_find_mapping(gc->irq.domain, irqnr + i);
 			generic_handle_irq(irq);
 
-			/* Clear interrupt.
-			 * We must read the pin register again, in case the
-			 * value was changed while executing
-			 * generic_handle_irq() above.
+			/*
+			 * Write-1-to-clear irq/wake status bits in MSByte.
+			 * All other bits in this byte are read-only.
 			 */
-			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-			regval = readl(regs + i);
-			writel(regval, regs + i);
-			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
+			writeb((regval >> 24), (u8 *)(regs + i) + 3);
 			ret = IRQ_HANDLED;
 		}
 	}
-- 
2.18.0.203.gfac676dfb9-goog
