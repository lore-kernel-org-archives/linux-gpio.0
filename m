From: Nava kishore Manne <nava.manne@xilinx.com>
Subject: [PATCH v3] gpio: Added zynq specific check for special pins on bank zero
Date: Fri, 23 Sep 2016 16:56:58 +0530
Message-ID: <1474630018-9986-1-git-send-email-navam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2nam01on0054.outbound.protection.outlook.com ([104.47.34.54]:60736
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755175AbcIWL1S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Sep 2016 07:27:18 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nava kishore Manne <nava.manne@xilinx.com>, Nava kishore Manne <navam@xilinx.com>

From: Nava kishore Manne <nava.manne@xilinx.com>

This patch adds zynq specific check for bank 0 pins 7 and 8
are special and cannot be used as inputs

Signed-off-by: Nava kishore Manne <navam@xilinx.com>
Reported-by: Jonas Karlsson <Jonas.d.karlsson@gmail.com>
Acked-by: S=C3=B6ren Brinkmann <soren.brinkmann@xilinx.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
Changes for v3:
		-Fixed some minor comments.
Changes for v2:
                -Removed un-used quirks for zynqmp.

 drivers/gpio/gpio-zynq.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index e72794e..6b4d10d 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -96,6 +96,9 @@
 /* GPIO upper 16 bit mask */
 #define ZYNQ_GPIO_UPPER_MASK 0xFFFF0000
=20
+/* For GPIO quirks */
+#define ZYNQ_GPIO_QUIRK_FOO	BIT(0)
+
 /**
  * struct zynq_gpio - gpio device private data structure
  * @chip:	instance of the gpio_chip
@@ -122,6 +125,7 @@ struct zynq_gpio {
 */
 struct zynq_platform_data {
 	const char *label;
+	u32 quirks;
 	u16 ngpio;
 	int max_bank;
 	int bank_min[ZYNQMP_GPIO_MAX_BANK];
@@ -238,13 +242,19 @@ static void zynq_gpio_set_value(struct gpio_chip *c=
hip, unsigned int pin,
 static int zynq_gpio_dir_in(struct gpio_chip *chip, unsigned int pin)
 {
 	u32 reg;
+	bool is_zynq_gpio;
 	unsigned int bank_num, bank_pin_num;
 	struct zynq_gpio *gpio =3D gpiochip_get_data(chip);
=20
+	is_zynq_gpio =3D gpio->p_data->quirks & ZYNQ_GPIO_QUIRK_FOO;
 	zynq_gpio_get_bank_pin(pin, &bank_num, &bank_pin_num, gpio);
=20
-	/* bank 0 pins 7 and 8 are special and cannot be used as inputs */
-	if (bank_num =3D=3D 0 && (bank_pin_num =3D=3D 7 || bank_pin_num =3D=3D =
8))
+	/*
+	 * On zynq bank 0 pins 7 and 8 are special and cannot be used
+	 * as inputs.
+	 */
+	if (is_zynq_gpio && bank_num =3D=3D 0 &&
+		(bank_pin_num =3D=3D 7 || bank_pin_num =3D=3D 8))
 		return -EINVAL;
=20
 	/* clear the bit in direction mode reg to set the pin as input */
@@ -627,6 +637,7 @@ static const struct zynq_platform_data zynqmp_gpio_de=
f =3D {
=20
 static const struct zynq_platform_data zynq_gpio_def =3D {
 	.label =3D "zynq_gpio",
+	.quirks =3D ZYNQ_GPIO_QUIRK_FOO,
 	.ngpio =3D ZYNQ_GPIO_NR_GPIOS,
 	.max_bank =3D ZYNQ_GPIO_MAX_BANK,
 	.bank_min[0] =3D ZYNQ_GPIO_BANK0_PIN_MIN(),
--=20
2.1.2

