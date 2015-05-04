From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Check for irq_set_irq_wake() failures
Date: Mon,  4 May 2015 16:09:52 +0200
Message-ID: <1430748592-6394-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:41014 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751752AbbEDOJz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 May 2015 10:09:55 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Axel Haslam <ahaslam@baylibre.com>, linux-gpio@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

If an interrupt controller doesn't support wake-up configuration, trying
to deconfigure wake-up will cause a warning:

    WARNING: CPU: 1 PID: 1341 at kernel/irq/manage.c:540 irq_set_irq_wake+0x9c/0xf8()
    Unbalanced IRQ 26 wake disable

To fix this, refrain from any further parent interrupt controller
(de)configuration if irq_set_irq_wake() failed.

Fixes: ab82fa7da4dce5c7 ("gpio: rcar: Prevent module clock disable when wake-up is enabled")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is an alternative for:
  - calling "gic_set_irqchip_flags(IRQCHIP_SKIP_SET_WAKE)" from the
    platform code, OR
  - setting "gic_chip.flags = IRQCHIP_SKIP_SET_WAKE" in the GIC driver
    code.
---
 drivers/gpio/gpio-rcar.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index fd39774659484fa6..1e14a6c74ed13941 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -177,8 +177,17 @@ static int gpio_rcar_irq_set_wake(struct irq_data *d, unsigned int on)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct gpio_rcar_priv *p = container_of(gc, struct gpio_rcar_priv,
 						gpio_chip);
-
-	irq_set_irq_wake(p->irq_parent, on);
+	int error;
+
+	if (p->irq_parent) {
+		error = irq_set_irq_wake(p->irq_parent, on);
+		if (error) {
+			dev_dbg(&p->pdev->dev,
+				"irq %u doesn't support irq_set_wake\n",
+				p->irq_parent);
+			p->irq_parent = 0;
+		}
+	}
 
 	if (!p->clk)
 		return 0;
-- 
1.9.1

