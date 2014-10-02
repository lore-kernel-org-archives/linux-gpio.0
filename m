From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] gpio: stmpe: add verbose debug code
Date: Thu,  2 Oct 2014 07:55:41 +0200
Message-ID: <1412229341-2161-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:64897 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337AbaJBFzr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Oct 2014 01:55:47 -0400
Received: by mail-lb0-f179.google.com with SMTP id l4so1621223lbv.10
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2014 22:55:46 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

To troubleshoot the STMPE GPIO driver, some more detailed
debug information giving the exact info on how each pin is
used will be helpful.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-stmpe.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index a888e6ec5c6e..24108c45f7b7 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -211,6 +211,77 @@ static void stmpe_gpio_irq_unmask(struct irq_data *d)
 	stmpe_gpio->regs[REG_IE][regoffset] |= mask;
 }
 
+static void stmpe_dbg_show_one(struct seq_file *s,
+			       struct gpio_chip *gc,
+			       unsigned offset, unsigned gpio)
+{
+	struct stmpe_gpio *stmpe_gpio = to_stmpe_gpio(gc);
+	struct stmpe *stmpe = stmpe_gpio->stmpe;
+	const char *label = gpiochip_is_requested(gc, offset);
+	int num_banks = DIV_ROUND_UP(stmpe->num_gpios, 8);
+	bool val = !!stmpe_gpio_get(gc, offset);
+	u8 dir_reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);
+	u8 mask = 1 << (offset % 8);
+	int ret;
+	u8 dir;
+
+	ret = stmpe_reg_read(stmpe, dir_reg);
+	if (ret < 0)
+		return;
+	dir = !!(ret & mask);
+
+	if (dir) {
+		seq_printf(s, " gpio-%-3d (%-20.20s) out %s",
+			   gpio, label ?: "(none)",
+			   val ? "hi" : "lo");
+	} else {
+		u8 edge_det_reg = stmpe->regs[STMPE_IDX_GPEDR_MSB] + num_banks - 1 - (offset / 8);
+		u8 rise_reg = stmpe->regs[STMPE_IDX_GPRER_LSB] - (offset / 8);
+		u8 fall_reg = stmpe->regs[STMPE_IDX_GPFER_LSB] - (offset / 8);
+		u8 irqen_reg = stmpe->regs[STMPE_IDX_IEGPIOR_LSB] - (offset / 8);
+		bool edge_det;
+		bool rise;
+		bool fall;
+		bool irqen;
+
+		ret = stmpe_reg_read(stmpe, edge_det_reg);
+		if (ret < 0)
+			return;
+		edge_det = !!(ret & mask);
+		ret = stmpe_reg_read(stmpe, rise_reg);
+		if (ret < 0)
+			return;
+		rise = !!(ret & mask);
+		ret = stmpe_reg_read(stmpe, fall_reg);
+		if (ret < 0)
+			return;
+		fall = !!(ret & mask);
+		ret = stmpe_reg_read(stmpe, irqen_reg);
+		if (ret < 0)
+			return;
+		irqen = !!(ret & mask);
+
+		seq_printf(s, " gpio-%-3d (%-20.20s) in  %s %s %s%s%s",
+			   gpio, label ?: "(none)",
+			   val ? "hi" : "lo",
+			   edge_det ? "edge-asserted" : "edge-inactive",
+			   irqen ? "IRQ-enabled" : "",
+			   rise ? " rising-edge-detection" : "",
+			   fall ? " falling-edge-detection" : "");
+	}
+}
+
+static void stmpe_dbg_show(struct seq_file *s, struct gpio_chip *gc)
+{
+	unsigned i;
+	unsigned gpio = gc->base;
+
+	for (i = 0; i < gc->ngpio; i++, gpio++) {
+		stmpe_dbg_show_one(s, gc, i, gpio);
+		seq_printf(s, "\n");
+	}
+}
+
 static struct irq_chip stmpe_gpio_irq_chip = {
 	.name			= "stmpe-gpio",
 	.irq_bus_lock		= stmpe_gpio_irq_lock,
@@ -293,6 +364,9 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 #endif
 	stmpe_gpio->chip.base = -1;
 
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
+                stmpe_gpio->chip.dbg_show = stmpe_dbg_show;
+
 	if (pdata)
 		stmpe_gpio->norequest_mask = pdata->norequest_mask;
 	else if (np)
-- 
1.9.3

