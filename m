From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH] gpio: gpio-rcar: Support S2RAM
Date: Thu,  7 Dec 2017 03:48:35 +0900
Message-ID: <1512586115-4698-1-git-send-email-ykaneko0929@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Hien Dang <hien.dang.eb@renesas.com>

This patch adds an implementation that saves and restores the state of
GPIO configuration on suspend and resume.

Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the for-next branch of linux-gpio tree.

 drivers/gpio/gpio-rcar.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index e76de57..c99a2c5 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -31,6 +31,16 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 
+struct gpio_rcar_bank_info {
+	bool iointsel;
+	bool inoutsel;
+	bool outdt;
+	bool active_high_rising_edge;
+	bool level_trigger;
+	bool both;
+	bool intmsk;
+};
+
 struct gpio_rcar_priv {
 	void __iomem *base;
 	spinlock_t lock;
@@ -41,6 +51,7 @@ struct gpio_rcar_priv {
 	unsigned int irq_parent;
 	bool has_both_edge_trigger;
 	bool needs_clk;
+	struct gpio_rcar_bank_info bank_info[32];
 };
 
 #define IOINTSEL 0x00	/* General IO/Interrupt Switching Register */
@@ -415,6 +426,83 @@ static int gpio_rcar_parse_dt(struct gpio_rcar_priv *p, unsigned int *npins)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int gpio_rcar_suspend(struct device *dev)
+{
+	struct gpio_rcar_priv *p = dev_get_drvdata(dev);
+	int offset;
+	u32 bit_mask;
+	struct gpio_rcar_bank_info *bank_info;
+
+	for (offset = 0; offset < p->gpio_chip.ngpio; offset++) {
+		bank_info = &p->bank_info[offset];
+		bit_mask = BIT(offset);
+		bank_info->iointsel = !!(gpio_rcar_read(p, IOINTSEL) &
+					 bit_mask);
+
+		/* I/O pin  */
+		if (!bank_info->iointsel) {
+			bank_info->inoutsel = !!(gpio_rcar_read(p, INOUTSEL) &
+						 bit_mask);
+			bank_info->outdt = !!(gpio_rcar_read(p, OUTDT) &
+					      bit_mask);
+		/* Interrupt pin  */
+		} else {
+			bank_info->intmsk = !!(gpio_rcar_read(p, INTMSK) &
+					       bit_mask);
+			bank_info->active_high_rising_edge =
+				!(!!(gpio_rcar_read(p, POSNEG) & bit_mask));
+			bank_info->level_trigger =
+				!(!!(gpio_rcar_read(p, EDGLEVEL) & bit_mask));
+			bank_info->both = !!(gpio_rcar_read(p, BOTHEDGE) &
+					     bit_mask);
+		}
+	}
+
+	return 0;
+}
+
+static int gpio_rcar_resume(struct device *dev)
+{
+	struct gpio_rcar_priv *p = dev_get_drvdata(dev);
+	int offset;
+	struct gpio_rcar_bank_info *bank_info;
+
+	for (offset = 0; offset < p->gpio_chip.ngpio; offset++) {
+		bank_info = &p->bank_info[offset];
+		/* I/O pin  */
+		if (!bank_info->iointsel) {
+			if (bank_info->inoutsel)
+				gpio_rcar_direction_output(&p->gpio_chip,
+							   offset,
+							   bank_info->outdt);
+			else
+				gpio_rcar_direction_input(&p->gpio_chip,
+							  offset);
+		/* Interrupt pin  */
+		} else {
+			gpio_rcar_config_interrupt_input_mode(
+				p,
+				offset,
+				bank_info->active_high_rising_edge,
+				bank_info->level_trigger,
+				bank_info->both);
+
+			if (bank_info->intmsk)
+				gpio_rcar_write(p, MSKCLR, BIT(offset));
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
@@ -536,6 +624,7 @@ static int gpio_rcar_remove(struct platform_device *pdev)
 	.remove		= gpio_rcar_remove,
 	.driver		= {
 		.name	= "gpio_rcar",
+		.pm     = DEV_PM_OPS,
 		.of_match_table = of_match_ptr(gpio_rcar_of_table),
 	}
 };
-- 
1.9.1
