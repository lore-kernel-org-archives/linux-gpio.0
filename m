From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 108/182] pinctrl: spmi: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:32:40 +0100
Message-ID: <1449667960-2914-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:32800 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754214AbbLINcq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:32:46 -0500
Received: by lfaz4 with SMTP id z4so34302548lfa.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:32:44 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-spmi-gpio.c
index 3e5ccc76d59c..db079b20c837 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -158,11 +158,6 @@ static const char *const pmic_gpio_functions[] =3D=
 {
 	PMIC_GPIO_FUNC_DTEST3, PMIC_GPIO_FUNC_DTEST4,
 };
=20
-static inline struct pmic_gpio_state *to_gpio_state(struct gpio_chip *=
chip)
-{
-	return container_of(chip, struct pmic_gpio_state, chip);
-};
-
 static int pmic_gpio_read(struct pmic_gpio_state *state,
 			  struct pmic_gpio_pad *pad, unsigned int addr)
 {
@@ -495,7 +490,7 @@ static const struct pinconf_ops pmic_gpio_pinconf_o=
ps =3D {
=20
 static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned =
pin)
 {
-	struct pmic_gpio_state *state =3D to_gpio_state(chip);
+	struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
 	unsigned long config;
=20
 	config =3D pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
@@ -506,7 +501,7 @@ static int pmic_gpio_direction_input(struct gpio_ch=
ip *chip, unsigned pin)
 static int pmic_gpio_direction_output(struct gpio_chip *chip,
 				      unsigned pin, int val)
 {
-	struct pmic_gpio_state *state =3D to_gpio_state(chip);
+	struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
 	unsigned long config;
=20
 	config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
@@ -516,7 +511,7 @@ static int pmic_gpio_direction_output(struct gpio_c=
hip *chip,
=20
 static int pmic_gpio_get(struct gpio_chip *chip, unsigned pin)
 {
-	struct pmic_gpio_state *state =3D to_gpio_state(chip);
+	struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
 	struct pmic_gpio_pad *pad;
 	int ret;
=20
@@ -538,7 +533,7 @@ static int pmic_gpio_get(struct gpio_chip *chip, un=
signed pin)
=20
 static void pmic_gpio_set(struct gpio_chip *chip, unsigned pin, int va=
lue)
 {
-	struct pmic_gpio_state *state =3D to_gpio_state(chip);
+	struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
 	unsigned long config;
=20
 	config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
@@ -561,7 +556,7 @@ static int pmic_gpio_of_xlate(struct gpio_chip *chi=
p,
=20
 static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
 {
-	struct pmic_gpio_state *state =3D to_gpio_state(chip);
+	struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
 	struct pmic_gpio_pad *pad;
=20
 	pad =3D state->ctrl->desc->pins[pin].drv_data;
@@ -571,7 +566,7 @@ static int pmic_gpio_to_irq(struct gpio_chip *chip,=
 unsigned pin)
=20
 static void pmic_gpio_dbg_show(struct seq_file *s, struct gpio_chip *c=
hip)
 {
-	struct pmic_gpio_state *state =3D to_gpio_state(chip);
+	struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
 	unsigned i;
=20
 	for (i =3D 0; i < chip->ngpio; i++) {
@@ -771,7 +766,7 @@ static int pmic_gpio_probe(struct platform_device *=
pdev)
 	if (IS_ERR(state->ctrl))
 		return PTR_ERR(state->ctrl);
=20
-	ret =3D gpiochip_add(&state->chip);
+	ret =3D gpiochip_add_data(&state->chip, state);
 	if (ret) {
 		dev_err(state->dev, "can't add gpio chip\n");
 		goto err_chip;
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
