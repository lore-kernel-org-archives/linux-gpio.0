From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 042/182] gpio: mpc8xxx: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:18:37 +0100
Message-ID: <1449667117-31740-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:34648 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751673AbbLINSm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:18:42 -0500
Received: by lffu14 with SMTP id u14so34045936lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:18:40 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexander Stein <alexander.stein@systec-electronic.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-mpc8xxx.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 48ef368347ab..34b6ebe63638 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -49,15 +49,9 @@ static inline u32 mpc8xxx_gpio2mask(unsigned int gpi=
o)
 	return 1u << (MPC8XXX_GPIO_PINS - 1 - gpio);
 }
=20
-static inline struct mpc8xxx_gpio_chip *
-to_mpc8xxx_gpio_chip(struct of_mm_gpio_chip *mm)
-{
-	return container_of(mm, struct mpc8xxx_gpio_chip, mm_gc);
-}
-
 static void mpc8xxx_gpio_save_regs(struct of_mm_gpio_chip *mm)
 {
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D to_mpc8xxx_gpio_chip(mm);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(&mm->gc);
=20
 	mpc8xxx_gc->data =3D in_be32(mm->regs + GPIO_DAT);
 }
@@ -71,7 +65,7 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, uns=
igned int gpio)
 {
 	u32 val;
 	struct of_mm_gpio_chip *mm =3D to_of_mm_gpio_chip(gc);
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D to_mpc8xxx_gpio_chip(mm);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(gc);
 	u32 out_mask, out_shadow;
=20
 	out_mask =3D in_be32(mm->regs + GPIO_DIR);
@@ -92,7 +86,7 @@ static int mpc8xxx_gpio_get(struct gpio_chip *gc, uns=
igned int gpio)
 static void mpc8xxx_gpio_set(struct gpio_chip *gc, unsigned int gpio, =
int val)
 {
 	struct of_mm_gpio_chip *mm =3D to_of_mm_gpio_chip(gc);
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D to_mpc8xxx_gpio_chip(mm);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(gc);
 	unsigned long flags;
=20
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
@@ -111,7 +105,7 @@ static void mpc8xxx_gpio_set_multiple(struct gpio_c=
hip *gc,
 				      unsigned long *mask, unsigned long *bits)
 {
 	struct of_mm_gpio_chip *mm =3D to_of_mm_gpio_chip(gc);
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D to_mpc8xxx_gpio_chip(mm);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(gc);
 	unsigned long flags;
 	int i;
=20
@@ -136,7 +130,7 @@ static void mpc8xxx_gpio_set_multiple(struct gpio_c=
hip *gc,
 static int mpc8xxx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio=
)
 {
 	struct of_mm_gpio_chip *mm =3D to_of_mm_gpio_chip(gc);
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D to_mpc8xxx_gpio_chip(mm);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(gc);
 	unsigned long flags;
=20
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
@@ -151,7 +145,7 @@ static int mpc8xxx_gpio_dir_in(struct gpio_chip *gc=
, unsigned int gpio)
 static int mpc8xxx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpi=
o, int val)
 {
 	struct of_mm_gpio_chip *mm =3D to_of_mm_gpio_chip(gc);
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D to_mpc8xxx_gpio_chip(mm);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(gc);
 	unsigned long flags;
=20
 	mpc8xxx_gpio_set(gc, gpio, val);
@@ -185,8 +179,7 @@ static int mpc5125_gpio_dir_out(struct gpio_chip *g=
c, unsigned int gpio, int val
=20
 static int mpc8xxx_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
 {
-	struct of_mm_gpio_chip *mm =3D to_of_mm_gpio_chip(gc);
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D to_mpc8xxx_gpio_chip(mm);
+	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D gpiochip_get_data(gc);
=20
 	if (mpc8xxx_gc->irq && offset < MPC8XXX_GPIO_PINS)
 		return irq_create_mapping(mpc8xxx_gc->irq, offset);
@@ -417,7 +410,7 @@ static int mpc8xxx_probe(struct platform_device *pd=
ev)
 	gc->set_multiple =3D mpc8xxx_gpio_set_multiple;
 	gc->to_irq =3D mpc8xxx_gpio_to_irq;
=20
-	ret =3D of_mm_gpiochip_add(np, mm_gc);
+	ret =3D of_mm_gpiochip_add_data(np, mm_gc, mpc8xxx_gc);
 	if (ret)
 		return ret;
=20
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
