From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Fri, 22 May 2015 10:56:08 +0300
Message-ID: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

BIOS/platform may use some of the pins by themselves, such as providing SCI
(System Control Interrupt) from the embedded controller. The driver masks
all interrupts at probe time which prevents those pins from triggering
interrupts properly.

Fix this by not masking all interrupts at probe -- it should be enough just
to clear the status register.

Reported-by: Yu C Chen <yu.c.chen@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 82f691eeeec4..c9c0257a370c 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1417,8 +1417,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		offset += range->npins;
 	}
 
-	/* Mask and clear all interrupts */
-	chv_writel(0, pctrl->regs + CHV_INTMASK);
+	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
 	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
-- 
2.1.4
