From: Jonas Gorski <jogo@openwrt.org>
Subject: [PATCH V2 2/5] gpio: replace trivial implementations of request/free with generic one
Date: Sun, 11 Oct 2015 17:34:16 +0200
Message-ID: <1444577659-17621-3-git-send-email-jogo@openwrt.org>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:54626 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751635AbbJKPi4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 11 Oct 2015 11:38:56 -0400
In-Reply-To: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>, Heiko

Replace all trivial request/free callbacks that do nothing but call into
pinctrl code with the generic versions.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: James Hogan <james.hogan@imgtec.com>
Acked-by: Stefan Agner <stefan@agner.ch>
Acked-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/gpio/gpio-lpc18xx.c    | 14 ++------------
 drivers/gpio/gpio-moxart.c     | 14 ++------------
 drivers/gpio/gpio-mvebu.c      | 14 ++------------
 drivers/gpio/gpio-tb10x.c      | 14 ++------------
 drivers/gpio/gpio-tz1090-pdc.c | 14 ++------------
 drivers/gpio/gpio-vf610.c      | 14 ++------------
 6 files changed, 12 insertions(+), 72 deletions(-)

diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index eb68603..e39dcb0 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -36,16 +36,6 @@ static inline struct lpc18xx_gpio_chip *to_lpc18xx_gpio(struct gpio_chip *chip)
 	return container_of(chip, struct lpc18xx_gpio_chip, gpio);
 }
 
-static int lpc18xx_gpio_request(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_request_gpio(offset);
-}
-
-static void lpc18xx_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	pinctrl_free_gpio(offset);
-}
-
 static void lpc18xx_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct lpc18xx_gpio_chip *gc = to_lpc18xx_gpio(chip);
@@ -95,8 +85,8 @@ static int lpc18xx_gpio_direction_output(struct gpio_chip *chip,
 
 static struct gpio_chip lpc18xx_chip = {
 	.label			= "lpc18xx/43xx-gpio",
-	.request		= lpc18xx_gpio_request,
-	.free			= lpc18xx_gpio_free,
+	.request		= gpiochip_generic_request,
+	.free			= gpiochip_generic_free,
 	.direction_input	= lpc18xx_gpio_direction_input,
 	.direction_output	= lpc18xx_gpio_direction_output,
 	.set			= lpc18xx_gpio_set,
diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index abd8676..d3355a6 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -29,16 +29,6 @@
 #define GPIO_DATA_IN		0x04
 #define GPIO_PIN_DIRECTION	0x08
 
-static int moxart_gpio_request(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_request_gpio(offset);
-}
-
-static void moxart_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	pinctrl_free_gpio(offset);
-}
-
 static int moxart_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -66,8 +56,8 @@ static int moxart_gpio_probe(struct platform_device *pdev)
 	}
 
 	bgc->gc.label = "moxart-gpio";
-	bgc->gc.request = moxart_gpio_request;
-	bgc->gc.free = moxart_gpio_free;
+	bgc->gc.request = gpiochip_generic_request;
+	bgc->gc.free = gpiochip_generic_free;
 	bgc->data = bgc->read_reg(bgc->reg_set);
 	bgc->gc.base = 0;
 	bgc->gc.ngpio = 32;
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index df418b8..d428b97 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -185,16 +185,6 @@ static void __iomem *mvebu_gpioreg_level_mask(struct mvebu_gpio_chip *mvchip)
  * Functions implementing the gpio_chip methods
  */
 
-static int mvebu_gpio_request(struct gpio_chip *chip, unsigned pin)
-{
-	return pinctrl_request_gpio(chip->base + pin);
-}
-
-static void mvebu_gpio_free(struct gpio_chip *chip, unsigned pin)
-{
-	pinctrl_free_gpio(chip->base + pin);
-}
-
 static void mvebu_gpio_set(struct gpio_chip *chip, unsigned pin, int value)
 {
 	struct mvebu_gpio_chip *mvchip =
@@ -709,8 +699,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	mvchip->soc_variant = soc_variant;
 	mvchip->chip.label = dev_name(&pdev->dev);
 	mvchip->chip.dev = &pdev->dev;
-	mvchip->chip.request = mvebu_gpio_request;
-	mvchip->chip.free = mvebu_gpio_free;
+	mvchip->chip.request = gpiochip_generic_request;
+	mvchip->chip.free = gpiochip_generic_free;
 	mvchip->chip.direction_input = mvebu_gpio_direction_input;
 	mvchip->chip.get = mvebu_gpio_get;
 	mvchip->chip.direction_output = mvebu_gpio_direction_output;
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 12c99d9..4356e6c 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -138,16 +138,6 @@ static int tb10x_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
-static int tb10x_gpio_request(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_request_gpio(chip->base + offset);
-}
-
-static void tb10x_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	pinctrl_free_gpio(chip->base + offset);
-}
-
 static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct tb10x_gpio *tb10x_gpio = to_tb10x_gpio(chip);
@@ -213,8 +203,8 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
 	tb10x_gpio->gc.get		= tb10x_gpio_get;
 	tb10x_gpio->gc.direction_output	= tb10x_gpio_direction_out;
 	tb10x_gpio->gc.set		= tb10x_gpio_set;
-	tb10x_gpio->gc.request		= tb10x_gpio_request;
-	tb10x_gpio->gc.free		= tb10x_gpio_free;
+	tb10x_gpio->gc.request		= gpiochip_generic_request;
+	tb10x_gpio->gc.free		= gpiochip_generic_free;
 	tb10x_gpio->gc.base		= -1;
 	tb10x_gpio->gc.ngpio		= ngpio;
 	tb10x_gpio->gc.can_sleep	= false;
diff --git a/drivers/gpio/gpio-tz1090-pdc.c b/drivers/gpio/gpio-tz1090-pdc.c
index ede7e40..3623d00 100644
--- a/drivers/gpio/gpio-tz1090-pdc.c
+++ b/drivers/gpio/gpio-tz1090-pdc.c
@@ -137,16 +137,6 @@ static void tz1090_pdc_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	__global_unlock2(lstat);
 }
 
-static int tz1090_pdc_gpio_request(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_request_gpio(chip->base + offset);
-}
-
-static void tz1090_pdc_gpio_free(struct gpio_chip *chip, unsigned int offset)
-{
-	pinctrl_free_gpio(chip->base + offset);
-}
-
 static int tz1090_pdc_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tz1090_pdc_gpio *priv = to_pdc(chip);
@@ -203,8 +193,8 @@ static int tz1090_pdc_gpio_probe(struct platform_device *pdev)
 	priv->chip.direction_output	= tz1090_pdc_gpio_direction_output;
 	priv->chip.get			= tz1090_pdc_gpio_get;
 	priv->chip.set			= tz1090_pdc_gpio_set;
-	priv->chip.free			= tz1090_pdc_gpio_free;
-	priv->chip.request		= tz1090_pdc_gpio_request;
+	priv->chip.free			= gpiochip_generic_free;
+	priv->chip.request		= gpiochip_generic_request;
 	priv->chip.to_irq		= tz1090_pdc_gpio_to_irq;
 	priv->chip.of_node		= np;
 
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index e1a3971..87b950c 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -82,16 +82,6 @@ static inline u32 vf610_gpio_readl(void __iomem *reg)
 	return readl_relaxed(reg);
 }
 
-static int vf610_gpio_request(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_request_gpio(chip->base + offset);
-}
-
-static void vf610_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	pinctrl_free_gpio(chip->base + offset);
-}
-
 static int vf610_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct vf610_gpio_port *port = to_vf610_gp(gc);
@@ -264,8 +254,8 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	gc->ngpio = VF610_GPIO_PER_PORT;
 	gc->base = of_alias_get_id(np, "gpio") * VF610_GPIO_PER_PORT;
 
-	gc->request = vf610_gpio_request;
-	gc->free = vf610_gpio_free;
+	gc->request = gpiochip_generic_request;
+	gc->free = gpiochip_generic_free;
 	gc->direction_input = vf610_gpio_direction_input;
 	gc->get = vf610_gpio_get;
 	gc->direction_output = vf610_gpio_direction_output;
-- 
2.1.4
