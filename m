From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 01/53] gpio: pl061: Move irq_chip definition inside struct pl061
Date: Tue,  8 Jan 2019 14:31:29 -0500
Message-ID: <20190108193222.123316-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

[ Upstream commit ed8dce4c6f726b7f3c6bf40859b92a9e32f189c1 ]

Keeping the irq_chip definition static will make it shared with multiple
giochips in the system. This practice is considered to be bad and now we
will get the below warning from gpiolib core:

"detected irqchip that is shared with multiple gpiochips: please fix the
driver."

Hence, move the irq_chip definition from static to `struct pl061` for
using a unique irq_chip for each gpiochip.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-pl061.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 6aaaab79c205..f6e1e0e306a3 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -54,6 +54,7 @@ struct pl061 {
 
 	void __iomem		*base;
 	struct gpio_chip	gc;
+	struct irq_chip		irq_chip;
 	int			parent_irq;
 
 #ifdef CONFIG_PM
@@ -281,15 +282,6 @@ static int pl061_irq_set_wake(struct irq_data *d, unsigned int state)
 	return irq_set_irq_wake(pl061->parent_irq, state);
 }
 
-static struct irq_chip pl061_irqchip = {
-	.name		= "pl061",
-	.irq_ack	= pl061_irq_ack,
-	.irq_mask	= pl061_irq_mask,
-	.irq_unmask	= pl061_irq_unmask,
-	.irq_set_type	= pl061_irq_type,
-	.irq_set_wake	= pl061_irq_set_wake,
-};
-
 static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
@@ -328,6 +320,13 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	/*
 	 * irq_chip support
 	 */
+	pl061->irq_chip.name = dev_name(dev);
+	pl061->irq_chip.irq_ack	= pl061_irq_ack;
+	pl061->irq_chip.irq_mask = pl061_irq_mask;
+	pl061->irq_chip.irq_unmask = pl061_irq_unmask;
+	pl061->irq_chip.irq_set_type = pl061_irq_type;
+	pl061->irq_chip.irq_set_wake = pl061_irq_set_wake;
+
 	writeb(0, pl061->base + GPIOIE); /* disable irqs */
 	irq = adev->irq[0];
 	if (irq < 0) {
@@ -336,14 +335,14 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 	pl061->parent_irq = irq;
 
-	ret = gpiochip_irqchip_add(&pl061->gc, &pl061_irqchip,
+	ret = gpiochip_irqchip_add(&pl061->gc, &pl061->irq_chip,
 				   0, handle_bad_irq,
 				   IRQ_TYPE_NONE);
 	if (ret) {
 		dev_info(&adev->dev, "could not add irqchip\n");
 		return ret;
 	}
-	gpiochip_set_chained_irqchip(&pl061->gc, &pl061_irqchip,
+	gpiochip_set_chained_irqchip(&pl061->gc, &pl061->irq_chip,
 				     irq, pl061_irq_handler);
 
 	amba_set_drvdata(adev, pl061);
-- 
2.19.1
