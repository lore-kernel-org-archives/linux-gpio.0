From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [PATCH v10 1/2] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Fri, 13 May 2016 23:07:11 +0200
Message-ID: <4af460fea30b60fbb1d621fcb568c5f3b04e1eee.1463172434.git.chunkeey@googlemail.com>
References: <cover.1463172434.git.chunkeey@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36440 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515AbcEMVH3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2016 17:07:29 -0400
In-Reply-To: <cover.1463172434.git.chunkeey@googlemail.com>
In-Reply-To: <cover.1463172434.git.chunkeey@googlemail.com>
References: <cover.1463172434.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Christian Lamparter <chunkeey@googlemail.com>

=46rom: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>

This patch adds support for defining memory-mapped GPIOs which
are compatible with the existing gpio-mmio interface. The generic
library provides support for many memory-mapped GPIO controllers
that are found in various on-board FPGA and ASIC solutions that
are used to control board's switches, LEDs, chip-selects,
Ethernet/USB PHY power, etc.

=46or setting GPIOs there are three configurations:
	1. single input/output register resource (named "dat"),
	2. set/clear pair (named "set" and "clr"),
	3. single output register resource and single input resource
	   ("set" and dat").

The configuration is detected by which resources are present.
=46or the single output register, this drives a 1 by setting a bit
and a zero by clearing a bit.  For the set clr pair, this drives
a 1 by setting a bit in the set register and clears it by setting
a bit in the clear register.

=46or setting the GPIO direction, there are three configurations:
	a. simple bidirectional GPIOs that requires no configuration.
	b. an output direction register (named "dirout")
	   where a 1 bit indicates the GPIO is an output.
	c. an input direction register (named "dirin")
	   where a 1 bit indicates the GPIO is an input.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/gpio/gpio-mmio.c | 47 ++++++++++++++++++++++++++++++++++++++++=
+++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 6c1cb3b..af583be 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -61,6 +61,8 @@ o        `                     ~~~~\___/~~~~    ` con=
troller in FPGA is ,.`
 #include <linux/bitops.h>
 #include <linux/platform_device.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
=20
 static void bgpio_write8(void __iomem *reg, unsigned long data)
 {
@@ -569,6 +571,37 @@ static void __iomem *bgpio_map(struct platform_dev=
ice *pdev,
 	return devm_ioremap_resource(&pdev->dev, r);
 }
=20
+#ifdef CONFIG_OF
+static const struct of_device_id bgpio_of_match[] =3D {
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bgpio_of_match);
+
+static struct bgpio_pdata *bgpio_parse_dt(struct platform_device *pdev=
,
+					  unsigned long *flags)
+{
+	struct bgpio_pdata *pdata;
+
+	if (!of_match_device(bgpio_of_match, &pdev->dev))
+		return NULL;
+
+	pdata =3D devm_kzalloc(&pdev->dev, sizeof(struct bgpio_pdata),
+			     GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+
+	pdata->base =3D -1;
+
+	return pdata;
+}
+#else
+static struct bgpio_pdata *bgpio_parse_dt(struct platform_device *pdev=
,
+					  unsigned long *flags)
+{
+	return NULL;
+}
+#endif /* CONFIG_OF */
+
 static int bgpio_pdev_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
@@ -579,10 +612,19 @@ static int bgpio_pdev_probe(struct platform_devic=
e *pdev)
 	void __iomem *dirout;
 	void __iomem *dirin;
 	unsigned long sz;
-	unsigned long flags =3D pdev->id_entry->driver_data;
+	unsigned long flags =3D 0;
 	int err;
 	struct gpio_chip *gc;
-	struct bgpio_pdata *pdata =3D dev_get_platdata(dev);
+	struct bgpio_pdata *pdata;
+
+	pdata =3D bgpio_parse_dt(pdev, &flags);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+
+	if (!pdata) {
+		pdata =3D dev_get_platdata(dev);
+		flags =3D pdev->id_entry->driver_data;
+	}
=20
 	r =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
 	if (!r)
@@ -646,6 +688,7 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
 static struct platform_driver bgpio_driver =3D {
 	.driver =3D {
 		.name =3D "basic-mmio-gpio",
+		.of_match_table =3D of_match_ptr(bgpio_of_match),
 	},
 	.id_table =3D bgpio_id_table,
 	.probe =3D bgpio_pdev_probe,
--=20
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
