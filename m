From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 111/182] pinctrl: ssbi-gpio: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:33:04 +0100
Message-ID: <1449667984-3057-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33028 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751883AbbLINdJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:33:09 -0500
Received: by lfaz4 with SMTP id z4so34310629lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:08 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-ssbi-gpio.c
index 7b80fa9c2049..d91572160a0e 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -443,7 +443,7 @@ static struct pinctrl_desc pm8xxx_pinctrl_desc =3D =
{
 static int pm8xxx_gpio_direction_input(struct gpio_chip *chip,
 				       unsigned offset)
 {
-	struct pm8xxx_gpio *pctrl =3D container_of(chip, struct pm8xxx_gpio, =
chip);
+	struct pm8xxx_gpio *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
 	u8 val;
=20
@@ -459,7 +459,7 @@ static int pm8xxx_gpio_direction_output(struct gpio=
_chip *chip,
 					unsigned offset,
 					int value)
 {
-	struct pm8xxx_gpio *pctrl =3D container_of(chip, struct pm8xxx_gpio, =
chip);
+	struct pm8xxx_gpio *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
 	u8 val;
=20
@@ -477,7 +477,7 @@ static int pm8xxx_gpio_direction_output(struct gpio=
_chip *chip,
=20
 static int pm8xxx_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct pm8xxx_gpio *pctrl =3D container_of(chip, struct pm8xxx_gpio, =
chip);
+	struct pm8xxx_gpio *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
 	bool state;
 	int ret;
@@ -495,7 +495,7 @@ static int pm8xxx_gpio_get(struct gpio_chip *chip, =
unsigned offset)
=20
 static void pm8xxx_gpio_set(struct gpio_chip *chip, unsigned offset, i=
nt value)
 {
-	struct pm8xxx_gpio *pctrl =3D container_of(chip, struct pm8xxx_gpio, =
chip);
+	struct pm8xxx_gpio *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
 	u8 val;
=20
@@ -524,7 +524,7 @@ static int pm8xxx_gpio_of_xlate(struct gpio_chip *c=
hip,
=20
 static int pm8xxx_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct pm8xxx_gpio *pctrl =3D container_of(chip, struct pm8xxx_gpio, =
chip);
+	struct pm8xxx_gpio *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
=20
 	return pin->irq;
@@ -539,7 +539,7 @@ static void pm8xxx_gpio_dbg_show_one(struct seq_fil=
e *s,
 				  unsigned offset,
 				  unsigned gpio)
 {
-	struct pm8xxx_gpio *pctrl =3D container_of(chip, struct pm8xxx_gpio, =
chip);
+	struct pm8xxx_gpio *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
=20
 	static const char * const modes[] =3D {
@@ -735,7 +735,7 @@ static int pm8xxx_gpio_probe(struct platform_device=
 *pdev)
 	pctrl->chip.of_gpio_n_cells =3D 2;
 	pctrl->chip.label =3D dev_name(pctrl->dev);
 	pctrl->chip.ngpio =3D pctrl->npins;
-	ret =3D gpiochip_add(&pctrl->chip);
+	ret =3D gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(&pdev->dev, "failed register gpiochip\n");
 		goto unregister_pinctrl;
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
