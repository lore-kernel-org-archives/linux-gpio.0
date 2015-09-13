From: Jonas Gorski <jogo@openwrt.org>
Subject: [PATCH RFT 4/5] gpio: gpio-pl061: use the generic request/free implementations
Date: Sun, 13 Sep 2015 15:21:37 +0200
Message-ID: <1442150498-31116-5-git-send-email-jogo@openwrt.org>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:54568 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752455AbbIMNWt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 13 Sep 2015 09:22:49 -0400
In-Reply-To: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew

Instead of storing in the chip data whether the chip uses pinctrl and
conditionally call pinctrl_{request,free}_gpio, just don't populate
request/free in that case.

This makes the implementations trivial and the same as the generic
implementations, thus we can just use them.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 drivers/gpio/gpio-pl061.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 0475613..92a52ff 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -52,36 +52,12 @@ struct pl061_gpio {
 
 	void __iomem		*base;
 	struct gpio_chip	gc;
-	bool			uses_pinctrl;
 
 #ifdef CONFIG_PM
 	struct pl061_context_save_regs csave_regs;
 #endif
 };
 
-static int pl061_gpio_request(struct gpio_chip *gc, unsigned offset)
-{
-	/*
-	 * Map back to global GPIO space and request muxing, the direction
-	 * parameter does not matter for this controller.
-	 */
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
-	int gpio = gc->base + offset;
-
-	if (chip->uses_pinctrl)
-		return pinctrl_request_gpio(gpio);
-	return 0;
-}
-
-static void pl061_gpio_free(struct gpio_chip *gc, unsigned offset)
-{
-	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
-	int gpio = gc->base + offset;
-
-	if (chip->uses_pinctrl)
-		pinctrl_free_gpio(gpio);
-}
-
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
@@ -269,11 +245,11 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 		return PTR_ERR(chip->base);
 
 	spin_lock_init(&chip->lock);
-	if (of_property_read_bool(dev->of_node, "gpio-ranges"))
-		chip->uses_pinctrl = true;
+	if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
+		chip->gc.request = gpiochip_generic_request;
+		chip->gc.free = gpiochip_generic_free;
+	}
 
-	chip->gc.request = pl061_gpio_request;
-	chip->gc.free = pl061_gpio_free;
 	chip->gc.direction_input = pl061_direction_input;
 	chip->gc.direction_output = pl061_direction_output;
 	chip->gc.get = pl061_get_value;
-- 
2.1.4
