From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 027/182] gpio: it87: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:16:29 +0100
Message-ID: <1449666989-31028-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36312 "EHLO
	mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753145AbbLINQe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:16:34 -0500
Received: by lfs39 with SMTP id 39so34140397lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:16:33 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Diego Elio Petten=C3=B2 <flameeyes@flameeyes.eu>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-it87.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index 21f6f7c0eb34..b219c82414bf 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -77,11 +77,6 @@ static struct it87_gpio it87_gpio_chip =3D {
 	.lock =3D __SPIN_LOCK_UNLOCKED(it87_gpio_chip.lock),
 };
=20
-static inline struct it87_gpio *to_it87_gpio(struct gpio_chip *chip)
-{
-	return container_of(chip, struct it87_gpio, chip);
-}
-
 /* Superio chip access functions; copied from wdt_it87 */
=20
 static inline int superio_enter(void)
@@ -165,7 +160,7 @@ static int it87_gpio_request(struct gpio_chip *chip=
, unsigned gpio_num)
 {
 	u8 mask, group;
 	int rc =3D 0;
-	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+	struct it87_gpio *it87_gpio =3D gpiochip_get_data(chip);
=20
 	mask =3D 1 << (gpio_num % 8);
 	group =3D (gpio_num / 8);
@@ -198,7 +193,7 @@ static int it87_gpio_get(struct gpio_chip *chip, un=
signed gpio_num)
 {
 	u16 reg;
 	u8 mask;
-	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+	struct it87_gpio *it87_gpio =3D gpiochip_get_data(chip);
=20
 	mask =3D 1 << (gpio_num % 8);
 	reg =3D (gpio_num / 8) + it87_gpio->io_base;
@@ -210,7 +205,7 @@ static int it87_gpio_direction_in(struct gpio_chip =
*chip, unsigned gpio_num)
 {
 	u8 mask, group;
 	int rc =3D 0;
-	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+	struct it87_gpio *it87_gpio =3D gpiochip_get_data(chip);
=20
 	mask =3D 1 << (gpio_num % 8);
 	group =3D (gpio_num / 8);
@@ -236,7 +231,7 @@ static void it87_gpio_set(struct gpio_chip *chip,
 {
 	u8 mask, curr_vals;
 	u16 reg;
-	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+	struct it87_gpio *it87_gpio =3D gpiochip_get_data(chip);
=20
 	mask =3D 1 << (gpio_num % 8);
 	reg =3D (gpio_num / 8) + it87_gpio->io_base;
@@ -253,7 +248,7 @@ static int it87_gpio_direction_out(struct gpio_chip=
 *chip,
 {
 	u8 mask, group;
 	int rc =3D 0;
-	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+	struct it87_gpio *it87_gpio =3D gpiochip_get_data(chip);
=20
 	mask =3D 1 << (gpio_num % 8);
 	group =3D (gpio_num / 8);
@@ -380,7 +375,7 @@ static int __init it87_gpio_init(void)
=20
 	it87_gpio->chip.names =3D (const char *const*)labels_table;
=20
-	rc =3D gpiochip_add(&it87_gpio->chip);
+	rc =3D gpiochip_add_data(&it87_gpio->chip, it87_gpio);
 	if (rc)
 		goto labels_free;
=20
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
