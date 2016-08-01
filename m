From: "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>
Subject: RE: [PATCH] pinctrl/amd: Remove the default de-bounce time
Date: Mon, 1 Aug 2016 06:38:27 +0000
Message-ID: <CY1PR12MB0042DD8942D0CC3A19FA01B4DC040@CY1PR12MB0042.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2nam03on0040.outbound.protection.outlook.com ([104.47.42.40]:47264
	"EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751132AbcHAGz0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Aug 2016 02:55:26 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, "Sen, Pankaj" <Pankaj.Sen@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Xue, Ken" <Ken.Xue@amd.com>, SPG_Linux_Kernel <SPG_Linux_Kernel@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

In the function amd_gpio_irq_enable and amd_gpio_direction_input, remove the code which is setting the default de-bounce time to 2.75ms.

The driver code shall use the same settings as specified in BIOS.
Any default assignment impacts TouchPad behaviour when the LevelTrig is set to EDGE FALLING.

Reviewed-by:  Ken Xue <Ken.Xue@amd.com>
Signed-off-by: Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c index 634b4d3..828148d 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -43,16 +43,6 @@ static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + offset * 4);
-	/*
-	 * Suppose BIOS or Bootloader sets specific debounce for the
-	 * GPIO. if not, set debounce to be  2.75ms and remove glitch.
-	*/
-	if ((pin_reg & DB_TMR_OUT_MASK) == 0) {
-		pin_reg |= 0xf;
-		pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
-		pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
-		pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
-	}
 
 	pin_reg &= ~BIT(OUTPUT_ENABLE_OFF);
 	writel(pin_reg, gpio_dev->base + offset * 4); @@ -326,15 +316,7 @@ static void amd_gpio_irq_enable(struct irq_data *d)
 
 	spin_lock_irqsave(&gpio_dev->lock, flags);
 	pin_reg = readl(gpio_dev->base + (d->hwirq)*4);
-	/*
-		Suppose BIOS or Bootloader sets specific debounce for the
-		GPIO. if not, set debounce to be  2.75ms.
-	*/
-	if ((pin_reg & DB_TMR_OUT_MASK) == 0) {
-		pin_reg |= 0xf;
-		pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
-		pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
-	}
+
 	pin_reg |= BIT(INTERRUPT_ENABLE_OFF);
 	pin_reg |= BIT(INTERRUPT_MASK_OFF);
 	writel(pin_reg, gpio_dev->base + (d->hwirq)*4);
--
2.7.4


Any comments or feedback on the above patch

