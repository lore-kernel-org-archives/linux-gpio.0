From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT v2] gpio: gpio-rcar: Support S2RAM
Date: Sun, 24 Dec 2017 22:37:23 +0900
Message-ID: <1514122643-28838-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:41541 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751680AbdLXNiJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Dec 2017 08:38:09 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org

From: Hien Dang <hien.dang.eb@renesas.com>

This patch adds an implementation that saves and restores the state of
GPIO configuration on suspend and resume.

Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[Modify structure of the bank info to simplify a saving registers]
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the for-next branch of linux-gpio tree.

v2 [Yoshihiro Kaneko]
* Modify structure of the bank info as suggested by Geert Uytterhoeven

 drivers/gpio/gpio-rcar.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index e76de57..7c7360b 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -31,6 +31,16 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 
+struct gpio_rcar_bank_info {
+	u32 iointsel;
+	u32 inoutsel;
+	u32 outdt;
+	u32 active_high_rising_edge;
+	u32 level_trigger;
+	u32 both;
+	u32 intmsk;
+};
+
 struct gpio_rcar_priv {
 	void __iomem *base;
 	spinlock_t lock;
@@ -41,6 +51,7 @@ struct gpio_rcar_priv {
 	unsigned int irq_parent;
 	bool has_both_edge_trigger;
 	bool needs_clk;
+	struct gpio_rcar_bank_info bank_info;
 };
 
 #define IOINTSEL 0x00	/* General IO/Interrupt Switching Register */
@@ -415,6 +426,63 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int gpio_rcar_suspend(struct device *dev)
+{
+	struct gpio_rcar_priv *p = dev_get_drvdata(dev);
+
+	p->bank_info.iointsel = gpio_rcar_read(p, IOINTSEL);
+	p->bank_info.inoutsel = gpio_rcar_read(p, INOUTSEL);
+	p->bank_info.outdt = gpio_rcar_read(p, OUTDT);
+	p->bank_info.intmsk = gpio_rcar_read(p, INTMSK);
+	p->bank_info.active_high_rising_edge = gpio_rcar_read(p, POSNEG);
+	p->bank_info.level_trigger = gpio_rcar_read(p, EDGLEVEL);
+	p->bank_info.both = gpio_rcar_read(p, BOTHEDGE);
+
+	return 0;
+}
+
+static int gpio_rcar_resume(struct device *dev)
+{
+	struct gpio_rcar_priv *p = dev_get_drvdata(dev);
+	int offset;
+	u32 mask;
+
+	for (offset = 0; offset < p->gpio_chip.ngpio; offset++) {
+		mask = BIT(offset);
+		/* I/O pin */
+		if (!(p->bank_info.iointsel & mask)) {
+			if (p->bank_info.inoutsel & mask)
+				gpio_rcar_direction_output(
+					&p->gpio_chip, offset,
+					!!(p->bank_info.outdt & mask));
+			else
+				gpio_rcar_direction_input(&p->gpio_chip,
+							  offset);
+		/* Interrupt pin */
+		} else {
+			gpio_rcar_config_interrupt_input_mode(
+				p,
+				offset,
+				!(p->bank_info.active_high_rising_edge & mask),
+				!!(p->bank_info.level_trigger & mask),
+				!!(p->bank_info.both & mask));
+
+			if (p->bank_info.intmsk & mask)
+				gpio_rcar_write(p, MSKCLR, mask);
+		}
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops,
+		gpio_rcar_suspend, gpio_rcar_resume);
+#define DEV_PM_OPS (&gpio_rcar_pm_ops)
+#else
+#define DEV_PM_OPS NULL
+#endif /* CONFIG_PM_SLEEP*/
+
 static int gpio_rcar_probe(struct platform_device *pdev)
 {
 	struct gpio_rcar_priv *p;
@@ -536,6 +604,7 @@ static int gpio_rcar_remove(struct platform_device *pdev)
 	.remove		= gpio_rcar_remove,
 	.driver		= {
 		.name	= "gpio_rcar",
+		.pm     = DEV_PM_OPS,
 		.of_match_table = of_match_ptr(gpio_rcar_of_table),
 	}
 };
-- 
1.9.1

