From: =?UTF-8?q?Timo=20Ter=C3=A4s?= <timo.teras@iki.fi>
Subject: [PATCH] gpio: mcp23s08: support setting pullups from device tree data
Date: Fri,  4 Dec 2015 13:46:13 +0200
Message-ID: <1449229573-25759-1-git-send-email-timo.teras@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:33231 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755388AbbLDLqb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 06:46:31 -0500
Received: by lbbkw15 with SMTP id kw15so18939746lbb.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2015 03:46:30 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: =?UTF-8?q?Timo=20Ter=C3=A4s?= <timo.teras@iki.fi>

Make pullup configurable from device tree data.

Signed-off-by: Timo Ter=C3=A4s <timo.teras@iki.fi>
---
I'm not fully certain how the pullup data should be made configurable v=
ia OF.
gpio-twl4030.c uses similar approach as this, but gpio-samsung.c makes =
the
pullup configuration seems to be part of the custom data in gpio specif=
iers.

 Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt |  1 +
 drivers/gpio/gpio-mcp23s08.c                             | 14 ++++++++=
+++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt b=
/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
index f3332b9..c7d2128 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt
@@ -59,6 +59,7 @@ Optional device specific properties:
         On devices with only one interrupt output this property is use=
less.
 - microchip,irq-active-high: Sets the INTPOL flag in the IOCON registe=
r. This
         configures the IRQ output polarity as active high.
+- microchip,pullups: Configuration value for GPPU register.
=20
 Example I2C (with interrupt):
 gpiom1: gpio@20 {
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.=
c
index 73db7ec..2320230 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -786,9 +786,12 @@ static int mcp230xx_probe(struct i2c_client *clien=
t,
 	match =3D of_match_device(of_match_ptr(mcp23s08_i2c_of_match),
 					&client->dev);
 	if (match) {
+		u32 pullups =3D 0;
 		pdata =3D &local_pdata;
 		pdata->base =3D -1;
-		pdata->chip[0].pullups =3D 0;
+		of_property_read_u32(client->dev.of_node, "microchip,pullups",
+				     &pullups);
+		pdata->chip[0].pullups =3D pullups;
 		pdata->irq_controller =3D	of_property_read_bool(
 					client->dev.of_node,
 					"interrupt-controller");
@@ -910,9 +913,14 @@ static int mcp23s08_probe(struct spi_device *spi)
 		pdata =3D &local_pdata;
 		pdata->base =3D -1;
 		for (addr =3D 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
-			pdata->chip[addr].pullups =3D 0;
-			if (spi_present_mask & (1 << addr))
+			u32 pullups =3D 0;
+			if (spi_present_mask & (1 << addr)) {
+				of_property_read_u32_index(spi->dev.of_node,
+							   "microchip,pullups",
+							   addr, &pullups);
 				chips++;
+			}
+			pdata->chip[addr].pullups =3D pullups;
 		}
 		pdata->irq_controller =3D	of_property_read_bool(
 					spi->dev.of_node,
--=20
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
