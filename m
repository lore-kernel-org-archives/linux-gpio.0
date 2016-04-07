From: Yong Li <yong.b.li@intel.com>
Subject: [PATCH] gpio: pca953x: add PCAL9535 interrupt support for Galileo Gen2
Date: Thu,  7 Apr 2016 10:15:41 +0800
Message-ID: <1459995341-15341-1-git-send-email-yong.b.li@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:18760 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751925AbcDGCUA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 6 Apr 2016 22:20:00 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, gnurou@gmail.com
Cc: yong.b.li@intel.com, andriy.shevchenko@linux.intel.com, ismo.puustinen@intel.com, preid@electromag.com.au

Galileo Gen2 board uses the PCAL9535 as the GPIO expansion,
it is different from PCA9535 and includes interrupt mask/status registers,
The current driver does not support the interrupt registers configuration,
it causes some gpio pins cannot trigger interrupt events,
this patch fix this issue. The original patch was submitted by
Josef Ahmad <josef.ahmad@linux.intel.com>
http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-quark/tree/recipes-kernel/linux/files/0015-Quark-GPIO-1-2-quark.patch

Signed-off-by: Yong Li <yong.b.li@intel.com>
---
 drivers/gpio/gpio-pca953x.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e66084c..cf2f73b 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -38,8 +38,13 @@
 #define PCA957X_MSK		6
 #define PCA957X_INTS		7
 
+#define PCAL953X_IN_LATCH	34
+#define PCAL953X_INT_MASK	37
+#define PCAL953X_INT_STAT	38
+
 #define PCA_GPIO_MASK		0x00FF
 #define PCA_INT			0x0100
+#define PCA_PCAL			0x0200
 #define PCA953X_TYPE		0x1000
 #define PCA957X_TYPE		0x2000
 #define PCA_TYPE_MASK		0xF000
@@ -77,7 +82,7 @@ static const struct i2c_device_id pca953x_id[] = {
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
 
 static const struct acpi_device_id pca953x_acpi_ids[] = {
-	{ "INT3491", 16 | PCA953X_TYPE | PCA_INT, },
+	{ "INT3491", 16 | PCA953X_TYPE | PCA_INT | PCA_PCAL, },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
@@ -437,6 +442,18 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	u8 new_irqs;
 	int level, i;
+	u8 invert_irq_mask[MAX_BANK];
+
+	if (chip->driver_data & PCA_PCAL) {
+		/* Enable latch on interrupt-enabled inputs */
+		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
+
+		for (i = 0; i < NBANK(chip); i++)
+			invert_irq_mask[i] = ~chip->irq_mask[i];
+
+		/* Unmask enabled interrupts */
+		pca953x_write_regs(chip, PCAL953X_INT_MASK, invert_irq_mask);
+	}
 
 	/* Look for any newly setup interrupt */
 	for (i = 0; i < NBANK(chip); i++) {
@@ -498,6 +515,29 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 	u8 trigger[MAX_BANK];
 	int ret, i, offset = 0;
 
+	if (chip->driver_data & PCA_PCAL) {
+		/* Read the current interrupt status from the device */
+		ret = pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
+		if (ret)
+			return 0;
+
+		/* Check latched inputs and clear interrupt status */
+		ret = pca953x_read_regs(chip, PCA953X_INPUT, cur_stat);
+		if (ret)
+			return 0;
+
+		for (i = 0; i < NBANK(chip); i++) {
+			/* Apply filter for rising/falling edge selection */
+			pending[i] = (~cur_stat[i] & chip->irq_trig_fall[i]) |
+				(cur_stat[i] & chip->irq_trig_raise[i]);
+			pending[i] &= trigger[i];
+			if (pending[i])
+				pending_seen = true;
+		}
+
+		return pending_seen;
+	}
+
 	switch (chip->chip_type) {
 	case PCA953X_TYPE:
 		offset = PCA953X_INPUT;
-- 
2.1.4

