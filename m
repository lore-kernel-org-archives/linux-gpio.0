From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines used
 as irq?
Date: Wed, 12 Jul 2017 23:41:42 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1707122330060.2510@nanos>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch> <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:45292 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753369AbdGLVlv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2017 17:41:51 -0400
In-Reply-To: <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Davide Hug <d@videhug.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>

On Wed, 12 Jul 2017, Linus Walleij wrote:
> On Tue, Jul 11, 2017 at 7:55 PM, Davide Hug <d@videhug.ch> wrote:
> 
> > I'm looking at a driver (hwmon/sht15) that does not load with message:
> >
> >         gpio-48 (SHT15 data): _gpiod_direction_output_raw: tried to set a GPIO tied to an IRQ as output
> >
> > This happens because the driver uses a GPIO line alternately (and not at the
> > same time) as IRQ and output. To do this irq_enable/disable are used to
> > prevent setting a GPIO with enabled IRQ as output. This seems the right
> > approach to me since in the patch "gpio: add API to be strict about GPIO IRQ
> > usage"[1] I read:
> >
> >         The API is symmetric so that lines can also be flagged from
> >         .irq_enable() and unflagged from IRQ by .irq_disable().
> >
> > But I didn't find any GPIO driver implementing this API in irq_enable/disable.
> >
> > Since my platform uses omap_gpio which does not implement
> > irq_enable/disable at all, I added a default irq_enable/disable
> > implementation in gpio/gpiolib.c (in the patch below).
> >
> > Is it the right approach to call gpiochip_lock_as_irq/gpiochip_unlock_as_irq
> 
> We already call this in gpiochip_irq_reqres() and gpiochip_irq_relres().
> from the .irq_request_resources()/.irq_release_resources() callbacks.
> 
> Your patch makes us call the functions twice I think.
> 
> Why isn't gpiochip_irq_relres() called before you reuse the line
> for something else than IRQ?
>
> 
> If there is a legitimate reason why .irq_disable() and .irq_enable()
> are called but not .irq_request_resources() and .irq_release_resources()
> I want to know why that is so.

Well, because that driver is completely broken.

It does:

	ret = devm_gpio_request(&pdev->dev, data->pdata->gpio_data,
                                "SHT15 data");

	request_irq(gpio_to_irq(data->pdata->gpio_data),....);

and at random places it does:

	ret = gpio_direction_input(data->pdata->gpio_data);
	
	err = gpio_direction_output(data->pdata->gpio_data, 1);

and the 'protection' for that is to use disable_irq_nosync() and
enable_irq() at various places.

That of course breaks with the current semantics of the GPIO interrupt
facility, because it prevents switching a requested interrupt gpio line
from input to output.

The only sane option is to get rid of the interrupt and switch the whole
thing to timer based polling. I'm sure that's not more overhead and removes
half of the unpenetrable mess in that drivere.

Thanks,

	tglx


    
