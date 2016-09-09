From: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Subject: [PATCH] pinctrl/amd: Configure GPIO register using BIOS settings
Date: Fri, 9 Sep 2016 15:18:09 +0000
Message-ID: <CY1PR12MB0042D650A9FCDC4B1676FB0EDCFA0@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-dm3nam03on0075.outbound.protection.outlook.com ([104.47.41.75]:56048
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752015AbcIIRxz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Sep 2016 13:53:55 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


In the function amd_gpio_irq_set_type, use the settings provided by
the BIOS,when the LevelTrig is Edge and activeLevel is HIGH, to configure
the GPIO registers. Ignore the settings from client.

Reviewed-by: Pankaj Sen <Pankaj.Sen@amd.com>
Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 828148d..6408dda 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -384,6 +384,8 @@ static int amd_gpio_irq_set_type(struct irq_data *d, un=
signed int type)
 {
 	int ret =3D 0;
 	u32 pin_reg;
+	bool level_trig;
+	u32 active_level;
 	unsigned long flags;
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev =3D gpiochip_get_data(gc);
@@ -391,6 +393,18 @@ static int amd_gpio_irq_set_type(struct irq_data *d, u=
nsigned int type)
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg =3D readl(gpio_dev->base + (d->hwirq)*4);
=20
+	/*
+	* Use the settings provided by the BIOS, when the LevelTrig is
+	* EDGE and the activeLevel is HIGH, ignore the settings coming
+	* from the client to configure the GPIO register.
+	*/
+	level_trig =3D !(pin_reg & (LEVEL_TRIGGER << LEVEL_TRIG_OFF));
+	active_level =3D pin_reg & (ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
+
+	if (level_trig && ((active_level >> ACTIVE_LEVEL_OFF) =3D=3D ACTIVE_HIGH)=
) {
+		type =3D IRQ_TYPE_EDGE_FALLING;
+	}
+
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
 		pin_reg &=3D ~BIT(LEVEL_TRIG_OFF);
--=20
2.7.4
