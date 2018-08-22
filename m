From: Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH v2] pinctrl/amd: use byte access to clear irq/wake status bits
Date: Wed, 22 Aug 2018 10:57:54 -0600
Message-ID: <20180822165754.213402-1-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Shyam-sundar.S-k@amd.com, Nehal-bakulchandra.Shah@amd.com, Ken.Xue@amd.com, Daniel Kurtz <djkurtz@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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
 drivers/pinctrl/pinctrl-amd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 41ccc759b8b886..7698bd9f6b687c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -558,15 +558,14 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 			irq = irq_find_mapping(gc->irq.domain, irqnr + i);
 			generic_handle_irq(irq);
 
-			/* Clear interrupt.
-			 * We must read the pin register again, in case the
+			/*
+			 * Write 1 to clear the irq/wake status bits in MSByte.
+			 * All other bits in this byte are read-only.  This
+			 * avoids modifying the lower 24-bits, in case their
 			 * value was changed while executing
 			 * generic_handle_irq() above.
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
2.18.0.1017.ga543ac7ca45-goog
