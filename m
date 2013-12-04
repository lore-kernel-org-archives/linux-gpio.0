From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio/pinctrl: make gpio_chip members typed boolean
Date: Wed,  4 Dec 2013 14:45:23 +0100
Message-ID: <1386164723-31773-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:47403 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932462Ab3LDNpc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 08:45:32 -0500
Received: by mail-lb0-f173.google.com with SMTP id u14so9366426lbd.18
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2013 05:45:30 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

This switches the two members of struct gpio_chip that were
defined as unsigned foo:1 to bool, because that is indeed what
they are. Switch all users in the gpio and pinctrl subsystems
to assign these values with true/false instead of 0/1. The
users outside these subsystems will survive since true/false
is 1/0, atleast we set some kind of more strict typing example.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-74x164.c           |  2 +-
 drivers/gpio/gpio-adnp.c             |  2 +-
 drivers/gpio/gpio-adp5520.c          |  2 +-
 drivers/gpio/gpio-adp5588.c          |  2 +-
 drivers/gpio/gpio-arizona.c          |  2 +-
 drivers/gpio/gpio-bt8xx.c            |  2 +-
 drivers/gpio/gpio-da9052.c           |  2 +-
 drivers/gpio/gpio-da9055.c           |  2 +-
 drivers/gpio/gpio-ich.c              |  2 +-
 drivers/gpio/gpio-intel-mid.c        |  2 +-
 drivers/gpio/gpio-kempld.c           |  2 +-
 drivers/gpio/gpio-ks8695.c           |  2 +-
 drivers/gpio/gpio-lpc32xx.c          | 12 ++++++------
 drivers/gpio/gpio-lynxpoint.c        |  2 +-
 drivers/gpio/gpio-max730x.c          |  2 +-
 drivers/gpio/gpio-max732x.c          |  2 +-
 drivers/gpio/gpio-mc33880.c          |  2 +-
 drivers/gpio/gpio-mc9s08dz60.c       |  2 +-
 drivers/gpio/gpio-mcp23s08.c         |  2 +-
 drivers/gpio/gpio-ml-ioh.c           |  2 +-
 drivers/gpio/gpio-msic.c             |  2 +-
 drivers/gpio/gpio-mvebu.c            |  2 +-
 drivers/gpio/gpio-octeon.c           |  2 +-
 drivers/gpio/gpio-palmas.c           |  2 +-
 drivers/gpio/gpio-pca953x.c          |  2 +-
 drivers/gpio/gpio-pcf857x.c          |  2 +-
 drivers/gpio/gpio-pch.c              |  2 +-
 drivers/gpio/gpio-rc5t583.c          |  2 +-
 drivers/gpio/gpio-sta2x11.c          |  2 +-
 drivers/gpio/gpio-stmpe.c            |  2 +-
 drivers/gpio/gpio-sx150x.c           |  2 +-
 drivers/gpio/gpio-tb10x.c            |  2 +-
 drivers/gpio/gpio-tc3589x.c          |  2 +-
 drivers/gpio/gpio-timberdale.c       |  2 +-
 drivers/gpio/gpio-tnetv107x.c        |  2 +-
 drivers/gpio/gpio-tps6586x.c         |  2 +-
 drivers/gpio/gpio-tps65910.c         |  2 +-
 drivers/gpio/gpio-tps65912.c         |  2 +-
 drivers/gpio/gpio-twl4030.c          |  2 +-
 drivers/gpio/gpio-twl6040.c          |  2 +-
 drivers/gpio/gpio-ucb1400.c          |  2 +-
 drivers/gpio/gpio-viperboard.c       |  4 ++--
 drivers/gpio/gpio-vx855.c            |  2 +-
 drivers/gpio/gpio-wm831x.c           |  2 +-
 drivers/gpio/gpio-wm8350.c           |  2 +-
 drivers/gpio/gpio-wm8994.c           |  2 +-
 drivers/gpio/gpiolib.c               |  2 +-
 drivers/pinctrl/pinctrl-as3722.c     |  2 +-
 drivers/pinctrl/pinctrl-at91.c       |  2 +-
 drivers/pinctrl/pinctrl-baytrail.c   |  2 +-
 drivers/pinctrl/pinctrl-bcm2835.c    |  2 +-
 drivers/pinctrl/pinctrl-nomadik.c    |  2 +-
 drivers/pinctrl/pinctrl-sunxi.c      |  2 +-
 drivers/pinctrl/vt8500/pinctrl-wmt.c |  2 +-
 include/linux/gpio/driver.h          |  9 +++++----
 55 files changed, 65 insertions(+), 64 deletions(-)

diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index 1e04bf91328d..ddb831232407 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -159,7 +159,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 		goto exit_destroy;
 	}
 
-	chip->gpio_chip.can_sleep = 1;
+	chip->gpio_chip.can_sleep = true;
 	chip->gpio_chip.dev = &spi->dev;
 	chip->gpio_chip.owner = THIS_MODULE;
 
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index b204033acaeb..030a3897d9f7 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -260,7 +260,7 @@ static int adnp_gpio_setup(struct adnp *adnp, unsigned int num_gpios)
 	chip->direction_output = adnp_gpio_direction_output;
 	chip->get = adnp_gpio_get;
 	chip->set = adnp_gpio_set;
-	chip->can_sleep = 1;
+	chip->can_sleep = true;
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		chip->dbg_show = adnp_gpio_dbg_show;
diff --git a/drivers/gpio/gpio-adp5520.c b/drivers/gpio/gpio-adp5520.c
index 084337d5514d..613265944e2e 100644
--- a/drivers/gpio/gpio-adp5520.c
+++ b/drivers/gpio/gpio-adp5520.c
@@ -127,7 +127,7 @@ static int adp5520_gpio_probe(struct platform_device *pdev)
 	gc->direction_output = adp5520_gpio_direction_output;
 	gc->get = adp5520_gpio_get_value;
 	gc->set = adp5520_gpio_set_value;
-	gc->can_sleep = 1;
+	gc->can_sleep = true;
 
 	gc->base = pdata->gpio_start;
 	gc->ngpio = gpios;
diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index 90fc4c99c024..3f190e68f973 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -380,7 +380,7 @@ static int adp5588_gpio_probe(struct i2c_client *client,
 	gc->direction_output = adp5588_gpio_direction_output;
 	gc->get = adp5588_gpio_get_value;
 	gc->set = adp5588_gpio_set_value;
-	gc->can_sleep = 1;
+	gc->can_sleep = true;
 
 	gc->base = pdata->gpio_start;
 	gc->ngpio = ADP5588_MAXGPIO;
diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index dceb5dcf9d16..29bdff558981 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -91,7 +91,7 @@ static struct gpio_chip template_chip = {
 	.get			= arizona_gpio_get,
 	.direction_output	= arizona_gpio_direction_out,
 	.set			= arizona_gpio_set,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 };
 
 static int arizona_gpio_probe(struct platform_device *pdev)
diff --git a/drivers/gpio/gpio-bt8xx.c b/drivers/gpio/gpio-bt8xx.c
index c5c356b7f2ce..ecb3ca2d1d10 100644
--- a/drivers/gpio/gpio-bt8xx.c
+++ b/drivers/gpio/gpio-bt8xx.c
@@ -169,7 +169,7 @@ static void bt8xxgpio_gpio_setup(struct bt8xxgpio *bg)
 	c->dbg_show = NULL;
 	c->base = modparam_gpiobase;
 	c->ngpio = BT8XXGPIO_NR_GPIOS;
-	c->can_sleep = 0;
+	c->can_sleep = false;
 }
 
 static int bt8xxgpio_probe(struct pci_dev *dev,
diff --git a/drivers/gpio/gpio-da9052.c b/drivers/gpio/gpio-da9052.c
index 9b77dc05d4ad..416cdf786b05 100644
--- a/drivers/gpio/gpio-da9052.c
+++ b/drivers/gpio/gpio-da9052.c
@@ -200,7 +200,7 @@ static struct gpio_chip reference_gp = {
 	.direction_input = da9052_gpio_direction_input,
 	.direction_output = da9052_gpio_direction_output,
 	.to_irq = da9052_gpio_to_irq,
-	.can_sleep = 1,
+	.can_sleep = true,
 	.ngpio = 16,
 	.base = -1,
 };
diff --git a/drivers/gpio/gpio-da9055.c b/drivers/gpio/gpio-da9055.c
index 7ef0820032bd..f992997bc301 100644
--- a/drivers/gpio/gpio-da9055.c
+++ b/drivers/gpio/gpio-da9055.c
@@ -134,7 +134,7 @@ static struct gpio_chip reference_gp = {
 	.direction_input = da9055_gpio_direction_input,
 	.direction_output = da9055_gpio_direction_output,
 	.to_irq = da9055_gpio_to_irq,
-	.can_sleep = 1,
+	.can_sleep = true,
 	.ngpio = 3,
 	.base = -1,
 };
diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 814addb62d2c..f5bf3c38bca6 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -252,7 +252,7 @@ static void ichx_gpiolib_setup(struct gpio_chip *chip)
 	chip->direction_output = ichx_gpio_direction_output;
 	chip->base = modparam_gpiobase;
 	chip->ngpio = ichx_priv.desc->ngpio;
-	chip->can_sleep = 0;
+	chip->can_sleep = false;
 	chip->dbg_show = NULL;
 }
 
diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index f2035c01577f..1535ebae8fc8 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -425,7 +425,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 	priv->chip.to_irq = intel_gpio_to_irq;
 	priv->chip.base = gpio_base;
 	priv->chip.ngpio = ddata->ngpio;
-	priv->chip.can_sleep = 0;
+	priv->chip.can_sleep = false;
 	priv->pdev = pdev;
 
 	spin_lock_init(&priv->lock);
diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index efdc3924d7df..c6d88173f5a2 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -167,7 +167,7 @@ static int kempld_gpio_probe(struct platform_device *pdev)
 	chip->label = "gpio-kempld";
 	chip->owner = THIS_MODULE;
 	chip->dev = dev;
-	chip->can_sleep = 1;
+	chip->can_sleep = true;
 	if (pdata && pdata->gpio_base)
 		chip->base = pdata->gpio_base;
 	else
diff --git a/drivers/gpio/gpio-ks8695.c b/drivers/gpio/gpio-ks8695.c
index a3ac66ea364b..464a83de0d6a 100644
--- a/drivers/gpio/gpio-ks8695.c
+++ b/drivers/gpio/gpio-ks8695.c
@@ -228,7 +228,7 @@ static struct gpio_chip ks8695_gpio_chip = {
 	.to_irq			= ks8695_gpio_to_irq,
 	.base			= 0,
 	.ngpio			= 16,
-	.can_sleep		= 0,
+	.can_sleep		= false,
 };
 
 /* Register the GPIOs */
diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index a7093e010149..225344d66404 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -448,7 +448,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.base			= LPC32XX_GPIO_P0_GRP,
 			.ngpio			= LPC32XX_GPIO_P0_MAX,
 			.names			= gpio_p0_names,
-			.can_sleep		= 0,
+			.can_sleep		= false,
 		},
 		.gpio_grp = &gpio_grp_regs_p0,
 	},
@@ -464,7 +464,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.base			= LPC32XX_GPIO_P1_GRP,
 			.ngpio			= LPC32XX_GPIO_P1_MAX,
 			.names			= gpio_p1_names,
-			.can_sleep		= 0,
+			.can_sleep		= false,
 		},
 		.gpio_grp = &gpio_grp_regs_p1,
 	},
@@ -479,7 +479,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.base			= LPC32XX_GPIO_P2_GRP,
 			.ngpio			= LPC32XX_GPIO_P2_MAX,
 			.names			= gpio_p2_names,
-			.can_sleep		= 0,
+			.can_sleep		= false,
 		},
 		.gpio_grp = &gpio_grp_regs_p2,
 	},
@@ -495,7 +495,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.base			= LPC32XX_GPIO_P3_GRP,
 			.ngpio			= LPC32XX_GPIO_P3_MAX,
 			.names			= gpio_p3_names,
-			.can_sleep		= 0,
+			.can_sleep		= false,
 		},
 		.gpio_grp = &gpio_grp_regs_p3,
 	},
@@ -509,7 +509,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.base			= LPC32XX_GPI_P3_GRP,
 			.ngpio			= LPC32XX_GPI_P3_MAX,
 			.names			= gpi_p3_names,
-			.can_sleep		= 0,
+			.can_sleep		= false,
 		},
 		.gpio_grp = &gpio_grp_regs_p3,
 	},
@@ -523,7 +523,7 @@ static struct lpc32xx_gpio_chip lpc32xx_gpiochip[] = {
 			.base			= LPC32XX_GPO_P3_GRP,
 			.ngpio			= LPC32XX_GPO_P3_MAX,
 			.names			= gpo_p3_names,
-			.can_sleep		= 0,
+			.can_sleep		= false,
 		},
 		.gpio_grp = &gpio_grp_regs_p3,
 	},
diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index 1a7443ee6016..c283cd3b247a 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -391,7 +391,7 @@ static int lp_gpio_probe(struct platform_device *pdev)
 	gc->set = lp_gpio_set;
 	gc->base = -1;
 	gc->ngpio = LP_NUM_GPIO;
-	gc->can_sleep = 0;
+	gc->can_sleep = false;
 	gc->dev = dev;
 
 	/* set up interrupts  */
diff --git a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
index f4f4ed19bdc1..89226a36b08c 100644
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -188,7 +188,7 @@ int __max730x_probe(struct max7301 *ts)
 	ts->chip.set = max7301_set;
 
 	ts->chip.ngpio = PIN_NUMBER;
-	ts->chip.can_sleep = 1;
+	ts->chip.can_sleep = true;
 	ts->chip.dev = dev;
 	ts->chip.owner = THIS_MODULE;
 
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 91ad74dea8ce..36cb290764b6 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -564,7 +564,7 @@ static int max732x_setup_gpio(struct max732x_chip *chip,
 		gc->set = max732x_gpio_set_value;
 	}
 	gc->get = max732x_gpio_get_value;
-	gc->can_sleep = 1;
+	gc->can_sleep = true;
 
 	gc->base = gpio_start;
 	gc->ngpio = port;
diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index c0b7835f5136..553a80a5eaf3 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -115,7 +115,7 @@ static int mc33880_probe(struct spi_device *spi)
 	mc->chip.set = mc33880_set;
 	mc->chip.base = pdata->base;
 	mc->chip.ngpio = PIN_NUMBER;
-	mc->chip.can_sleep = 1;
+	mc->chip.can_sleep = true;
 	mc->chip.dev = &spi->dev;
 	mc->chip.owner = THIS_MODULE;
 
diff --git a/drivers/gpio/gpio-mc9s08dz60.c b/drivers/gpio/gpio-mc9s08dz60.c
index 0ab700046a23..dce35ff00db7 100644
--- a/drivers/gpio/gpio-mc9s08dz60.c
+++ b/drivers/gpio/gpio-mc9s08dz60.c
@@ -102,7 +102,7 @@ static int mc9s08dz60_probe(struct i2c_client *client,
 	mc9s->chip.dev = &client->dev;
 	mc9s->chip.owner = THIS_MODULE;
 	mc9s->chip.ngpio = GPIO_NUM;
-	mc9s->chip.can_sleep = 1;
+	mc9s->chip.can_sleep = true;
 	mc9s->chip.get = mc9s08dz60_get_value;
 	mc9s->chip.set = mc9s08dz60_set_value;
 	mc9s->chip.direction_output = mc9s08dz60_direction_output;
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 2deb0c5e54a4..b16401ee4766 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -425,7 +425,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	}
 
 	mcp->chip.base = base;
-	mcp->chip.can_sleep = 1;
+	mcp->chip.can_sleep = true;
 	mcp->chip.dev = dev;
 	mcp->chip.owner = THIS_MODULE;
 
diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 5c94af3c84e0..d51329d23d38 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -242,7 +242,7 @@ static void ioh_gpio_setup(struct ioh_gpio *chip, int num_port)
 	gpio->dbg_show = NULL;
 	gpio->base = -1;
 	gpio->ngpio = num_port;
-	gpio->can_sleep = 0;
+	gpio->can_sleep = false;
 	gpio->to_irq = ioh_gpio_to_irq;
 }
 
diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 69d60ab1d698..8f70ded82a2b 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -292,7 +292,7 @@ static int platform_msic_gpio_probe(struct platform_device *pdev)
 	mg->chip.to_irq = msic_gpio_to_irq;
 	mg->chip.base = pdata->gpio_base;
 	mg->chip.ngpio = MSIC_NUM_GPIO;
-	mg->chip.can_sleep = 1;
+	mg->chip.can_sleep = true;
 	mg->chip.dev = dev;
 
 	mutex_init(&mg->buslock);
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 3c3321f94053..a8908009803f 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -600,7 +600,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	mvchip->chip.to_irq = mvebu_gpio_to_irq;
 	mvchip->chip.base = id * MVEBU_MAX_GPIO_PER_BANK;
 	mvchip->chip.ngpio = ngpios;
-	mvchip->chip.can_sleep = 0;
+	mvchip->chip.can_sleep = false;
 	mvchip->chip.of_node = np;
 	mvchip->chip.dbg_show = mvebu_gpio_dbg_show;
 
diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 71a4a318315d..dbb08546b9ec 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -111,7 +111,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->dev = &pdev->dev;
 	chip->owner = THIS_MODULE;
 	chip->base = 0;
-	chip->can_sleep = 0;
+	chip->can_sleep = false;
 	chip->ngpio = 20;
 	chip->direction_input = octeon_gpio_dir_in;
 	chip->get = octeon_gpio_get;
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 11801e986dd9..da9d33252e56 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -182,7 +182,7 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	palmas_gpio->gpio_chip.owner = THIS_MODULE;
 	palmas_gpio->gpio_chip.label = dev_name(&pdev->dev);
 	palmas_gpio->gpio_chip.ngpio = dev_data->ngpio;
-	palmas_gpio->gpio_chip.can_sleep = 1;
+	palmas_gpio->gpio_chip.can_sleep = true;
 	palmas_gpio->gpio_chip.direction_input = palmas_gpio_input;
 	palmas_gpio->gpio_chip.direction_output = palmas_gpio_output;
 	palmas_gpio->gpio_chip.to_irq = palmas_gpio_to_irq;
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 6e48c07e3d8c..019b23b955a2 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -354,7 +354,7 @@ static void pca953x_setup_gpio(struct pca953x_chip *chip, int gpios)
 	gc->direction_output = pca953x_gpio_direction_output;
 	gc->get = pca953x_gpio_get_value;
 	gc->set = pca953x_gpio_set_value;
-	gc->can_sleep = 1;
+	gc->can_sleep = true;
 
 	gc->base = chip->gpio_start;
 	gc->ngpio = gpios;
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 1535686e74ea..82735822bc9d 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -305,7 +305,7 @@ static int pcf857x_probe(struct i2c_client *client,
 	spin_lock_init(&gpio->slock);
 
 	gpio->chip.base			= pdata ? pdata->gpio_base : -1;
-	gpio->chip.can_sleep		= 1;
+	gpio->chip.can_sleep		= true;
 	gpio->chip.dev			= &client->dev;
 	gpio->chip.owner		= THIS_MODULE;
 	gpio->chip.get			= pcf857x_get;
diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index ef7a756c9ded..9656c196772e 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -224,7 +224,7 @@ static void pch_gpio_setup(struct pch_gpio *chip)
 	gpio->dbg_show = NULL;
 	gpio->base = -1;
 	gpio->ngpio = gpio_pins[chip->ioh];
-	gpio->can_sleep = 0;
+	gpio->can_sleep = false;
 	gpio->to_irq = pch_gpio_to_irq;
 }
 
diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index e63d6a397e17..122b776fdc0b 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -133,7 +133,7 @@ static int rc5t583_gpio_probe(struct platform_device *pdev)
 	rc5t583_gpio->gpio_chip.get = rc5t583_gpio_get,
 	rc5t583_gpio->gpio_chip.to_irq = rc5t583_gpio_to_irq,
 	rc5t583_gpio->gpio_chip.ngpio = RC5T583_MAX_GPIO,
-	rc5t583_gpio->gpio_chip.can_sleep = 1,
+	rc5t583_gpio->gpio_chip.can_sleep = true,
 	rc5t583_gpio->gpio_chip.dev = &pdev->dev;
 	rc5t583_gpio->gpio_chip.base = -1;
 	rc5t583_gpio->rc5t583 = rc5t583;
diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
index f2fb12c18da9..68e3fcb1acea 100644
--- a/drivers/gpio/gpio-sta2x11.c
+++ b/drivers/gpio/gpio-sta2x11.c
@@ -146,7 +146,7 @@ static void gsta_gpio_setup(struct gsta_gpio *chip) /* called from probe */
 	gpio->dbg_show = NULL;
 	gpio->base = gpio_base;
 	gpio->ngpio = GSTA_NR_GPIO;
-	gpio->can_sleep = 0;
+	gpio->can_sleep = false;
 	gpio->to_irq = gsta_gpio_to_irq;
 
 	/*
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 2647e243d471..2776a09bee58 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -129,7 +129,7 @@ static struct gpio_chip template_chip = {
 	.set			= stmpe_gpio_set,
 	.to_irq			= stmpe_gpio_to_irq,
 	.request		= stmpe_gpio_request,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 };
 
 static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index d2983e9ad6af..13d73fb2b5e1 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -436,7 +436,7 @@ static void sx150x_init_chip(struct sx150x_chip *chip,
 	chip->gpio_chip.set              = sx150x_gpio_set;
 	chip->gpio_chip.to_irq           = sx150x_gpio_to_irq;
 	chip->gpio_chip.base             = pdata->gpio_base;
-	chip->gpio_chip.can_sleep        = 1;
+	chip->gpio_chip.can_sleep        = true;
 	chip->gpio_chip.ngpio            = chip->dev_cfg->ngpios;
 	if (pdata->oscio_is_gpo)
 		++chip->gpio_chip.ngpio;
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 0502b9a041a5..66a54ea4f779 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -221,7 +221,7 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	tb10x_gpio->gc.free		= tb10x_gpio_free;
 	tb10x_gpio->gc.base		= -1;
 	tb10x_gpio->gc.ngpio		= ngpio;
-	tb10x_gpio->gc.can_sleep	= 0;
+	tb10x_gpio->gc.can_sleep	= false;
 
 
 	ret = gpiochip_add(&tb10x_gpio->gc);
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index ddb5fefaa715..1019320984d7 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -127,7 +127,7 @@ static struct gpio_chip template_chip = {
 	.direction_output	= tc3589x_gpio_direction_output,
 	.set			= tc3589x_gpio_set,
 	.to_irq			= tc3589x_gpio_to_irq,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 };
 
 static int tc3589x_gpio_irq_set_type(struct irq_data *d, unsigned int type)
diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index 521971e6a9f5..f9a8fbde108e 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -275,7 +275,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 	gc->dbg_show = NULL;
 	gc->base = pdata->gpio_base;
 	gc->ngpio = pdata->nr_pins;
-	gc->can_sleep = 0;
+	gc->can_sleep = false;
 
 	err = gpiochip_add(gc);
 	if (err)
diff --git a/drivers/gpio/gpio-tnetv107x.c b/drivers/gpio/gpio-tnetv107x.c
index 58445bb69106..4aa481579a05 100644
--- a/drivers/gpio/gpio-tnetv107x.c
+++ b/drivers/gpio/gpio-tnetv107x.c
@@ -176,7 +176,7 @@ static int __init tnetv107x_gpio_setup(void)
 		ctlr = &chips[i];
 
 		ctlr->chip.label	= "tnetv107x";
-		ctlr->chip.can_sleep	= 0;
+		ctlr->chip.can_sleep	= false;
 		ctlr->chip.base		= base;
 		ctlr->chip.ngpio	= ngpio - base;
 		if (ctlr->chip.ngpio > 32)
diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index 29e8e750bd49..8994dfa13491 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -108,7 +108,7 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 	tps6586x_gpio->gpio_chip.label = pdev->name;
 	tps6586x_gpio->gpio_chip.dev = &pdev->dev;
 	tps6586x_gpio->gpio_chip.ngpio = 4;
-	tps6586x_gpio->gpio_chip.can_sleep = 1;
+	tps6586x_gpio->gpio_chip.can_sleep = true;
 
 	/* FIXME: add handling of GPIOs as dedicated inputs */
 	tps6586x_gpio->gpio_chip.direction_output = tps6586x_gpio_output;
diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.c
index 06146219d9d2..b6e818e68007 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -143,7 +143,7 @@ static int tps65910_gpio_probe(struct platform_device *pdev)
 	default:
 		return -EINVAL;
 	}
-	tps65910_gpio->gpio_chip.can_sleep = 1;
+	tps65910_gpio->gpio_chip.can_sleep = true;
 	tps65910_gpio->gpio_chip.direction_input = tps65910_gpio_input;
 	tps65910_gpio->gpio_chip.direction_output = tps65910_gpio_output;
 	tps65910_gpio->gpio_chip.set	= tps65910_gpio_set;
diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.c
index 276a4229b032..59ee486cb8b9 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -79,7 +79,7 @@ static struct gpio_chip template_chip = {
 	.direction_output	= tps65912_gpio_output,
 	.get			= tps65912_gpio_get,
 	.set			= tps65912_gpio_set,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 	.ngpio			= 5,
 	.base			= -1,
 };
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 0c7e891c8651..cd06678a29f7 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -386,7 +386,7 @@ static struct gpio_chip template_chip = {
 	.direction_output	= twl_direction_out,
 	.set			= twl_set,
 	.to_irq			= twl_to_irq,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 };
 
 /*----------------------------------------------------------------------*/
diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index d420d30b86e7..0caf5cd1b47d 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -77,7 +77,7 @@ static struct gpio_chip twl6040gpo_chip = {
 	.get			= twl6040gpo_get,
 	.direction_output	= twl6040gpo_direction_out,
 	.set			= twl6040gpo_set,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 };
 
 /*----------------------------------------------------------------------*/
diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index 1a605f2a0f55..c6a53971387b 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -64,7 +64,7 @@ static int ucb1400_gpio_probe(struct platform_device *dev)
 	ucb->gc.direction_output = ucb1400_gpio_dir_out;
 	ucb->gc.get = ucb1400_gpio_get;
 	ucb->gc.set = ucb1400_gpio_set;
-	ucb->gc.can_sleep = 1;
+	ucb->gc.can_sleep = true;
 
 	err = gpiochip_add(&ucb->gc);
 	if (err)
diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperboard.c
index 5ac2919197fe..79e3b5836712 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -413,7 +413,7 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpioa.owner = THIS_MODULE;
 	vb_gpio->gpioa.base = -1;
 	vb_gpio->gpioa.ngpio = 16;
-	vb_gpio->gpioa.can_sleep = 1;
+	vb_gpio->gpioa.can_sleep = true;
 	vb_gpio->gpioa.set = vprbrd_gpioa_set;
 	vb_gpio->gpioa.get = vprbrd_gpioa_get;
 	vb_gpio->gpioa.direction_input = vprbrd_gpioa_direction_input;
@@ -430,7 +430,7 @@ static int vprbrd_gpio_probe(struct platform_device *pdev)
 	vb_gpio->gpiob.owner = THIS_MODULE;
 	vb_gpio->gpiob.base = -1;
 	vb_gpio->gpiob.ngpio = 16;
-	vb_gpio->gpiob.can_sleep = 1;
+	vb_gpio->gpiob.can_sleep = true;
 	vb_gpio->gpiob.set = vprbrd_gpiob_set;
 	vb_gpio->gpiob.get = vprbrd_gpiob_get;
 	vb_gpio->gpiob.direction_input = vprbrd_gpiob_direction_input;
diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index cddfa22edb41..0fd23b6a753d 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -214,7 +214,7 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
 	c->dbg_show = NULL;
 	c->base = 0;
 	c->ngpio = NR_VX855_GP;
-	c->can_sleep = 0;
+	c->can_sleep = false;
 	c->names = vx855gpio_names;
 }
 
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 456000c5c457..b18a1a26425e 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -240,7 +240,7 @@ static struct gpio_chip template_chip = {
 	.to_irq			= wm831x_gpio_to_irq,
 	.set_debounce		= wm831x_gpio_set_debounce,
 	.dbg_show		= wm831x_gpio_dbg_show,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 };
 
 static int wm831x_gpio_probe(struct platform_device *pdev)
diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index fc49154be7b1..2487f9d575d3 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -106,7 +106,7 @@ static struct gpio_chip template_chip = {
 	.direction_output	= wm8350_gpio_direction_out,
 	.set			= wm8350_gpio_set,
 	.to_irq			= wm8350_gpio_to_irq,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 };
 
 static int wm8350_gpio_probe(struct platform_device *pdev)
diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index a53dbdefc7ee..d93b6b581677 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -242,7 +242,7 @@ static struct gpio_chip template_chip = {
 	.set			= wm8994_gpio_set,
 	.to_irq			= wm8994_gpio_to_irq,
 	.dbg_show		= wm8994_gpio_dbg_show,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 };
 
 static int wm8994_gpio_probe(struct platform_device *pdev)
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c6326e44e2c0..94467ddb3711 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1051,7 +1051,7 @@ static void gpiochip_unexport(struct gpio_chip *chip)
 	if (dev) {
 		put_device(dev);
 		device_unregister(dev);
-		chip->exported = 0;
+		chip->exported = false;
 		status = 0;
 	} else
 		status = -ENODEV;
diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl-as3722.c
index 01bffc1d52fd..b80f1e150f53 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -531,7 +531,7 @@ static const struct gpio_chip as3722_gpio_chip = {
 	.direction_input	= as3722_gpio_direction_input,
 	.direction_output	= as3722_gpio_direction_output,
 	.to_irq			= as3722_gpio_to_irq,
-	.can_sleep		= 1,
+	.can_sleep		= true,
 	.ngpio			= AS3722_PIN_NUM,
 	.base			= -1,
 };
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index a7549c4c83b4..943805185f3f 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1527,7 +1527,7 @@ static struct gpio_chip at91_gpio_template = {
 	.set			= at91_gpio_set,
 	.to_irq			= at91_gpio_to_irq,
 	.dbg_show		= at91_gpio_dbg_show,
-	.can_sleep		= 0,
+	.can_sleep		= false,
 	.ngpio			= MAX_NB_GPIO_PER_BANK,
 };
 
diff --git a/drivers/pinctrl/pinctrl-baytrail.c b/drivers/pinctrl/pinctrl-baytrail.c
index 2832576d8b12..31c8b3257a94 100644
--- a/drivers/pinctrl/pinctrl-baytrail.c
+++ b/drivers/pinctrl/pinctrl-baytrail.c
@@ -461,7 +461,7 @@ static int byt_gpio_probe(struct platform_device *pdev)
 	gc->set = byt_gpio_set;
 	gc->dbg_show = byt_gpio_dbg_show;
 	gc->base = -1;
-	gc->can_sleep = 0;
+	gc->can_sleep = false;
 	gc->dev = dev;
 
 	ret = gpiochip_add(gc);
diff --git a/drivers/pinctrl/pinctrl-bcm2835.c b/drivers/pinctrl/pinctrl-bcm2835.c
index c05c1ef2cc3c..3d907de9bc91 100644
--- a/drivers/pinctrl/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/pinctrl-bcm2835.c
@@ -384,7 +384,7 @@ static struct gpio_chip bcm2835_gpio_chip = {
 	.to_irq = bcm2835_gpio_to_irq,
 	.base = -1,
 	.ngpio = BCM2835_NUM_GPIOS,
-	.can_sleep = 0,
+	.can_sleep = false,
 };
 
 static irqreturn_t bcm2835_gpio_irq_handler(int irq, void *dev_id)
diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
index 7111c3b59130..a21820fc4b7c 100644
--- a/drivers/pinctrl/pinctrl-nomadik.c
+++ b/drivers/pinctrl/pinctrl-nomadik.c
@@ -904,7 +904,7 @@ static struct gpio_chip nmk_gpio_template = {
 	.set			= nmk_gpio_set_output,
 	.to_irq			= nmk_gpio_to_irq,
 	.dbg_show		= nmk_gpio_dbg_show,
-	.can_sleep		= 0,
+	.can_sleep		= false,
 };
 
 void nmk_gpio_clocks_enable(void)
diff --git a/drivers/pinctrl/pinctrl-sunxi.c b/drivers/pinctrl/pinctrl-sunxi.c
index 119d2ddedfe7..6b181cb90d39 100644
--- a/drivers/pinctrl/pinctrl-sunxi.c
+++ b/drivers/pinctrl/pinctrl-sunxi.c
@@ -547,7 +547,7 @@ static struct gpio_chip sunxi_pinctrl_gpio_chip = {
 	.of_xlate		= sunxi_pinctrl_gpio_of_xlate,
 	.to_irq			= sunxi_pinctrl_gpio_to_irq,
 	.of_gpio_n_cells	= 3,
-	.can_sleep		= 0,
+	.can_sleep		= false,
 };
 
 static int sunxi_pinctrl_irq_set_type(struct irq_data *d,
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index 39aec0850810..b28d1af9c232 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -565,7 +565,7 @@ static struct gpio_chip wmt_gpio_chip = {
 	.direction_output = wmt_gpio_direction_output,
 	.get = wmt_gpio_get_value,
 	.set = wmt_gpio_set_value,
-	.can_sleep = 0,
+	.can_sleep = false,
 };
 
 int wmt_pinctrl_probe(struct platform_device *pdev,
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 656a27efb2c8..804ec45365b7 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -36,14 +36,15 @@ struct seq_file;
  * @ngpio: the number of GPIOs handled by this controller; the last GPIO
  *	handled is (base + ngpio - 1).
  * @desc: array of ngpio descriptors. Private.
- * @can_sleep: flag must be set iff get()/set() methods sleep, as they
- *	must while accessing GPIO expander chips over I2C or SPI
  * @names: if set, must be an array of strings to use as alternative
  *      names for the GPIOs in this chip. Any entry in the array
  *      may be NULL if there is no alias for the GPIO, however the
  *      array must be @ngpio entries long.  A name can include a single printk
  *      format specifier for an unsigned int.  It is substituted by the actual
  *      number of the gpio.
+ * @can_sleep: flag must be set iff get()/set() methods sleep, as they
+ *	must while accessing GPIO expander chips over I2C or SPI
+ * @exported: flags if the gpiochip is exported for use from sysfs. Private.
  *
  * A gpio_chip can help platforms abstract various sources of GPIOs so
  * they can all be accessed through a common programing interface.
@@ -88,8 +89,8 @@ struct gpio_chip {
 	u16			ngpio;
 	struct gpio_desc	*desc;
 	const char		*const *names;
-	unsigned		can_sleep:1;
-	unsigned		exported:1;
+	bool			can_sleep;
+	bool			exported;
 
 #if defined(CONFIG_OF_GPIO)
 	/*
-- 
1.8.3.1

