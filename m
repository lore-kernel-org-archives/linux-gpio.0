From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: lm363x: Pass descriptor instead of GPIO number" to the regulator tree
Date: Thu, 24 May 2018 20:14:18 +0100
Message-ID: <E1fLvgo-000602-MN@debutante>
References: <20180212131717.27193-10-linus.walleij@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180212131717.27193-10-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Milo Kim <milo.kim@ti.com>linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The patch

   regulator: lm363x: Pass descriptor instead of GPIO number

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From b2d751b7f69b352de0280d2279765a9506ed54f0 Mon Sep 17 00:00:00 2001
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 May 2018 10:06:27 +0200
Subject: [PATCH] regulator: lm363x: Pass descriptor instead of GPIO number

Instead of passing a global GPIO number, pass a descriptor looked
up with the standard devm_gpiod_get_index_optional() call.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/lm363x-regulator.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm363x-regulator.c
index ce5f7d9ad475..b615a413ca9f 100644
--- a/drivers/regulator/lm363x-regulator.c
+++ b/drivers/regulator/lm363x-regulator.c
@@ -16,7 +16,7 @@
 #include <linux/mfd/ti-lmu-register.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/of_regulator.h>
@@ -219,7 +219,7 @@ static const struct regulator_desc lm363x_regulator_desc[] = {
 	},
 };
 
-static int lm363x_regulator_of_get_enable_gpio(struct device_node *np, int id)
+static struct gpio_desc *lm363x_regulator_of_get_enable_gpio(struct device *dev, int id)
 {
 	/*
 	 * Check LCM_EN1/2_GPIO is configured.
@@ -227,11 +227,11 @@ static int lm363x_regulator_of_get_enable_gpio(struct device_node *np, int id)
 	 */
 	switch (id) {
 	case LM3632_LDO_POS:
-		return of_get_named_gpio(np, "enable-gpios", 0);
+		return devm_gpiod_get_index_optional(dev, "enable", 0, GPIOD_OUT_LOW);
 	case LM3632_LDO_NEG:
-		return of_get_named_gpio(np, "enable-gpios", 1);
+		return devm_gpiod_get_index_optional(dev, "enable", 1, GPIOD_OUT_LOW);
 	default:
-		return -EINVAL;
+		return NULL;
 	}
 }
 
@@ -243,7 +243,8 @@ static int lm363x_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	struct device *dev = &pdev->dev;
 	int id = pdev->id;
-	int ret, ena_gpio;
+	struct gpio_desc *gpiod;
+	int ret;
 
 	cfg.dev = dev;
 	cfg.regmap = regmap;
@@ -252,10 +253,9 @@ static int lm363x_regulator_probe(struct platform_device *pdev)
 	 * LM3632 LDOs can be controlled by external pin.
 	 * Register update is required if the pin is used.
 	 */
-	ena_gpio = lm363x_regulator_of_get_enable_gpio(dev->of_node, id);
-	if (gpio_is_valid(ena_gpio)) {
-		cfg.ena_gpio = ena_gpio;
-		cfg.ena_gpio_flags = GPIOF_OUT_INIT_LOW;
+	gpiod = lm363x_regulator_of_get_enable_gpio(dev, id);
+	if (gpiod) {
+		cfg.ena_gpiod = gpiod;
 
 		ret = regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
 					 LM3632_EXT_EN_MASK,
-- 
2.17.0
