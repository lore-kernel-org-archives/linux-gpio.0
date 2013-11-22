From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 7/9] ARM: sa1100: move gpio irq handling to GPIO driver
Date: Fri, 22 Nov 2013 17:45:28 +0000
Message-ID: <20131122174528.GB16735@n2100.arm.linux.org.uk>
References: <1384505280-25389-1-git-send-email-dbaryshkov@gmail.com> <1384505280-25389-8-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:43290 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754477Ab3KVRqR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2013 12:46:17 -0500
Content-Disposition: inline
In-Reply-To: <1384505280-25389-8-git-send-email-dbaryshkov@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Dmitry Artamonow <mad_soft@inbox.ru>

On Fri, Nov 15, 2013 at 12:47:58PM +0400, Dmitry Eremin-Solenikov wrote:
> mach-sa1100's irq.c contains a mixture of system and GPIO irqs handling.
> Split out GPIO irqchip to gpio-sa1100.c. To decouple first 11 GPIO IRQs
> handling, make IRQ0-IRQ10 use chained irq handler that just passes the
> IRQ to GPIO IRQs.
> 
> Also during this refactoring introduce irq domain support for sa1100
> gpio irqs.

I'm not sure I quite like this change... How much testing has this had?
I'd much prefer that this code just isn't touched because of all the
problems we've had here in years back with IRQs from CF cards being
dropped and the like.  This was very hard to get right, especially when
interacting with the SA1111.

> @@ -136,3 +301,58 @@ static int __init sa1100_gpio_init(void)
>  	return platform_driver_register(&sa1100_gpio_driver);
>  }
>  postcore_initcall(sa1100_gpio_init);
> +
> +#ifdef CONFIG_PM
> +static unsigned long	saved_gplr;
> +static unsigned long	saved_gpdr;
> +static unsigned long	saved_grer;
> +static unsigned long	saved_gfer;
> +
> +static int sa1100_gpio_suspend(void)
> +{
> +	struct sa1100_gpio_chip *sgc = chip;
> +	saved_gplr = readl_relaxed(sgc->regbase + GPLR_OFFSET);
> +	saved_gpdr = readl_relaxed(sgc->regbase + GPDR_OFFSET);
> +	saved_grer = readl_relaxed(sgc->regbase + GRER_OFFSET);
> +	saved_gfer = readl_relaxed(sgc->regbase + GFER_OFFSET);
> +
> +	/* Clear GPIO transition detect bits */
> +	writel_relaxed(0xffffffff, sgc->regbase + GEDR_OFFSET);
> +
> +	/* FIXME: Original code also reprogramed GRER/GFER here,
> +	 * I don't see the purpose though.
> +	GRER = PWER & sgc->gpio_rising;
> +	GFER = PWER & sgc->gpio_falling;
> +	 */

So you thought you'd just comment it out because you don't understand...
Not really the way things are done.  If you don't understand something,
you shouldn't be touching the code.

In this case, it's quite simple.  GRER and GFER need to be programmed
with the interrupts which we want to be active for _each_ mode of the
system.

Therefore, if we want to have certain GPIOs triggering wakeups (iow,
those GPIOs which have had enable_irq_wake() called on them) but not
those which haven't, we need to reprogram GRER and GFER with the
GPIOs which can wake the system up.

Quite simple and obvious really.
