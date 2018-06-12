From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH v3 1/2] gpio: davinci: Shuffle IRQ resource fetching from DT to beginning of probe
Date: Tue, 12 Jun 2018 13:29:15 +0530
Message-ID: <1528790356-15945-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, t-kristo@ti.com, j-keerthy@ti.com
List-Id: linux-gpio@vger.kernel.org

This is needed in case of PROBE_DEFER if IRQ resource is not yet ready.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---

Tested for GPIO Interrupts on da850-lcdk board.

Changes in v3:

	Changed type of bank_irq to int from unsigned

  * Changed irqs type from unsigned to int
 drivers/gpio/gpio-davinci.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 987126c..0ff2c0d 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -55,7 +55,7 @@ static inline struct davinci_gpio_regs __iomem *irq2regs(struct irq_data *d)
 	return g;
 }
 
-static int davinci_gpio_irq_setup(struct platform_device *pdev);
+static int davinci_gpio_irq_setup(struct platform_device *pdev, int bank_irq);
 
 /*--------------------------------------------------------------------------*/
 
@@ -167,7 +167,7 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
 static int davinci_gpio_probe(struct platform_device *pdev)
 {
 	static int ctrl_num, bank_base;
-	int gpio, bank, ret = 0;
+	int gpio, bank, bank_irq, ret = 0;
 	unsigned ngpio, nbank;
 	struct davinci_gpio_controller *chips;
 	struct davinci_gpio_platform_data *pdata;
@@ -209,6 +209,12 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio_base))
 		return PTR_ERR(gpio_base);
 
+	bank_irq = platform_get_irq(pdev, 0);
+	if (bank_irq < 0) {
+		dev_dbg(dev, "IRQ not populated\n");
+		return bank_irq;
+	}
+
 	snprintf(label, MAX_LABEL_SIZE, "davinci_gpio.%d", ctrl_num++);
 	chips->chip.label = devm_kstrdup(dev, label, GFP_KERNEL);
 		if (!chips->chip.label)
@@ -243,7 +249,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 		goto err;
 
 	platform_set_drvdata(pdev, chips);
-	ret = davinci_gpio_irq_setup(pdev);
+	ret = davinci_gpio_irq_setup(pdev, bank_irq);
 	if (ret)
 		goto err;
 
@@ -452,16 +458,15 @@ static struct irq_chip *keystone_gpio_get_irq_chip(unsigned int irq)
  * (dm6446) can be set appropriately for GPIOV33 pins.
  */
 
-static int davinci_gpio_irq_setup(struct platform_device *pdev)
+static int davinci_gpio_irq_setup(struct platform_device *pdev, int bank_irq)
 {
 	unsigned	gpio, bank;
 	int		irq;
 	int		ret;
 	struct clk	*clk;
 	u32		binten = 0;
-	unsigned	ngpio, bank_irq;
+	unsigned	ngpio;
 	struct device *dev = &pdev->dev;
-	struct resource	*res;
 	struct davinci_gpio_controller *chips = platform_get_drvdata(pdev);
 	struct davinci_gpio_platform_data *pdata = dev->platform_data;
 	struct davinci_gpio_regs __iomem *g;
@@ -481,18 +486,6 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		gpio_get_irq_chip = (gpio_get_irq_chip_cb_t)match->data;
 
 	ngpio = pdata->ngpio;
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(dev, "Invalid IRQ resource\n");
-		return -EBUSY;
-	}
-
-	bank_irq = res->start;
-
-	if (!bank_irq) {
-		dev_err(dev, "Invalid IRQ resource\n");
-		return -ENODEV;
-	}
 
 	clk = devm_clk_get(dev, "gpio");
 	if (IS_ERR(clk)) {
-- 
1.9.1
