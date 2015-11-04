From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: change member .dev to .parent
Date: Wed,  4 Nov 2015 10:31:15 +0100
Message-ID: <1446629475-31754-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:33615 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbbKDJbe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2015 04:31:34 -0500
Received: by lbbkw15 with SMTP id kw15so5635310lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2015 01:31:31 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Lee Jones <lee.jones@linaro.org>, Alek Du <alek.du@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>

The name .dev in a struct is normally reserved for a struct device
that is let us say a superclass to the thing described by the struct.
struct gpio_chip stands out by confusingly using a struct device *dev
to point to the parent device (such as a platform_device) that
represents the hardware. As we want to give gpio_chip:s real devices,
this is not working. We need to rename this member to parent.

This was done by two coccinelle scripts, I guess it is possible to
combine them into one, but I don't know such stuff. They look like
this:

@@
struct gpio_chip *var;
@@
-var->dev
+var->parent

and:

@@
struct gpio_chip var;
@@
-var.dev
+var.parent

This patch hits all over the place, but I *strongly* prefer this
solution to any piecemal approaches that just exercise patch
mechanics all over the place. It mainly hits drivers/gpio and
drivers/pinctrl which is my own backyard anyway.

Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Alek Du <alek.du@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Other subsystem maintainers: please ACK this. I want to merge this
big patch in the beginning of -rc1. I can create an immutable branch
or tag if you think it will cause you problems, so you can pull it
in.
---
 arch/avr32/mach-at32ap/pio.c                  |  2 +-
 drivers/bcma/driver_gpio.c                    |  2 +-
 drivers/gpio/gpio-104-idio-16.c               |  2 +-
 drivers/gpio/gpio-74x164.c                    |  4 +--
 drivers/gpio/gpio-adnp.c                      | 19 ++++++-----
 drivers/gpio/gpio-amd8111.c                   |  2 +-
 drivers/gpio/gpio-amdpt.c                     | 18 +++++-----
 drivers/gpio/gpio-arizona.c                   |  2 +-
 drivers/gpio/gpio-ath79.c                     |  2 +-
 drivers/gpio/gpio-bcm-kona.c                  |  6 ++--
 drivers/gpio/gpio-crystalcove.c               |  2 +-
 drivers/gpio/gpio-davinci.c                   |  4 +--
 drivers/gpio/gpio-dln2.c                      | 10 +++---
 drivers/gpio/gpio-em.c                        |  4 +--
 drivers/gpio/gpio-f7188x.c                    |  2 +-
 drivers/gpio/gpio-ich.c                       |  2 +-
 drivers/gpio/gpio-intel-mid.c                 |  2 +-
 drivers/gpio/gpio-janz-ttl.c                  |  6 ++--
 drivers/gpio/gpio-kempld.c                    |  2 +-
 drivers/gpio/gpio-lp3943.c                    |  2 +-
 drivers/gpio/gpio-lpc18xx.c                   |  2 +-
 drivers/gpio/gpio-lynxpoint.c                 |  2 +-
 drivers/gpio/gpio-max732x.c                   |  4 +--
 drivers/gpio/gpio-mb86s7x.c                   |  2 +-
 drivers/gpio/gpio-mc33880.c                   |  2 +-
 drivers/gpio/gpio-mc9s08dz60.c                |  2 +-
 drivers/gpio/gpio-mcp23s08.c                  | 16 +++++----
 drivers/gpio/gpio-msic.c                      |  2 +-
 drivers/gpio/gpio-mvebu.c                     |  2 +-
 drivers/gpio/gpio-octeon.c                    |  2 +-
 drivers/gpio/gpio-omap.c                      |  4 +--
 drivers/gpio/gpio-palmas.c                    | 14 ++++----
 drivers/gpio/gpio-pca953x.c                   |  2 +-
 drivers/gpio/gpio-pcf857x.c                   |  2 +-
 drivers/gpio/gpio-pch.c                       |  2 +-
 drivers/gpio/gpio-pl061.c                     | 12 +++----
 drivers/gpio/gpio-rc5t583.c                   |  2 +-
 drivers/gpio/gpio-rcar.c                      |  2 +-
 drivers/gpio/gpio-sch.c                       |  2 +-
 drivers/gpio/gpio-sch311x.c                   |  4 +--
 drivers/gpio/gpio-spear-spics.c               |  2 +-
 drivers/gpio/gpio-stmpe.c                     |  2 +-
 drivers/gpio/gpio-stp-xway.c                  |  4 +--
 drivers/gpio/gpio-sx150x.c                    |  2 +-
 drivers/gpio/gpio-syscon.c                    |  4 +--
 drivers/gpio/gpio-tb10x.c                     |  2 +-
 drivers/gpio/gpio-tc3589x.c                   |  2 +-
 drivers/gpio/gpio-timberdale.c                |  2 +-
 drivers/gpio/gpio-tps6586x.c                  |  2 +-
 drivers/gpio/gpio-tps65910.c                  |  2 +-
 drivers/gpio/gpio-tps65912.c                  |  2 +-
 drivers/gpio/gpio-ts5500.c                    |  5 +--
 drivers/gpio/gpio-twl4030.c                   |  4 +--
 drivers/gpio/gpio-twl6040.c                   |  6 ++--
 drivers/gpio/gpio-tz1090-pdc.c                |  2 +-
 drivers/gpio/gpio-tz1090.c                    |  2 +-
 drivers/gpio/gpio-vf610.c                     |  2 +-
 drivers/gpio/gpio-viperboard.c                | 16 ++++-----
 drivers/gpio/gpio-vr41xx.c                    |  4 +--
 drivers/gpio/gpio-wm831x.c                    |  2 +-
 drivers/gpio/gpio-wm8350.c                    |  2 +-
 drivers/gpio/gpio-wm8994.c                    |  2 +-
 drivers/gpio/gpio-xgene.c                     |  2 +-
 drivers/gpio/gpio-xlp.c                       |  2 +-
 drivers/gpio/gpio-zx.c                        |  2 +-
 drivers/gpio/gpio-zynq.c                      |  6 ++--
 drivers/gpio/gpiolib-acpi.c                   | 47 ++++++++++++++-----=
--------
 drivers/gpio/gpiolib-of.c                     |  4 +--
 drivers/gpio/gpiolib-sysfs.c                  |  5 +--
 drivers/gpio/gpiolib.c                        | 19 ++++++-----
 drivers/hid/hid-cp2112.c                      |  2 +-
 drivers/input/touchscreen/ad7879.c            |  2 +-
 drivers/leds/leds-pca9532.c                   |  6 ++--
 drivers/leds/leds-tca6507.c                   |  2 +-
 drivers/media/dvb-frontends/cxd2820r_core.c   |  2 +-
 drivers/mfd/dm355evm_msp.c                    |  2 +-
 drivers/mfd/htc-egpio.c                       |  2 +-
 drivers/mfd/htc-i2cpld.c                      |  4 +--
 drivers/mfd/tps65010.c                        |  2 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c         |  8 ++---
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c     |  2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c      |  2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c    |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c         |  2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 12 +++----
 drivers/pinctrl/meson/pinctrl-meson.c         |  2 +-
 drivers/pinctrl/nomadik/pinctrl-abx500.c      |  7 ++--
 drivers/pinctrl/nomadik/pinctrl-nomadik.c     |  8 ++---
 drivers/pinctrl/pinctrl-amd.c                 |  2 +-
 drivers/pinctrl/pinctrl-as3722.c              |  2 +-
 drivers/pinctrl/pinctrl-at91-pio4.c           | 12 +++----
 drivers/pinctrl/pinctrl-at91.c                |  2 +-
 drivers/pinctrl/pinctrl-coh901.c              |  2 +-
 drivers/pinctrl/pinctrl-digicolor.c           |  2 +-
 drivers/pinctrl/pinctrl-pistachio.c           |  2 +-
 drivers/pinctrl/pinctrl-rockchip.c            |  2 +-
 drivers/pinctrl/pinctrl-st.c                  |  2 +-
 drivers/pinctrl/pinctrl-xway.c                | 10 +++---
 drivers/pinctrl/qcom/pinctrl-msm.c            |  2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |  2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c       |  2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c      |  2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c       |  2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c      |  3 +-
 drivers/pinctrl/samsung/pinctrl-exynos5440.c  | 12 +++----
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +-
 drivers/pinctrl/sh-pfc/gpio.c                 |  2 +-
 drivers/pinctrl/sirf/pinctrl-atlas7.c         |  2 +-
 drivers/pinctrl/spear/pinctrl-plgpio.c        |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 10 +++---
 drivers/pinctrl/vt8500/pinctrl-wmt.c          |  8 ++---
 drivers/platform/x86/intel_pmic_gpio.c        |  4 +--
 drivers/tty/serial/max310x.c                  |  2 +-
 drivers/tty/serial/sc16is7xx.c                |  2 +-
 include/linux/gpio/driver.h                   |  4 +--
 sound/soc/codecs/rt5677.c                     |  2 +-
 sound/soc/codecs/wm5100.c                     |  2 +-
 sound/soc/codecs/wm8903.c                     |  2 +-
 sound/soc/codecs/wm8962.c                     |  2 +-
 sound/soc/codecs/wm8996.c                     |  2 +-
 120 files changed, 265 insertions(+), 252 deletions(-)

diff --git a/arch/avr32/mach-at32ap/pio.c b/arch/avr32/mach-at32ap/pio.=
c
index 4f61378c3453..aa74491771fa 100644
--- a/arch/avr32/mach-at32ap/pio.c
+++ b/arch/avr32/mach-at32ap/pio.c
@@ -397,7 +397,7 @@ static int __init pio_probe(struct platform_device =
*pdev)
 	pio->chip.label =3D pio->name;
 	pio->chip.base =3D pdev->id * 32;
 	pio->chip.ngpio =3D 32;
-	pio->chip.dev =3D &pdev->dev;
+	pio->chip.parent =3D &pdev->dev;
 	pio->chip.owner =3D THIS_MODULE;
=20
 	pio->chip.direction_input =3D direction_input;
diff --git a/drivers/bcma/driver_gpio.c b/drivers/bcma/driver_gpio.c
index 504899a72966..949754427ce2 100644
--- a/drivers/bcma/driver_gpio.c
+++ b/drivers/bcma/driver_gpio.c
@@ -188,7 +188,7 @@ int bcma_gpio_init(struct bcma_drv_cc *cc)
 	chip->direction_input	=3D bcma_gpio_direction_input;
 	chip->direction_output	=3D bcma_gpio_direction_output;
 	chip->owner		=3D THIS_MODULE;
-	chip->dev		=3D bcma_bus_get_host_dev(bus);
+	chip->parent		=3D bcma_bus_get_host_dev(bus);
 #if IS_BUILTIN(CONFIG_OF)
 	if (cc->core->bus->hosttype =3D=3D BCMA_HOSTTYPE_SOC)
 		chip->of_node	=3D cc->core->dev.of_node;
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-id=
io-16.c
index 5400d7d4d8fd..107cfd7105a8 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -127,7 +127,7 @@ static int __init idio_16_probe(struct platform_dev=
ice *pdev)
 	}
=20
 	idio16gpio->chip.label =3D NAME;
-	idio16gpio->chip.dev =3D dev;
+	idio16gpio->chip.parent =3D dev;
 	idio16gpio->chip.owner =3D THIS_MODULE;
 	idio16gpio->chip.base =3D -1;
 	idio16gpio->chip.ngpio =3D 32;
diff --git a/drivers/gpio/gpio-74x164.c b/drivers/gpio/gpio-74x164.c
index e3d968f751f1..cdcc2994edf3 100644
--- a/drivers/gpio/gpio-74x164.c
+++ b/drivers/gpio/gpio-74x164.c
@@ -33,7 +33,7 @@ static struct gen_74x164_chip *gpio_to_74x164_chip(st=
ruct gpio_chip *gc)
=20
 static int __gen_74x164_write_config(struct gen_74x164_chip *chip)
 {
-	struct spi_device *spi =3D to_spi_device(chip->gpio_chip.dev);
+	struct spi_device *spi =3D to_spi_device(chip->gpio_chip.parent);
 	struct spi_message message;
 	struct spi_transfer *msg_buf;
 	int i, ret =3D 0;
@@ -143,7 +143,7 @@ static int gen_74x164_probe(struct spi_device *spi)
 		return -ENOMEM;
=20
 	chip->gpio_chip.can_sleep =3D true;
-	chip->gpio_chip.dev =3D &spi->dev;
+	chip->gpio_chip.parent =3D &spi->dev;
 	chip->gpio_chip.owner =3D THIS_MODULE;
=20
 	mutex_init(&chip->lock);
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index d3d0a90fe542..b34a62a5a7e1 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -47,7 +47,7 @@ static int adnp_read(struct adnp *adnp, unsigned offs=
et, uint8_t *value)
=20
 	err =3D i2c_smbus_read_byte_data(adnp->client, offset);
 	if (err < 0) {
-		dev_err(adnp->gpio.dev, "%s failed: %d\n",
+		dev_err(adnp->gpio.parent, "%s failed: %d\n",
 			"i2c_smbus_read_byte_data()", err);
 		return err;
 	}
@@ -62,7 +62,7 @@ static int adnp_write(struct adnp *adnp, unsigned off=
set, uint8_t value)
=20
 	err =3D i2c_smbus_write_byte_data(adnp->client, offset, value);
 	if (err < 0) {
-		dev_err(adnp->gpio.dev, "%s failed: %d\n",
+		dev_err(adnp->gpio.parent, "%s failed: %d\n",
 			"i2c_smbus_write_byte_data()", err);
 		return err;
 	}
@@ -266,8 +266,8 @@ static int adnp_gpio_setup(struct adnp *adnp, unsig=
ned int num_gpios)
 	chip->base =3D -1;
 	chip->ngpio =3D num_gpios;
 	chip->label =3D adnp->client->name;
-	chip->dev =3D &adnp->client->dev;
-	chip->of_node =3D chip->dev->of_node;
+	chip->parent =3D &adnp->client->dev;
+	chip->of_node =3D chip->parent->of_node;
 	chip->owner =3D THIS_MODULE;
=20
 	err =3D gpiochip_add(chip);
@@ -435,7 +435,8 @@ static int adnp_irq_setup(struct adnp *adnp)
 	 * is chosen to match the register layout of the hardware in that
 	 * each segment contains the corresponding bits for all interrupts.
 	 */
-	adnp->irq_enable =3D devm_kzalloc(chip->dev, num_regs * 6, GFP_KERNEL=
);
+	adnp->irq_enable =3D devm_kzalloc(chip->parent, num_regs * 6,
+					GFP_KERNEL);
 	if (!adnp->irq_enable)
 		return -ENOMEM;
=20
@@ -462,12 +463,12 @@ static int adnp_irq_setup(struct adnp *adnp)
 		adnp->irq_enable[i] =3D 0x00;
 	}
=20
-	err =3D devm_request_threaded_irq(chip->dev, adnp->client->irq,
+	err =3D devm_request_threaded_irq(chip->parent, adnp->client->irq,
 					NULL, adnp_irq,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-					dev_name(chip->dev), adnp);
+					dev_name(chip->parent), adnp);
 	if (err !=3D 0) {
-		dev_err(chip->dev, "can't request IRQ#%d: %d\n",
+		dev_err(chip->parent, "can't request IRQ#%d: %d\n",
 			adnp->client->irq, err);
 		return err;
 	}
@@ -478,7 +479,7 @@ static int adnp_irq_setup(struct adnp *adnp)
 				   handle_simple_irq,
 				   IRQ_TYPE_NONE);
 	if (err) {
-		dev_err(chip->dev,
+		dev_err(chip->parent,
 			"could not connect irqchip to gpiochip\n");
 		return err;
 	}
diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index d00d81928fe8..5c378e9f53a0 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -220,7 +220,7 @@ found:
 		goto out;
 	}
 	gp.pdev =3D pdev;
-	gp.chip.dev =3D &pdev->dev;
+	gp.chip.parent =3D &pdev->dev;
=20
 	spin_lock_init(&gp.lock);
=20
diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index cbbb966d4fc0..f842ccc45e64 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -39,14 +39,14 @@ static int pt_gpio_request(struct gpio_chip *gc, un=
signed offset)
 	unsigned long flags;
 	u32 using_pins;
=20
-	dev_dbg(gc->dev, "pt_gpio_request offset=3D%x\n", offset);
+	dev_dbg(gc->parent, "pt_gpio_request offset=3D%x\n", offset);
=20
 	spin_lock_irqsave(&pt_gpio->lock, flags);
=20
 	using_pins =3D readl(pt_gpio->reg_base + PT_SYNC_REG);
 	if (using_pins & BIT(offset)) {
-		dev_warn(gc->dev, "PT GPIO pin %x reconfigured\n",
-			offset);
+		dev_warn(gc->parent, "PT GPIO pin %x reconfigured\n",
+			 offset);
 		spin_unlock_irqrestore(&pt_gpio->lock, flags);
 		return -EINVAL;
 	}
@@ -72,7 +72,7 @@ static void pt_gpio_free(struct gpio_chip *gc, unsign=
ed offset)
=20
 	spin_unlock_irqrestore(&pt_gpio->lock, flags);
=20
-	dev_dbg(gc->dev, "pt_gpio_free offset=3D%x\n", offset);
+	dev_dbg(gc->parent, "pt_gpio_free offset=3D%x\n", offset);
 }
=20
 static void pt_gpio_set_value(struct gpio_chip *gc, unsigned offset, i=
nt value)
@@ -81,7 +81,7 @@ static void pt_gpio_set_value(struct gpio_chip *gc, u=
nsigned offset, int value)
 	unsigned long flags;
 	u32 data;
=20
-	dev_dbg(gc->dev, "pt_gpio_set_value offset=3D%x, value=3D%x\n",
+	dev_dbg(gc->parent, "pt_gpio_set_value offset=3D%x, value=3D%x\n",
 		offset, value);
=20
 	spin_lock_irqsave(&pt_gpio->lock, flags);
@@ -116,7 +116,7 @@ static int pt_gpio_get_value(struct gpio_chip *gc, =
unsigned offset)
 	data >>=3D offset;
 	data &=3D 1;
=20
-	dev_dbg(gc->dev, "pt_gpio_get_value offset=3D%x, value=3D%x\n",
+	dev_dbg(gc->parent, "pt_gpio_get_value offset=3D%x, value=3D%x\n",
 		offset, data);
=20
 	return data;
@@ -128,7 +128,7 @@ static int pt_gpio_direction_input(struct gpio_chip=
 *gc, unsigned offset)
 	unsigned long flags;
 	u32 data;
=20
-	dev_dbg(gc->dev, "pt_gpio_dirction_input offset=3D%x\n", offset);
+	dev_dbg(gc->parent, "pt_gpio_dirction_input offset=3D%x\n", offset);
=20
 	spin_lock_irqsave(&pt_gpio->lock, flags);
=20
@@ -148,7 +148,7 @@ static int pt_gpio_direction_output(struct gpio_chi=
p *gc,
 	unsigned long flags;
 	u32 data;
=20
-	dev_dbg(gc->dev, "pt_gpio_direction_output offset=3D%x, value=3D%x\n"=
,
+	dev_dbg(gc->parent, "pt_gpio_direction_output offset=3D%x, value=3D%x=
\n",
 		offset, value);
=20
 	spin_lock_irqsave(&pt_gpio->lock, flags);
@@ -202,7 +202,7 @@ static int pt_gpio_probe(struct platform_device *pd=
ev)
=20
 	pt_gpio->gc.label            =3D pdev->name;
 	pt_gpio->gc.owner            =3D THIS_MODULE;
-	pt_gpio->gc.dev              =3D dev;
+	pt_gpio->gc.parent              =3D dev;
 	pt_gpio->gc.request          =3D pt_gpio_request;
 	pt_gpio->gc.free             =3D pt_gpio_free;
 	pt_gpio->gc.direction_input  =3D pt_gpio_direction_input;
diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index ca002739616a..412d131b513d 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -108,7 +108,7 @@ static int arizona_gpio_probe(struct platform_devic=
e *pdev)
=20
 	arizona_gpio->arizona =3D arizona;
 	arizona_gpio->gpio_chip =3D template_chip;
-	arizona_gpio->gpio_chip.dev =3D &pdev->dev;
+	arizona_gpio->gpio_chip.parent =3D &pdev->dev;
 #ifdef CONFIG_OF_GPIO
 	arizona_gpio->gpio_chip.of_node =3D arizona->dev->of_node;
 #endif
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index e5827a56ff3b..b1410226dc95 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -177,7 +177,7 @@ static int ath79_gpio_probe(struct platform_device =
*pdev)
=20
 	spin_lock_init(&ctrl->lock);
 	memcpy(&ctrl->chip, &ath79_gpio_chip, sizeof(ctrl->chip));
-	ctrl->chip.dev =3D &pdev->dev;
+	ctrl->chip.parent =3D &pdev->dev;
 	ctrl->chip.ngpio =3D ath79_gpio_count;
 	if (oe_inverted) {
 		ctrl->chip.direction_input =3D ar934x_gpio_direction_input;
diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.=
c
index 33a1f9779b86..21c3280d66e1 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -273,7 +273,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_c=
hip *chip, unsigned gpio,
 	reg_base =3D kona_gpio->reg_base;
 	/* debounce must be 1-128ms (or 0) */
 	if ((debounce > 0 && debounce < 1000) || debounce > 128000) {
-		dev_err(chip->dev, "Debounce value %u not in range\n",
+		dev_err(chip->parent, "Debounce value %u not in range\n",
 			debounce);
 		return -EINVAL;
 	}
@@ -416,7 +416,7 @@ static int bcm_kona_gpio_irq_set_type(struct irq_da=
ta *d, unsigned int type)
 	case IRQ_TYPE_LEVEL_LOW:
 		/* BCM GPIO doesn't support level triggering */
 	default:
-		dev_err(kona_gpio->gpio_chip.dev,
+		dev_err(kona_gpio->gpio_chip.parent,
 			"Invalid BCM GPIO irq type 0x%x\n", type);
 		return -EINVAL;
 	}
@@ -477,7 +477,7 @@ static int bcm_kona_gpio_irq_reqres(struct irq_data=
 *d)
 	struct bcm_kona_gpio *kona_gpio =3D irq_data_get_irq_chip_data(d);
=20
 	if (gpiochip_lock_as_irq(&kona_gpio->gpio_chip, d->hwirq)) {
-		dev_err(kona_gpio->gpio_chip.dev,
+		dev_err(kona_gpio->gpio_chip.parent,
 			"unable to lock HW IRQ %lu for IRQ\n",
 			d->hwirq);
 		return -EINVAL;
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crysta=
lcove.c
index fddd204dc9b6..141093a8cd3f 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -341,7 +341,7 @@ static int crystalcove_gpio_probe(struct platform_d=
evice *pdev)
 	cg->chip.base =3D -1;
 	cg->chip.ngpio =3D CRYSTALCOVE_VGPIO_NUM;
 	cg->chip.can_sleep =3D true;
-	cg->chip.dev =3D dev;
+	cg->chip.parent =3D dev;
 	cg->chip.dbg_show =3D crystalcove_gpio_dbg_show;
 	cg->regmap =3D pmic->regmap;
=20
diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 5e715388803d..cf31179726b1 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -179,8 +179,8 @@ static int davinci_gpio_of_xlate(struct gpio_chip *=
gc,
 			     const struct of_phandle_args *gpiospec,
 			     u32 *flags)
 {
-	struct davinci_gpio_controller *chips =3D dev_get_drvdata(gc->dev);
-	struct davinci_gpio_platform_data *pdata =3D dev_get_platdata(gc->dev=
);
+	struct davinci_gpio_controller *chips =3D dev_get_drvdata(gc->parent)=
;
+	struct davinci_gpio_platform_data *pdata =3D dev_get_platdata(gc->par=
ent);
=20
 	if (gpiospec->args[0] > pdata->ngpio)
 		return -EINVAL;
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index 6685712c15cf..e541af03dd45 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -377,7 +377,7 @@ static void dln2_irq_bus_unlock(struct irq_data *ir=
qd)
=20
 		ret =3D dln2_gpio_set_event_cfg(dln2, pin, type, 0);
 		if (ret)
-			dev_err(dln2->gpio.dev, "failed to set event\n");
+			dev_err(dln2->gpio.parent, "failed to set event\n");
 	}
=20
 	mutex_unlock(&dln2->irq_lock);
@@ -406,19 +406,19 @@ static void dln2_gpio_event(struct platform_devic=
e *pdev, u16 echo,
 	struct dln2_gpio *dln2 =3D platform_get_drvdata(pdev);
=20
 	if (len < sizeof(*event)) {
-		dev_err(dln2->gpio.dev, "short event message\n");
+		dev_err(dln2->gpio.parent, "short event message\n");
 		return;
 	}
=20
 	pin =3D le16_to_cpu(event->pin);
 	if (pin >=3D dln2->gpio.ngpio) {
-		dev_err(dln2->gpio.dev, "out of bounds pin %d\n", pin);
+		dev_err(dln2->gpio.parent, "out of bounds pin %d\n", pin);
 		return;
 	}
=20
 	irq =3D irq_find_mapping(dln2->gpio.irqdomain, pin);
 	if (!irq) {
-		dev_err(dln2->gpio.dev, "pin %d not mapped to IRQ\n", pin);
+		dev_err(dln2->gpio.parent, "pin %d not mapped to IRQ\n", pin);
 		return;
 	}
=20
@@ -462,7 +462,7 @@ static int dln2_gpio_probe(struct platform_device *=
pdev)
 	dln2->pdev =3D pdev;
=20
 	dln2->gpio.label =3D "dln2";
-	dln2->gpio.dev =3D dev;
+	dln2->gpio.parent =3D dev;
 	dln2->gpio.owner =3D THIS_MODULE;
 	dln2->gpio.base =3D -1;
 	dln2->gpio.ngpio =3D pins;
diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 6bca1e125e12..c3ca2b1c1dfe 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -103,7 +103,7 @@ static int em_gio_irq_reqres(struct irq_data *d)
 	struct em_gio_priv *p =3D irq_data_get_irq_chip_data(d);
=20
 	if (gpiochip_lock_as_irq(&p->gpio_chip, irqd_to_hwirq(d))) {
-		dev_err(p->gpio_chip.dev,
+		dev_err(p->gpio_chip.parent,
 			"unable to lock HW IRQ %lu for IRQ\n",
 			irqd_to_hwirq(d));
 		return -EINVAL;
@@ -332,7 +332,7 @@ static int em_gio_probe(struct platform_device *pde=
v)
 	gpio_chip->request =3D em_gio_request;
 	gpio_chip->free =3D em_gio_free;
 	gpio_chip->label =3D name;
-	gpio_chip->dev =3D &pdev->dev;
+	gpio_chip->parent =3D &pdev->dev;
 	gpio_chip->owner =3D THIS_MODULE;
 	gpio_chip->base =3D -1;
 	gpio_chip->ngpio =3D ngpios;
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index 5e3c4fa67d82..1734e4fbd2b5 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -333,7 +333,7 @@ static int f7188x_gpio_probe(struct platform_device=
 *pdev)
 	for (i =3D 0; i < data->nr_bank; i++) {
 		struct f7188x_gpio_bank *bank =3D &data->bank[i];
=20
-		bank->chip.dev =3D &pdev->dev;
+		bank->chip.parent =3D &pdev->dev;
 		bank->data =3D data;
=20
 		err =3D gpiochip_add(&bank->chip);
diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 4ba7ed502131..8623d12e23c1 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -282,7 +282,7 @@ static void ichx_gpiolib_setup(struct gpio_chip *ch=
ip)
 {
 	chip->owner =3D THIS_MODULE;
 	chip->label =3D DRV_NAME;
-	chip->dev =3D &ichx_priv.dev->dev;
+	chip->parent =3D &ichx_priv.dev->dev;
=20
 	/* Allow chip-specific overrides of request()/get() */
 	chip->request =3D ichx_priv.desc->request ?
diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mi=
d.c
index 70097472b02c..1c46a7ef2680 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -392,7 +392,7 @@ static int intel_gpio_probe(struct pci_dev *pdev,
=20
 	priv->reg_base =3D pcim_iomap_table(pdev)[0];
 	priv->chip.label =3D dev_name(&pdev->dev);
-	priv->chip.dev =3D &pdev->dev;
+	priv->chip.parent =3D &pdev->dev;
 	priv->chip.request =3D intel_gpio_request;
 	priv->chip.direction_input =3D intel_gpio_direction_input;
 	priv->chip.direction_output =3D intel_gpio_direction_output;
diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.=
c
index 3a1664335f5e..e5f85cab0100 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -59,7 +59,7 @@ struct ttl_module {
=20
 static int ttl_get_value(struct gpio_chip *gpio, unsigned offset)
 {
-	struct ttl_module *mod =3D dev_get_drvdata(gpio->dev);
+	struct ttl_module *mod =3D dev_get_drvdata(gpio->parent);
 	u8 *shadow;
 	int ret;
=20
@@ -81,7 +81,7 @@ static int ttl_get_value(struct gpio_chip *gpio, unsi=
gned offset)
=20
 static void ttl_set_value(struct gpio_chip *gpio, unsigned offset, int=
 value)
 {
-	struct ttl_module *mod =3D dev_get_drvdata(gpio->dev);
+	struct ttl_module *mod =3D dev_get_drvdata(gpio->parent);
 	void __iomem *port;
 	u8 *shadow;
=20
@@ -172,7 +172,7 @@ static int ttl_probe(struct platform_device *pdev)
=20
 	/* Initialize the GPIO data structures */
 	gpio =3D &mod->gpio;
-	gpio->dev =3D &pdev->dev;
+	gpio->parent =3D &pdev->dev;
 	gpio->label =3D pdev->name;
 	gpio->get =3D ttl_get_value;
 	gpio->set =3D ttl_set_value;
diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 83f281dda1e0..35dd1e0af364 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -166,7 +166,7 @@ static int kempld_gpio_probe(struct platform_device=
 *pdev)
 	chip =3D &gpio->chip;
 	chip->label =3D "gpio-kempld";
 	chip->owner =3D THIS_MODULE;
-	chip->dev =3D dev;
+	chip->parent =3D dev;
 	chip->can_sleep =3D true;
 	if (pdata && pdata->gpio_base)
 		chip->base =3D pdata->gpio_base;
diff --git a/drivers/gpio/gpio-lp3943.c b/drivers/gpio/gpio-lp3943.c
index cfc5b12b43ad..f979c3be217f 100644
--- a/drivers/gpio/gpio-lp3943.c
+++ b/drivers/gpio/gpio-lp3943.c
@@ -205,7 +205,7 @@ static int lp3943_gpio_probe(struct platform_device=
 *pdev)
=20
 	lp3943_gpio->lp3943 =3D lp3943;
 	lp3943_gpio->chip =3D lp3943_gpio_chip;
-	lp3943_gpio->chip.dev =3D &pdev->dev;
+	lp3943_gpio->chip.parent =3D &pdev->dev;
=20
 	platform_set_drvdata(pdev, lp3943_gpio);
=20
diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index e39dcb0af8ae..b01fbc9db7cd 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -127,7 +127,7 @@ static int lpc18xx_gpio_probe(struct platform_devic=
e *pdev)
=20
 	spin_lock_init(&gc->lock);
=20
-	gc->gpio.dev =3D &pdev->dev;
+	gc->gpio.parent =3D &pdev->dev;
=20
 	ret =3D gpiochip_add(&gc->gpio);
 	if (ret) {
diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoin=
t.c
index 127c37b380ae..6a48ffd6e0db 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -368,7 +368,7 @@ static int lp_gpio_probe(struct platform_device *pd=
ev)
 	gc->base =3D -1;
 	gc->ngpio =3D LP_NUM_GPIO;
 	gc->can_sleep =3D false;
-	gc->dev =3D dev;
+	gc->parent =3D dev;
=20
 	ret =3D gpiochip_add(gc);
 	if (ret) {
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 8c5252c6c327..c1e7b55644b0 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -603,7 +603,7 @@ static int max732x_setup_gpio(struct max732x_chip *=
chip,
 	gc->base =3D gpio_start;
 	gc->ngpio =3D port;
 	gc->label =3D chip->client->name;
-	gc->dev =3D &chip->client->dev;
+	gc->parent =3D &chip->client->dev;
 	gc->owner =3D THIS_MODULE;
=20
 	return port;
@@ -649,7 +649,7 @@ static int max732x_probe(struct i2c_client *client,
 	chip->client =3D client;
=20
 	nr_port =3D max732x_setup_gpio(chip, id, pdata->gpio_base);
-	chip->gpio_chip.dev =3D &client->dev;
+	chip->gpio_chip.parent =3D &client->dev;
=20
 	addr_a =3D (client->addr & 0x0f) | 0x60;
 	addr_b =3D (client->addr & 0x0f) | 0x50;
diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index ee93c0ab0a59..93d61a5be0d4 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -187,7 +187,7 @@ static int mb86s70_gpio_probe(struct platform_devic=
e *pdev)
 	gchip->gc.label =3D dev_name(&pdev->dev);
 	gchip->gc.ngpio =3D 32;
 	gchip->gc.owner =3D THIS_MODULE;
-	gchip->gc.dev =3D &pdev->dev;
+	gchip->gc.parent =3D &pdev->dev;
 	gchip->gc.base =3D -1;
=20
 	platform_set_drvdata(pdev, gchip);
diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index a431604c9e67..13a37793f251 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -116,7 +116,7 @@ static int mc33880_probe(struct spi_device *spi)
 	mc->chip.base =3D pdata->base;
 	mc->chip.ngpio =3D PIN_NUMBER;
 	mc->chip.can_sleep =3D true;
-	mc->chip.dev =3D &spi->dev;
+	mc->chip.parent =3D &spi->dev;
 	mc->chip.owner =3D THIS_MODULE;
=20
 	mc->port_config =3D 0x00;
diff --git a/drivers/gpio/gpio-mc9s08dz60.c b/drivers/gpio/gpio-mc9s08d=
z60.c
index d62b4f8182bf..defa38f958fb 100644
--- a/drivers/gpio/gpio-mc9s08dz60.c
+++ b/drivers/gpio/gpio-mc9s08dz60.c
@@ -99,7 +99,7 @@ static int mc9s08dz60_probe(struct i2c_client *client=
,
=20
 	mc9s->chip.label =3D client->name;
 	mc9s->chip.base =3D -1;
-	mc9s->chip.dev =3D &client->dev;
+	mc9s->chip.parent =3D &client->dev;
 	mc9s->chip.owner =3D THIS_MODULE;
 	mc9s->chip.ngpio =3D GPIO_NUM;
 	mc9s->chip.can_sleep =3D true;
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.=
c
index 73db7ecd7ffd..2c9553f5b29a 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -446,7 +446,7 @@ static int mcp23s08_irq_reqres(struct irq_data *dat=
a)
 	struct mcp23s08 *mcp =3D irq_data_get_irq_chip_data(data);
=20
 	if (gpiochip_lock_as_irq(&mcp->chip, data->hwirq)) {
-		dev_err(mcp->chip.dev,
+		dev_err(mcp->chip.parent,
 			"unable to lock HW IRQ %lu for IRQ usage\n",
 			data->hwirq);
 		return -EINVAL;
@@ -481,7 +481,8 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
=20
 	mutex_init(&mcp->irq_lock);
=20
-	mcp->irq_domain =3D irq_domain_add_linear(chip->dev->of_node, chip->n=
gpio,
+	mcp->irq_domain =3D irq_domain_add_linear(chip->parent->of_node,
+						chip->ngpio,
 						&irq_domain_simple_ops, mcp);
 	if (!mcp->irq_domain)
 		return -ENODEV;
@@ -491,10 +492,11 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mc=
p)
 	else
 		irqflags |=3D IRQF_TRIGGER_LOW;
=20
-	err =3D devm_request_threaded_irq(chip->dev, mcp->irq, NULL, mcp23s08=
_irq,
-					irqflags, dev_name(chip->dev), mcp);
+	err =3D devm_request_threaded_irq(chip->parent, mcp->irq, NULL,
+					mcp23s08_irq,
+					irqflags, dev_name(chip->parent), mcp);
 	if (err !=3D 0) {
-		dev_err(chip->dev, "unable to request IRQ#%d: %d\n",
+		dev_err(chip->parent, "unable to request IRQ#%d: %d\n",
 			mcp->irq, err);
 		return err;
 	}
@@ -638,7 +640,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp,=
 struct device *dev,
=20
 	mcp->chip.base =3D pdata->base;
 	mcp->chip.can_sleep =3D true;
-	mcp->chip.dev =3D dev;
+	mcp->chip.parent =3D dev;
 	mcp->chip.owner =3D THIS_MODULE;
=20
 	/* verify MCP_IOCON.SEQOP =3D 0, so sequential reads work,
@@ -652,7 +654,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp,=
 struct device *dev,
 	mcp->irq_controller =3D pdata->irq_controller;
 	if (mcp->irq && mcp->irq_controller) {
 		mcp->irq_active_high =3D
-			of_property_read_bool(mcp->chip.dev->of_node,
+			of_property_read_bool(mcp->chip.parent->of_node,
 					      "microchip,irq-active-high");
=20
 		if (type =3D=3D MCP_TYPE_017)
diff --git a/drivers/gpio/gpio-msic.c b/drivers/gpio/gpio-msic.c
index 22523aae8abe..fe9ef2bc981a 100644
--- a/drivers/gpio/gpio-msic.c
+++ b/drivers/gpio/gpio-msic.c
@@ -293,7 +293,7 @@ static int platform_msic_gpio_probe(struct platform=
_device *pdev)
 	mg->chip.base =3D pdata->gpio_base;
 	mg->chip.ngpio =3D MSIC_NUM_GPIO;
 	mg->chip.can_sleep =3D true;
-	mg->chip.dev =3D dev;
+	mg->chip.parent =3D dev;
=20
 	mutex_init(&mg->buslock);
=20
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index d428b97876c5..6acedf4e9b1c 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -698,7 +698,7 @@ static int mvebu_gpio_probe(struct platform_device =
*pdev)
=20
 	mvchip->soc_variant =3D soc_variant;
 	mvchip->chip.label =3D dev_name(&pdev->dev);
-	mvchip->chip.dev =3D &pdev->dev;
+	mvchip->chip.parent =3D &pdev->dev;
 	mvchip->chip.request =3D gpiochip_generic_request;
 	mvchip->chip.free =3D gpiochip_generic_free;
 	mvchip->chip.direction_input =3D mvebu_gpio_direction_input;
diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 62ae251d4490..3c66ce4fe9ed 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -108,7 +108,7 @@ static int octeon_gpio_probe(struct platform_device=
 *pdev)
=20
 	pdev->dev.platform_data =3D chip;
 	chip->label =3D "octeon-gpio";
-	chip->dev =3D &pdev->dev;
+	chip->parent =3D &pdev->dev;
 	chip->owner =3D THIS_MODULE;
 	chip->base =3D 0;
 	chip->can_sleep =3D false;
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 56d2d026e62e..7e4f7c5f999a 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1090,7 +1090,7 @@ static int omap_gpio_chip_init(struct gpio_bank *=
bank, struct irq_chip *irqc)
 	if (bank->is_mpuio) {
 		bank->chip.label =3D "mpuio";
 		if (bank->regs->wkup_en)
-			bank->chip.dev =3D &omap_mpuio_device.dev;
+			bank->chip.parent =3D &omap_mpuio_device.dev;
 		bank->chip.base =3D OMAP_MPUIO(0);
 	} else {
 		bank->chip.label =3D "gpio";
@@ -1199,7 +1199,7 @@ static int omap_gpio_probe(struct platform_device=
 *pdev)
 	}
=20
 	bank->dev =3D dev;
-	bank->chip.dev =3D dev;
+	bank->chip.parent =3D dev;
 	bank->chip.owner =3D THIS_MODULE;
 	bank->dbck_flag =3D pdata->dbck_flag;
 	bank->stride =3D pdata->bank_stride;
diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 171a6389f9ce..5f09ed1700dc 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -54,7 +54,7 @@ static int palmas_gpio_get(struct gpio_chip *gc, unsi=
gned offset)
=20
 	ret =3D palmas_read(palmas, PALMAS_GPIO_BASE, reg, &val);
 	if (ret < 0) {
-		dev_err(gc->dev, "Reg 0x%02x read failed, %d\n", reg, ret);
+		dev_err(gc->parent, "Reg 0x%02x read failed, %d\n", reg, ret);
 		return ret;
 	}
=20
@@ -65,7 +65,7 @@ static int palmas_gpio_get(struct gpio_chip *gc, unsi=
gned offset)
=20
 	ret =3D palmas_read(palmas, PALMAS_GPIO_BASE, reg, &val);
 	if (ret < 0) {
-		dev_err(gc->dev, "Reg 0x%02x read failed, %d\n", reg, ret);
+		dev_err(gc->parent, "Reg 0x%02x read failed, %d\n", reg, ret);
 		return ret;
 	}
 	return !!(val & BIT(offset));
@@ -90,7 +90,7 @@ static void palmas_gpio_set(struct gpio_chip *gc, uns=
igned offset,
=20
 	ret =3D palmas_write(palmas, PALMAS_GPIO_BASE, reg, BIT(offset));
 	if (ret < 0)
-		dev_err(gc->dev, "Reg 0x%02x write failed, %d\n", reg, ret);
+		dev_err(gc->parent, "Reg 0x%02x write failed, %d\n", reg, ret);
 }
=20
 static int palmas_gpio_output(struct gpio_chip *gc, unsigned offset,
@@ -111,7 +111,8 @@ static int palmas_gpio_output(struct gpio_chip *gc,=
 unsigned offset,
 	ret =3D palmas_update_bits(palmas, PALMAS_GPIO_BASE, reg,
 				BIT(offset), BIT(offset));
 	if (ret < 0)
-		dev_err(gc->dev, "Reg 0x%02x update failed, %d\n", reg, ret);
+		dev_err(gc->parent, "Reg 0x%02x update failed, %d\n", reg,
+			ret);
 	return ret;
 }
=20
@@ -128,7 +129,8 @@ static int palmas_gpio_input(struct gpio_chip *gc, =
unsigned offset)
=20
 	ret =3D palmas_update_bits(palmas, PALMAS_GPIO_BASE, reg, BIT(offset)=
, 0);
 	if (ret < 0)
-		dev_err(gc->dev, "Reg 0x%02x update failed, %d\n", reg, ret);
+		dev_err(gc->parent, "Reg 0x%02x update failed, %d\n", reg,
+			ret);
 	return ret;
 }
=20
@@ -186,7 +188,7 @@ static int palmas_gpio_probe(struct platform_device=
 *pdev)
 	palmas_gpio->gpio_chip.to_irq =3D palmas_gpio_to_irq;
 	palmas_gpio->gpio_chip.set	=3D palmas_gpio_set;
 	palmas_gpio->gpio_chip.get	=3D palmas_gpio_get;
-	palmas_gpio->gpio_chip.dev =3D &pdev->dev;
+	palmas_gpio->gpio_chip.parent =3D &pdev->dev;
 #ifdef CONFIG_OF_GPIO
 	palmas_gpio->gpio_chip.of_node =3D pdev->dev.of_node;
 #endif
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 2d4892cc70fb..ddbbbe57eef8 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -367,7 +367,7 @@ static void pca953x_setup_gpio(struct pca953x_chip =
*chip, int gpios)
 	gc->base =3D chip->gpio_start;
 	gc->ngpio =3D gpios;
 	gc->label =3D chip->client->name;
-	gc->dev =3D &chip->client->dev;
+	gc->parent =3D &chip->client->dev;
 	gc->owner =3D THIS_MODULE;
 	gc->names =3D chip->names;
 }
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 1d4d9bc8b69d..c7552106a80c 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -293,7 +293,7 @@ static int pcf857x_probe(struct i2c_client *client,
=20
 	gpio->chip.base			=3D pdata ? pdata->gpio_base : -1;
 	gpio->chip.can_sleep		=3D true;
-	gpio->chip.dev			=3D &client->dev;
+	gpio->chip.parent			=3D &client->dev;
 	gpio->chip.owner		=3D THIS_MODULE;
 	gpio->chip.get			=3D pcf857x_get;
 	gpio->chip.set			=3D pcf857x_set;
diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 34ed176df15a..e43db64e52b3 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -220,7 +220,7 @@ static void pch_gpio_setup(struct pch_gpio *chip)
 	struct gpio_chip *gpio =3D &chip->gpio;
=20
 	gpio->label =3D dev_name(chip->dev);
-	gpio->dev =3D chip->dev;
+	gpio->parent =3D chip->dev;
 	gpio->owner =3D THIS_MODULE;
 	gpio->direction_input =3D pch_gpio_direction_input;
 	gpio->get =3D pch_gpio_get;
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 4d4b37676702..e041639adc14 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -131,7 +131,7 @@ static int pl061_irq_type(struct irq_data *d, unsig=
ned trigger)
 	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
 	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
 	{
-		dev_err(gc->dev,
+		dev_err(gc->parent,
 			"trying to configure line %d for both level and edge "
 			"detection, choose one!\n",
 			offset);
@@ -158,7 +158,7 @@ static int pl061_irq_type(struct irq_data *d, unsig=
ned trigger)
 		else
 			gpioiev &=3D ~bit;
 		irq_set_handler_locked(d, handle_level_irq);
-		dev_dbg(gc->dev, "line %d: IRQ on %s level\n",
+		dev_dbg(gc->parent, "line %d: IRQ on %s level\n",
 			offset,
 			polarity ? "HIGH" : "LOW");
 	} else if ((trigger & IRQ_TYPE_EDGE_BOTH) =3D=3D IRQ_TYPE_EDGE_BOTH) =
{
@@ -167,7 +167,7 @@ static int pl061_irq_type(struct irq_data *d, unsig=
ned trigger)
 		/* Select both edges, setting this makes GPIOEV be ignored */
 		gpioibe |=3D bit;
 		irq_set_handler_locked(d, handle_edge_irq);
-		dev_dbg(gc->dev, "line %d: IRQ on both edges\n", offset);
+		dev_dbg(gc->parent, "line %d: IRQ on both edges\n", offset);
 	} else if ((trigger & IRQ_TYPE_EDGE_RISING) ||
 		   (trigger & IRQ_TYPE_EDGE_FALLING)) {
 		bool rising =3D trigger & IRQ_TYPE_EDGE_RISING;
@@ -182,7 +182,7 @@ static int pl061_irq_type(struct irq_data *d, unsig=
ned trigger)
 		else
 			gpioiev &=3D ~bit;
 		irq_set_handler_locked(d, handle_edge_irq);
-		dev_dbg(gc->dev, "line %d: IRQ on %s edge\n",
+		dev_dbg(gc->parent, "line %d: IRQ on %s edge\n",
 			offset,
 			rising ? "RISING" : "FALLING");
 	} else {
@@ -191,7 +191,7 @@ static int pl061_irq_type(struct irq_data *d, unsig=
ned trigger)
 		gpioibe &=3D ~bit;
 		gpioiev &=3D ~bit;
 		irq_set_handler_locked(d, handle_bad_irq);
-		dev_warn(gc->dev, "no trigger selected for line %d\n",
+		dev_warn(gc->parent, "no trigger selected for line %d\n",
 			 offset);
 	}
=20
@@ -316,7 +316,7 @@ static int pl061_probe(struct amba_device *adev, co=
nst struct amba_id *id)
 	chip->gc.set =3D pl061_set_value;
 	chip->gc.ngpio =3D PL061_GPIO_NR;
 	chip->gc.label =3D dev_name(dev);
-	chip->gc.dev =3D dev;
+	chip->gc.parent =3D dev;
 	chip->gc.owner =3D THIS_MODULE;
=20
 	ret =3D gpiochip_add(&chip->gc);
diff --git a/drivers/gpio/gpio-rc5t583.c b/drivers/gpio/gpio-rc5t583.c
index 6eabf239676b..f26d9f7d8cdd 100644
--- a/drivers/gpio/gpio-rc5t583.c
+++ b/drivers/gpio/gpio-rc5t583.c
@@ -132,7 +132,7 @@ static int rc5t583_gpio_probe(struct platform_devic=
e *pdev)
 	rc5t583_gpio->gpio_chip.to_irq =3D rc5t583_gpio_to_irq,
 	rc5t583_gpio->gpio_chip.ngpio =3D RC5T583_MAX_GPIO,
 	rc5t583_gpio->gpio_chip.can_sleep =3D true,
-	rc5t583_gpio->gpio_chip.dev =3D &pdev->dev;
+	rc5t583_gpio->gpio_chip.parent =3D &pdev->dev;
 	rc5t583_gpio->gpio_chip.base =3D -1;
 	rc5t583_gpio->rc5t583 =3D rc5t583;
=20
diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 2a8122444614..3cbb25ecfc7a 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -449,7 +449,7 @@ static int gpio_rcar_probe(struct platform_device *=
pdev)
 	gpio_chip->direction_output =3D gpio_rcar_direction_output;
 	gpio_chip->set =3D gpio_rcar_set;
 	gpio_chip->label =3D name;
-	gpio_chip->dev =3D dev;
+	gpio_chip->parent =3D dev;
 	gpio_chip->owner =3D THIS_MODULE;
 	gpio_chip->base =3D p->config.gpio_base;
 	gpio_chip->ngpio =3D p->config.number_of_pins;
diff --git a/drivers/gpio/gpio-sch.c b/drivers/gpio/gpio-sch.c
index b72906f5b999..a8a333ade9aa 100644
--- a/drivers/gpio/gpio-sch.c
+++ b/drivers/gpio/gpio-sch.c
@@ -171,7 +171,7 @@ static int sch_gpio_probe(struct platform_device *p=
dev)
 	sch->iobase =3D res->start;
 	sch->chip =3D sch_gpio_chip;
 	sch->chip.label =3D dev_name(&pdev->dev);
-	sch->chip.dev =3D &pdev->dev;
+	sch->chip.parent =3D &pdev->dev;
=20
 	switch (pdev->id) {
 	case PCI_DEVICE_ID_INTEL_SCH_LPC:
diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index 0cb11413e814..3841398d1078 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -149,7 +149,7 @@ static int sch311x_gpio_request(struct gpio_chip *c=
hip, unsigned offset)
=20
 	if (!request_region(block->runtime_reg + block->config_regs[offset],
 			    1, DRV_NAME)) {
-		dev_err(chip->dev, "Failed to request region 0x%04x.\n",
+		dev_err(chip->parent, "Failed to request region 0x%04x.\n",
 			block->runtime_reg + block->config_regs[offset]);
 		return -EBUSY;
 	}
@@ -261,7 +261,7 @@ static int sch311x_gpio_probe(struct platform_devic=
e *pdev)
 		block->chip.get =3D sch311x_gpio_get;
 		block->chip.set =3D sch311x_gpio_set;
 		block->chip.ngpio =3D 8;
-		block->chip.dev =3D &pdev->dev;
+		block->chip.parent =3D &pdev->dev;
 		block->chip.base =3D sch311x_gpio_blocks[i].base;
 		block->config_regs =3D sch311x_gpio_blocks[i].config_regs;
 		block->data_reg =3D sch311x_gpio_blocks[i].data_reg;
diff --git a/drivers/gpio/gpio-spear-spics.c b/drivers/gpio/gpio-spear-=
spics.c
index 69ffca5b073b..bd436b7f86e1 100644
--- a/drivers/gpio/gpio-spear-spics.c
+++ b/drivers/gpio/gpio-spear-spics.c
@@ -164,7 +164,7 @@ static int spics_gpio_probe(struct platform_device =
*pdev)
 	spics->chip.get =3D spics_get_value;
 	spics->chip.set =3D spics_set_value;
 	spics->chip.label =3D dev_name(&pdev->dev);
-	spics->chip.dev =3D &pdev->dev;
+	spics->chip.parent =3D &pdev->dev;
 	spics->chip.owner =3D THIS_MODULE;
 	spics->last_off =3D -1;
=20
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index dabfb99dddef..9e471979aa9e 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -356,7 +356,7 @@ static int stmpe_gpio_probe(struct platform_device =
*pdev)
 	stmpe_gpio->stmpe =3D stmpe;
 	stmpe_gpio->chip =3D template_chip;
 	stmpe_gpio->chip.ngpio =3D stmpe->num_gpios;
-	stmpe_gpio->chip.dev =3D &pdev->dev;
+	stmpe_gpio->chip.parent =3D &pdev->dev;
 	stmpe_gpio->chip.of_node =3D np;
 	stmpe_gpio->chip.base =3D -1;
=20
diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.=
c
index 81bdbe7ba2a4..c250f21b9e40 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -139,7 +139,7 @@ static int xway_stp_request(struct gpio_chip *gc, u=
nsigned gpio)
 		container_of(gc, struct xway_stp, gc);
=20
 	if ((gpio < 8) && (chip->reserved & BIT(gpio))) {
-		dev_err(gc->dev, "GPIO %d is driven by hardware\n", gpio);
+		dev_err(gc->parent, "GPIO %d is driven by hardware\n", gpio);
 		return -ENODEV;
 	}
=20
@@ -214,7 +214,7 @@ static int xway_stp_probe(struct platform_device *p=
dev)
 	if (IS_ERR(chip->virt))
 		return PTR_ERR(chip->virt);
=20
-	chip->gc.dev =3D &pdev->dev;
+	chip->gc.parent =3D &pdev->dev;
 	chip->gc.label =3D "stp-xway";
 	chip->gc.direction_output =3D xway_stp_dir_out;
 	chip->gc.set =3D xway_stp_set;
diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index 76f920173a2f..c0145159a127 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -473,7 +473,7 @@ static void sx150x_init_chip(struct sx150x_chip *ch=
ip,
=20
 	chip->client                     =3D client;
 	chip->dev_cfg                    =3D &sx150x_devices[driver_data];
-	chip->gpio_chip.dev              =3D &client->dev;
+	chip->gpio_chip.parent              =3D &client->dev;
 	chip->gpio_chip.label            =3D client->name;
 	chip->gpio_chip.direction_input  =3D sx150x_gpio_direction_input;
 	chip->gpio_chip.direction_output =3D sx150x_gpio_direction_output;
diff --git a/drivers/gpio/gpio-syscon.c b/drivers/gpio/gpio-syscon.c
index 045a952576c7..cd6afee11f84 100644
--- a/drivers/gpio/gpio-syscon.c
+++ b/drivers/gpio/gpio-syscon.c
@@ -159,7 +159,7 @@ static void keystone_gpio_set(struct gpio_chip *chi=
p, unsigned offset, int val)
 			BIT(offs % SYSCON_REG_BITS) | KEYSTONE_LOCK_BIT,
 			BIT(offs % SYSCON_REG_BITS) | KEYSTONE_LOCK_BIT);
 	if (ret < 0)
-		dev_err(chip->dev, "gpio write failed ret(%d)\n", ret);
+		dev_err(chip->parent, "gpio write failed ret(%d)\n", ret);
 }
=20
 static const struct syscon_gpio_data keystone_dsp_gpio =3D {
@@ -224,7 +224,7 @@ static int syscon_gpio_probe(struct platform_device=
 *pdev)
 		priv->dir_reg_offset <<=3D 3;
 	}
=20
-	priv->chip.dev =3D dev;
+	priv->chip.parent =3D dev;
 	priv->chip.owner =3D THIS_MODULE;
 	priv->chip.label =3D dev_name(dev);
 	priv->chip.base =3D -1;
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 4356e6c20fc5..1a7c3efae5d8 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -197,7 +197,7 @@ static int tb10x_gpio_probe(struct platform_device =
*pdev)
 		return PTR_ERR(tb10x_gpio->base);
=20
 	tb10x_gpio->gc.label		=3D of_node_full_name(dn);
-	tb10x_gpio->gc.dev		=3D &pdev->dev;
+	tb10x_gpio->gc.parent		=3D &pdev->dev;
 	tb10x_gpio->gc.owner		=3D THIS_MODULE;
 	tb10x_gpio->gc.direction_input	=3D tb10x_gpio_direction_in;
 	tb10x_gpio->gc.get		=3D tb10x_gpio_get;
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index d1d585ddb9ab..7c1537ed6dff 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -258,7 +258,7 @@ static int tc3589x_gpio_probe(struct platform_devic=
e *pdev)
=20
 	tc3589x_gpio->chip =3D template_chip;
 	tc3589x_gpio->chip.ngpio =3D tc3589x->num_gpio;
-	tc3589x_gpio->chip.dev =3D &pdev->dev;
+	tc3589x_gpio->chip.parent =3D &pdev->dev;
 	tc3589x_gpio->chip.base =3D -1;
 	tc3589x_gpio->chip.of_node =3D np;
=20
diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberd=
ale.c
index 30653e6319e9..dda8f21811eb 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -268,7 +268,7 @@ static int timbgpio_probe(struct platform_device *p=
dev)
=20
 	gc->label =3D dev_name(&pdev->dev);
 	gc->owner =3D THIS_MODULE;
-	gc->dev =3D &pdev->dev;
+	gc->parent =3D &pdev->dev;
 	gc->direction_input =3D timbgpio_gpio_direction_input;
 	gc->get =3D timbgpio_gpio_get;
 	gc->direction_output =3D timbgpio_gpio_direction_output;
diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.=
c
index 9c9238e838a9..89b2249100b0 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -104,7 +104,7 @@ static int tps6586x_gpio_probe(struct platform_devi=
ce *pdev)
=20
 	tps6586x_gpio->gpio_chip.owner =3D THIS_MODULE;
 	tps6586x_gpio->gpio_chip.label =3D pdev->name;
-	tps6586x_gpio->gpio_chip.dev =3D &pdev->dev;
+	tps6586x_gpio->gpio_chip.parent =3D &pdev->dev;
 	tps6586x_gpio->gpio_chip.ngpio =3D 4;
 	tps6586x_gpio->gpio_chip.can_sleep =3D true;
=20
diff --git a/drivers/gpio/gpio-tps65910.c b/drivers/gpio/gpio-tps65910.=
c
index 88f1f5ff4e96..83894c0387fb 100644
--- a/drivers/gpio/gpio-tps65910.c
+++ b/drivers/gpio/gpio-tps65910.c
@@ -146,7 +146,7 @@ static int tps65910_gpio_probe(struct platform_devi=
ce *pdev)
 	tps65910_gpio->gpio_chip.direction_output =3D tps65910_gpio_output;
 	tps65910_gpio->gpio_chip.set	=3D tps65910_gpio_set;
 	tps65910_gpio->gpio_chip.get	=3D tps65910_gpio_get;
-	tps65910_gpio->gpio_chip.dev =3D &pdev->dev;
+	tps65910_gpio->gpio_chip.parent =3D &pdev->dev;
 #ifdef CONFIG_OF_GPIO
 	tps65910_gpio->gpio_chip.of_node =3D tps65910->dev->of_node;
 #endif
diff --git a/drivers/gpio/gpio-tps65912.c b/drivers/gpio/gpio-tps65912.=
c
index 9cdbc0c9cb2d..0f073ffa74cf 100644
--- a/drivers/gpio/gpio-tps65912.c
+++ b/drivers/gpio/gpio-tps65912.c
@@ -104,7 +104,7 @@ static int tps65912_gpio_probe(struct platform_devi=
ce *pdev)
=20
 	tps65912_gpio->tps65912 =3D tps65912;
 	tps65912_gpio->gpio_chip =3D template_chip;
-	tps65912_gpio->gpio_chip.dev =3D &pdev->dev;
+	tps65912_gpio->gpio_chip.parent =3D &pdev->dev;
 	if (pdata && pdata->gpio_base)
 		tps65912_gpio->gpio_chip.base =3D pdata->gpio_base;
=20
diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
index b29a102d136b..aafe7910e030 100644
--- a/drivers/gpio/gpio-ts5500.c
+++ b/drivers/gpio/gpio-ts5500.c
@@ -315,7 +315,8 @@ static void ts5500_disable_irq(struct ts5500_priv *=
priv)
 	else if (priv->hwirq =3D=3D 1)
 		ts5500_clear_mask(BIT(6), 0x7d); /* LCD_RS on IRQ1 */
 	else
-		dev_err(priv->gpio_chip.dev, "invalid hwirq %d\n", priv->hwirq);
+		dev_err(priv->gpio_chip.parent, "invalid hwirq %d\n",
+			priv->hwirq);
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
=20
@@ -346,7 +347,7 @@ static int ts5500_dio_probe(struct platform_device =
*pdev)
=20
 	priv->gpio_chip.owner =3D THIS_MODULE;
 	priv->gpio_chip.label =3D name;
-	priv->gpio_chip.dev =3D dev;
+	priv->gpio_chip.parent =3D dev;
 	priv->gpio_chip.direction_input =3D ts5500_gpio_input;
 	priv->gpio_chip.direction_output =3D ts5500_gpio_output;
 	priv->gpio_chip.get =3D ts5500_gpio_get;
diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 9e1dbb9877c1..14f40bf64e34 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -256,7 +256,7 @@ static int twl_request(struct gpio_chip *chip, unsi=
gned offset)
 		/* optionally have the first two GPIOs switch vMMC1
 		 * and vMMC2 power supplies based on card presence.
 		 */
-		pdata =3D dev_get_platdata(chip->dev);
+		pdata =3D dev_get_platdata(chip->parent);
 		if (pdata)
 			value |=3D pdata->mmc_cd & 0x03;
=20
@@ -509,7 +509,7 @@ no_irqs:
 	priv->gpio_chip =3D template_chip;
 	priv->gpio_chip.base =3D -1;
 	priv->gpio_chip.ngpio =3D TWL4030_GPIO_MAX;
-	priv->gpio_chip.dev =3D &pdev->dev;
+	priv->gpio_chip.parent =3D &pdev->dev;
=20
 	mutex_init(&priv->mutex);
=20
diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index c946e7eef3ee..2da7c5f70034 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -36,7 +36,7 @@ static struct gpio_chip twl6040gpo_chip;
=20
 static int twl6040gpo_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct twl6040 *twl6040 =3D dev_get_drvdata(chip->dev->parent);
+	struct twl6040 *twl6040 =3D dev_get_drvdata(chip->parent->parent);
 	int ret =3D 0;
=20
 	ret =3D twl6040_reg_read(twl6040, TWL6040_REG_GPOCTL);
@@ -55,7 +55,7 @@ static int twl6040gpo_direction_out(struct gpio_chip =
*chip, unsigned offset,
=20
 static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, in=
t value)
 {
-	struct twl6040 *twl6040 =3D dev_get_drvdata(chip->dev->parent);
+	struct twl6040 *twl6040 =3D dev_get_drvdata(chip->parent->parent);
 	int ret;
 	u8 gpoctl;
=20
@@ -95,7 +95,7 @@ static int gpo_twl6040_probe(struct platform_device *=
pdev)
 	else
 		twl6040gpo_chip.ngpio =3D 1; /* twl6041 have 1 GPO */
=20
-	twl6040gpo_chip.dev =3D &pdev->dev;
+	twl6040gpo_chip.parent =3D &pdev->dev;
 #ifdef CONFIG_OF_GPIO
 	twl6040gpo_chip.of_node =3D twl6040_core_dev->of_node;
 #endif
diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-=
pdc.c
index 3623d009d808..a974397164b2 100644
--- a/drivers/gpio/gpio-tz1090-pdc.c
+++ b/drivers/gpio/gpio-tz1090-pdc.c
@@ -188,7 +188,7 @@ static int tz1090_pdc_gpio_probe(struct platform_de=
vice *pdev)
=20
 	/* Set up GPIO chip */
 	priv->chip.label		=3D "tz1090-pdc-gpio";
-	priv->chip.dev			=3D &pdev->dev;
+	priv->chip.parent			=3D &pdev->dev;
 	priv->chip.direction_input	=3D tz1090_pdc_gpio_direction_input;
 	priv->chip.direction_output	=3D tz1090_pdc_gpio_direction_output;
 	priv->chip.get			=3D tz1090_pdc_gpio_get;
diff --git a/drivers/gpio/gpio-tz1090.c b/drivers/gpio/gpio-tz1090.c
index 87bb1b1eee8d..7858d90202f3 100644
--- a/drivers/gpio/gpio-tz1090.c
+++ b/drivers/gpio/gpio-tz1090.c
@@ -425,7 +425,7 @@ static int tz1090_gpio_bank_probe(struct tz1090_gpi=
o_bank_info *info)
 	snprintf(bank->label, sizeof(bank->label), "tz1090-gpio-%u",
 		 info->index);
 	bank->chip.label		=3D bank->label;
-	bank->chip.dev			=3D dev;
+	bank->chip.parent			=3D dev;
 	bank->chip.direction_input	=3D tz1090_gpio_direction_input;
 	bank->chip.direction_output	=3D tz1090_gpio_direction_output;
 	bank->chip.get			=3D tz1090_gpio_get;
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 87b950cec6ec..9031e60c815c 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -249,7 +249,7 @@ static int vf610_gpio_probe(struct platform_device =
*pdev)
=20
 	gc =3D &port->gc;
 	gc->of_node =3D np;
-	gc->dev =3D dev;
+	gc->parent =3D dev;
 	gc->label =3D "vf610-gpio";
 	gc->ngpio =3D VF610_GPIO_PER_PORT;
 	gc->base =3D of_alias_get_id(np, "gpio") * VF610_GPIO_PER_PORT;
diff --git a/drivers/gpio/gpio-viperboard.c b/drivers/gpio/gpio-viperbo=
ard.c
index e2a11f27807f..26e7edb74f42 100644
--- a/drivers/gpio/gpio-viperboard.c
+++ b/drivers/gpio/gpio-viperboard.c
@@ -173,7 +173,7 @@ static void vprbrd_gpioa_set(struct gpio_chip *chip=
,
 		mutex_unlock(&vb->lock);
=20
 		if (ret !=3D sizeof(struct vprbrd_gpioa_msg))
-			dev_err(chip->dev, "usb error setting pin value\n");
+			dev_err(chip->parent, "usb error setting pin value\n");
 	}
 }
=20
@@ -345,7 +345,7 @@ static void vprbrd_gpiob_set(struct gpio_chip *chip=
,
 		mutex_unlock(&vb->lock);
=20
 		if (ret !=3D sizeof(struct vprbrd_gpiob_msg))
-			dev_err(chip->dev, "usb error setting pin value\n");
+			dev_err(chip->parent, "usb error setting pin value\n");
 	}
 }
=20
@@ -366,7 +366,7 @@ static int vprbrd_gpiob_direction_input(struct gpio=
_chip *chip,
 	mutex_unlock(&vb->lock);
=20
 	if (ret)
-		dev_err(chip->dev, "usb error setting pin to input\n");
+		dev_err(chip->parent, "usb error setting pin to input\n");
=20
 	return ret;
 }
@@ -385,7 +385,7 @@ static int vprbrd_gpiob_direction_output(struct gpi=
o_chip *chip,
=20
 	ret =3D vprbrd_gpiob_setdir(vb, offset, 1);
 	if (ret)
-		dev_err(chip->dev, "usb error setting pin to output\n");
+		dev_err(chip->parent, "usb error setting pin to output\n");
=20
 	mutex_unlock(&vb->lock);
=20
@@ -409,7 +409,7 @@ static int vprbrd_gpio_probe(struct platform_device=
 *pdev)
 	vb_gpio->vb =3D vb;
 	/* registering gpio a */
 	vb_gpio->gpioa.label =3D "viperboard gpio a";
-	vb_gpio->gpioa.dev =3D &pdev->dev;
+	vb_gpio->gpioa.parent =3D &pdev->dev;
 	vb_gpio->gpioa.owner =3D THIS_MODULE;
 	vb_gpio->gpioa.base =3D -1;
 	vb_gpio->gpioa.ngpio =3D 16;
@@ -420,13 +420,13 @@ static int vprbrd_gpio_probe(struct platform_devi=
ce *pdev)
 	vb_gpio->gpioa.direction_output =3D vprbrd_gpioa_direction_output;
 	ret =3D gpiochip_add(&vb_gpio->gpioa);
 	if (ret < 0) {
-		dev_err(vb_gpio->gpioa.dev, "could not add gpio a");
+		dev_err(vb_gpio->gpioa.parent, "could not add gpio a");
 		goto err_gpioa;
 	}
=20
 	/* registering gpio b */
 	vb_gpio->gpiob.label =3D "viperboard gpio b";
-	vb_gpio->gpiob.dev =3D &pdev->dev;
+	vb_gpio->gpiob.parent =3D &pdev->dev;
 	vb_gpio->gpiob.owner =3D THIS_MODULE;
 	vb_gpio->gpiob.base =3D -1;
 	vb_gpio->gpiob.ngpio =3D 16;
@@ -437,7 +437,7 @@ static int vprbrd_gpio_probe(struct platform_device=
 *pdev)
 	vb_gpio->gpiob.direction_output =3D vprbrd_gpiob_direction_output;
 	ret =3D gpiochip_add(&vb_gpio->gpiob);
 	if (ret < 0) {
-		dev_err(vb_gpio->gpiob.dev, "could not add gpio b");
+		dev_err(vb_gpio->gpiob.parent, "could not add gpio b");
 		goto err_gpiob;
 	}
=20
diff --git a/drivers/gpio/gpio-vr41xx.c b/drivers/gpio/gpio-vr41xx.c
index c1caa459c02d..1947531b7cf5 100644
--- a/drivers/gpio/gpio-vr41xx.c
+++ b/drivers/gpio/gpio-vr41xx.c
@@ -139,7 +139,7 @@ static void unmask_giuint_low(struct irq_data *d)
 static unsigned int startup_giuint(struct irq_data *data)
 {
 	if (gpiochip_lock_as_irq(&vr41xx_gpio_chip, data->hwirq))
-		dev_err(vr41xx_gpio_chip.dev,
+		dev_err(vr41xx_gpio_chip.parent,
 			"unable to lock HW IRQ %lu for IRQ\n",
 			data->hwirq);
 	/* Satisfy the .enable semantics by unmasking the line */
@@ -542,7 +542,7 @@ static int giu_probe(struct platform_device *pdev)
 	if (!giu_base)
 		return -ENOMEM;
=20
-	vr41xx_gpio_chip.dev =3D &pdev->dev;
+	vr41xx_gpio_chip.parent =3D &pdev->dev;
=20
 	ret =3D gpiochip_add(&vr41xx_gpio_chip);
 	if (!ret) {
diff --git a/drivers/gpio/gpio-wm831x.c b/drivers/gpio/gpio-wm831x.c
index 58ce75c188b7..2e73e4b52c69 100644
--- a/drivers/gpio/gpio-wm831x.c
+++ b/drivers/gpio/gpio-wm831x.c
@@ -258,7 +258,7 @@ static int wm831x_gpio_probe(struct platform_device=
 *pdev)
 	wm831x_gpio->wm831x =3D wm831x;
 	wm831x_gpio->gpio_chip =3D template_chip;
 	wm831x_gpio->gpio_chip.ngpio =3D wm831x->num_gpio;
-	wm831x_gpio->gpio_chip.dev =3D &pdev->dev;
+	wm831x_gpio->gpio_chip.parent =3D &pdev->dev;
 	if (pdata && pdata->gpio_base)
 		wm831x_gpio->gpio_chip.base =3D pdata->gpio_base;
 	else
diff --git a/drivers/gpio/gpio-wm8350.c b/drivers/gpio/gpio-wm8350.c
index 060b89303bb6..1e3d8da61ff3 100644
--- a/drivers/gpio/gpio-wm8350.c
+++ b/drivers/gpio/gpio-wm8350.c
@@ -124,7 +124,7 @@ static int wm8350_gpio_probe(struct platform_device=
 *pdev)
 	wm8350_gpio->wm8350 =3D wm8350;
 	wm8350_gpio->gpio_chip =3D template_chip;
 	wm8350_gpio->gpio_chip.ngpio =3D 13;
-	wm8350_gpio->gpio_chip.dev =3D &pdev->dev;
+	wm8350_gpio->gpio_chip.parent =3D &pdev->dev;
 	if (pdata && pdata->gpio_base)
 		wm8350_gpio->gpio_chip.base =3D pdata->gpio_base;
 	else
diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
index 6f5e42db4b9e..de73c80163c1 100644
--- a/drivers/gpio/gpio-wm8994.c
+++ b/drivers/gpio/gpio-wm8994.c
@@ -260,7 +260,7 @@ static int wm8994_gpio_probe(struct platform_device=
 *pdev)
 	wm8994_gpio->wm8994 =3D wm8994;
 	wm8994_gpio->gpio_chip =3D template_chip;
 	wm8994_gpio->gpio_chip.ngpio =3D WM8994_GPIO_MAX;
-	wm8994_gpio->gpio_chip.dev =3D &pdev->dev;
+	wm8994_gpio->gpio_chip.parent =3D &pdev->dev;
 	if (pdata && pdata->gpio_base)
 		wm8994_gpio->gpio_chip.base =3D pdata->gpio_base;
 	else
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 18a8182d4fec..b8ceb71885f6 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -188,7 +188,7 @@ static int xgene_gpio_probe(struct platform_device =
*pdev)
 	gpio->chip.ngpio =3D XGENE_MAX_GPIOS;
=20
 	spin_lock_init(&gpio->lock);
-	gpio->chip.dev =3D &pdev->dev;
+	gpio->chip.parent =3D &pdev->dev;
 	gpio->chip.direction_input =3D xgene_gpio_dir_in;
 	gpio->chip.direction_output =3D xgene_gpio_dir_out;
 	gpio->chip.get =3D xgene_gpio_get;
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index bc06a2cd2c1d..3f31aac2ba3c 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -373,7 +373,7 @@ static int xlp_gpio_probe(struct platform_device *p=
dev)
 	gc->owner =3D THIS_MODULE;
 	gc->label =3D dev_name(&pdev->dev);
 	gc->base =3D 0;
-	gc->dev =3D &pdev->dev;
+	gc->parent =3D &pdev->dev;
 	gc->ngpio =3D ngpio;
 	gc->of_node =3D pdev->dev.of_node;
 	gc->direction_output =3D xlp_gpio_dir_output;
diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index 1dcf7a66dd36..ab2e54fa46cf 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -245,7 +245,7 @@ static int zx_gpio_probe(struct platform_device *pd=
ev)
 	chip->gc.base =3D ZX_GPIO_NR * id;
 	chip->gc.ngpio =3D ZX_GPIO_NR;
 	chip->gc.label =3D dev_name(dev);
-	chip->gc.dev =3D dev;
+	chip->gc.parent =3D dev;
 	chip->gc.owner =3D THIS_MODULE;
=20
 	ret =3D gpiochip_add(&chip->gc);
diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 8abeacac5885..8a04e00bef32 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -592,7 +592,7 @@ static int zynq_gpio_request(struct gpio_chip *chip=
, unsigned offset)
 {
 	int ret;
=20
-	ret =3D pm_runtime_get_sync(chip->dev);
+	ret =3D pm_runtime_get_sync(chip->parent);
=20
 	/*
 	 * If the device is already active pm_runtime_get() will return 1 on
@@ -603,7 +603,7 @@ static int zynq_gpio_request(struct gpio_chip *chip=
, unsigned offset)
=20
 static void zynq_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	pm_runtime_put(chip->dev);
+	pm_runtime_put(chip->parent);
 }
=20
 static const struct dev_pm_ops zynq_gpio_dev_pm_ops =3D {
@@ -698,7 +698,7 @@ static int zynq_gpio_probe(struct platform_device *=
pdev)
 	chip =3D &gpio->chip;
 	chip->label =3D gpio->p_data->label;
 	chip->owner =3D THIS_MODULE;
-	chip->dev =3D &pdev->dev;
+	chip->parent =3D &pdev->dev;
 	chip->get =3D zynq_gpio_get_value;
 	chip->set =3D zynq_gpio_set_value;
 	chip->request =3D zynq_gpio_request;
diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index bbcac3af2a7a..af9aa7b76e81 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -51,10 +51,10 @@ struct acpi_gpio_chip {
=20
 static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
 {
-	if (!gc->dev)
+	if (!gc->parent)
 		return false;
=20
-	return ACPI_HANDLE(gc->dev) =3D=3D data;
+	return ACPI_HANDLE(gc->parent) =3D=3D data;
 }
=20
 #ifdef CONFIG_PINCTRL
@@ -184,7 +184,7 @@ static acpi_status acpi_gpiochip_request_interrupt(=
struct acpi_resource *ares,
 	if (agpio->connection_type !=3D ACPI_RESOURCE_GPIO_TYPE_INT)
 		return AE_OK;
=20
-	handle =3D ACPI_HANDLE(chip->dev);
+	handle =3D ACPI_HANDLE(chip->parent);
 	pin =3D agpio->pin_table[0];
=20
 	if (pin <=3D 255) {
@@ -208,7 +208,7 @@ static acpi_status acpi_gpiochip_request_interrupt(=
struct acpi_resource *ares,
=20
 	desc =3D gpiochip_request_own_desc(chip, pin, "ACPI:Event");
 	if (IS_ERR(desc)) {
-		dev_err(chip->dev, "Failed to request GPIO\n");
+		dev_err(chip->parent, "Failed to request GPIO\n");
 		return AE_ERROR;
 	}
=20
@@ -216,13 +216,13 @@ static acpi_status acpi_gpiochip_request_interrup=
t(struct acpi_resource *ares,
=20
 	ret =3D gpiochip_lock_as_irq(chip, pin);
 	if (ret) {
-		dev_err(chip->dev, "Failed to lock GPIO as interrupt\n");
+		dev_err(chip->parent, "Failed to lock GPIO as interrupt\n");
 		goto fail_free_desc;
 	}
=20
 	irq =3D gpiod_to_irq(desc);
 	if (irq < 0) {
-		dev_err(chip->dev, "Failed to translate GPIO to IRQ\n");
+		dev_err(chip->parent, "Failed to translate GPIO to IRQ\n");
 		goto fail_unlock_irq;
 	}
=20
@@ -259,7 +259,8 @@ static acpi_status acpi_gpiochip_request_interrupt(=
struct acpi_resource *ares,
 	ret =3D request_threaded_irq(event->irq, NULL, handler, irqflags,
 				   "ACPI:Event", event);
 	if (ret) {
-		dev_err(chip->dev, "Failed to setup interrupt handler for %d\n",
+		dev_err(chip->parent,
+			"Failed to setup interrupt handler for %d\n",
 			event->irq);
 		goto fail_free_event;
 	}
@@ -293,10 +294,10 @@ void acpi_gpiochip_request_interrupts(struct gpio=
_chip *chip)
 	acpi_handle handle;
 	acpi_status status;
=20
-	if (!chip->dev || !chip->to_irq)
+	if (!chip->parent || !chip->to_irq)
 		return;
=20
-	handle =3D ACPI_HANDLE(chip->dev);
+	handle =3D ACPI_HANDLE(chip->parent);
 	if (!handle)
 		return;
=20
@@ -323,10 +324,10 @@ void acpi_gpiochip_free_interrupts(struct gpio_ch=
ip *chip)
 	acpi_handle handle;
 	acpi_status status;
=20
-	if (!chip->dev || !chip->to_irq)
+	if (!chip->parent || !chip->to_irq)
 		return;
=20
-	handle =3D ACPI_HANDLE(chip->dev);
+	handle =3D ACPI_HANDLE(chip->parent);
 	if (!handle)
 		return;
=20
@@ -683,7 +684,7 @@ out:
 static void acpi_gpiochip_request_regions(struct acpi_gpio_chip *achip=
)
 {
 	struct gpio_chip *chip =3D achip->chip;
-	acpi_handle handle =3D ACPI_HANDLE(chip->dev);
+	acpi_handle handle =3D ACPI_HANDLE(chip->parent);
 	acpi_status status;
=20
 	INIT_LIST_HEAD(&achip->conns);
@@ -692,20 +693,22 @@ static void acpi_gpiochip_request_regions(struct =
acpi_gpio_chip *achip)
 						    acpi_gpio_adr_space_handler,
 						    NULL, achip);
 	if (ACPI_FAILURE(status))
-		dev_err(chip->dev, "Failed to install GPIO OpRegion handler\n");
+		dev_err(chip->parent,
+		        "Failed to install GPIO OpRegion handler\n");
 }
=20
 static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
 {
 	struct gpio_chip *chip =3D achip->chip;
-	acpi_handle handle =3D ACPI_HANDLE(chip->dev);
+	acpi_handle handle =3D ACPI_HANDLE(chip->parent);
 	struct acpi_gpio_connection *conn, *tmp;
 	acpi_status status;
=20
 	status =3D acpi_remove_address_space_handler(handle, ACPI_ADR_SPACE_G=
PIO,
 						   acpi_gpio_adr_space_handler);
 	if (ACPI_FAILURE(status)) {
-		dev_err(chip->dev, "Failed to remove GPIO OpRegion handler\n");
+		dev_err(chip->parent,
+			"Failed to remove GPIO OpRegion handler\n");
 		return;
 	}
=20
@@ -722,16 +725,16 @@ void acpi_gpiochip_add(struct gpio_chip *chip)
 	acpi_handle handle;
 	acpi_status status;
=20
-	if (!chip || !chip->dev)
+	if (!chip || !chip->parent)
 		return;
=20
-	handle =3D ACPI_HANDLE(chip->dev);
+	handle =3D ACPI_HANDLE(chip->parent);
 	if (!handle)
 		return;
=20
 	acpi_gpio =3D kzalloc(sizeof(*acpi_gpio), GFP_KERNEL);
 	if (!acpi_gpio) {
-		dev_err(chip->dev,
+		dev_err(chip->parent,
 			"Failed to allocate memory for ACPI GPIO chip\n");
 		return;
 	}
@@ -741,7 +744,7 @@ void acpi_gpiochip_add(struct gpio_chip *chip)
=20
 	status =3D acpi_attach_data(handle, acpi_gpio_chip_dh, acpi_gpio);
 	if (ACPI_FAILURE(status)) {
-		dev_err(chip->dev, "Failed to attach ACPI GPIO chip\n");
+		dev_err(chip->parent, "Failed to attach ACPI GPIO chip\n");
 		kfree(acpi_gpio);
 		return;
 	}
@@ -755,16 +758,16 @@ void acpi_gpiochip_remove(struct gpio_chip *chip)
 	acpi_handle handle;
 	acpi_status status;
=20
-	if (!chip || !chip->dev)
+	if (!chip || !chip->parent)
 		return;
=20
-	handle =3D ACPI_HANDLE(chip->dev);
+	handle =3D ACPI_HANDLE(chip->parent);
 	if (!handle)
 		return;
=20
 	status =3D acpi_get_data(handle, acpi_gpio_chip_dh, (void **)&acpi_gp=
io);
 	if (ACPI_FAILURE(status)) {
-		dev_warn(chip->dev, "Failed to retrieve ACPI GPIO chip\n");
+		dev_warn(chip->parent, "Failed to retrieve ACPI GPIO chip\n");
 		return;
 	}
=20
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 5fe34a9df3e6..6ed465ea2e12 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -423,8 +423,8 @@ int of_gpiochip_add(struct gpio_chip *chip)
 {
 	int status;
=20
-	if ((!chip->of_node) && (chip->dev))
-		chip->of_node =3D chip->dev->of_node;
+	if ((!chip->of_node) && (chip->parent))
+		chip->of_node =3D chip->parent->of_node;
=20
 	if (!chip->of_node)
 		return 0;
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.=
c
index b57ed8e55ab5..405dfcaadc4c 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -605,7 +605,7 @@ int gpiod_export(struct gpio_desc *desc, bool direc=
tion_may_change)
 	if (chip->names && chip->names[offset])
 		ioname =3D chip->names[offset];
=20
-	dev =3D device_create_with_groups(&gpio_class, chip->dev,
+	dev =3D device_create_with_groups(&gpio_class, chip->parent,
 					MKDEV(0, 0), data, gpio_groups,
 					ioname ? ioname : "gpio%u",
 					desc_to_gpio(desc));
@@ -730,7 +730,8 @@ int gpiochip_sysfs_register(struct gpio_chip *chip)
 		return 0;
=20
 	/* use chip->base for the ID; it's already known to be unique */
-	dev =3D device_create_with_groups(&gpio_class, chip->dev, MKDEV(0, 0)=
,
+	dev =3D device_create_with_groups(&gpio_class, chip->parent,
+					MKDEV(0, 0),
 					chip, gpiochip_groups,
 					"gpiochip%d", chip->base);
 	if (IS_ERR(dev))
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6798355c61c6..bcb49a508ef4 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -205,8 +205,8 @@ static int gpiochip_add_to_list(struct gpio_chip *c=
hip)
 	if (pos !=3D &gpio_chips && pos->prev !=3D &gpio_chips) {
 		_chip =3D list_entry(pos->prev, struct gpio_chip, list);
 		if (_chip->base + _chip->ngpio > chip->base) {
-			dev_err(chip->dev,
-			       "GPIO integer space overlap, cannot add chip\n");
+			dev_err(chip->parent,
+				"GPIO integer space overlap, cannot add chip\n");
 			err =3D -EBUSY;
 		}
 	}
@@ -267,7 +267,7 @@ static int gpiochip_set_desc_names(struct gpio_chip=
 *gc)
=20
 		gpio =3D gpio_name_to_desc(gc->names[i]);
 		if (gpio)
-			dev_warn(gc->dev, "Detected name collision for "
+			dev_warn(gc->parent, "Detected name collision for "
 				 "GPIO name '%s'\n",
 				 gc->names[i]);
 	}
@@ -348,8 +348,8 @@ int gpiochip_add(struct gpio_chip *chip)
 	INIT_LIST_HEAD(&chip->pin_ranges);
 #endif
=20
-	if (!chip->owner && chip->dev && chip->dev->driver)
-		chip->owner =3D chip->dev->driver->owner;
+	if (!chip->owner && chip->parent && chip->parent->driver)
+		chip->owner =3D chip->parent->driver->owner;
=20
 	status =3D gpiochip_set_desc_names(chip);
 	if (status)
@@ -424,7 +424,8 @@ void gpiochip_remove(struct gpio_chip *chip)
 	spin_unlock_irqrestore(&gpio_lock, flags);
=20
 	if (requested)
-		dev_crit(chip->dev, "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n"=
);
+		dev_crit(chip->parent,
+			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
=20
 	kfree(chip->desc);
 	chip->desc =3D NULL;
@@ -683,11 +684,11 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpioc=
hip,
 	if (!gpiochip || !irqchip)
 		return -EINVAL;
=20
-	if (!gpiochip->dev) {
+	if (!gpiochip->parent) {
 		pr_err("missing gpiochip .dev parent pointer\n");
 		return -EINVAL;
 	}
-	of_node =3D gpiochip->dev->of_node;
+	of_node =3D gpiochip->parent->of_node;
 #ifdef CONFIG_OF_GPIO
 	/*
 	 * If the gpiochip has an assigned OF node this takes precedence
@@ -2504,7 +2505,7 @@ static int gpiolib_seq_show(struct seq_file *s, v=
oid *v)
=20
 	seq_printf(s, "%sGPIOs %d-%d", (char *)s->private,
 			chip->base, chip->base + chip->ngpio - 1);
-	dev =3D chip->dev;
+	dev =3D chip->parent;
 	if (dev)
 		seq_printf(s, ", %s/%s", dev->bus ? dev->bus->name : "no-bus",
 			dev_name(dev));
diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 7afc3fcc122c..f47954e8fd2c 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1104,7 +1104,7 @@ static int cp2112_probe(struct hid_device *hdev, =
const struct hid_device_id *id)
 	dev->gc.base			=3D -1;
 	dev->gc.ngpio			=3D 8;
 	dev->gc.can_sleep		=3D 1;
-	dev->gc.dev			=3D &hdev->dev;
+	dev->gc.parent			=3D &hdev->dev;
=20
 	ret =3D gpiochip_add(&dev->gc);
 	if (ret < 0) {
diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchsc=
reen/ad7879.c
index fec66ad80513..16b5cc2196f2 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -454,7 +454,7 @@ static int ad7879_gpio_add(struct ad7879 *ts,
 		ts->gc.ngpio =3D 1;
 		ts->gc.label =3D "AD7879-GPIO";
 		ts->gc.owner =3D THIS_MODULE;
-		ts->gc.dev =3D ts->dev;
+		ts->gc.parent =3D ts->dev;
=20
 		ret =3D gpiochip_add(&ts->gc);
 		if (ret)
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 5a6363d161a2..a975b32ee8c8 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -319,7 +319,7 @@ static int pca9532_destroy_devices(struct pca9532_d=
ata *data, int n_devs)
 	}
=20
 #ifdef CONFIG_LEDS_PCA9532_GPIO
-	if (data->gpio.dev)
+	if (data->gpio.parent)
 		gpiochip_remove(&data->gpio);
 #endif
=20
@@ -413,13 +413,13 @@ static int pca9532_configure(struct i2c_client *c=
lient,
 		data->gpio.can_sleep =3D 1;
 		data->gpio.base =3D pdata->gpio_base;
 		data->gpio.ngpio =3D data->chip_info->num_leds;
-		data->gpio.dev =3D &client->dev;
+		data->gpio.parent =3D &client->dev;
 		data->gpio.owner =3D THIS_MODULE;
=20
 		err =3D gpiochip_add(&data->gpio);
 		if (err) {
 			/* Use data->gpio.dev as a flag for freeing gpiochip */
-			data->gpio.dev =3D NULL;
+			data->gpio.parent =3D NULL;
 			dev_warn(&client->dev, "could not add gpiochip\n");
 		} else {
 			dev_info(&client->dev, "gpios %i...%i\n",
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index edbecc4ca2da..75529a24a615 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -651,7 +651,7 @@ static int tca6507_probe_gpios(struct i2c_client *c=
lient,
 	tca->gpio.owner =3D THIS_MODULE;
 	tca->gpio.direction_output =3D tca6507_gpio_direction_output;
 	tca->gpio.set =3D tca6507_gpio_set_value;
-	tca->gpio.dev =3D &client->dev;
+	tca->gpio.parent =3D &client->dev;
 #ifdef CONFIG_OF_GPIO
 	tca->gpio.of_node =3D of_node_get(client->dev.of_node);
 #endif
diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/medi=
a/dvb-frontends/cxd2820r_core.c
index def6d21d1445..24a457d9d803 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -722,7 +722,7 @@ struct dvb_frontend *cxd2820r_attach(const struct c=
xd2820r_config *cfg,
 #ifdef CONFIG_GPIOLIB
 		/* add GPIOs */
 		priv->gpio_chip.label =3D KBUILD_MODNAME;
-		priv->gpio_chip.dev =3D &priv->i2c->dev;
+		priv->gpio_chip.parent =3D &priv->i2c->dev;
 		priv->gpio_chip.owner =3D THIS_MODULE;
 		priv->gpio_chip.direction_output =3D
 				cxd2820r_gpio_direction_output;
diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index 4c826f78acd0..bc90efe01b59 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -259,7 +259,7 @@ static int add_children(struct i2c_client *client)
 	int		i;
=20
 	/* GPIO-ish stuff */
-	dm355evm_msp_gpio.dev =3D &client->dev;
+	dm355evm_msp_gpio.parent =3D &client->dev;
 	status =3D gpiochip_add(&dm355evm_msp_gpio);
 	if (status < 0)
 		return status;
diff --git a/drivers/mfd/htc-egpio.c b/drivers/mfd/htc-egpio.c
index 6ccaf90d98fd..eca19d637785 100644
--- a/drivers/mfd/htc-egpio.c
+++ b/drivers/mfd/htc-egpio.c
@@ -321,7 +321,7 @@ static int __init egpio_probe(struct platform_devic=
e *pdev)
 		ei->chip[i].dev =3D &(pdev->dev);
 		chip =3D &(ei->chip[i].chip);
 		chip->label           =3D "htc-egpio";
-		chip->dev             =3D &pdev->dev;
+		chip->parent             =3D &pdev->dev;
 		chip->owner           =3D THIS_MODULE;
 		chip->get             =3D egpio_get;
 		chip->set             =3D egpio_set;
diff --git a/drivers/mfd/htc-i2cpld.c b/drivers/mfd/htc-i2cpld.c
index 1bd5b042c8b3..a36f6a5a308b 100644
--- a/drivers/mfd/htc-i2cpld.c
+++ b/drivers/mfd/htc-i2cpld.c
@@ -430,7 +430,7 @@ static int htcpld_register_chip_gpio(
 	/* Setup the GPIO chips */
 	gpio_chip =3D &(chip->chip_out);
 	gpio_chip->label           =3D "htcpld-out";
-	gpio_chip->dev             =3D dev;
+	gpio_chip->parent             =3D dev;
 	gpio_chip->owner           =3D THIS_MODULE;
 	gpio_chip->get             =3D htcpld_chip_get;
 	gpio_chip->set             =3D htcpld_chip_set;
@@ -441,7 +441,7 @@ static int htcpld_register_chip_gpio(
=20
 	gpio_chip =3D &(chip->chip_in);
 	gpio_chip->label           =3D "htcpld-in";
-	gpio_chip->dev             =3D dev;
+	gpio_chip->parent             =3D dev;
 	gpio_chip->owner           =3D THIS_MODULE;
 	gpio_chip->get             =3D htcpld_chip_get;
 	gpio_chip->set             =3D NULL;
diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
index 448f0a182dc4..b96847491277 100644
--- a/drivers/mfd/tps65010.c
+++ b/drivers/mfd/tps65010.c
@@ -638,7 +638,7 @@ static int tps65010_probe(struct i2c_client *client=
,
 		tps->outmask =3D board->outmask;
=20
 		tps->chip.label =3D client->name;
-		tps->chip.dev =3D &client->dev;
+		tps->chip.parent =3D &client->dev;
 		tps->chip.owner =3D THIS_MODULE;
=20
 		tps->chip.set =3D tps65010_gpio_set;
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bc=
m/pinctrl-bcm2835.c
index a1ea565fcd46..0bc1abcedbae 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -337,7 +337,7 @@ static int bcm2835_gpio_direction_input(struct gpio=
_chip *chip, unsigned offset)
=20
 static int bcm2835_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct bcm2835_pinctrl *pc =3D dev_get_drvdata(chip->dev);
+	struct bcm2835_pinctrl *pc =3D dev_get_drvdata(chip->parent);
=20
 	return bcm2835_gpio_get_bit(pc, GPLEV0, offset);
 }
@@ -350,14 +350,14 @@ static int bcm2835_gpio_direction_output(struct g=
pio_chip *chip,
=20
 static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, =
int value)
 {
-	struct bcm2835_pinctrl *pc =3D dev_get_drvdata(chip->dev);
+	struct bcm2835_pinctrl *pc =3D dev_get_drvdata(chip->parent);
=20
 	bcm2835_gpio_set_bit(pc, value ? GPSET0 : GPCLR0, offset);
 }
=20
 static int bcm2835_gpio_to_irq(struct gpio_chip *chip, unsigned offset=
)
 {
-	struct bcm2835_pinctrl *pc =3D dev_get_drvdata(chip->dev);
+	struct bcm2835_pinctrl *pc =3D dev_get_drvdata(chip->parent);
=20
 	return irq_linear_revmap(pc->irq_domain, offset);
 }
@@ -963,7 +963,7 @@ static int bcm2835_pinctrl_probe(struct platform_de=
vice *pdev)
 		return PTR_ERR(pc->base);
=20
 	pc->gpio_chip =3D bcm2835_gpio_chip;
-	pc->gpio_chip.dev =3D dev;
+	pc->gpio_chip.parent =3D dev;
 	pc->gpio_chip.of_node =3D np;
=20
 	pc->irq_domain =3D irq_domain_add_linear(np, BCM2835_NUM_GPIOS,
diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c b/drivers/pinctr=
l/bcm/pinctrl-cygnus-gpio.c
index 12a48f498b75..bd212b269094 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
@@ -720,7 +720,7 @@ static int cygnus_gpio_probe(struct platform_device=
 *pdev)
 	gc->ngpio =3D ngpios;
 	chip->num_banks =3D (ngpios + NGPIOS_PER_BANK - 1) / NGPIOS_PER_BANK;
 	gc->label =3D dev_name(dev);
-	gc->dev =3D dev;
+	gc->parent =3D dev;
 	gc->of_node =3D dev->of_node;
 	gc->request =3D cygnus_gpio_request;
 	gc->free =3D cygnus_gpio_free;
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl=
/intel/pinctrl-baytrail.c
index b59ce75b1947..bb92f8ae6b33 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -598,7 +598,7 @@ static int byt_gpio_probe(struct platform_device *p=
dev)
 	gc->dbg_show =3D byt_gpio_dbg_show;
 	gc->base =3D -1;
 	gc->can_sleep =3D false;
-	gc->dev =3D dev;
+	gc->parent =3D dev;
=20
 #ifdef CONFIG_PM_SLEEP
 	vg->saved_context =3D devm_kcalloc(&pdev->dev, gc->ngpio,
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinct=
rl/intel/pinctrl-cherryview.c
index 84936bae6e5e..dac8ec46aeb4 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1436,7 +1436,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pct=
rl, int irq)
=20
 	chip->ngpio =3D pctrl->community->ngpios;
 	chip->label =3D dev_name(pctrl->dev);
-	chip->dev =3D pctrl->dev;
+	chip->parent =3D pctrl->dev;
 	chip->base =3D -1;
=20
 	ret =3D gpiochip_add(chip);
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/in=
tel/pinctrl-intel.c
index 392e28d3f48d..401c186244be 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -874,7 +874,7 @@ static int intel_gpio_probe(struct intel_pinctrl *p=
ctrl, int irq)
=20
 	pctrl->chip.ngpio =3D pctrl->soc->npins;
 	pctrl->chip.label =3D dev_name(pctrl->dev);
-	pctrl->chip.dev =3D pctrl->dev;
+	pctrl->chip.parent =3D pctrl->dev;
 	pctrl->chip.base =3D -1;
=20
 	ret =3D gpiochip_add(&pctrl->chip);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pi=
nctrl/mediatek/pinctrl-mtk-common.c
index f307f1d27d64..a71f68362967 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -95,7 +95,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsi=
gned offset, int value)
 {
 	unsigned int reg_addr;
 	unsigned int bit;
-	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->dev);
+	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->parent);
=20
 	reg_addr =3D mtk_get_port(pctl, offset) + pctl->devdata->dout_offset;
 	bit =3D BIT(offset & 0xf);
@@ -742,7 +742,7 @@ static int mtk_gpio_get_direction(struct gpio_chip =
*chip, unsigned offset)
 	unsigned int bit;
 	unsigned int read_val =3D 0;
=20
-	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->dev);
+	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->parent);
=20
 	reg_addr =3D  mtk_get_port(pctl, offset) + pctl->devdata->dir_offset;
 	bit =3D BIT(offset & 0xf);
@@ -755,7 +755,7 @@ static int mtk_gpio_get(struct gpio_chip *chip, uns=
igned offset)
 	unsigned int reg_addr;
 	unsigned int bit;
 	unsigned int read_val =3D 0;
-	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->dev);
+	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->parent);
=20
 	if (mtk_gpio_get_direction(chip, offset))
 		reg_addr =3D mtk_get_port(pctl, offset) +
@@ -772,7 +772,7 @@ static int mtk_gpio_get(struct gpio_chip *chip, uns=
igned offset)
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	const struct mtk_desc_pin *pin;
-	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->dev);
+	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->parent);
 	int irq;
=20
 	pin =3D pctl->devdata->pins + offset;
@@ -940,7 +940,7 @@ static void mtk_eint_unmask(struct irq_data *d)
 static int mtk_gpio_set_debounce(struct gpio_chip *chip, unsigned offs=
et,
 	unsigned debounce)
 {
-	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->dev);
+	struct mtk_pinctrl *pctl =3D dev_get_drvdata(chip->parent);
 	int eint_num, virq, eint_offset;
 	unsigned int set_offset, bit, clr_bit, clr_offset, rst, i, unmask, db=
nc;
 	static const unsigned int dbnc_arr[] =3D {0 , 1, 16, 32, 64, 128, 256=
};
@@ -1348,7 +1348,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	*pctl->chip =3D mtk_gpio_chip;
 	pctl->chip->ngpio =3D pctl->devdata->npins;
 	pctl->chip->label =3D dev_name(&pdev->dev);
-	pctl->chip->dev =3D &pdev->dev;
+	pctl->chip->parent =3D &pdev->dev;
 	pctl->chip->base =3D -1;
=20
 	ret =3D gpiochip_add(pctl->chip);
diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/me=
son/pinctrl-meson.c
index 84943e4cff09..4b5f6829144d 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -562,7 +562,7 @@ static int meson_gpiolib_register(struct meson_pinc=
trl *pc)
 		domain =3D &pc->domains[i];
=20
 		domain->chip.label =3D domain->data->name;
-		domain->chip.dev =3D pc->dev;
+		domain->chip.parent =3D pc->dev;
 		domain->chip.request =3D meson_gpio_request;
 		domain->chip.free =3D meson_gpio_free;
 		domain->chip.direction_input =3D meson_gpio_direction_input;
diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl=
/nomadik/pinctrl-abx500.c
index b59fbb4b1fb1..434d5de0177b 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -986,7 +986,7 @@ static int abx500_pin_config_set(struct pinctrl_dev=
 *pctldev,
 		param =3D pinconf_to_config_param(configs[i]);
 		argument =3D pinconf_to_config_argument(configs[i]);
=20
-		dev_dbg(chip->dev, "pin %d [%#lx]: %s %s\n",
+		dev_dbg(chip->parent, "pin %d [%#lx]: %s %s\n",
 			pin, configs[i],
 			(param =3D=3D PIN_CONFIG_OUTPUT) ? "output " : "input",
 			(param =3D=3D PIN_CONFIG_OUTPUT) ?
@@ -1077,7 +1077,8 @@ static int abx500_pin_config_set(struct pinctrl_d=
ev *pctldev,
 			break;
=20
 		default:
-			dev_err(chip->dev, "illegal configuration requested\n");
+			dev_err(chip->parent,
+				"illegal configuration requested\n");
 		}
 	} /* for each config */
 out:
@@ -1172,7 +1173,7 @@ static int abx500_gpio_probe(struct platform_devi=
ce *pdev)
 	pct->dev =3D &pdev->dev;
 	pct->parent =3D dev_get_drvdata(pdev->dev.parent);
 	pct->chip =3D abx500gpio_chip;
-	pct->chip.dev =3D &pdev->dev;
+	pct->chip.parent =3D &pdev->dev;
 	pct->chip.base =3D -1; /* Dynamic allocation */
=20
 	match =3D of_match_device(abx500_gpio_match, &pdev->dev);
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctr=
l/nomadik/pinctrl-nomadik.c
index eebfae0c9b7c..cb4a327425a0 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -438,7 +438,7 @@ nmk_gpio_disable_lazy_irq(struct nmk_gpio_chip *nmk=
_chip, unsigned offset)
 			       nmk_chip->addr + NMK_GPIO_FIMSC);
 	}
=20
-	dev_dbg(nmk_chip->chip.dev, "%d: clearing interrupt mask\n", gpio);
+	dev_dbg(nmk_chip->chip.parent, "%d: clearing interrupt mask\n", gpio)=
;
 }
=20
 static void nmk_write_masked(void __iomem *reg, u32 mask, u32 value)
@@ -1188,7 +1188,7 @@ static struct nmk_gpio_chip *nmk_gpio_populate_ch=
ip(struct device_node *np,
 	chip->base =3D id * NMK_GPIO_PER_CHIP;
 	chip->ngpio =3D NMK_GPIO_PER_CHIP;
 	chip->label =3D dev_name(&gpio_pdev->dev);
-	chip->dev =3D &gpio_pdev->dev;
+	chip->parent =3D &gpio_pdev->dev;
=20
 	res =3D platform_get_resource(gpio_pdev, IORESOURCE_MEM, 0);
 	base =3D devm_ioremap_resource(&pdev->dev, res);
@@ -1890,7 +1890,7 @@ static int nmk_pin_config_set(struct pinctrl_dev =
*pctldev, unsigned pin,
 			if (slpm_val)
 				val =3D slpm_val - 1;
=20
-			dev_dbg(nmk_chip->chip.dev,
+			dev_dbg(nmk_chip->chip.parent,
 				"pin %d: sleep pull %s, dir %s, val %s\n",
 				pin,
 				slpm_pull ? pullnames[pull] : "same",
@@ -1899,7 +1899,7 @@ static int nmk_pin_config_set(struct pinctrl_dev =
*pctldev, unsigned pin,
 				slpm_val ? (val ? "high" : "low") : "same");
 		}
=20
-		dev_dbg(nmk_chip->chip.dev,
+		dev_dbg(nmk_chip->chip.parent,
 			"pin %d [%#lx]: pull %s, slpm %s (%s%s), lowemi %s\n",
 			pin, cfg, pullnames[pull], slpmnames[slpm],
 			output ? "output " : "input",
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-am=
d.c
index 3318f1d6193c..a74b2b0a75e0 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -778,7 +778,7 @@ static int amd_gpio_probe(struct platform_device *p=
dev)
 	gpio_dev->gc.base			=3D 0;
 	gpio_dev->gc.label			=3D pdev->name;
 	gpio_dev->gc.owner			=3D THIS_MODULE;
-	gpio_dev->gc.dev			=3D &pdev->dev;
+	gpio_dev->gc.parent			=3D &pdev->dev;
 	gpio_dev->gc.ngpio			=3D TOTAL_NUMBER_OF_PINS;
 #if defined(CONFIG_OF_GPIO)
 	gpio_dev->gc.of_node			=3D pdev->dev.of_node;
diff --git a/drivers/pinctrl/pinctrl-as3722.c b/drivers/pinctrl/pinctrl=
-as3722.c
index 56af28b95a44..89479bea6262 100644
--- a/drivers/pinctrl/pinctrl-as3722.c
+++ b/drivers/pinctrl/pinctrl-as3722.c
@@ -582,7 +582,7 @@ static int as3722_pinctrl_probe(struct platform_dev=
ice *pdev)
 	}
=20
 	as_pci->gpio_chip =3D as3722_gpio_chip;
-	as_pci->gpio_chip.dev =3D &pdev->dev;
+	as_pci->gpio_chip.parent =3D &pdev->dev;
 	as_pci->gpio_chip.of_node =3D pdev->dev.parent->of_node;
 	ret =3D gpiochip_add(&as_pci->gpio_chip);
 	if (ret < 0) {
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinc=
trl-at91-pio4.c
index 33edd07d9149..f1daf8580167 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -290,7 +290,7 @@ static void atmel_gpio_irq_handler(struct irq_desc =
*desc)
=20
 static int atmel_gpio_direction_input(struct gpio_chip *chip, unsigned=
 offset)
 {
-	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->dev);
+	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->parent)=
;
 	struct atmel_pin *pin =3D atmel_pioctrl->pins[offset];
 	unsigned reg;
=20
@@ -305,7 +305,7 @@ static int atmel_gpio_direction_input(struct gpio_c=
hip *chip, unsigned offset)
=20
 static int atmel_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->dev);
+	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->parent)=
;
 	struct atmel_pin *pin =3D atmel_pioctrl->pins[offset];
 	unsigned reg;
=20
@@ -317,7 +317,7 @@ static int atmel_gpio_get(struct gpio_chip *chip, u=
nsigned offset)
 static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigne=
d offset,
 				       int value)
 {
-	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->dev);
+	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->parent)=
;
 	struct atmel_pin *pin =3D atmel_pioctrl->pins[offset];
 	unsigned reg;
=20
@@ -336,7 +336,7 @@ static int atmel_gpio_direction_output(struct gpio_=
chip *chip, unsigned offset,
=20
 static void atmel_gpio_set(struct gpio_chip *chip, unsigned offset, in=
t val)
 {
-	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->dev);
+	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->parent)=
;
 	struct atmel_pin *pin =3D atmel_pioctrl->pins[offset];
=20
 	atmel_gpio_write(atmel_pioctrl, pin->bank,
@@ -346,7 +346,7 @@ static void atmel_gpio_set(struct gpio_chip *chip, =
unsigned offset, int val)
=20
 static int atmel_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->dev);
+	struct atmel_pioctrl *atmel_pioctrl =3D dev_get_drvdata(chip->parent)=
;
=20
 	return irq_find_mapping(atmel_pioctrl->irq_domain, offset);
 }
@@ -969,7 +969,7 @@ static int atmel_pinctrl_probe(struct platform_devi=
ce *pdev)
 	atmel_pioctrl->gpio_chip->of_node =3D dev->of_node;
 	atmel_pioctrl->gpio_chip->ngpio =3D atmel_pioctrl->npins;
 	atmel_pioctrl->gpio_chip->label =3D dev_name(dev);
-	atmel_pioctrl->gpio_chip->dev =3D dev;
+	atmel_pioctrl->gpio_chip->parent =3D dev;
 	atmel_pioctrl->gpio_chip->names =3D atmel_pioctrl->group_names;
=20
 	atmel_pioctrl->pm_wakeup_sources =3D devm_kzalloc(dev,
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-a=
t91.c
index 0d2fc0cff35e..667d90607abc 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1750,7 +1750,7 @@ static int at91_gpio_probe(struct platform_device=
 *pdev)
 	chip =3D &at91_chip->chip;
 	chip->of_node =3D np;
 	chip->label =3D dev_name(&pdev->dev);
-	chip->dev =3D &pdev->dev;
+	chip->parent =3D &pdev->dev;
 	chip->owner =3D THIS_MODULE;
 	chip->base =3D alias_idx * MAX_NB_GPIO_PER_BANK;
=20
diff --git a/drivers/pinctrl/pinctrl-coh901.c b/drivers/pinctrl/pinctrl=
-coh901.c
index 813eb7c771ec..e1cbf56df4b2 100644
--- a/drivers/pinctrl/pinctrl-coh901.c
+++ b/drivers/pinctrl/pinctrl-coh901.c
@@ -637,7 +637,7 @@ static int __init u300_gpio_probe(struct platform_d=
evice *pdev)
=20
 	gpio->chip =3D u300_gpio_chip;
 	gpio->chip.ngpio =3D U300_GPIO_NUM_PORTS * U300_GPIO_PINS_PER_PORT;
-	gpio->chip.dev =3D &pdev->dev;
+	gpio->chip.parent =3D &pdev->dev;
 	gpio->chip.base =3D 0;
 	gpio->dev =3D &pdev->dev;
=20
diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinc=
trl-digicolor.c
index 38a7799f8257..d8efb2ccac6c 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -244,7 +244,7 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap, =
struct device_node *np)
 	int ret;
=20
 	chip->label		=3D DRIVER_NAME;
-	chip->dev		=3D pmap->dev;
+	chip->parent		=3D pmap->dev;
 	chip->request		=3D gpiochip_generic_request;
 	chip->free		=3D gpiochip_generic_free;
 	chip->direction_input	=3D dc_gpio_direction_input;
diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinc=
trl-pistachio.c
index 85c9046c690e..fd5148d106a3 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1388,7 +1388,7 @@ static int pistachio_gpio_register(struct pistach=
io_pinctrl *pctl)
 		bank->pctl =3D pctl;
 		bank->base =3D pctl->base + GPIO_BANK_BASE(i);
=20
-		bank->gpio_chip.dev =3D pctl->dev;
+		bank->gpio_chip.parent =3D pctl->dev;
 		bank->gpio_chip.of_node =3D child;
 		ret =3D gpiochip_add(&bank->gpio_chip);
 		if (ret < 0) {
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinct=
rl-rockchip.c
index a0651128e23a..2b88a40f61d3 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1754,7 +1754,7 @@ static int rockchip_gpiolib_register(struct platf=
orm_device *pdev,
 		gc =3D &bank->gpio_chip;
 		gc->base =3D bank->pin_base;
 		gc->ngpio =3D bank->nr_pins;
-		gc->dev =3D &pdev->dev;
+		gc->parent =3D &pdev->dev;
 		gc->of_node =3D bank->of_node;
 		gc->label =3D bank->name;
=20
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.=
c
index b58d3f29148a..52639e65ea67 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1522,7 +1522,7 @@ static int st_gpiolib_register_bank(struct st_pin=
ctrl *info,
 	bank->gpio_chip.base =3D bank_num * ST_GPIO_PINS_PER_BANK;
 	bank->gpio_chip.ngpio =3D ST_GPIO_PINS_PER_BANK;
 	bank->gpio_chip.of_node =3D np;
-	bank->gpio_chip.dev =3D dev;
+	bank->gpio_chip.parent =3D dev;
 	spin_lock_init(&bank->lock);
=20
 	of_property_read_string(np, "st,bank-name", &range->name);
diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-x=
way.c
index ae724bdab3d3..b4380fb72001 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -648,7 +648,7 @@ static struct ltq_pinmux_info xway_info =3D {
 /* ---------  gpio_chip related code --------- */
 static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, in=
t val)
 {
-	struct ltq_pinmux_info *info =3D dev_get_drvdata(chip->dev);
+	struct ltq_pinmux_info *info =3D dev_get_drvdata(chip->parent);
=20
 	if (val)
 		gpio_setbit(info->membase[0], GPIO_OUT(pin), PORT_PIN(pin));
@@ -658,14 +658,14 @@ static void xway_gpio_set(struct gpio_chip *chip,=
 unsigned int pin, int val)
=20
 static int xway_gpio_get(struct gpio_chip *chip, unsigned int pin)
 {
-	struct ltq_pinmux_info *info =3D dev_get_drvdata(chip->dev);
+	struct ltq_pinmux_info *info =3D dev_get_drvdata(chip->parent);
=20
 	return gpio_getbit(info->membase[0], GPIO_IN(pin), PORT_PIN(pin));
 }
=20
 static int xway_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 {
-	struct ltq_pinmux_info *info =3D dev_get_drvdata(chip->dev);
+	struct ltq_pinmux_info *info =3D dev_get_drvdata(chip->parent);
=20
 	gpio_clearbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
=20
@@ -674,7 +674,7 @@ static int xway_gpio_dir_in(struct gpio_chip *chip,=
 unsigned int pin)
=20
 static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin,=
 int val)
 {
-	struct ltq_pinmux_info *info =3D dev_get_drvdata(chip->dev);
+	struct ltq_pinmux_info *info =3D dev_get_drvdata(chip->parent);
=20
 	gpio_setbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
 	xway_gpio_set(chip, pin, val);
@@ -783,7 +783,7 @@ static int pinmux_xway_probe(struct platform_device=
 *pdev)
 	xway_pctrl_desc.pins =3D xway_info.pads;
=20
 	/* load the gpio chip */
-	xway_chip.dev =3D &pdev->dev;
+	xway_chip.parent =3D &pdev->dev;
 	ret =3D gpiochip_add(&xway_chip);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register gpio chip\n");
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/=
pinctrl-msm.c
index 146264a41ec8..af2a13040898 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -800,7 +800,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	chip->base =3D 0;
 	chip->ngpio =3D ngpio;
 	chip->label =3D dev_name(pctrl->dev);
-	chip->dev =3D pctrl->dev;
+	chip->parent =3D pctrl->dev;
 	chip->owner =3D THIS_MODULE;
 	chip->of_node =3D pctrl->dev->of_node;
=20
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-spmi-gpio.c
index 6c42ca14d2fd..3e5ccc76d59c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -760,7 +760,7 @@ static int pmic_gpio_probe(struct platform_device *=
pdev)
 	}
=20
 	state->chip =3D pmic_gpio_gpio_template;
-	state->chip.dev =3D dev;
+	state->chip.parent =3D dev;
 	state->chip.base =3D -1;
 	state->chip.ngpio =3D npins;
 	state->chip.label =3D dev_name(dev);
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/=
qcom/pinctrl-spmi-mpp.c
index 9ce0e30e33e8..69c14ba177d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -862,7 +862,7 @@ static int pmic_mpp_probe(struct platform_device *p=
dev)
 	}
=20
 	state->chip =3D pmic_mpp_gpio_template;
-	state->chip.dev =3D dev;
+	state->chip.parent =3D dev;
 	state->chip.base =3D -1;
 	state->chip.ngpio =3D npins;
 	state->chip.label =3D dev_name(dev);
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-ssbi-gpio.c
index d809c9eaa323..7b80fa9c2049 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -730,7 +730,7 @@ static int pm8xxx_gpio_probe(struct platform_device=
 *pdev)
=20
 	pctrl->chip =3D pm8xxx_gpio_template;
 	pctrl->chip.base =3D -1;
-	pctrl->chip.dev =3D &pdev->dev;
+	pctrl->chip.parent =3D &pdev->dev;
 	pctrl->chip.of_node =3D pdev->dev.of_node;
 	pctrl->chip.of_gpio_n_cells =3D 2;
 	pctrl->chip.label =3D dev_name(pctrl->dev);
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/=
qcom/pinctrl-ssbi-mpp.c
index 8982027de8e8..7bc1e0f27447 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -821,7 +821,7 @@ static int pm8xxx_mpp_probe(struct platform_device =
*pdev)
=20
 	pctrl->chip =3D pm8xxx_mpp_template;
 	pctrl->chip.base =3D -1;
-	pctrl->chip.dev =3D &pdev->dev;
+	pctrl->chip.parent =3D &pdev->dev;
 	pctrl->chip.of_node =3D pdev->dev.of_node;
 	pctrl->chip.of_gpio_n_cells =3D 2;
 	pctrl->chip.label =3D dev_name(pctrl->dev);
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
index 71ccf6a90b22..7d7374e57f16 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -176,7 +176,8 @@ static int exynos_irq_request_resources(struct irq_=
data *irqd)
=20
 	ret =3D gpiochip_lock_as_irq(&bank->gpio_chip, irqd->hwirq);
 	if (ret) {
-		dev_err(bank->gpio_chip.dev, "unable to lock pin %s-%lu IRQ\n",
+		dev_err(bank->gpio_chip.parent,
+			"unable to lock pin %s-%lu IRQ\n",
 			bank->name, irqd->hwirq);
 		return ret;
 	}
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos5440.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos5440.c
index 82dc109f7ed4..f61f9a6fa9af 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos5440.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
@@ -539,7 +539,7 @@ static const struct pinconf_ops exynos5440_pinconf_=
ops =3D {
 /* gpiolib gpio_set callback function */
 static void exynos5440_gpio_set(struct gpio_chip *gc, unsigned offset,=
 int value)
 {
-	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->dev=
);
+	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->par=
ent);
 	void __iomem *base =3D priv->reg_base;
 	u32 data;
=20
@@ -553,7 +553,7 @@ static void exynos5440_gpio_set(struct gpio_chip *g=
c, unsigned offset, int value
 /* gpiolib gpio_get callback function */
 static int exynos5440_gpio_get(struct gpio_chip *gc, unsigned offset)
 {
-	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->dev=
);
+	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->par=
ent);
 	void __iomem *base =3D priv->reg_base;
 	u32 data;
=20
@@ -566,7 +566,7 @@ static int exynos5440_gpio_get(struct gpio_chip *gc=
, unsigned offset)
 /* gpiolib gpio_direction_input callback function */
 static int exynos5440_gpio_direction_input(struct gpio_chip *gc, unsig=
ned offset)
 {
-	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->dev=
);
+	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->par=
ent);
 	void __iomem *base =3D priv->reg_base;
 	u32 data;
=20
@@ -586,7 +586,7 @@ static int exynos5440_gpio_direction_input(struct g=
pio_chip *gc, unsigned offset
 static int exynos5440_gpio_direction_output(struct gpio_chip *gc, unsi=
gned offset,
 							int value)
 {
-	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->dev=
);
+	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->par=
ent);
 	void __iomem *base =3D priv->reg_base;
 	u32 data;
=20
@@ -607,7 +607,7 @@ static int exynos5440_gpio_direction_output(struct =
gpio_chip *gc, unsigned offse
 /* gpiolib gpio_to_irq callback function */
 static int exynos5440_gpio_to_irq(struct gpio_chip *gc, unsigned offse=
t)
 {
-	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->dev=
);
+	struct exynos5440_pinctrl_priv_data *priv =3D dev_get_drvdata(gc->par=
ent);
 	unsigned int virq;
=20
 	if (offset < 16 || offset > 23)
@@ -817,7 +817,7 @@ static int exynos5440_gpiolib_register(struct platf=
orm_device *pdev,
 	priv->gc =3D gc;
 	gc->base =3D 0;
 	gc->ngpio =3D EXYNOS5440_MAX_PINS;
-	gc->dev =3D &pdev->dev;
+	gc->parent =3D &pdev->dev;
 	gc->set =3D exynos5440_gpio_set;
 	gc->get =3D exynos5440_gpio_get;
 	gc->direction_input =3D exynos5440_gpio_direction_input;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
index 3f622ccd8eab..bb4db2050f19 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -914,7 +914,7 @@ static int samsung_gpiolib_register(struct platform=
_device *pdev,
 		gc =3D &bank->gpio_chip;
 		gc->base =3D drvdata->pin_base + bank->pin_base;
 		gc->ngpio =3D bank->nr_pins;
-		gc->dev =3D &pdev->dev;
+		gc->parent =3D &pdev->dev;
 		gc->of_node =3D bank->of_node;
 		gc->label =3D bank->name;
=20
diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpi=
o.c
index db3f09aa8993..cdb2460a7b00 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -246,7 +246,7 @@ static int gpio_pin_setup(struct sh_pfc_chip *chip)
 	gc->to_irq =3D gpio_pin_to_irq;
=20
 	gc->label =3D pfc->info->name;
-	gc->dev =3D pfc->dev;
+	gc->parent =3D pfc->dev;
 	gc->owner =3D THIS_MODULE;
 	gc->base =3D 0;
 	gc->ngpio =3D pfc->nr_gpio_pins;
diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/si=
rf/pinctrl-atlas7.c
index 829018c812bd..1850dc1b3863 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -6012,7 +6012,7 @@ static int atlas7_gpio_probe(struct platform_devi=
ce *pdev)
 	chip->label =3D kstrdup(np->name, GFP_KERNEL);
 	chip->of_node =3D np;
 	chip->of_gpio_n_cells =3D 2;
-	chip->dev =3D &pdev->dev;
+	chip->parent =3D &pdev->dev;
=20
 	/* Add gpio chip to system */
 	ret =3D gpiochip_add(chip);
diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/s=
pear/pinctrl-plgpio.c
index 1f0af250dbb5..925f597de266 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -561,7 +561,7 @@ static int plgpio_probe(struct platform_device *pde=
v)
 	plgpio->chip.get =3D plgpio_get_value;
 	plgpio->chip.set =3D plgpio_set_value;
 	plgpio->chip.label =3D dev_name(&pdev->dev);
-	plgpio->chip.dev =3D &pdev->dev;
+	plgpio->chip.parent =3D &pdev->dev;
 	plgpio->chip.owner =3D THIS_MODULE;
 	plgpio->chip.of_node =3D pdev->dev.of_node;
=20
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
index dead97daca35..a437e4f8628b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -454,7 +454,7 @@ static int sunxi_pinctrl_gpio_direction_input(struc=
t gpio_chip *chip,
=20
 static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned off=
set)
 {
-	struct sunxi_pinctrl *pctl =3D dev_get_drvdata(chip->dev);
+	struct sunxi_pinctrl *pctl =3D dev_get_drvdata(chip->parent);
 	u32 reg =3D sunxi_data_reg(offset);
 	u8 index =3D sunxi_data_offset(offset);
 	u32 set_mux =3D pctl->desc->irq_read_needs_mux &&
@@ -475,7 +475,7 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip =
*chip, unsigned offset)
 static void sunxi_pinctrl_gpio_set(struct gpio_chip *chip,
 				unsigned offset, int value)
 {
-	struct sunxi_pinctrl *pctl =3D dev_get_drvdata(chip->dev);
+	struct sunxi_pinctrl *pctl =3D dev_get_drvdata(chip->parent);
 	u32 reg =3D sunxi_data_reg(offset);
 	u8 index =3D sunxi_data_offset(offset);
 	unsigned long flags;
@@ -522,7 +522,7 @@ static int sunxi_pinctrl_gpio_of_xlate(struct gpio_=
chip *gc,
=20
 static int sunxi_pinctrl_gpio_to_irq(struct gpio_chip *chip, unsigned =
offset)
 {
-	struct sunxi_pinctrl *pctl =3D dev_get_drvdata(chip->dev);
+	struct sunxi_pinctrl *pctl =3D dev_get_drvdata(chip->parent);
 	struct sunxi_desc_function *desc;
 	unsigned pinnum =3D pctl->desc->pin_base + offset;
 	unsigned irqnum;
@@ -536,7 +536,7 @@ static int sunxi_pinctrl_gpio_to_irq(struct gpio_ch=
ip *chip, unsigned offset)
=20
 	irqnum =3D desc->irqbank * IRQ_PER_BANK + desc->irqnum;
=20
-	dev_dbg(chip->dev, "%s: request IRQ for GPIO %d, return %d\n",
+	dev_dbg(chip->parent, "%s: request IRQ for GPIO %d, return %d\n",
 		chip->label, offset + chip->base, irqnum);
=20
 	return irq_find_mapping(pctl->domain, irqnum);
@@ -959,7 +959,7 @@ int sunxi_pinctrl_init(struct platform_device *pdev=
,
 	pctl->chip->ngpio =3D round_up(last_pin, PINS_PER_BANK) -
 			    pctl->desc->pin_base;
 	pctl->chip->label =3D dev_name(&pdev->dev);
-	pctl->chip->dev =3D &pdev->dev;
+	pctl->chip->parent =3D &pdev->dev;
 	pctl->chip->base =3D pctl->desc->pin_base;
=20
 	ret =3D gpiochip_add(pctl->chip);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8=
500/pinctrl-wmt.c
index fb22d3f62480..e9c1dfd90570 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -488,7 +488,7 @@ static struct pinctrl_desc wmt_desc =3D {
=20
 static int wmt_gpio_get_direction(struct gpio_chip *chip, unsigned off=
set)
 {
-	struct wmt_pinctrl_data *data =3D dev_get_drvdata(chip->dev);
+	struct wmt_pinctrl_data *data =3D dev_get_drvdata(chip->parent);
 	u32 bank =3D WMT_BANK_FROM_PIN(offset);
 	u32 bit =3D WMT_BIT_FROM_PIN(offset);
 	u32 reg_dir =3D data->banks[bank].reg_dir;
@@ -503,7 +503,7 @@ static int wmt_gpio_get_direction(struct gpio_chip =
*chip, unsigned offset)
=20
 static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 {
-	struct wmt_pinctrl_data *data =3D dev_get_drvdata(chip->dev);
+	struct wmt_pinctrl_data *data =3D dev_get_drvdata(chip->parent);
 	u32 bank =3D WMT_BANK_FROM_PIN(offset);
 	u32 bit =3D WMT_BIT_FROM_PIN(offset);
 	u32 reg_data_in =3D data->banks[bank].reg_data_in;
@@ -519,7 +519,7 @@ static int wmt_gpio_get_value(struct gpio_chip *chi=
p, unsigned offset)
 static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset=
,
 			       int val)
 {
-	struct wmt_pinctrl_data *data =3D dev_get_drvdata(chip->dev);
+	struct wmt_pinctrl_data *data =3D dev_get_drvdata(chip->parent);
 	u32 bank =3D WMT_BANK_FROM_PIN(offset);
 	u32 bit =3D WMT_BIT_FROM_PIN(offset);
 	u32 reg_data_out =3D data->banks[bank].reg_data_out;
@@ -575,7 +575,7 @@ int wmt_pinctrl_probe(struct platform_device *pdev,
 	wmt_desc.npins =3D data->npins;
=20
 	data->gpio_chip =3D wmt_gpio_chip;
-	data->gpio_chip.dev =3D &pdev->dev;
+	data->gpio_chip.parent =3D &pdev->dev;
 	data->gpio_chip.of_node =3D pdev->dev.of_node;
 	data->gpio_chip.ngpio =3D data->nbanks * 32;
=20
diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/=
x86/intel_pmic_gpio.c
index 709f0afdafa8..0e73fd10ba72 100644
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -274,11 +274,11 @@ static int platform_pmic_gpio_probe(struct platfo=
rm_device *pdev)
 	pg->chip.base =3D pdata->gpio_base;
 	pg->chip.ngpio =3D NUM_GPIO;
 	pg->chip.can_sleep =3D 1;
-	pg->chip.dev =3D dev;
+	pg->chip.parent =3D dev;
=20
 	mutex_init(&pg->buslock);
=20
-	pg->chip.dev =3D dev;
+	pg->chip.parent =3D dev;
 	retval =3D gpiochip_add(&pg->chip);
 	if (retval) {
 		pr_err("Can not add pmic gpio chip\n");
diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.=
c
index 182549f55904..da437163d68f 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1174,7 +1174,7 @@ static int max310x_probe(struct device *dev, stru=
ct max310x_devtype *devtype,
 #ifdef CONFIG_GPIOLIB
 	/* Setup GPIO cotroller */
 	s->gpio.owner		=3D THIS_MODULE;
-	s->gpio.dev		=3D dev;
+	s->gpio.parent		=3D dev;
 	s->gpio.label		=3D dev_name(dev);
 	s->gpio.direction_input	=3D max310x_gpio_direction_input;
 	s->gpio.get		=3D max310x_gpio_get;
diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is=
7xx.c
index 72ffd0dcab78..4d12c27a6b54 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1180,7 +1180,7 @@ static int sc16is7xx_probe(struct device *dev,
 	if (devtype->nr_gpio) {
 		/* Setup GPIO cotroller */
 		s->gpio.owner		 =3D THIS_MODULE;
-		s->gpio.dev		 =3D dev;
+		s->gpio.parent		 =3D dev;
 		s->gpio.label		 =3D dev_name(dev);
 		s->gpio.direction_input	 =3D sc16is7xx_gpio_direction_input;
 		s->gpio.get		 =3D sc16is7xx_gpio_get;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index d1baebf350d8..b02c43be7859 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -20,7 +20,7 @@ struct seq_file;
 /**
  * struct gpio_chip - abstract a GPIO controller
  * @label: for diagnostics
- * @dev: optional device providing the GPIOs
+ * @parent: optional parent device providing the GPIOs
  * @cdev: class device used by sysfs interface (may be NULL)
  * @owner: helps prevent removal of modules exporting active GPIOs
  * @list: links gpio_chips together for traversal
@@ -89,7 +89,7 @@ struct seq_file;
  */
 struct gpio_chip {
 	const char		*label;
-	struct device		*dev;
+	struct device		*parent;
 	struct device		*cdev;
 	struct module		*owner;
 	struct list_head        list;
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index b4cd7e3bf5f8..1f590b5a6718 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4674,7 +4674,7 @@ static void rt5677_init_gpio(struct i2c_client *i=
2c)
=20
 	rt5677->gpio_chip =3D rt5677_template_chip;
 	rt5677->gpio_chip.ngpio =3D RT5677_GPIO_NUM;
-	rt5677->gpio_chip.dev =3D &i2c->dev;
+	rt5677->gpio_chip.parent =3D &i2c->dev;
 	rt5677->gpio_chip.base =3D -1;
=20
 	ret =3D gpiochip_add(&rt5677->gpio_chip);
diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index c2cdcae18ff6..171a23ddd15d 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2306,7 +2306,7 @@ static void wm5100_init_gpio(struct i2c_client *i=
2c)
=20
 	wm5100->gpio_chip =3D wm5100_template_chip;
 	wm5100->gpio_chip.ngpio =3D 6;
-	wm5100->gpio_chip.dev =3D &i2c->dev;
+	wm5100->gpio_chip.parent =3D &i2c->dev;
=20
 	if (wm5100->pdata.gpio_base)
 		wm5100->gpio_chip.base =3D wm5100->pdata.gpio_base;
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index b011253459af..d854f6fcf474 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1853,7 +1853,7 @@ static void wm8903_init_gpio(struct wm8903_priv *=
wm8903)
=20
 	wm8903->gpio_chip =3D wm8903_template_chip;
 	wm8903->gpio_chip.ngpio =3D WM8903_NUM_GPIO;
-	wm8903->gpio_chip.dev =3D wm8903->dev;
+	wm8903->gpio_chip.parent =3D wm8903->dev;
=20
 	if (pdata->gpio_base)
 		wm8903->gpio_chip.base =3D pdata->gpio_base;
diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 39ebd7bf4f53..b563d6746ac4 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3380,7 +3380,7 @@ static void wm8962_init_gpio(struct snd_soc_codec=
 *codec)
=20
 	wm8962->gpio_chip =3D wm8962_template_chip;
 	wm8962->gpio_chip.ngpio =3D WM8962_MAX_GPIO;
-	wm8962->gpio_chip.dev =3D codec->dev;
+	wm8962->gpio_chip.parent =3D codec->dev;
=20
 	if (pdata->gpio_base)
 		wm8962->gpio_chip.base =3D pdata->gpio_base;
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index f7ccd9fc5808..8d7d6c01a2f7 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2204,7 +2204,7 @@ static void wm8996_init_gpio(struct wm8996_priv *=
wm8996)
=20
 	wm8996->gpio_chip =3D wm8996_template_chip;
 	wm8996->gpio_chip.ngpio =3D 5;
-	wm8996->gpio_chip.dev =3D wm8996->dev;
+	wm8996->gpio_chip.parent =3D wm8996->dev;
=20
 	if (wm8996->pdata.gpio_base)
 		wm8996->gpio_chip.base =3D wm8996->pdata.gpio_base;
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
