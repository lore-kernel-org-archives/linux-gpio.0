From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Thu, 18 Aug 2016 15:13:28 +0300
Message-ID: <20160818121328.GE30827@lahna.fi.intel.com>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
 <20150601092348.GK1747@lahna.fi.intel.com>
 <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com>
 <20150602141520.GE4057@lahna.fi.intel.com>
 <CALUN=qLAvUipcHArE_NT7Opv8iDjaZ3OTAsgs_jpXtBbvpwUXQ@mail.gmail.com>
 <20160817081344.GM30827@lahna.fi.intel.com>
 <CALUN=q+LAfTf_=V4tXy3_h48K2BLtNOjxK4=AKRTtdjfW8970g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALUN=q+LAfTf_=V4tXy3_h48K2BLtNOjxK4=AKRTtdjfW8970g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anisse Astier <anisse@astier.eu>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 17, 2016 at 03:42:58PM +0200, Anisse Astier wrote:
> On Wed, Aug 17, 2016 at 10:13 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Tue, Aug 16, 2016 at 06:12:40PM +0200, Anisse Astier wrote:
> >> Hi Mika,
> >>
> >> Did you find a way to fix this issue ? I'm seeing a similar problem on a
> >> laptop where this masks the interrupt used for ACPI events (brightness,
> >> lid, battery).
> >
> > I seem to have forgotten this completely :-/
> >
> > Can you send me output of /sys/kernel/debug/pinctrl/INT33FF:*/pins for
> > that particular EC pin?
> >
> > In addition if you apply this patch do you see that ACPI events start
> > working?
> 
> >From what I've seen it's in the north range, I don't know which pin in
> particular it is yet.
> 
> If the interrupts aren't masked for the north community, ACPI events
> start working.
> 
> 
> # cat /sys/kernel/debug/pinctrl/INT33FF\:01/pins
> registered pins: 59
> pin 0 (GPIO_DFX_0) GPIO ctrl0 0x00118102 ctrl1 0x05c00000
> pin 1 (GPIO_DFX_3) GPIO ctrl0 0x2c018100 ctrl1 0x05c00000
> pin 2 (GPIO_DFX_7) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
> pin 3 (GPIO_DFX_1) GPIO ctrl0 0x18118100 ctrl1 0x05c00000
> pin 4 (GPIO_DFX_5) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
> pin 5 (GPIO_DFX_4) GPIO ctrl0 0x00118102 ctrl1 0x05c00000
> pin 6 (GPIO_DFX_8) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
> pin 7 (GPIO_DFX_2) GPIO ctrl0 0x00118100 ctrl1 0x05c00000
> pin 8 (GPIO_DFX_6) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
> pin 15 (GPIO_SUS0) GPIO ctrl0 0x3c018201 ctrl1 0x05c00001
> pin 16 (SEC_GPIO_SUS10) GPIO ctrl0 0x00118100 ctrl1 0x05c00000
> pin 17 (GPIO_SUS3) GPIO ctrl0 0x4c118100 ctrl1 0x05c00000
> pin 18 (GPIO_SUS7) GPIO ctrl0 0xfc918201 ctrl1 0x05c00001
> pin 19 (GPIO_SUS1) mode 6 ctrl0 0x00160301 ctrl1 0x05c00000
> pin 20 (GPIO_SUS5) mode 1 ctrl0 0x00910200 ctrl1 0x05c00000
> pin 21 (SEC_GPIO_SUS11) GPIO ctrl0 0x5c118100 ctrl1 0x05c00000
> pin 22 (GPIO_SUS4) mode 6 ctrl0 0x00960301 ctrl1 0x05c00000
> pin 23 (SEC_GPIO_SUS8) mode 1 ctrl0 0x00910300 ctrl1 0x05c00000
> pin 24 (GPIO_SUS2) GPIO ctrl0 0x00918102 ctrl1 0x05c00000
> pin 25 (GPIO_SUS6) GPIO ctrl0 0xec918201 ctrl1 0x05c00001

It is this one (GPIO_SUS6).

I wonder if we can relax the driver so that it only masks pins which are
not configured to generate interrupts by the BIOS. I quickly tried
following on one Braswell machine and it did not generate spurious
interrupts.

Can you check if this works for you?

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 5749a4eee746..579e0e48bdee 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1513,6 +1513,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 	const struct chv_gpio_pinrange *range;
 	struct gpio_chip *chip = &pctrl->chip;
 	int ret, i, offset;
+	u32 intmask = 0;
 
 	*chip = chv_gpio_chip;
 
@@ -1539,8 +1540,27 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
 		offset += range->npins;
 	}
 
-	/* Mask and clear all interrupts */
-	chv_writel(0, pctrl->regs + CHV_INTMASK);
+	/*
+	 * Mask all interrupts except those which BIOS has configured to
+	 * actually generate interrupts in their padctrl registers.
+	 */
+	for (i = 0; i < pctrl->community->npins; i++) {
+		unsigned pin = pctrl->community->pins[i].number;
+		u32 intsel, ctrl1;
+
+		intsel = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+		intsel &= CHV_PADCTRL0_INTSEL_MASK;
+		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
+		ctrl1 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL1));
+
+		if (intsel && (ctrl1 & CHV_PADCTRL1_INTWAKECFG_MASK))
+			intmask |= BIT(intsel);
+	}
+
+	intmask &= readl(pctrl->regs + CHV_INTMASK);
+	writel(intmask, pctrl->regs + CHV_INTMASK);
+
+	/* Clear all interrupts */
 	chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
 
 	ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
