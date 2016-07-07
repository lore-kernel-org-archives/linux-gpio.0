From: Bin Gao <bin.gao@linux.intel.com>
Subject: Re: [PATCH v4] gpio: add Intel WhiskeyCove GPIO driver
Date: Wed, 6 Jul 2016 22:29:45 -0700
Message-ID: <20160707052945.GA115716@worksta>
References: <20160627235616.GA9303@worksta>
 <CACRpkdZJ0AUWmxLApzryCZbQcQmwWO1A-NLMP46WsLkJBZgprQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:25393 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750844AbcGGFZv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 7 Jul 2016 01:25:51 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZJ0AUWmxLApzryCZbQcQmwWO1A-NLMP46WsLkJBZgprQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>

On Wed, Jul 06, 2016 at 10:57:19AM +0200, Linus Walleij wrote:
> > +static irqreturn_t wcove_gpio_irq_handler(int irq, void *data)
> > +{
> > +       int pending;
> > +       unsigned int p0, p1, virq, gpio;
> > +       struct wcove_gpio *wg = data;
> > +
> > +       if (regmap_read(wg->regmap, IRQ_STATUS_OFFSET + 0, &p0) ||
> > +           regmap_read(wg->regmap, IRQ_STATUS_OFFSET + 1, &p1)) {
> 
> Why can't you use regmap_bulk_read() here?

Will fix this in v5.

> 
> > +               dev_err(wg->chip.parent, "%s(): regmap_read() failed.\n",
> > +                                                               __func__);
> > +               return IRQ_NONE;
> > +       }
> > +
> > +       pending = p0 | (p1 << 8);
> > +
> > +       for (gpio = 0; gpio < WCOVE_GPIO_NUM; gpio++) {
> > +               if (pending & BIT(gpio)) {
> > +                       virq = irq_find_mapping(wg->chip.irqdomain, gpio);
> > +                       handle_nested_irq(virq);
> > +               }
> > +       }
> > +
> > +       regmap_write(wg->regmap, IRQ_STATUS_OFFSET + 0, p0);
> > +       regmap_write(wg->regmap, IRQ_STATUS_OFFSET + 1, p1);
> 
> Use regmap_bulk_write()?

Will fix this in v5.

> 
> Also you're ignoring the return error code. Check it and dev_err() if
> it fails.

Yes, will fix.

> 
> This loop seems like it could miss interrupts happening while
> processing. Especially edge interrupts, and thatr will lead to serious
> bugs later.
> 
> Please consider the following construction:
> 
> 1. read status register
> 2. Any IRQs active?
>   2.1 No IRQs active: if this is the FIRST iteration, exit with IRQ_NONE
>   2.2 No IRQs active If this the second iteration or later, exit with
> IRQ_HANDLED
>   2.3 IRQs active, continue
> 2. Find first active IRQ
> 3. Handle first active IRQ
> 4. ACK the first active IRQ by writing the status register
> 5. Reiterate from 1
> 
> This way, if two IRQs happen at the same time, or if a new IRQ appears
> while you're inside the interrupt handler, it gets served.

I agree. Writing to status register should be done bit by bit, instead of
one write for all bits. Will fix this in v5.

> 
> > +static void wcove_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
> > +{
> > +       struct wcove_gpio *wg = gpiochip_get_data(chip);
> > +       int gpio, offset, group;
> > +       unsigned int ctlo, ctli, irq_mask, irq_status;
> > +
> > +       for (gpio = 0; gpio < WCOVE_GPIO_NUM; gpio++) {
> > +               group = gpio < GROUP0_NR_IRQS ? 0 : 1;
> > +               regmap_read(wg->regmap, to_reg(gpio, CTRL_OUT), &ctlo);
> > +               regmap_read(wg->regmap, to_reg(gpio, CTRL_IN), &ctli);
> > +               regmap_read(wg->regmap, IRQ_MASK_OFFSET + group, &irq_mask);
> > +               regmap_read(wg->regmap, IRQ_STATUS_OFFSET + group, &irq_status);
> 
> Ignoring error codes. Fix this.

Will Fix in v5.

> 
> > +       gpiochip_irqchip_add(&wg->chip, &wcove_irqchip, 0,
> > +                            handle_simple_irq, IRQ_TYPE_NONE);
> 
> Reexamine the use of handle_simple_irq() here. We have two kinds of
> irq hardware: those with one register for ACKing and reading the status
> of an IRQ, and those with two registers for it: one where you ACK the
> IRQ (so it can immediately re-trigger) and one to read the status of
> whether it happened. Sometimes different handling is needed for
> levek and edge IRQs even (c.f. gpio-pl061.c).
> 
> Only the hardware with just one register for both things should use
> handle_simple_irq(). This seems to be the case here but I want you
> to verify.

I will check and fix if it's needed.

> 
> Yours,
> Linus Walleij

Thanks for your review.
