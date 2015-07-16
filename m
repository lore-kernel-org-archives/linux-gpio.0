From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 2/4] gpio: mpc8xxx: handle differences between incarnations at a single place
Date: Thu, 16 Jul 2015 21:08:22 +0200
Message-ID: <1437073704-13881-2-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:52623 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754262AbbGPTKB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 15:10:01 -0400
In-Reply-To: <1437073704-13881-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de

The gpio controllers that are handled by the mpc8xxx driver differ
slightly. Up to now some differences were handled by use of
of_device_is_compatible, others by use of struct of_device_id's data.

To make this consistent and easily extendable handle the differences at
a single place.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-mpc8xxx.c | 49 +++++++++++++++++++++++++++++++++++--=
--------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 0e2dbbb1645b..836494420a56 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -312,17 +312,13 @@ static struct irq_chip mpc8xxx_irq_chip =3D {
 	.irq_unmask	=3D mpc8xxx_irq_unmask,
 	.irq_mask	=3D mpc8xxx_irq_mask,
 	.irq_ack	=3D mpc8xxx_irq_ack,
+	/* this might get overwritten in mpc8xxx_probe() */
 	.irq_set_type	=3D mpc8xxx_irq_set_type,
 };
=20
 static int mpc8xxx_gpio_irq_map(struct irq_domain *h, unsigned int irq=
,
 				irq_hw_number_t hwirq)
 {
-	struct mpc8xxx_gpio_chip *mpc8xxx_gc =3D h->host_data;
-
-	if (mpc8xxx_gc->of_dev_id_data)
-		mpc8xxx_irq_chip.irq_set_type =3D mpc8xxx_gc->of_dev_id_data;
-
 	irq_set_chip_data(irq, h->host_data);
 	irq_set_chip_and_handler(irq, &mpc8xxx_irq_chip, handle_level_irq);
=20
@@ -334,11 +330,32 @@ static const struct irq_domain_ops mpc8xxx_gpio_i=
rq_ops =3D {
 	.xlate	=3D irq_domain_xlate_twocell,
 };
=20
+struct mpc8xxx_gpio_devtype {
+	int (*gpio_dir_out)(struct gpio_chip *, unsigned int, int);
+	int (*gpio_get)(struct gpio_chip *, unsigned int);
+	int (*irq_set_type)(struct irq_data *, unsigned int);
+};
+
+static const struct mpc8xxx_gpio_devtype mpc512x_gpio_devtype =3D {
+	.gpio_dir_out =3D mpc5121_gpio_dir_out,
+	.irq_set_type =3D mpc512x_irq_set_type,
+};
+
+static const struct mpc8xxx_gpio_devtype mpc8572_gpio_devtype =3D {
+	.gpio_get =3D mpc8572_gpio_get,
+};
+
+static const struct mpc8xxx_gpio_devtype mpc8xxx_gpio_devtype_default =
=3D {
+	.gpio_dir_out =3D mpc8xxx_gpio_dir_out,
+	.gpio_get =3D mpc8xxx_gpio_get,
+	.irq_set_type =3D mpc8xxx_irq_set_type,
+};
+
 static const struct of_device_id mpc8xxx_gpio_ids[] =3D {
 	{ .compatible =3D "fsl,mpc8349-gpio", },
-	{ .compatible =3D "fsl,mpc8572-gpio", },
+	{ .compatible =3D "fsl,mpc8572-gpio", .data =3D &mpc8572_gpio_devtype=
, },
 	{ .compatible =3D "fsl,mpc8610-gpio", },
-	{ .compatible =3D "fsl,mpc5121-gpio", .data =3D mpc512x_irq_set_type,=
 },
+	{ .compatible =3D "fsl,mpc5121-gpio", .data =3D &mpc512x_gpio_devtype=
, },
 	{ .compatible =3D "fsl,pq3-gpio",     },
 	{ .compatible =3D "fsl,qoriq-gpio",   },
 	{}
@@ -351,6 +368,8 @@ static int mpc8xxx_probe(struct platform_device *pd=
ev)
 	struct of_mm_gpio_chip *mm_gc;
 	struct gpio_chip *gc;
 	const struct of_device_id *id;
+	const struct mpc8xxx_gpio_devtype *devtype =3D
+		of_device_get_match_data(&pdev->dev);
 	int ret;
=20
 	mpc8xxx_gc =3D devm_kzalloc(&pdev->dev, sizeof(*mpc8xxx_gc), GFP_KERN=
EL);
@@ -367,10 +386,18 @@ static int mpc8xxx_probe(struct platform_device *=
pdev)
 	mm_gc->save_regs =3D mpc8xxx_gpio_save_regs;
 	gc->ngpio =3D MPC8XXX_GPIO_PINS;
 	gc->direction_input =3D mpc8xxx_gpio_dir_in;
-	gc->direction_output =3D of_device_is_compatible(np, "fsl,mpc5121-gpi=
o") ?
-		mpc5121_gpio_dir_out : mpc8xxx_gpio_dir_out;
-	gc->get =3D of_device_is_compatible(np, "fsl,mpc8572-gpio") ?
-		mpc8572_gpio_get : mpc8xxx_gpio_get;
+
+	if (!devtype)
+		devtype =3D &mpc8xxx_gpio_devtype_default;
+
+	/*
+	 * It's assumed that only a single type of gpio controller is availab=
le
+	 * on the current machine, so overwriting global data is fine.
+	 */
+	mpc8xxx_irq_chip.irq_set_type =3D devtype->irq_set_type;
+
+	gc->direction_output =3D devtype->gpio_dir_out ?: mpc8xxx_gpio_dir_ou=
t;
+	gc->get =3D devtype->gpio_get ?: mpc8xxx_gpio_get;
 	gc->set =3D mpc8xxx_gpio_set;
 	gc->set_multiple =3D mpc8xxx_gpio_set_multiple;
 	gc->to_irq =3D mpc8xxx_gpio_to_irq;
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
