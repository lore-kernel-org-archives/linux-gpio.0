From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH V3 5/5] gpio: davinci: Remove custom .xlate
Date: Tue, 17 Jan 2017 21:59:14 +0530
Message-ID: <1484670554-6392-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com, t-kristo@ti.com
List-Id: linux-gpio@vger.kernel.org

With the current redesign of driver it's not necessary to have
custom .xlate() as the gpiolib will assign default of_gpio_simple_xlate().

Suggested-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Keerthy <j-keerthy@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-davinci.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 2a5ae04..86b4950 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -163,27 +163,6 @@ static int davinci_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return NULL;
 }
 
-#ifdef CONFIG_OF_GPIO
-static int davinci_gpio_of_xlate(struct gpio_chip *gc,
-			     const struct of_phandle_args *gpiospec,
-			     u32 *flags)
-{
-	struct davinci_gpio_controller *chips = dev_get_drvdata(gc->parent);
-	struct davinci_gpio_platform_data *pdata = dev_get_platdata(gc->parent);
-
-	if (gpiospec->args[0] > pdata->ngpio)
-		return -EINVAL;
-
-	if (gc != &chips->chip)
-		return -EINVAL;
-
-	if (flags)
-		*flags = gpiospec->args[1];
-
-	return gpiospec->args[0] % 32;
-}
-#endif
-
 static int davinci_gpio_probe(struct platform_device *pdev)
 {
 	static int ctrl_num, bank_base;
@@ -244,7 +223,6 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF_GPIO
 	chips->chip.of_gpio_n_cells = 2;
-	chips->chip.of_xlate = davinci_gpio_of_xlate;
 	chips->chip.parent = dev;
 	chips->chip.of_node = dev->of_node;
 #endif
-- 
1.9.1
