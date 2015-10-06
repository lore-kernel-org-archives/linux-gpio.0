From: Andreas Werner <andy@wernerandy.de>
Subject: Re: [PATCH] gpio: Add driver for MEN 16Z127 GPIO controller
Date: Tue, 6 Oct 2015 19:54:23 +0200
Message-ID: <20151006175422.GB4364@linux-rrhd.site>
References: <1444068553-16899-1-git-send-email-andy@wernerandy.de>
 <CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:52675 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbbJFRya (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2015 13:54:30 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZhdf787xAH-AY=8fY3YXOuLriVXhJHAn554YFWtDYZ7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Thumshirn <morbidrsa@gmail.com>

On Tue, Oct 06, 2015 at 09:35:51AM +0200, Linus Walleij wrote:
> On Mon, Oct 5, 2015 at 8:09 PM, Andreas Werner <andy@wernerandy.de> wrote:
> 
> > The 16Z127 is a GPIO controller on a MCB FPGA and has 32
> > configurable GPIOs.
> > The GPIOs can be configured as inputs and outputs
> >
> > Signed-off-by: Andreas Werner <andy@wernerandy.de>
> 
> This driver looks like it can use the generic MMIO library.

Yes you are right, did not know about the gener MMIO lib but seems to be 
the right think for this driver. I will change that.

> 
> select GPIO_GENERIC
> #include <linux/basic_mmio_gpio.h>
> 
> Then look at example for how to do this, e.g.
> drivers/gpio/gpio-74xx-mmio.c
> 
> > +config GPIO_MENZ127
> > +       tristate "MEN 16Z127 GPIO support"
> > +       depends on MCB
> 
> Is this "MCB" symbol already upstream? It seems a bit short.
>

Yes MCB is already upstream and there is alreay a driver upstream named 
men_Z135_uart. MCB is called "MEN Chameleon Bus" which is out FPGA.
The FPGA implements a table named "Chameleon Table" which describes the IPs
in the FPGA. 
 
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/io.h>
> > +#include <linux/mcb.h>
> > +#include <linux/gpio.h>
> 
> Just
> #include <linux/gpio/driver.h>
> 
OK, will change that.

> > +#define MEN_Z127_CTRL  0x00
> > +#define MEN_Z127_PSR   0x04
> > +#define MEN_Z127_IRQR  0x08
> > +#define MEN_Z127_GPIODR        0x0c
> > +#define MEN_Z127_IER1  0x10
> > +#define MEN_Z127_IER2  0x14
> 
> It looks like it has interrupt support?
> 
Yes there is an Interrupt support but not completly implemented in HW.
My IC designer is currently in holiday and he is planned to do the IRQ work
in a few weeks (month).
The plan was to start without IRQ support and get the driver upstream.

> > +#define MEN_Z127_DBER  0x18
> 
> Debounce? In that case, maybe implement .set_debounce from day 1?

Yes did not want to implement this from day 1, but i think you are right
I should do that, its not a complicated thing :-)
> 
> > +#define MEN_Z127_ODER  0x1C
> 
> And Open Drain? Maybe you should support that from day 1?
> 
Need to check if this is current implementation is working, but should be no 
problem to implement this.

> Yours,
> Linus Walleij

Thanks for your comments. I will send a v2 today or tomorrow.

Regards
Andy
