From: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Subject: [PATCH] pinctrl/amd: Configure GPIO register using BIOS settings
Date: Wed, 31 Aug 2016 08:50:49 +0000
Message-ID: <CY1PR12MB00420E90B52B0F478D9DF1CDDCE30@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0071.outbound.protection.outlook.com ([104.47.38.71]:30336
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1757955AbcHaJYv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Aug 2016 05:24:51 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>


In the function amd_gpio_irq_set_type, use the settings provided by
the BIOS,when the LevelTrig is Edge and activeLevel is HIGH, to configure
the GPIO registers. Ignore the settings from client.

Reviewed-by:Pankaj Sen <Pankaj.Sen@amd.com>
Signed-off-by:Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 828148d..a645082 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -385,12 +385,26 @@ static int amd_gpio_irq_set_type(struct irq_data *d, =
unsigned int type)
 	int ret =3D 0;
 	u32 pin_reg;
 	unsigned long flags;
+        u32 levelTrig;
+        u32 activeLevel;
 	struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
 	struct amd_gpio *gpio_dev =3D gpiochip_get_data(gc);
=20
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg =3D readl(gpio_dev->base + (d->hwirq)*4);
=20
+        /*
+         When LevelTrig is set EDGE and activeLevel is set HIGH in BIOS
+         default settings, ignore incoming settings from client and use
+         BIOS settings to configure GPIO register.
+        */
+        levelTrig =3D pin_reg & (LEVEL_TRIGGER << LEVEL_TRIG_OFF);
+        activeLevel =3D pin_reg & (ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
+
+        if((!levelTrig)&&((activeLevel>> ACTIVE_LEVEL_OFF) =3D=3D ACTIVE_H=
IGH)) {
+           type =3D IRQ_TYPE_EDGE_FALLING;
+        }
+
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_RISING:
 		pin_reg &=3D ~BIT(LEVEL_TRIG_OFF);
--=20
2.7.4

