From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT v4] gpio: gpio-rcar: Support S2RAM
Date: Mon,  5 Feb 2018 04:15:02 +0900
Message-ID: <1517771702-16984-1-git-send-email-ykaneko0929@gmail.com>
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
[Modify structure of the bank info to simplify a saving registers]
[Remove DEV_PM_OPS macro]
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the for-next branch of linux-gpio tree.

v2 [Yoshihiro Kaneko]
* Modify structure of the bank info as suggested by Geert Uytterhoeven

v3 [Yoshihiro Kaneko]
* Remove DEV_PM_OPS macro as suggested by Vladimir Zapolskiy

v4 [Yoshihiro Kaneko]
* As suggested by Geert Uytterhoeven
  - make the name of all members of gpio_rcar_bank_info accord with the
    name of the registers
  - fix type of the 'offset' variable in unsigned int
  - fix the inverted logic in gpio_rcar_resume()

 drivers/gpio/gpio-rcar.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index e76de57..e5b0dbe 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -31,6 +31,16 @@
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 
+struct gpio_rcar_bank_info {
+	u32 iointsel;
+	u32 inoutsel;
+	u32 outdt;
+	u32 posneg;
+	u32 edglevel;
+	u32 bothedge;
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
@@ -531,11 +542,66 @@ static int gpio_rcar_remove(struct platform_device *pdev)
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
+	p->bank_info.posneg = gpio_rcar_read(p, POSNEG);
+	p->bank_info.edglevel = gpio_rcar_read(p, EDGLEVEL);
+	if (p->has_both_edge_trigger)
+		p->bank_info.bothedge = gpio_rcar_read(p, BOTHEDGE);
+
+	return 0;
+}
+
+static int gpio_rcar_resume(struct device *dev)
+{
+	struct gpio_rcar_priv *p = dev_get_drvdata(dev);
+	unsigned int offset;
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
+		} else {
+			/* Interrupt pin */
+			gpio_rcar_config_interrupt_input_mode(
+				p,
+				offset,
+				!(p->bank_info.posneg & mask),
+				!(p->bank_info.edglevel & mask),
+				!!(p->bank_info.bothedge & mask));
+
+			if (p->bank_info.intmsk & mask)
+				gpio_rcar_write(p, MSKCLR, mask);
+		}
+	}
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP*/
+
+static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend, gpio_rcar_resume);
+
 static struct platform_driver gpio_rcar_device_driver = {
 	.probe		= gpio_rcar_probe,
 	.remove		= gpio_rcar_remove,
 	.driver		= {
 		.name	= "gpio_rcar",
+		.pm     = &gpio_rcar_pm_ops,
 		.of_match_table = of_match_ptr(gpio_rcar_of_table),
 	}
 };
-- 
1.9.1
