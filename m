From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] gpio: rcar: Add support for DT IRQ flags
Date: Tue,  1 Apr 2014 12:58:06 +0200
Message-ID: <1396349886-26663-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-sh@vger.kernel.org, Magnus Damm <damm@opensource.se>
List-Id: linux-gpio@vger.kernel.org

The gpio-rcar driver has no IRQ domain OF xlate function and thus
ignores IRQ flags specified in DT. Fix this by using the two-cell xlate
function.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpio/gpio-rcar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index ca76ce7..c9edcc9 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -283,6 +283,7 @@ static int gpio_rcar_irq_domain_map(struct irq_domain *h, unsigned int irq,
 
 static struct irq_domain_ops gpio_rcar_irq_domain_ops = {
 	.map	= gpio_rcar_irq_domain_map,
+	.xlate	= irq_domain_xlate_twocell,
 };
 
 struct gpio_rcar_info {
-- 
Regards,

Laurent Pinchart

