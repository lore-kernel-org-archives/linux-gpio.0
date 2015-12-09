From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 107/182] pinctrl: msm: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:32:33 +0100
Message-ID: <1449667953-2847-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35800 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754153AbbLINci (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:32:38 -0500
Received: by lfdl133 with SMTP id l133so34123994lfd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:32:36 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bj=C3=B6rn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/=
pinctrl-msm.c
index af2a13040898..8777cf083eef 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -69,11 +69,6 @@ struct msm_pinctrl {
 	void __iomem *regs;
 };
=20
-static inline struct msm_pinctrl *to_msm_pinctrl(struct gpio_chip *gc)
-{
-	return container_of(gc, struct msm_pinctrl, chip);
-}
-
 static int msm_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct msm_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
@@ -381,7 +376,7 @@ static struct pinctrl_desc msm_pinctrl_desc =3D {
 static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned o=
ffset)
 {
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl =3D container_of(chip, struct msm_pinctrl, =
chip);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 val;
=20
@@ -401,7 +396,7 @@ static int msm_gpio_direction_input(struct gpio_chi=
p *chip, unsigned offset)
 static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned =
offset, int value)
 {
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl =3D container_of(chip, struct msm_pinctrl, =
chip);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 val;
=20
@@ -428,7 +423,7 @@ static int msm_gpio_direction_output(struct gpio_ch=
ip *chip, unsigned offset, in
 static int msm_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl =3D container_of(chip, struct msm_pinctrl, =
chip);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(chip);
 	u32 val;
=20
 	g =3D &pctrl->soc->groups[offset];
@@ -440,7 +435,7 @@ static int msm_gpio_get(struct gpio_chip *chip, uns=
igned offset)
 static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int =
value)
 {
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl =3D container_of(chip, struct msm_pinctrl, =
chip);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(chip);
 	unsigned long flags;
 	u32 val;
=20
@@ -468,7 +463,7 @@ static void msm_gpio_dbg_show_one(struct seq_file *=
s,
 				  unsigned gpio)
 {
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl =3D container_of(chip, struct msm_pinctrl, =
chip);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(chip);
 	unsigned func;
 	int is_out;
 	int drive;
@@ -567,7 +562,7 @@ static void msm_gpio_update_dual_edge_pos(struct ms=
m_pinctrl *pctrl,
 static void msm_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
-	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val;
@@ -588,7 +583,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
-	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val;
@@ -613,7 +608,7 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 static void msm_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
-	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val;
@@ -638,7 +633,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type=
)
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
-	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val;
@@ -732,7 +727,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d=
, unsigned int type)
 static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
-	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
 	unsigned long flags;
=20
 	spin_lock_irqsave(&pctrl->lock, flags);
@@ -757,7 +752,7 @@ static void msm_gpio_irq_handler(struct irq_desc *d=
esc)
 {
 	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
 	const struct msm_pingroup *g;
-	struct msm_pinctrl *pctrl =3D to_msm_pinctrl(gc);
+	struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
 	struct irq_chip *chip =3D irq_desc_get_chip(desc);
 	int irq_pin;
 	int handled =3D 0;
@@ -804,7 +799,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	chip->owner =3D THIS_MODULE;
 	chip->of_node =3D pctrl->dev->of_node;
=20
-	ret =3D gpiochip_add(&pctrl->chip);
+	ret =3D gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
 		dev_err(pctrl->dev, "Failed register gpiochip\n");
 		return ret;
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
