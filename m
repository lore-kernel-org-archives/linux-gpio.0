From: Jonas Gorski <jogo@openwrt.org>
Subject: [PATCH V2 3/5] gpio: gpio-xz: use the generic request/free implementations
Date: Sun, 11 Oct 2015 17:34:17 +0200
Message-ID: <1444577659-17621-4-git-send-email-jogo@openwrt.org>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:54605 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751635AbbJKPit (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 11 Oct 2015 11:38:49 -0400
In-Reply-To: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>, Heiko

Instead of storing in the chip data whether the chip uses pinctrl and
conditionally call pinctrl_{request,free}_gpio, just don't populate
request/free in that case.

This makes the implementations trivial and the same as the generic
implementations, thus we can just use them.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 drivers/gpio/gpio-zx.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpio/gpio-zx.c b/drivers/gpio/gpio-zx.c
index 4b8a269..1dcf7a6 100644
--- a/drivers/gpio/gpio-zx.c
+++ b/drivers/gpio/gpio-zx.c
@@ -41,7 +41,6 @@ struct zx_gpio {
 
 	void __iomem		*base;
 	struct gpio_chip	gc;
-	bool			uses_pinctrl;
 };
 
 static inline struct zx_gpio *to_zx(struct gpio_chip *gc)
@@ -49,25 +48,6 @@ static inline struct zx_gpio *to_zx(struct gpio_chip *gc)
 	return container_of(gc, struct zx_gpio, gc);
 }
 
-static int zx_gpio_request(struct gpio_chip *gc, unsigned offset)
-{
-	struct zx_gpio *chip = to_zx(gc);
-	int gpio = gc->base + offset;
-
-	if (chip->uses_pinctrl)
-		return pinctrl_request_gpio(gpio);
-	return 0;
-}
-
-static void zx_gpio_free(struct gpio_chip *gc, unsigned offset)
-{
-	struct zx_gpio *chip = to_zx(gc);
-	int gpio = gc->base + offset;
-
-	if (chip->uses_pinctrl)
-		pinctrl_free_gpio(gpio);
-}
-
 static int zx_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	struct zx_gpio *chip = to_zx(gc);
@@ -252,12 +232,12 @@ static int zx_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->base);
 
 	spin_lock_init(&chip->lock);
-	if (of_property_read_bool(dev->of_node, "gpio-ranges"))
-		chip->uses_pinctrl = true;
+	if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
+		chip->gc.request = gpiochip_generic_request;
+		chip->gc.free = gpiochip_generic_free;
+	}
 
 	id = of_alias_get_id(dev->of_node, "gpio");
-	chip->gc.request = zx_gpio_request;
-	chip->gc.free = zx_gpio_free;
 	chip->gc.direction_input = zx_direction_input;
 	chip->gc.direction_output = zx_direction_output;
 	chip->gc.get = zx_get_value;
-- 
2.1.4
