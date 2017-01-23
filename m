From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/3] pinctrl / gpio: Introduce .set_config() callback for GPIO chips
Date: Mon, 23 Jan 2017 15:34:34 +0300
Message-ID: <20170123123434.61972-4-mika.westerberg@linux.intel.com>
References: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170123123434.61972-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Currently we already have two pin configuration related callbacks
available for GPIO chips .set_single_ended() and .set_debounce(). In
future we expect to have even more, which does not scale well if we need
to add yet another callback to the GPIO chip structure for each possible
configuration parameter.

Better solution is to reuse what we already have available in the
generic pinconf.

To support this, we introduce a new .set_config() callback for GPIO
chips. The callback takes a single packed pin configuration value as
parameter. This can then be extended easily beyond what is currently
supported by just adding new types to the generic pinconf enum.

If the GPIO driver is backed up by a pinctrl driver the GPIO driver can
just assign gpiochip_generic_config() (introduced in this patch) to
.set_config and that will take care configuration requests are directed
to the pinctrl driver.

We then convert the existing drivers over .set_config() and finally
remove the .set_single_ended() and .set_debounce() callbacks.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 Documentation/gpio/driver.txt                 |  9 +++--
 drivers/gpio/gpio-bcm-kona.c                  | 14 ++++++-
 drivers/gpio/gpio-dln2.c                      | 12 ++++--
 drivers/gpio/gpio-dwapb.c                     | 14 ++++++-
 drivers/gpio/gpio-ep93xx.c                    | 11 ++++--
 drivers/gpio/gpio-f7188x.c                    | 19 +++++----
 drivers/gpio/gpio-lp873x.c                    | 14 +++----
 drivers/gpio/gpio-max77620.c                  | 20 +++++-----
 drivers/gpio/gpio-menz127.c                   | 34 +++++++++++-----
 drivers/gpio/gpio-merrifield.c                | 14 ++++++-
 drivers/gpio/gpio-omap.c                      | 14 ++++++-
 drivers/gpio/gpio-tc3589x.c                   | 15 ++++---
 drivers/gpio/gpio-tegra.c                     | 14 ++++++-
 drivers/gpio/gpio-tps65218.c                  | 14 +++----
 drivers/gpio/gpio-vx855.c                     | 13 ++++---
 drivers/gpio/gpio-wcove.c                     | 13 +++----
 drivers/gpio/gpio-wm831x.c                    | 21 +++++-----
 drivers/gpio/gpio-wm8994.c                    | 13 +++----
 drivers/gpio/gpiolib.c                        | 56 +++++++++++++++++----------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 14 ++++++-
 drivers/pinctrl/pinctrl-amd.c                 | 14 ++++++-
 drivers/pinctrl/pinctrl-sx150x.c              | 55 +++++++-------------------
 drivers/staging/greybus/gpio.c                | 15 ++++---
 drivers/usb/serial/cp210x.c                   | 13 ++++---
 include/linux/gpio/driver.h                   | 37 ++++--------------
 include/linux/pinctrl/pinconf-generic.h       | 33 +++++++---------
 26 files changed, 297 insertions(+), 218 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index 747c721776ed..ad8f0c0cd13f 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -146,10 +146,11 @@ a pull-up resistor is needed on the outgoing rail to complete the circuit, and
 in the second case, a pull-down resistor is needed on the rail.
 
 Hardware that supports open drain or open source or both, can implement a
-special callback in the gpio_chip: .set_single_ended() that takes an enum flag
-telling whether to configure the line as open drain, open source or push-pull.
-This will happen in response to the GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE flag
-set in the machine file, or coming from other hardware descriptions.
+special callback in the gpio_chip: .set_config() that takes a generic
+pinconf packed value telling whether to configure the line as open drain,
+open source or push-pull. This will happen in response to the
+GPIO_OPEN_DRAIN or GPIO_OPEN_SOURCE flag set in the machine file, or coming
+from other hardware descriptions.
 
 If this state can not be configured in hardware, i.e. if the GPIO hardware does
 not support open drain/open source in hardware, the GPIO library will instead
diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 3d1cf018e8e7..41d0ac142580 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -308,6 +308,18 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
 	return 0;
 }
 
+static int bcm_kona_gpio_set_config(struct gpio_chip *chip, unsigned gpio,
+				    unsigned long config)
+{
+	u32 debounce;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
+	return bcm_kona_gpio_set_debounce(chip, gpio, debounce);
+}
+
 static const struct gpio_chip template_chip = {
 	.label = "bcm-kona-gpio",
 	.owner = THIS_MODULE,
@@ -318,7 +330,7 @@ static const struct gpio_chip template_chip = {
 	.get = bcm_kona_gpio_get,
 	.direction_output = bcm_kona_gpio_direction_output,
 	.set = bcm_kona_gpio_set,
-	.set_debounce = bcm_kona_gpio_set_debounce,
+	.set_config = bcm_kona_gpio_set_config,
 	.to_irq = bcm_kona_gpio_to_irq,
 	.base = 0,
 };
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 5d38b08d1ee2..aecb847166f5 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -272,12 +272,16 @@ static int dln2_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 	return dln2_gpio_set_direction(chip, offset, DLN2_GPIO_DIRECTION_OUT);
 }
 
-static int dln2_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
-				  unsigned debounce)
+static int dln2_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+				unsigned long config)
 {
 	struct dln2_gpio *dln2 = gpiochip_get_data(chip);
-	__le32 duration = cpu_to_le32(debounce);
+	__le32 duration;
 
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	duration = cpu_to_le32(pinconf_to_config_argument(config));
 	return dln2_transfer_tx(dln2->pdev, DLN2_GPIO_SET_DEBOUNCE,
 				&duration, sizeof(duration));
 }
@@ -474,7 +478,7 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 	dln2->gpio.get_direction = dln2_gpio_get_direction;
 	dln2->gpio.direction_input = dln2_gpio_direction_input;
 	dln2->gpio.direction_output = dln2_gpio_direction_output;
-	dln2->gpio.set_debounce = dln2_gpio_set_debounce;
+	dln2->gpio.set_config = dln2_gpio_set_config;
 
 	platform_set_drvdata(pdev, dln2);
 
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 6193f62c0df4..9c15ee4ef4e9 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -279,6 +279,18 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 	return 0;
 }
 
+static int dwapb_gpio_set_config(struct gpio_chip *gc, unsigned offset,
+				 unsigned long config)
+{
+	u32 debounce;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
+	return dwapb_gpio_set_debounce(gc, offset, debounce);
+}
+
 static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
 {
 	u32 worked;
@@ -426,7 +438,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
 
 	/* Only port A support debounce */
 	if (pp->idx == 0)
-		port->gc.set_debounce = dwapb_gpio_set_debounce;
+		port->gc.set_config = dwapb_gpio_set_config;
 
 	if (pp->irq)
 		dwapb_configure_irqs(gpio, port, pp);
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index d054219e18b9..45d384039e9b 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -291,15 +291,20 @@ static struct ep93xx_gpio_bank ep93xx_gpio_banks[] = {
 	EP93XX_GPIO_BANK("H", 0x40, 0x44, 56, false),
 };
 
-static int ep93xx_gpio_set_debounce(struct gpio_chip *chip,
-				    unsigned offset, unsigned debounce)
+static int ep93xx_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+				  unsigned long config)
 {
 	int gpio = chip->base + offset;
 	int irq = gpio_to_irq(gpio);
+	u32 debounce;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
 
 	if (irq < 0)
 		return -EINVAL;
 
+	debounce = pinconf_to_config_argument(config);
 	ep93xx_gpio_int_debounce(irq, debounce ? true : false);
 
 	return 0;
@@ -335,7 +340,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc, struct device *dev,
 	gc->base = bank->base;
 
 	if (bank->has_debounce) {
-		gc->set_debounce = ep93xx_gpio_set_debounce;
+		gc->set_config = ep93xx_gpio_set_config;
 		gc->to_irq = ep93xx_gpio_to_irq;
 	}
 
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index e8accde62aa7..56bd76c33767 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -131,9 +131,8 @@ static int f7188x_gpio_get(struct gpio_chip *chip, unsigned offset);
 static int f7188x_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value);
 static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
-static int f7188x_gpio_set_single_ended(struct gpio_chip *gc,
-					unsigned offset,
-					enum single_ended_mode mode);
+static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+				  unsigned long config);
 
 #define F7188X_GPIO_BANK(_base, _ngpio, _regbase)			\
 	{								\
@@ -145,7 +144,7 @@ static int f7188x_gpio_set_single_ended(struct gpio_chip *gc,
 			.get              = f7188x_gpio_get,		\
 			.direction_output = f7188x_gpio_direction_out,	\
 			.set              = f7188x_gpio_set,		\
-			.set_single_ended = f7188x_gpio_set_single_ended, \
+			.set_config	  = f7188x_gpio_set_config,	\
 			.base             = _base,			\
 			.ngpio            = _ngpio,			\
 			.can_sleep        = true,			\
@@ -326,17 +325,17 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	superio_exit(sio->addr);
 }
 
-static int f7188x_gpio_set_single_ended(struct gpio_chip *chip,
-					unsigned offset,
-					enum single_ended_mode mode)
+static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+				  unsigned long config)
 {
 	int err;
+	enum pin_config_param param = pinconf_to_config_param(config);
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
 	struct f7188x_sio *sio = bank->data->sio;
 	u8 data;
 
-	if (mode != LINE_MODE_OPEN_DRAIN &&
-	    mode != LINE_MODE_PUSH_PULL)
+	if (param != PIN_CONFIG_DRIVE_OPEN_DRAIN &&
+	    param != PIN_CONFIG_DRIVE_PUSH_PULL)
 		return -ENOTSUPP;
 
 	err = superio_enter(sio->addr);
@@ -345,7 +344,7 @@ static int f7188x_gpio_set_single_ended(struct gpio_chip *chip,
 	superio_select(sio->addr, SIO_LD_GPIO);
 
 	data = superio_inb(sio->addr, gpio_out_mode(bank->regbase));
-	if (mode == LINE_MODE_OPEN_DRAIN)
+	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
 		data &= ~BIT(offset);
 	else
 		data |= BIT(offset);
diff --git a/drivers/gpio/gpio-lp873x.c b/drivers/gpio/gpio-lp873x.c
index 218c706359aa..df0ad2cef0d2 100644
--- a/drivers/gpio/gpio-lp873x.c
+++ b/drivers/gpio/gpio-lp873x.c
@@ -100,21 +100,21 @@ static int lp873x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
-static int lp873x_gpio_set_single_ended(struct gpio_chip *gc,
-					unsigned int offset,
-					enum single_ended_mode mode)
+static int lp873x_gpio_set_config(struct gpio_chip *gc, unsigned offset,
+				  unsigned long config)
 {
 	struct lp873x_gpio *gpio = gpiochip_get_data(gc);
 
-	switch (mode) {
-	case LINE_MODE_OPEN_DRAIN:
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 		return regmap_update_bits(gpio->lp873->regmap,
 					  LP873X_REG_GPO_CTRL,
 					  BIT(offset * BITS_PER_GPO +
 					  LP873X_GPO_CTRL_OD),
 					  BIT(offset * BITS_PER_GPO +
 					  LP873X_GPO_CTRL_OD));
-	case LINE_MODE_PUSH_PULL:
+
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		return regmap_update_bits(gpio->lp873->regmap,
 					  LP873X_REG_GPO_CTRL,
 					  BIT(offset * BITS_PER_GPO +
@@ -133,7 +133,7 @@ static const struct gpio_chip template_chip = {
 	.direction_output	= lp873x_gpio_direction_output,
 	.get			= lp873x_gpio_get,
 	.set			= lp873x_gpio_set,
-	.set_single_ended	= lp873x_gpio_set_single_ended,
+	.set_config		= lp873x_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 2,
 	.can_sleep		= true,
diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index ec8de4190db9..743459d9477d 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -152,11 +152,10 @@ static int max77620_gpio_dir_output(struct gpio_chip *gc, unsigned int offset,
 	return ret;
 }
 
-static int max77620_gpio_set_debounce(struct gpio_chip *gc,
+static int max77620_gpio_set_debounce(struct max77620_gpio *mgpio,
 				      unsigned int offset,
 				      unsigned int debounce)
 {
-	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
 	u8 val;
 	int ret;
 
@@ -202,21 +201,23 @@ static void max77620_gpio_set(struct gpio_chip *gc, unsigned int offset,
 		dev_err(mgpio->dev, "CNFG_GPIO_OUT update failed: %d\n", ret);
 }
 
-static int max77620_gpio_set_single_ended(struct gpio_chip *gc,
-					  unsigned int offset,
-					  enum single_ended_mode mode)
+static int max77620_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				    unsigned long config)
 {
 	struct max77620_gpio *mgpio = gpiochip_get_data(gc);
 
-	switch (mode) {
-	case LINE_MODE_OPEN_DRAIN:
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 		return regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(offset),
 					  MAX77620_CNFG_GPIO_DRV_MASK,
 					  MAX77620_CNFG_GPIO_DRV_OPENDRAIN);
-	case LINE_MODE_PUSH_PULL:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		return regmap_update_bits(mgpio->rmap, GPIO_REG_ADDR(offset),
 					  MAX77620_CNFG_GPIO_DRV_MASK,
 					  MAX77620_CNFG_GPIO_DRV_PUSHPULL);
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		return max77620_gpio_set_debounce(mgpio, offset,
+			pinconf_to_config_argument(config));
 	default:
 		break;
 	}
@@ -257,9 +258,8 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
 	mgpio->gpio_chip.get = max77620_gpio_get;
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
-	mgpio->gpio_chip.set_debounce = max77620_gpio_set_debounce;
 	mgpio->gpio_chip.set = max77620_gpio_set;
-	mgpio->gpio_chip.set_single_ended = max77620_gpio_set_single_ended;
+	mgpio->gpio_chip.set_config = max77620_gpio_set_config;
 	mgpio->gpio_chip.to_irq = max77620_gpio_to_irq;
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;
diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index a1210e330571..e1037582e34d 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -89,22 +89,18 @@ static int men_z127_debounce(struct gpio_chip *gc, unsigned gpio,
 
 static int men_z127_set_single_ended(struct gpio_chip *gc,
 				     unsigned offset,
-				     enum single_ended_mode mode)
+				     enum pin_config_param param)
 {
 	struct men_z127_gpio *priv = gpiochip_get_data(gc);
 	u32 od_en;
 
-	if (mode != LINE_MODE_OPEN_DRAIN &&
-	    mode != LINE_MODE_PUSH_PULL)
-		return -ENOTSUPP;
-
 	spin_lock(&gc->bgpio_lock);
 	od_en = readl(priv->reg_base + MEN_Z127_ODER);
 
-	if (mode == LINE_MODE_OPEN_DRAIN)
+	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
 		od_en |= BIT(offset);
 	else
-		/* Implicitly LINE_MODE_PUSH_PULL */
+		/* Implicitly PIN_CONFIG_DRIVE_PUSH_PULL */
 		od_en &= ~BIT(offset);
 
 	writel(od_en, priv->reg_base + MEN_Z127_ODER);
@@ -113,6 +109,27 @@ static int men_z127_set_single_ended(struct gpio_chip *gc,
 	return 0;
 }
 
+static int men_z127_set_config(struct gpio_chip *gc, unsigned offset,
+			       unsigned long config)
+{
+	enum pin_config_param param = pinconf_to_config_param(config);
+
+	switch (param) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return men_z127_set_single_ended(gc, offset, param);
+
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		return men_z127_debounce(gc, offset,
+			pinconf_to_config_argument(config));
+
+	default:
+		break;
+	}
+
+	return -ENOTSUPP;
+}
+
 static int men_z127_probe(struct mcb_device *mdev,
 			  const struct mcb_device_id *id)
 {
@@ -149,8 +166,7 @@ static int men_z127_probe(struct mcb_device *mdev,
 	if (ret)
 		goto err_unmap;
 
-	men_z127_gpio->gc.set_debounce = men_z127_debounce;
-	men_z127_gpio->gc.set_single_ended = men_z127_set_single_ended;
+	men_z127_gpio->gc.set_config = men_z127_set_config;
 
 	ret = gpiochip_add_data(&men_z127_gpio->gc, men_z127_gpio);
 	if (ret) {
diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 69e0f4ace465..f40088d268c1 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -190,6 +190,18 @@ static int mrfld_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static int mrfld_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				 unsigned long config)
+{
+	u32 debounce;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
+	return mrfld_gpio_set_debounce(chip, offset, debounce);
+}
+
 static void mrfld_irq_ack(struct irq_data *d)
 {
 	struct mrfld_gpio *priv = irq_data_get_irq_chip_data(d);
@@ -414,7 +426,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 	priv->chip.get = mrfld_gpio_get;
 	priv->chip.set = mrfld_gpio_set;
 	priv->chip.get_direction = mrfld_gpio_get_direction;
-	priv->chip.set_debounce = mrfld_gpio_set_debounce;
+	priv->chip.set_config = mrfld_gpio_set_config;
 	priv->chip.base = gpio_base;
 	priv->chip.ngpio = MRFLD_NGPIO;
 	priv->chip.can_sleep = false;
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index b98ede78c9d8..efc85a279d54 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -974,6 +974,18 @@ static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
+static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+				unsigned long config)
+{
+	u32 debounce;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
+	return omap_gpio_debounce(chip, offset, debounce);
+}
+
 static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct gpio_bank *bank;
@@ -1045,7 +1057,7 @@ static int omap_gpio_chip_init(struct gpio_bank *bank, struct irq_chip *irqc)
 	bank->chip.direction_input = omap_gpio_input;
 	bank->chip.get = omap_gpio_get;
 	bank->chip.direction_output = omap_gpio_output;
-	bank->chip.set_debounce = omap_gpio_debounce;
+	bank->chip.set_config = omap_gpio_set_config;
 	bank->chip.set = omap_gpio_set;
 	if (bank->is_mpuio) {
 		bank->chip.label = "mpuio";
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index be97101c2c9a..433b45ef332e 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -100,9 +100,8 @@ static int tc3589x_gpio_get_direction(struct gpio_chip *chip,
 	return !(ret & BIT(pos));
 }
 
-static int tc3589x_gpio_set_single_ended(struct gpio_chip *chip,
-					 unsigned int offset,
-					 enum single_ended_mode mode)
+static int tc3589x_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				   unsigned long config)
 {
 	struct tc3589x_gpio *tc3589x_gpio = gpiochip_get_data(chip);
 	struct tc3589x *tc3589x = tc3589x_gpio->tc3589x;
@@ -116,22 +115,22 @@ static int tc3589x_gpio_set_single_ended(struct gpio_chip *chip,
 	unsigned int pos = offset % 8;
 	int ret;
 
-	switch(mode) {
-	case LINE_MODE_OPEN_DRAIN:
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 		/* Set open drain mode */
 		ret = tc3589x_set_bits(tc3589x, odmreg, BIT(pos), 0);
 		if (ret)
 			return ret;
 		/* Enable open drain/source mode */
 		return tc3589x_set_bits(tc3589x, odereg, BIT(pos), BIT(pos));
-	case LINE_MODE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
 		/* Set open source mode */
 		ret = tc3589x_set_bits(tc3589x, odmreg, BIT(pos), BIT(pos));
 		if (ret)
 			return ret;
 		/* Enable open drain/source mode */
 		return tc3589x_set_bits(tc3589x, odereg, BIT(pos), BIT(pos));
-	case LINE_MODE_PUSH_PULL:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		/* Disable open drain/source mode */
 		return tc3589x_set_bits(tc3589x, odereg, BIT(pos), 0);
 	default:
@@ -148,7 +147,7 @@ static const struct gpio_chip template_chip = {
 	.direction_output	= tc3589x_gpio_direction_output,
 	.direction_input	= tc3589x_gpio_direction_input,
 	.get_direction		= tc3589x_gpio_get_direction,
-	.set_single_ended	= tc3589x_gpio_set_single_ended,
+	.set_config		= tc3589x_gpio_set_config,
 	.can_sleep		= true,
 };
 
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 661b0e34e067..88529d3c06c9 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -238,6 +238,18 @@ static int tegra_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static int tegra_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				 unsigned long config)
+{
+	u32 debounce;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
+	return tegra_gpio_set_debounce(chip, offset, debounce);
+}
+
 static int tegra_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
@@ -615,7 +627,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tgi);
 
 	if (config->debounce_supported)
-		tgi->gc.set_debounce = tegra_gpio_set_debounce;
+		tgi->gc.set_config = tegra_gpio_set_config;
 
 	tgi->bank_info = devm_kzalloc(&pdev->dev, tgi->bank_count *
 				      sizeof(*tgi->bank_info), GFP_KERNEL);
diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 46e6dcc089cb..a379bba57d31 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -139,28 +139,28 @@ static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
 	return 0;
 }
 
-static int tps65218_gpio_set_single_ended(struct gpio_chip *gc,
-					  unsigned offset,
-					  enum single_ended_mode mode)
+static int tps65218_gpio_set_config(struct gpio_chip *gc, unsigned offset,
+				    unsigned long config)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
 	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
+	enum pin_config_param param = pinconf_to_config_param(config);
 
 	switch (offset) {
 	case 0:
 	case 2:
 		/* GPO1 is hardwired to be open drain */
-		if (mode == LINE_MODE_OPEN_DRAIN)
+		if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
 			return 0;
 		return -ENOTSUPP;
 	case 1:
 		/* GPO2 is push-pull by default, can be set as open drain. */
-		if (mode == LINE_MODE_OPEN_DRAIN)
+		if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
 			return tps65218_clear_bits(tps65218,
 						   TPS65218_REG_CONFIG1,
 						   TPS65218_CONFIG1_GPO2_BUF,
 						   TPS65218_PROTECT_L1);
-		if (mode == LINE_MODE_PUSH_PULL)
+		if (param == PIN_CONFIG_DRIVE_PUSH_PULL)
 			return tps65218_set_bits(tps65218,
 						 TPS65218_REG_CONFIG1,
 						 TPS65218_CONFIG1_GPO2_BUF,
@@ -181,7 +181,7 @@ static const struct gpio_chip template_chip = {
 	.direction_input	= tps65218_gpio_input,
 	.get			= tps65218_gpio_get,
 	.set			= tps65218_gpio_set,
-	.set_single_ended	= tps65218_gpio_set_single_ended,
+	.set_config		= tps65218_gpio_set_config,
 	.can_sleep		= true,
 	.ngpio			= 3,
 	.base			= -1,
diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index 4e450121129b..98a6f1fcc561 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -186,23 +186,24 @@ static int vx855gpio_direction_output(struct gpio_chip *gpio,
 	return 0;
 }
 
-static int vx855gpio_set_single_ended(struct gpio_chip *gpio,
-				      unsigned int nr,
-				      enum single_ended_mode mode)
+static int vx855gpio_set_config(struct gpio_chip *gpio, unsigned int nr,
+				unsigned long config)
 {
+	enum pin_config_param param = pinconf_to_config_param(config);
+
 	/* The GPI cannot be single-ended */
 	if (nr < NR_VX855_GPI)
 		return -EINVAL;
 
 	/* The GPO's are push-pull */
 	if (nr < NR_VX855_GPInO) {
-		if (mode != LINE_MODE_PUSH_PULL)
+		if (param != PIN_CONFIG_DRIVE_PUSH_PULL)
 			return -ENOTSUPP;
 		return 0;
 	}
 
 	/* The GPIO's are open drain */
-	if (mode != LINE_MODE_OPEN_DRAIN)
+	if (param != PIN_CONFIG_DRIVE_OPEN_DRAIN)
 		return -ENOTSUPP;
 
 	return 0;
@@ -231,7 +232,7 @@ static void vx855gpio_gpio_setup(struct vx855_gpio *vg)
 	c->direction_output = vx855gpio_direction_output;
 	c->get = vx855gpio_get;
 	c->set = vx855gpio_set;
-	c->set_single_ended = vx855gpio_set_single_ended;
+	c->set_config = vx855gpio_set_config,
 	c->dbg_show = NULL;
 	c->base = 0;
 	c->ngpio = NR_VX855_GP;
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index 34baee5b1dd6..97613de5304e 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -202,17 +202,16 @@ static void wcove_gpio_set(struct gpio_chip *chip,
 		regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT), 1, 0);
 }
 
-static int wcove_gpio_set_single_ended(struct gpio_chip *chip,
-					unsigned int gpio,
-					enum single_ended_mode mode)
+static int wcove_gpio_set_config(struct gpio_chip *chip, unsigned int gpio,
+				 unsigned long config)
 {
 	struct wcove_gpio *wg = gpiochip_get_data(chip);
 
-	switch (mode) {
-	case LINE_MODE_OPEN_DRAIN:
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 		return regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT),
 						CTLO_DRV_MASK, CTLO_DRV_OD);
-	case LINE_MODE_PUSH_PULL:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		return regmap_update_bits(wg->regmap, to_reg(gpio, CTRL_OUT),
 						CTLO_DRV_MASK, CTLO_DRV_CMOS);
 	default:
@@ -411,7 +410,7 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 	wg->chip.get_direction = wcove_gpio_get_direction;
 	wg->chip.get = wcove_gpio_get;
 	wg->chip.set = wcove_gpio_set;
-	wg->chip.set_single_ended = wcove_gpio_set_single_ended,
+	wg->chip.set_config = wcove_gpio_set_config,
 	wg->chip.base = -1;
 	wg->chip.ngpio = WCOVE_VGPIO_NUM;
 	wg->chip.can_sleep = true;
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 533707f943f4..00e3839b3f96 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -101,11 +101,9 @@ static int wm831x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 				  WM831X_IRQ_GPIO_1 + offset);
 }
 
-static int wm831x_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
+static int wm831x_gpio_set_debounce(struct wm831x *wm831x, unsigned offset,
 				    unsigned debounce)
 {
-	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
-	struct wm831x *wm831x = wm831x_gpio->wm831x;
 	int reg = WM831X_GPIO1_CONTROL + offset;
 	int ret, fn;
 
@@ -132,21 +130,23 @@ static int wm831x_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
 	return wm831x_set_bits(wm831x, reg, WM831X_GPN_FN_MASK, fn);
 }
 
-static int wm831x_set_single_ended(struct gpio_chip *chip,
-				   unsigned int offset,
-				   enum single_ended_mode mode)
+static int wm831x_set_config(struct gpio_chip *chip, unsigned int offset,
+			     unsigned long config)
 {
 	struct wm831x_gpio *wm831x_gpio = gpiochip_get_data(chip);
 	struct wm831x *wm831x = wm831x_gpio->wm831x;
 	int reg = WM831X_GPIO1_CONTROL + offset;
 
-	switch (mode) {
-	case LINE_MODE_OPEN_DRAIN:
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 		return wm831x_set_bits(wm831x, reg,
 				       WM831X_GPN_OD_MASK, WM831X_GPN_OD);
-	case LINE_MODE_PUSH_PULL:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		return wm831x_set_bits(wm831x, reg,
 				       WM831X_GPN_OD_MASK, 0);
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		return wm831x_gpio_set_debounce(wm831x, offset,
+			pinconf_to_config_argument(config));
 	default:
 		break;
 	}
@@ -255,8 +255,7 @@ static const struct gpio_chip template_chip = {
 	.direction_output	= wm831x_gpio_direction_out,
 	.set			= wm831x_gpio_set,
 	.to_irq			= wm831x_gpio_to_irq,
-	.set_debounce		= wm831x_gpio_set_debounce,
-	.set_single_ended	= wm831x_set_single_ended,
+	.set_config		= wm831x_set_config,
 	.dbg_show		= wm831x_gpio_dbg_show,
 	.can_sleep		= true,
 };
diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index 68410fda6138..1e35756ac55b 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -103,19 +103,18 @@ static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset, WM8994_GPN_LVL, value);
 }
 
-static int wm8994_gpio_set_single_ended(struct gpio_chip *chip,
-					unsigned int offset,
-					enum single_ended_mode mode)
+static int wm8994_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				  unsigned long config)
 {
 	struct wm8994_gpio *wm8994_gpio = gpiochip_get_data(chip);
 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
 
-	switch (mode) {
-	case LINE_MODE_OPEN_DRAIN:
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 		return wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset,
 				       WM8994_GPN_OP_CFG_MASK,
 				       WM8994_GPN_OP_CFG);
-	case LINE_MODE_PUSH_PULL:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
 		return wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset,
 				       WM8994_GPN_OP_CFG_MASK, 0);
 	default:
@@ -257,7 +256,7 @@ static const struct gpio_chip template_chip = {
 	.get			= wm8994_gpio_get,
 	.direction_output	= wm8994_gpio_direction_out,
 	.set			= wm8994_gpio_set,
-	.set_single_ended	= wm8994_gpio_set_single_ended,
+	.set_config		= wm8994_gpio_set_config,
 	.to_irq			= wm8994_gpio_to_irq,
 	.dbg_show		= wm8994_gpio_dbg_show,
 	.can_sleep		= true,
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 86bf3b84ada5..1ccb573485c2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1876,6 +1876,19 @@ void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset)
 }
 EXPORT_SYMBOL_GPL(gpiochip_generic_free);
 
+/**
+ * gpiochip_generic_config() - apply configuration for a pin
+ * @chip: the gpiochip owning the GPIO
+ * @offset: the offset of the GPIO to apply the configuration
+ * @config: the configuration to be applied
+ */
+int gpiochip_generic_config(struct gpio_chip *chip, unsigned offset,
+			    unsigned long config)
+{
+	return pinctrl_gpio_set_config(chip->gpiodev->base + offset, config);
+}
+EXPORT_SYMBOL_GPL(gpiochip_generic_config);
+
 #ifdef CONFIG_PINCTRL
 
 /**
@@ -2264,6 +2277,14 @@ int gpiod_direction_input(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_direction_input);
 
+static int gpio_set_drive_single_ended(struct gpio_chip *gc, unsigned offset,
+				       enum pin_config_param mode)
+{
+	unsigned long config = { PIN_CONF_PACKED(mode, 0) };
+
+	return gc->set_config ? gc->set_config(gc, offset, config) : -ENOTSUPP;
+}
+
 static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 {
 	struct gpio_chip *gc = desc->gdev->chip;
@@ -2280,32 +2301,25 @@ static int _gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
 		/* First see if we can enable open drain in hardware */
-		if (gc->set_single_ended) {
-			ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
-						   LINE_MODE_OPEN_DRAIN);
-			if (!ret)
-				goto set_output_value;
-		}
+		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
+						  PIN_CONFIG_DRIVE_OPEN_DRAIN);
+		if (!ret)
+			goto set_output_value;
 		/* Emulate open drain by not actively driving the line high */
 		if (val)
 			return gpiod_direction_input(desc);
 	}
 	else if (test_bit(FLAG_OPEN_SOURCE, &desc->flags)) {
-		if (gc->set_single_ended) {
-			ret = gc->set_single_ended(gc, gpio_chip_hwgpio(desc),
-						   LINE_MODE_OPEN_SOURCE);
-			if (!ret)
-				goto set_output_value;
-		}
+		ret = gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
+						  PIN_CONFIG_DRIVE_OPEN_SOURCE);
+		if (!ret)
+			goto set_output_value;
 		/* Emulate open source by not actively driving the line low */
 		if (!val)
 			return gpiod_direction_input(desc);
 	} else {
-		/* Make sure to disable open drain/source hardware, if any */
-		if (gc->set_single_ended)
-			gc->set_single_ended(gc,
-					     gpio_chip_hwgpio(desc),
-					     LINE_MODE_PUSH_PULL);
+		gpio_set_drive_single_ended(gc, gpio_chip_hwgpio(desc),
+					    PIN_CONFIG_DRIVE_PUSH_PULL);
 	}
 
 set_output_value:
@@ -2376,17 +2390,19 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output);
 int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
 {
 	struct gpio_chip	*chip;
+	unsigned long		config;
 
 	VALIDATE_DESC(desc);
 	chip = desc->gdev->chip;
-	if (!chip->set || !chip->set_debounce) {
+	if (!chip->set || !chip->set_config) {
 		gpiod_dbg(desc,
-			  "%s: missing set() or set_debounce() operations\n",
+			  "%s: missing set() or set_config() operations\n",
 			  __func__);
 		return -ENOTSUPP;
 	}
 
-	return chip->set_debounce(chip, gpio_chip_hwgpio(desc), debounce);
+	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_DEBOUNCE, debounce);
+	return chip->set_config(chip, gpio_chip_hwgpio(desc), config);
 }
 EXPORT_SYMBOL_GPL(gpiod_set_debounce);
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index f9aef2ac03a1..3cf384f8b122 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1054,6 +1054,18 @@ static int mtk_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
+static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+			       unsigned long config)
+{
+	u32 debounce;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
+	return mtk_gpio_set_debounce(chip, offset, debounce);
+}
+
 static const struct gpio_chip mtk_gpio_chip = {
 	.owner			= THIS_MODULE,
 	.request		= gpiochip_generic_request,
@@ -1064,7 +1076,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.get			= mtk_gpio_get,
 	.set			= mtk_gpio_set,
 	.to_irq			= mtk_gpio_to_irq,
-	.set_debounce		= mtk_gpio_set_debounce,
+	.set_config		= mtk_gpio_set_config,
 	.of_gpio_n_cells	= 2,
 };
 
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index c9a146948192..799c4bd70199 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -164,6 +164,18 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
 	return ret;
 }
 
+static int amd_gpio_set_config(struct gpio_chip *gc, unsigned offset,
+			       unsigned long config)
+{
+	u32 debounce;
+
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
+	return amd_gpio_set_debounce(gc, offset, debounce);
+}
+
 #ifdef CONFIG_DEBUG_FS
 static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 {
@@ -756,7 +768,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->gc.direction_output	= amd_gpio_direction_output;
 	gpio_dev->gc.get			= amd_gpio_get_value;
 	gpio_dev->gc.set			= amd_gpio_set_value;
-	gpio_dev->gc.set_debounce	= amd_gpio_set_debounce;
+	gpio_dev->gc.set_config		= amd_gpio_set_config;
 	gpio_dev->gc.dbg_show		= amd_gpio_dbg_show;
 
 	gpio_dev->gc.base			= 0;
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 29fb7403d24e..7450f5118445 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -424,41 +424,6 @@ static int sx150x_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(value & BIT(offset));
 }
 
-static int sx150x_gpio_set_single_ended(struct gpio_chip *chip,
-					unsigned int offset,
-					enum single_ended_mode mode)
-{
-	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
-	int ret;
-
-	switch (mode) {
-	case LINE_MODE_PUSH_PULL:
-		if (pctl->data->model != SX150X_789 ||
-		    sx150x_pin_is_oscio(pctl, offset))
-			return 0;
-
-		ret = regmap_write_bits(pctl->regmap,
-					pctl->data->pri.x789.reg_drain,
-					BIT(offset), 0);
-		break;
-
-	case LINE_MODE_OPEN_DRAIN:
-		if (pctl->data->model != SX150X_789 ||
-		    sx150x_pin_is_oscio(pctl, offset))
-			return -ENOTSUPP;
-
-		ret = regmap_write_bits(pctl->regmap,
-					pctl->data->pri.x789.reg_drain,
-					BIT(offset), BIT(offset));
-		break;
-	default:
-		ret = -ENOTSUPP;
-		break;
-	}
-
-	return ret;
-}
-
 static int __sx150x_gpio_set(struct sx150x_pinctrl *pctl, unsigned int offset,
 			     int value)
 {
@@ -811,16 +776,26 @@ static int sx150x_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
-			ret = sx150x_gpio_set_single_ended(&pctl->gpio,
-						pin, LINE_MODE_OPEN_DRAIN);
+			if (pctl->data->model != SX150X_789 ||
+			    sx150x_pin_is_oscio(pctl, pin))
+				return -ENOTSUPP;
+
+			ret = regmap_write_bits(pctl->regmap,
+						pctl->data->pri.x789.reg_drain,
+						BIT(pin), BIT(pin));
 			if (ret < 0)
 				return ret;
 
 			break;
 
 		case PIN_CONFIG_DRIVE_PUSH_PULL:
-			ret = sx150x_gpio_set_single_ended(&pctl->gpio,
-						pin, LINE_MODE_PUSH_PULL);
+			if (pctl->data->model != SX150X_789 ||
+			    sx150x_pin_is_oscio(pctl, pin))
+				return 0;
+
+			ret = regmap_write_bits(pctl->regmap,
+						pctl->data->pri.x789.reg_drain,
+						BIT(pin), 0);
 			if (ret < 0)
 				return ret;
 
@@ -1178,7 +1153,7 @@ static int sx150x_probe(struct i2c_client *client,
 	pctl->gpio.direction_output = sx150x_gpio_direction_output;
 	pctl->gpio.get = sx150x_gpio_get;
 	pctl->gpio.set = sx150x_gpio_set;
-	pctl->gpio.set_single_ended = sx150x_gpio_set_single_ended;
+	pctl->gpio.set_config = gpiochip_generic_config;
 	pctl->gpio.parent = dev;
 #ifdef CONFIG_OF_GPIO
 	pctl->gpio.of_node = dev->of_node;
diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 250caa00de5e..51384bdde450 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -474,17 +474,20 @@ static void gb_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
 }
 
-static int gb_gpio_set_debounce(struct gpio_chip *chip, unsigned offset,
-					unsigned debounce)
+static int gb_gpio_set_config(struct gpio_chip *chip, unsigned offset,
+			      unsigned long config)
 {
 	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
-	u16 usec;
+	u32 debounce;
 
+	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
+		return -ENOTSUPP;
+
+	debounce = pinconf_to_config_argument(config);
 	if (debounce > U16_MAX)
 		return -EINVAL;
-	usec = (u16)debounce;
 
-	return gb_gpio_set_debounce_operation(ggc, (u8)offset, usec);
+	return gb_gpio_set_debounce_operation(ggc, (u8)offset, (u16)debounce);
 }
 
 static int gb_gpio_controller_setup(struct gb_gpio_controller *ggc)
@@ -689,7 +692,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
 	gpio->direction_output = gb_gpio_direction_output;
 	gpio->get = gb_gpio_get;
 	gpio->set = gb_gpio_set;
-	gpio->set_debounce = gb_gpio_set_debounce;
+	gpio->set_config = gb_gpio_set_config;
 	gpio->to_irq = gb_gpio_to_irq;
 	gpio->base = -1;		/* Allocate base dynamically */
 	gpio->ngpio = ggc->line_max + 1;
diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index fff718352e0c..5d61d0871f2e 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1329,17 +1329,20 @@ static int cp210x_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
 	return 0;
 }
 
-static int cp210x_gpio_set_single_ended(struct gpio_chip *gc, unsigned int gpio,
-					enum single_ended_mode mode)
+static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
+				  unsigned long config)
 {
 	struct usb_serial *serial = gpiochip_get_data(gc);
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
+	enum pin_config_param param = pinconf_to_config_param(config);
 
 	/* Succeed only if in correct mode (this can't be set at runtime) */
-	if ((mode == LINE_MODE_PUSH_PULL) && (priv->gpio_mode & BIT(gpio)))
+	if ((param == PIN_CONFIG_DRIVE_PUSH_PULL) &&
+	    (priv->gpio_mode & BIT(gpio)))
 		return 0;
 
-	if ((mode == LINE_MODE_OPEN_DRAIN) && !(priv->gpio_mode & BIT(gpio)))
+	if ((param == PIN_CONFIG_DRIVE_OPEN_DRAIN) &&
+	    !(priv->gpio_mode & BIT(gpio)))
 		return 0;
 
 	return -ENOTSUPP;
@@ -1402,7 +1405,7 @@ static int cp2105_shared_gpio_init(struct usb_serial *serial)
 	priv->gc.direction_output = cp210x_gpio_direction_output;
 	priv->gc.get = cp210x_gpio_get;
 	priv->gc.set = cp210x_gpio_set;
-	priv->gc.set_single_ended = cp210x_gpio_set_single_ended;
+	priv->gc.set_config = cp210x_gpio_set_config;
 	priv->gc.owner = THIS_MODULE;
 	priv->gc.parent = &serial->interface->dev;
 	priv->gc.base = -1;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index c2748accea71..db2022910caf 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -8,6 +8,7 @@
 #include <linux/irqdomain.h>
 #include <linux/lockdep.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf-generic.h>
 
 struct gpio_desc;
 struct of_phandle_args;
@@ -19,18 +20,6 @@ struct module;
 #ifdef CONFIG_GPIOLIB
 
 /**
- * enum single_ended_mode - mode for single ended operation
- * @LINE_MODE_PUSH_PULL: normal mode for a GPIO line, drive actively high/low
- * @LINE_MODE_OPEN_DRAIN: set line to be open drain
- * @LINE_MODE_OPEN_SOURCE: set line to be open source
- */
-enum single_ended_mode {
-	LINE_MODE_PUSH_PULL,
-	LINE_MODE_OPEN_DRAIN,
-	LINE_MODE_OPEN_SOURCE,
-};
-
-/**
  * struct gpio_chip - abstract a GPIO controller
  * @label: a functional name for the GPIO device, such as a part
  *	number or the name of the SoC IP-block implementing it.
@@ -48,16 +37,8 @@ enum single_ended_mode {
  * @get: returns value for signal "offset", 0=low, 1=high, or negative error
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
- * @set_debounce: optional hook for setting debounce time for specified gpio in
- *	interrupt triggered gpio chips
- * @set_single_ended: optional hook for setting a line as open drain, open
- *	source, or non-single ended (restore from open drain/source to normal
- *	push-pull mode) this should be implemented if the hardware supports
- *	open drain or open source settings. The GPIOlib will otherwise try
- *	to emulate open drain/source by not actively driving lines high/low
- *	if a consumer request this. The driver may return -ENOTSUPP if e.g.
- *	it supports just open drain but not open source and is called
- *	with LINE_MODE_OPEN_SOURCE as mode argument.
+ * @set_config: optional hook for all kinds of settings. Uses the same
+ *	packed config format as generic pinconf.
  * @to_irq: optional hook supporting non-static gpio_to_irq() mappings;
  *	implementation may not sleep
  * @dbg_show: optional routine to show contents in debugfs; default code
@@ -150,13 +131,9 @@ struct gpio_chip {
 	void			(*set_multiple)(struct gpio_chip *chip,
 						unsigned long *mask,
 						unsigned long *bits);
-	int			(*set_debounce)(struct gpio_chip *chip,
-						unsigned offset,
-						unsigned debounce);
-	int			(*set_single_ended)(struct gpio_chip *chip,
-						unsigned offset,
-						enum single_ended_mode mode);
-
+	int			(*set_config)(struct gpio_chip *chip,
+					      unsigned offset,
+					      unsigned long config);
 	int			(*to_irq)(struct gpio_chip *chip,
 						unsigned offset);
 
@@ -310,6 +287,8 @@ static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
 
 int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset);
 void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset);
+int gpiochip_generic_config(struct gpio_chip *chip, unsigned offset,
+			    unsigned long config);
 
 #ifdef CONFIG_PINCTRL
 
diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
index 9a09107c890e..7620eb127cff 100644
--- a/include/linux/pinctrl/pinconf-generic.h
+++ b/include/linux/pinctrl/pinconf-generic.h
@@ -12,12 +12,6 @@
 #ifndef __LINUX_PINCTRL_PINCONF_GENERIC_H
 #define __LINUX_PINCTRL_PINCONF_GENERIC_H
 
-/*
- * You shouldn't even be able to compile with these enums etc unless you're
- * using generic pin config. That is why this is defined out.
- */
-#ifdef CONFIG_GENERIC_PINCONF
-
 /**
  * enum pin_config_param - possible pin configuration parameters
  * @PIN_CONFIG_BIAS_BUS_HOLD: the pin will be set to weakly latch so that it
@@ -118,18 +112,6 @@ enum pin_config_param {
 	PIN_CONFIG_MAX = 0xFF,
 };
 
-#ifdef CONFIG_DEBUG_FS
-#define PCONFDUMP(a, b, c, d) { .param = a, .display = b, .format = c, \
-				.has_arg = d }
-
-struct pin_config_item {
-	const enum pin_config_param param;
-	const char * const display;
-	const char * const format;
-	bool has_arg;
-};
-#endif /* CONFIG_DEBUG_FS */
-
 /*
  * Helpful configuration macro to be used in tables etc.
  */
@@ -158,6 +140,21 @@ static inline unsigned long pinconf_to_config_packed(enum pin_config_param param
 	return PIN_CONF_PACKED(param, argument);
 }
 
+#ifdef CONFIG_GENERIC_PINCONF
+
+#ifdef CONFIG_DEBUG_FS
+#define PCONFDUMP(a, b, c, d) {					\
+	.param = a, .display = b, .format = c, .has_arg = d	\
+	}
+
+struct pin_config_item {
+	const enum pin_config_param param;
+	const char * const display;
+	const char * const format;
+	bool has_arg;
+};
+#endif /* CONFIG_DEBUG_FS */
+
 #ifdef CONFIG_OF
 
 #include <linux/device.h>
-- 
2.11.0
