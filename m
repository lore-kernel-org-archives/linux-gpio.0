From: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Subject: [PATCH] pinctrl/amd: Remove the default de-bounce time
Date: Tue, 26 Jul 2016 08:28:19 +0000
Message-ID: <CY1PR12MB0042EA043E7E47E2DF8C211FDC0E0@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, SPG_Linux_Kernel <SPG_Linux_Kernel@amd.com>, "Xue, Ken" <Ken.Xue@amd.com>
Cc: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
List-Id: linux-gpio@vger.kernel.org

In the function amd_gpio_irq_enable and amd_gpio_direction_input, remov=
e the code which is setting the default de-bounce time to 2.75ms.

The driver code shall use the same settings as specified in BIOS.
Any default assignment impacts TouchPad behaviour when the LevelTrig is=
 set to EDGE FALLING.

Reviewed-by:=A0 Ken Xue <Ken.Xue@amd.com>
Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-am=
d.c index 634b4d3..828148d 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -43,16 +43,6 @@ static int amd_gpio_direction_input(struct gpio_chip=
 *gc, unsigned offset)
=20
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg =3D readl(gpio_dev->base + offset * 4);
-	/*
-	 * Suppose BIOS or Bootloader sets specific debounce for the
-	 * GPIO. if not, set debounce to be  2.75ms and remove glitch.
-	*/
-	if ((pin_reg & DB_TMR_OUT_MASK) =3D=3D 0) {
-		pin_reg |=3D 0xf;
-		pin_reg |=3D BIT(DB_TMR_OUT_UNIT_OFF);
-		pin_reg |=3D DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
-		pin_reg &=3D ~BIT(DB_TMR_LARGE_OFF);
-	}
=20
 	pin_reg &=3D ~BIT(OUTPUT_ENABLE_OFF);
 	writel(pin_reg, gpio_dev->base + offset * 4); @@ -326,15 +316,7 @@ st=
atic void amd_gpio_irq_enable(struct irq_data *d)
=20
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg =3D readl(gpio_dev->base + (d->hwirq)*4);
-	/*
-		Suppose BIOS or Bootloader sets specific debounce for the
-		GPIO. if not, set debounce to be  2.75ms.
-	*/
-	if ((pin_reg & DB_TMR_OUT_MASK) =3D=3D 0) {
-		pin_reg |=3D 0xf;
-		pin_reg |=3D BIT(DB_TMR_OUT_UNIT_OFF);
-		pin_reg &=3D ~BIT(DB_TMR_LARGE_OFF);
-	}
+
 	pin_reg |=3D BIT(INTERRUPT_ENABLE_OFF);
 	pin_reg |=3D BIT(INTERRUPT_MASK_OFF);
 	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
--
2.7.4
