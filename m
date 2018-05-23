From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH] pinctrl: armada-37xx: Fix spurious irq management
Date: Wed, 23 May 2018 10:44:05 +0200
Message-ID: <20180523084405.14410-1-gregory.clement@bootlin.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Terry Zhou <bjzhou@marvell.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Terry Zhou <bjzhou@marvell.com>

Until now, if we found spurious irq in irq_handler, we only updated the
status in register but not the status in the code. Due to this the system
will got stuck dues to the infinite loop

[gregory.clement@bootlin.com: update comment and add fix and stable tags]
Fixes: 30ac0d3b0702 ("pinctrl: armada-37xx: Add edge both type gpio irq support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Terry Zhou <bjzhou@marvell.com>
Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 5b63248c8209..7bef929bd7fe 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -679,12 +679,13 @@ static void armada_37xx_irq_handler(struct irq_desc *desc)
 					writel(1 << hwirq,
 					       info->base +
 					       IRQ_STATUS + 4 * i);
-					continue;
+					goto update_status;
 				}
 			}
 
 			generic_handle_irq(virq);
 
+update_status:
 			/* Update status in case a new IRQ appears */
 			spin_lock_irqsave(&info->irq_lock, flags);
 			status = readl_relaxed(info->base +
-- 
2.17.0
