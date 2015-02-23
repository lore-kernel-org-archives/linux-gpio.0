From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/4] pinctrl: baytrail: Save pin context over system sleep
Date: Mon, 23 Feb 2015 14:53:13 +0200
Message-ID: <1424695993-43707-5-git-send-email-mika.westerberg@linux.intel.com>
References: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424695993-43707-1-git-send-email-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Hans Holmberg <hans.holmberg@intel.com>, Benjamin Adler <benadler@gmx.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The BIOS might reconfigure pins as it needs when S3 is entered. This might
cause drivers using the GPIOs to fail because the state was wrong or
interrupts stopped working.

Fix this by saving and restoring enough pin context over system sleep.

Reported-by: Hans Holmberg <hans.holmberg@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 83 +++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 2318057a309b..2062c224e32f 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -66,6 +66,10 @@
 #define BYT_DIR_MASK		(BIT(1) | BIT(2))
 #define BYT_TRIG_MASK		(BIT(26) | BIT(25) | BIT(24))
 
+#define BYT_CONF0_RESTORE_MASK	(BYT_DIRECT_IRQ_EN | BYT_TRIG_MASK | \
+				 BYT_PIN_MUX)
+#define BYT_VAL_RESTORE_MASK	(BYT_DIR_MASK | BYT_LEVEL)
+
 #define BYT_NGPIO_SCORE		102
 #define BYT_NGPIO_NCORE		28
 #define BYT_NGPIO_SUS		44
@@ -134,12 +138,18 @@ static struct pinctrl_gpio_range byt_ranges[] = {
 	},
 };
 
+struct byt_gpio_pin_context {
+	u32 conf0;
+	u32 val;
+};
+
 struct byt_gpio {
 	struct gpio_chip		chip;
 	struct platform_device		*pdev;
 	spinlock_t			lock;
 	void __iomem			*reg_base;
 	struct pinctrl_gpio_range	*range;
+	struct byt_gpio_pin_context	*saved_context;
 };
 
 #define to_byt_gpio(c)	container_of(c, struct byt_gpio, chip)
@@ -584,6 +594,11 @@ static int byt_gpio_probe(struct platform_device *pdev)
 	gc->can_sleep = false;
 	gc->dev = dev;
 
+#ifdef CONFIG_PM_SLEEP
+	vg->saved_context = devm_kcalloc(&pdev->dev, gc->ngpio,
+				       sizeof(*vg->saved_context), GFP_KERNEL);
+#endif
+
 	ret = gpiochip_add(gc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed adding byt-gpio chip\n");
@@ -612,6 +627,69 @@ static int byt_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int byt_gpio_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct byt_gpio *vg = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < vg->chip.ngpio; i++) {
+		void __iomem *reg;
+		u32 value;
+
+		reg = byt_gpio_reg(&vg->chip, i, BYT_CONF0_REG);
+		value = readl(reg) & BYT_CONF0_RESTORE_MASK;
+		vg->saved_context[i].conf0 = value;
+
+		reg = byt_gpio_reg(&vg->chip, i, BYT_VAL_REG);
+		value = readl(reg) & BYT_VAL_RESTORE_MASK;
+		vg->saved_context[i].val = value;
+	}
+
+	return 0;
+}
+
+static int byt_gpio_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct byt_gpio *vg = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < vg->chip.ngpio; i++) {
+		void __iomem *reg;
+		u32 value;
+
+		reg = byt_gpio_reg(&vg->chip, i, BYT_CONF0_REG);
+		value = readl(reg);
+		if ((value & BYT_CONF0_RESTORE_MASK) !=
+		     vg->saved_context[i].conf0) {
+			value &= ~BYT_CONF0_RESTORE_MASK;
+			value |= vg->saved_context[i].conf0;
+			writel(value, reg);
+			dev_info(dev, "restored pin %d conf0 %#08x", i, value);
+		}
+
+		reg = byt_gpio_reg(&vg->chip, i, BYT_VAL_REG);
+		value = readl(reg);
+		if ((value & BYT_VAL_RESTORE_MASK) !=
+		     vg->saved_context[i].val) {
+			u32 v;
+
+			v = value & ~BYT_VAL_RESTORE_MASK;
+			v |= vg->saved_context[i].val;
+			if (v != value) {
+				writel(v, reg);
+				dev_dbg(dev, "restored pin %d val %#08x\n",
+					i, v);
+			}
+		}
+	}
+
+	return 0;
+}
+#endif
+
 static int byt_gpio_runtime_suspend(struct device *dev)
 {
 	return 0;
@@ -623,8 +701,9 @@ static int byt_gpio_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops byt_gpio_pm_ops = {
-	.runtime_suspend = byt_gpio_runtime_suspend,
-	.runtime_resume = byt_gpio_runtime_resume,
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(byt_gpio_suspend, byt_gpio_resume)
+	SET_RUNTIME_PM_OPS(byt_gpio_runtime_suspend, byt_gpio_runtime_resume,
+			   NULL)
 };
 
 static const struct acpi_device_id byt_gpio_acpi_match[] = {
-- 
2.1.4
