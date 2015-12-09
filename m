From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 109/182] pinctrl: spmi-mpp: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:32:49 +0100
Message-ID: <1449667969-2961-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35944 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754496AbbLINcy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:32:54 -0500
Received: by lfs39 with SMTP id 39so34459796lfs.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:32:53 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/=
qcom/pinctrl-spmi-mpp.c
index 69c14ba177d0..0f3a7fafaca3 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -178,11 +178,6 @@ static const char *const pmic_mpp_functions[] =3D =
{
 	"digital", "analog", "sink"
 };
=20
-static inline struct pmic_mpp_state *to_mpp_state(struct gpio_chip *ch=
ip)
-{
-	return container_of(chip, struct pmic_mpp_state, chip);
-};
-
 static int pmic_mpp_read(struct pmic_mpp_state *state,
 			 struct pmic_mpp_pad *pad, unsigned int addr)
 {
@@ -556,7 +551,7 @@ static const struct pinconf_ops pmic_mpp_pinconf_op=
s =3D {
=20
 static int pmic_mpp_direction_input(struct gpio_chip *chip, unsigned p=
in)
 {
-	struct pmic_mpp_state *state =3D to_mpp_state(chip);
+	struct pmic_mpp_state *state =3D gpiochip_get_data(chip);
 	unsigned long config;
=20
 	config =3D pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
@@ -567,7 +562,7 @@ static int pmic_mpp_direction_input(struct gpio_chi=
p *chip, unsigned pin)
 static int pmic_mpp_direction_output(struct gpio_chip *chip,
 				     unsigned pin, int val)
 {
-	struct pmic_mpp_state *state =3D to_mpp_state(chip);
+	struct pmic_mpp_state *state =3D gpiochip_get_data(chip);
 	unsigned long config;
=20
 	config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT, val);
@@ -577,7 +572,7 @@ static int pmic_mpp_direction_output(struct gpio_ch=
ip *chip,
=20
 static int pmic_mpp_get(struct gpio_chip *chip, unsigned pin)
 {
-	struct pmic_mpp_state *state =3D to_mpp_state(chip);
+	struct pmic_mpp_state *state =3D gpiochip_get_data(chip);
 	struct pmic_mpp_pad *pad;
 	int ret;
=20
@@ -596,7 +591,7 @@ static int pmic_mpp_get(struct gpio_chip *chip, uns=
igned pin)
=20
 static void pmic_mpp_set(struct gpio_chip *chip, unsigned pin, int val=
ue)
 {
-	struct pmic_mpp_state *state =3D to_mpp_state(chip);
+	struct pmic_mpp_state *state =3D gpiochip_get_data(chip);
 	unsigned long config;
=20
 	config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT, value);
@@ -619,7 +614,7 @@ static int pmic_mpp_of_xlate(struct gpio_chip *chip=
,
=20
 static int pmic_mpp_to_irq(struct gpio_chip *chip, unsigned pin)
 {
-	struct pmic_mpp_state *state =3D to_mpp_state(chip);
+	struct pmic_mpp_state *state =3D gpiochip_get_data(chip);
 	struct pmic_mpp_pad *pad;
=20
 	pad =3D state->ctrl->desc->pins[pin].drv_data;
@@ -629,7 +624,7 @@ static int pmic_mpp_to_irq(struct gpio_chip *chip, =
unsigned pin)
=20
 static void pmic_mpp_dbg_show(struct seq_file *s, struct gpio_chip *ch=
ip)
 {
-	struct pmic_mpp_state *state =3D to_mpp_state(chip);
+	struct pmic_mpp_state *state =3D gpiochip_get_data(chip);
 	unsigned i;
=20
 	for (i =3D 0; i < chip->ngpio; i++) {
@@ -873,7 +868,7 @@ static int pmic_mpp_probe(struct platform_device *p=
dev)
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
