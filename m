From: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Subject: RE: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Fri, 26 May 2017 04:51:32 +0000
Message-ID: <BLUPR12MB07212D4797B68DB06C3A6D40A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
References: <alpine.DEB.2.20.1705232307330.2409@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-co1nam03on0084.outbound.protection.outlook.com ([104.47.40.84]:31699
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752520AbdEZEvk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 May 2017 00:51:40 -0400
In-Reply-To: <alpine.DEB.2.20.1705232307330.2409@nanos>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "Xue, Ken" <Ken.Xue@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>

Hi Thomas,

Thanks for the patch. However, we have received this issue from multiple pe=
ople and different disro but it occurs only on Gigabyte hardware. With refe=
rence AM4 ryzen board we are not facing this issue.
We are in discussion with gigabyte to check the BIOS part. Once we have cla=
rity on that, we can consider driver part. Also, this code is running on mu=
ltiple platform of different customers so changing directly at this point o=
f time may be risky in my point of view. Requesting you to hold this patch =
till we get clarity on bios end.

Thanks for your understanding.

Regards

Nehal

-----Original Message-----
From: linux-gpio-owner@vger.kernel.org [mailto:linux-gpio-owner@vger.kernel=
.org] On Behalf Of Thomas Gleixner
Sent: Wednesday, May 24, 2017 2:54 AM
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; B=
orislav Petkov <bp@alien8.de>; Xue, Ken <Ken.Xue@amd.com>
Subject: [PATCH] pinctrl/amd: Use regular interrupt instead of chained

The AMD pinctrl driver uses a chained interrupt to demultiplex the GPIO int=
errupts. Kevin Vandeventer reported, that his new AMD Ryzen locks up hard o=
n boot when the AMD pinctrl driver is initialized. The reason is an interru=
pt storm. It's not clear whether that's caused by hardware or firmware or b=
oth.

Using chained interrupts on X86 is a dangerous endavour. If a system is mis=
configured or the hardware buggy there is no safety net to catch an interru=
pt storm.

Convert the driver to use a regular interrupt for the demultiplex handler. =
This allows the interrupt storm detector to catch the malfunction and lets =
the system boot up.

This should be backported to stable because it's likely that more users run=
 into this problem as the AMD Ryzen machines are spreading.

Reported-by: Kevin Vandeventer
Link: https://bugzilla.suse.com/show_bug.cgi?id=3D1034261
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pinctrl/pinctrl-amd.c |   91 ++++++++++++++++++-------------------=
-----
 1 file changed, 41 insertions(+), 50 deletions(-)

--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -495,64 +495,54 @@ static struct irq_chip amd_gpio_irqchip
 	.flags        =3D IRQCHIP_SKIP_SET_WAKE,
 };
=20
-static void amd_gpio_irq_handler(struct irq_desc *desc)
+#define PIN_IRQ_PENDING	(BIT(INTERRUPT_STS_OFF) | BIT(WAKE_STS_OFF))
+
+static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
 {
-	u32 i;
-	u32 off;
-	u32 reg;
-	u32 pin_reg;
-	u64 reg64;
-	int handled =3D 0;
-	unsigned int irq;
+	struct amd_gpio *gpio_dev =3D dev_id;
+	struct gpio_chip *gc =3D &gpio_dev->gc;
+	irqreturn_t ret =3D IRQ_NONE;
+	unsigned int i, irqnr;
 	unsigned long flags;
-	struct irq_chip *chip =3D irq_desc_get_chip(desc);
-	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
-	struct amd_gpio *gpio_dev =3D gpiochip_get_data(gc);
+	u32 *regs, regval;
+	u64 status, mask;
=20
-	chained_irq_enter(chip, desc);
-	/*enable GPIO interrupt again*/
+	/* Read the wake status */
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	reg =3D readl(gpio_dev->base + WAKE_INT_STATUS_REG1);
-	reg64 =3D reg;
-	reg64 =3D reg64 << 32;
-
-	reg =3D readl(gpio_dev->base + WAKE_INT_STATUS_REG0);
-	reg64 |=3D reg;
+	status =3D readl(gpio_dev->base + WAKE_INT_STATUS_REG1);
+	status <<=3D 32;
+	status |=3D readl(gpio_dev->base + WAKE_INT_STATUS_REG0);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
=20
-	/*
-	 * first 46 bits indicates interrupt status.
-	 * one bit represents four interrupt sources.
-	*/
-	for (off =3D 0; off < 46 ; off++) {
-		if (reg64 & BIT(off)) {
-			for (i =3D 0; i < 4; i++) {
-				pin_reg =3D readl(gpio_dev->base +
-						(off * 4 + i) * 4);
-				if ((pin_reg & BIT(INTERRUPT_STS_OFF)) ||
-					(pin_reg & BIT(WAKE_STS_OFF))) {
-					irq =3D irq_find_mapping(gc->irqdomain,
-								off * 4 + i);
-					generic_handle_irq(irq);
-					writel(pin_reg,
-						gpio_dev->base
-						+ (off * 4 + i) * 4);
-					handled++;
-				}
-			}
+	/* Bit 0-45 contain the relevant status bits */
+	status &=3D (1ULL << 46) - 1;
+	regs =3D gpio_dev->base;
+	for (mask =3D 1, irqnr =3D 0; status; mask <<=3D 1, regs +=3D 4, irqnr +=
=3D 4) {
+		if (!(status & mask))
+			continue;
+		status &=3D ~mask;
+
+		/* Each status bit covers four pins */
+		for (i =3D 0; i < 4; i++) {
+			regval =3D readl(regs + i);
+			if (!(regval & PIN_IRQ_PENDING))
+				continue;
+			irq =3D irq_find_mapping(gc->irqdomain, irqnr + i);
+			generic_handle_irq(irq);
+			/* Clear interrupt */
+			writel(regval, regs + i);
+			ret =3D IRQ_HANDLED;
 		}
 	}
=20
-	if (handled =3D=3D 0)
-		handle_bad_irq(desc);
-
+	/* Signal EOI to the GPIO unit */
 	raw_spin_lock_irqsave(&gpio_dev->lock, flags);
-	reg =3D readl(gpio_dev->base + WAKE_INT_MASTER_REG);
-	reg |=3D EOI_MASK;
-	writel(reg, gpio_dev->base + WAKE_INT_MASTER_REG);
+	regval =3D readl(gpio_dev->base + WAKE_INT_MASTER_REG);
+	regval |=3D EOI_MASK;
+	writel(regval, gpio_dev->base + WAKE_INT_MASTER_REG);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
=20
-	chained_irq_exit(chip, desc);
+	return ret;
 }
=20
 static int amd_get_groups_count(struct pinctrl_dev *pctldev) @@ -821,10 +8=
11,11 @@ static int amd_gpio_probe(struct platfor
 		goto out2;
 	}
=20
-	gpiochip_set_chained_irqchip(&gpio_dev->gc,
-				 &amd_gpio_irqchip,
-				 irq_base,
-				 amd_gpio_irq_handler);
+	ret =3D devm_request_irq(&pdev->dev, irq_base, amd_gpio_irq_handler, 0,
+			       KBUILD_MODNAME, gpio_dev);
+	if (ret)
+		goto out2;
+
 	platform_set_drvdata(pdev, gpio_dev);
=20
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in th=
e body of a message to majordomo@vger.kernel.org More majordomo info at  ht=
tp://vger.kernel.org/majordomo-info.html
