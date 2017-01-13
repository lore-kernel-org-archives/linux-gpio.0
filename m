From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH V2 1/6] gpio: davinci: Remove gpio2regs function to accommodate multi instances
Date: Fri, 13 Jan 2017 09:50:10 +0530
Message-ID: <1484281215-24576-2-git-send-email-j-keerthy@ti.com>
References: <1484281215-24576-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:25641 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750835AbdAMEUo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 23:20:44 -0500
In-Reply-To: <1484281215-24576-1-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com

gpio2regs is written making an assumption that driver supports only
one instance of gpio controller. Removing this and adding a generic
array so as to support multiple instances of gpio controllers.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---

Changes in v2:

  * Added a comment to explain divide by 2 logic for register sets.

 drivers/gpio/gpio-davinci.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 163f81e..bb47de3 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -43,25 +43,7 @@ struct davinci_gpio_regs {
 #define MAX_LABEL_SIZE 20
 
 static void __iomem *gpio_base;
-
-static struct davinci_gpio_regs __iomem *gpio2regs(unsigned gpio)
-{
-	void __iomem *ptr;
-
-	if (gpio < 32 * 1)
-		ptr = gpio_base + 0x10;
-	else if (gpio < 32 * 2)
-		ptr = gpio_base + 0x38;
-	else if (gpio < 32 * 3)
-		ptr = gpio_base + 0x60;
-	else if (gpio < 32 * 4)
-		ptr = gpio_base + 0x88;
-	else if (gpio < 32 * 5)
-		ptr = gpio_base + 0xb0;
-	else
-		ptr = NULL;
-	return ptr;
-}
+static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
 
 static inline struct davinci_gpio_regs __iomem *irq2regs(struct irq_data *d)
 {
@@ -262,7 +244,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 #endif
 		spin_lock_init(&chips[i].lock);
 
-		regs = gpio2regs(base);
+		regs = gpio_base + offset_array[i];
 		if (!regs)
 			return -ENXIO;
 		chips[i].regs = regs;
@@ -417,7 +399,9 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 davinci_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 		     irq_hw_number_t hw)
 {
-	struct davinci_gpio_regs __iomem *g = gpio2regs(hw);
+	struct davinci_gpio_controller *chips =
+				(struct davinci_gpio_controller *)d->host_data;
+	struct davinci_gpio_regs __iomem *g = chips[hw / 32].regs;
 
 	irq_set_chip_and_handler_name(irq, &gpio_irqchip, handle_simple_irq,
 				"davinci_gpio");
@@ -554,7 +538,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		irq_chip->irq_set_type = gpio_irq_type_unbanked;
 
 		/* default trigger: both edges */
-		g = gpio2regs(0);
+		g = chips[0].regs;
 		writel_relaxed(~0, &g->set_falling);
 		writel_relaxed(~0, &g->set_rising);
 
@@ -573,8 +557,11 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * then chain through our own handler.
 	 */
 	for (gpio = 0, bank = 0; gpio < ngpio; bank++, bank_irq++, gpio += 16) {
-		/* disabled by default, enabled only as needed */
-		g = gpio2regs(gpio);
+		/* disabled by default, enabled only as needed
+		 * There are register sets for 32 GPIOs. 2 banks of 16
+		 * GPIOs are covered by each set of registers hence divide by 2
+		 */
+		g = chips[bank / 2].regs;
 		writel_relaxed(~0, &g->clr_falling);
 		writel_relaxed(~0, &g->clr_rising);
 
-- 
1.9.1

