From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 110/182] pinctrl: ssbi-mpp: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:32:57 +0100
Message-ID: <1449667977-3010-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:33488 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753962AbbLINdB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:33:01 -0500
Received: by lbbkw15 with SMTP id kw15so30052334lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:33:00 -0800 (PST)
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
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/=
qcom/pinctrl-ssbi-mpp.c
index 7bc1e0f27447..9b8de2da2451 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -448,7 +448,7 @@ static struct pinctrl_desc pm8xxx_pinctrl_desc =3D =
{
 static int pm8xxx_mpp_direction_input(struct gpio_chip *chip,
 				       unsigned offset)
 {
-	struct pm8xxx_mpp *pctrl =3D container_of(chip, struct pm8xxx_mpp, ch=
ip);
+	struct pm8xxx_mpp *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
=20
 	switch (pin->mode) {
@@ -472,7 +472,7 @@ static int pm8xxx_mpp_direction_output(struct gpio_=
chip *chip,
 					unsigned offset,
 					int value)
 {
-	struct pm8xxx_mpp *pctrl =3D container_of(chip, struct pm8xxx_mpp, ch=
ip);
+	struct pm8xxx_mpp *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
=20
 	switch (pin->mode) {
@@ -496,7 +496,7 @@ static int pm8xxx_mpp_direction_output(struct gpio_=
chip *chip,
=20
 static int pm8xxx_mpp_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct pm8xxx_mpp *pctrl =3D container_of(chip, struct pm8xxx_mpp, ch=
ip);
+	struct pm8xxx_mpp *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
 	bool state;
 	int ret;
@@ -513,7 +513,7 @@ static int pm8xxx_mpp_get(struct gpio_chip *chip, u=
nsigned offset)
=20
 static void pm8xxx_mpp_set(struct gpio_chip *chip, unsigned offset, in=
t value)
 {
-	struct pm8xxx_mpp *pctrl =3D container_of(chip, struct pm8xxx_mpp, ch=
ip);
+	struct pm8xxx_mpp *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
=20
 	pin->output_value =3D !!value;
@@ -537,7 +537,7 @@ static int pm8xxx_mpp_of_xlate(struct gpio_chip *ch=
ip,
=20
 static int pm8xxx_mpp_to_irq(struct gpio_chip *chip, unsigned offset)
 {
-	struct pm8xxx_mpp *pctrl =3D container_of(chip, struct pm8xxx_mpp, ch=
ip);
+	struct pm8xxx_mpp *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
=20
 	return pin->irq;
@@ -552,7 +552,7 @@ static void pm8xxx_mpp_dbg_show_one(struct seq_file=
 *s,
 				  unsigned offset,
 				  unsigned gpio)
 {
-	struct pm8xxx_mpp *pctrl =3D container_of(chip, struct pm8xxx_mpp, ch=
ip);
+	struct pm8xxx_mpp *pctrl =3D gpiochip_get_data(chip);
 	struct pm8xxx_pin_data *pin =3D pctrl->desc.pins[offset].drv_data;
=20
 	static const char * const aout_lvls[] =3D {
@@ -826,7 +826,7 @@ static int pm8xxx_mpp_probe(struct platform_device =
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
