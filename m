From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH 2/3] pinctrl:Intel: clear interrupt status for every IRQ
 setup
Date: Mon, 14 Mar 2016 16:26:07 +0200
Message-ID: <20160314142607.GI1793@lahna.fi.intel.com>
References: <1457715962-108484-1-git-send-email-qipeng.zha@intel.com>
 <1457715962-108484-2-git-send-email-qipeng.zha@intel.com>
 <20160311094517.GO1796@lahna.fi.intel.com>
 <0DD381DBF8F68D419C32ACFCEB28EB2521D10345@SHSMSX101.ccr.corp.intel.com>
 <20160314084457.GX1796@lahna.fi.intel.com>
 <CACRpkdbqa2zmQ4ajH6LVQLPcWXJ+hWvHNPY5-L3TeLvA=3yg-g@mail.gmail.com>
 <20160314125436.GG1793@lahna.fi.intel.com>
 <20160314130041.GH1793@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:6790 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932864AbcCNO0M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 14 Mar 2016 10:26:12 -0400
Content-Disposition: inline
In-Reply-To: <20160314130041.GH1793@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Zheng, Qi" <qi.zheng@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 14, 2016 at 03:00:41PM +0200, Westerberg, Mika wrote:
> 
> > > Your set_type() is supporting edges but have all IRQs
> > > handled by handle_simple_irq() rather than handle_edge_irq()
> > > for the edges, which gives a more robust control flow
> > > from IRQ to ACK to calling the handler.
> > > 
> > > Zheng/Mika: please look at how the level/edge
> > > IRQs are handled in drivers/gpio/gpio-pl061.c
> > > where I *tried* to do things right, switching handler
> > > in .set_type() using irq_set_handler_locked(). I think
> > > you may need to use handle_edge_irq() for the edge IRQs
> > > and handle_level_irq() for the level IRQs just like I do
> > > in the PL061 driver.
> > 
> > The driver is already doing that as far as I can tell (see
> > intel_gpio_irq_type()).
> 
> I will check again if we are still missing something there.

Maybe we can implement ->enable() that clears the status right before
interrupt is unmasked? Something like below.

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index c0f5586218c4..b4873a4e25d5 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -648,6 +648,33 @@ static const struct gpio_chip intel_gpio_chip = {
 	.set = intel_gpio_set,
 };
 
+static void intel_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct intel_community *community;
+	unsigned pin = irqd_to_hwirq(d);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+
+	community = intel_get_community(pctrl, pin);
+	if (community) {
+		unsigned padno = pin_to_padno(community, pin);
+		unsigned gpp_offset = padno % community->gpp_size;
+		unsigned gpp = padno / community->gpp_size;
+		unsigned value;
+
+		writel(BIT(gpp_offset), community->regs + GPI_IS + gpp * 4);
+
+		value = readl(community->regs + community->ie_offset + gpp * 4);
+		value |= BIT(gpp_offset);
+		writel(value, community->regs + community->ie_offset + gpp * 4);
+	}
+
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
 static void intel_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -856,6 +883,7 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
 
 static struct irq_chip intel_gpio_irqchip = {
 	.name = "intel-gpio",
+	.irq_enable = intel_gpio_irq_enable,
 	.irq_ack = intel_gpio_irq_ack,
 	.irq_mask = intel_gpio_irq_mask,
 	.irq_unmask = intel_gpio_irq_unmask,
