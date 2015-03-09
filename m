From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-dwapb: reset mask register on probe
Date: Mon, 9 Mar 2015 14:59:02 +0100
Message-ID: <CACRpkdaknfTMb=1LVqNLTtV8Te+mjRdSZ=grk4NUGxKBt6gpCg@mail.gmail.com>
References: <1425372461-17859-1-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:37870 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753857AbbCIN7C (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2015 09:59:02 -0400
Received: by oigi138 with SMTP id i138so29331646oig.4
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2015 06:59:02 -0700 (PDT)
In-Reply-To: <1425372461-17859-1-git-send-email-abrodkin@synopsys.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Mar 3, 2015 at 9:47 AM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:

> It's possible that boot-loader that worked on CPU before Linux kernel
> made some changes in GPIO controller registers. For example interrupts
> could be all masked.
>
> Current implementation of DW GPIO driver relies on default values in
> mask register.
>
> This is especially problematic in this DW GPIO driver because it sets 2
> pairs of methods: .irq_eable/.irq_disable and .irq_mask/.irq_unmask. In
> this case generic "irq_enable" function will use only
> .irq_enable call-back and mask register will be never modified so
> required interrupts will be finally unmasked.
>
> To troubleshoot described problem on driver probe we just need to make
> sure mask register is zeroed.
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

Wait.

> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -370,6 +370,9 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>                 irq_create_mapping(gpio->domain, hwirq);
>
>         port->bgc.gc.to_irq = dwapb_gpio_to_irq;
> +
> +       /* Reset mask register */
> +       dwapb_write(gpio, GPIO_INTMASK, 0);

I don't get this. This looks like you just enable all interrupts. The
driver also contains this in .suspend():

/* Mask out interrupts */
dwapb_write(gpio, GPIO_INTMASK, 0xffffffff);

If *anything* the probe should *mask* all interrupts so that the
.unmask() callback can enable them selectively.

The real problem I think is that struct irq_chip contains
mask()/unmask() callbacks that are not implemented
by this driver.

Can you please test the below (untested) patch instead:

From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 9 Mar 2015 14:56:18 +0100
Subject: [PATCH] RFC: gpio: dwapb: handle mask/unmask properly

This implements the callbacks for masking/unmasking IRQs in the
special IRQ mask/unmask register of the DWAPB GPIO block.
Previously these mask bits were unhandled and relied on
boot-up defaults.

Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-dwapb.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 58faf04fce5d..1396f26bac5d 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -158,6 +158,30 @@ static void dwapb_irq_handler(u32 irq, struct
irq_desc *desc)
         chip->irq_eoi(irq_desc_get_irq_data(desc));
 }

+static void dwapb_irq_mask(struct irq_data *d)
+{
+    struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
+    struct dwapb_gpio *gpio = igc->private;
+
+    spin_lock_irqsave(&bgc->lock, flags);
+    val = dwapb_read(gpio, GPIO_INTMASK);
+    val |= BIT(d->hwirq);
+    dwapb_write(gpio, GPIO_INTMASK, val);
+    spin_unlock_irqrestore(&bgc->lock, flags);
+}
+
+static void dwapb_irq_unmask(struct irq_data *d)
+{
+    struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
+    struct dwapb_gpio *gpio = igc->private;
+
+    spin_lock_irqsave(&bgc->lock, flags);
+    val = dwapb_read(gpio, GPIO_INTMASK);
+    val &= ~BIT(d->hwirq);
+    dwapb_write(gpio, GPIO_INTMASK, val);
+    spin_unlock_irqrestore(&bgc->lock, flags);
+}
+
 static void dwapb_irq_enable(struct irq_data *d)
 {
     struct irq_chip_generic *igc = irq_data_get_irq_chip_data(d);
@@ -302,6 +326,10 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
     struct irq_chip_type *ct;
     int err, i;

+    /* Mask out and disable all interrupts */
+    dwapb_write(gpio, GPIO_INTMASK, 0xffffffff);
+    dwapb_write(gpio, GPIO_INTEN, 0);
+
     gpio->domain = irq_domain_add_linear(node, ngpio,
                          &irq_generic_chip_ops, gpio);
     if (!gpio->domain)
@@ -334,6 +362,8 @@ static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
         ct->chip.irq_mask = irq_gc_mask_set_bit;
         ct->chip.irq_unmask = irq_gc_mask_clr_bit;
         ct->chip.irq_set_type = dwapb_irq_set_type;
+        ct->chip.irq_mask = dwapb_irq_mask;
+        ct->chip.irq_unmask = dwapb_irq_unmask;
         ct->chip.irq_enable = dwapb_irq_enable;
         ct->chip.irq_disable = dwapb_irq_disable;
         ct->chip.irq_request_resources = dwapb_irq_reqres;
-- 
1.9.3



Yours,
Linus Walleij
