From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [gpio:devel 12/12] drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:630:27: error: 'struct gpio_chip' has no member named 'irq_base'; did you mean 'base'?
Date: Mon, 16 Oct 2017 16:53:33 +0200
Message-ID: <87po9n6t5e.fsf@free-electrons.com>
References: <201710150916.Se4u1t6V%fengguang.wu@intel.com>
        <CACRpkdb5WcX8TRifAHX02=_u_xwiLdJ5b7KFLRAgeZHA-qE1sg@mail.gmail.com>
        <20171016080502.GB17369@ulmo> <20171016080821.GC17369@ulmo>
        <CACRpkdYuJeKQA+yyU1B0fvU2WoaFRNBHn3XVrGs1jgWXUOOmqg@mail.gmail.com>
        <20171016124656.GA6539@ulmo>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:58272 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752196AbdJPOxp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Oct 2017 10:53:45 -0400
In-Reply-To: <20171016124656.GA6539@ulmo> (Thierry Reding's message of "Mon,
        16 Oct 2017 14:46:56 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, kbuild test robot <fengguang.wu@intel.com>, Grygorii Strashko <grygorii.strashko@ti.com>, "kbuild-all@01.org" <kbuild-all@01.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Thierry,


 On lun., oct. 16 2017, Thierry Reding <thierry.reding@gmail.com> wrote:

> On Mon, Oct 16, 2017 at 01:50:08PM +0200, Linus Walleij wrote:
>> On Mon, Oct 16, 2017 at 10:08 AM, Thierry Reding
>> <thierry.reding@gmail.com> wrote:
>> 
>> > Nevermind, I see there is now yet another conflict that would require
>> > yet another rebase of that series.
>> 
>> Sorry about this :(
>> 
>> It sucks with moving targets, there was some fallout from Grygorii's patch
>> to map IRQs dynamically and remove irq_base so we need to clean that
>> up first.
>> 
>> This particular bug from the autobuilder seems to be constrained to the
>> armada driver though.
>
> Well, the problem here is that Grygorii's patch removes the field but
> with there still being one user left. So we'd have to make sure that the
> real last user goes away before that patch is applied.
>
> Looking at the code it seems a little phony. d->hwirq - chip->irq_base
> seems like a very risky thing to do because you never really know what
> irq_base will end up being (in the general case where it's dynamically
> allocated). But the driver passes 0 to gpiochip_irqchip_add() as the
> first_irq parameter, therefore the operation becomes a noop and so it
> should be completely safe to remove that line.
>
> Something like the below should do. Cc += Gregory.

Thanks for adding me in CC I wonder why I was not in CC in the original
series whereas we properly fill the MAINTAINER file for this.

About your patch it looks good. The reason to use irq_base was that at
the beginning I didn't use dynamic irq at all, and according to the test I
did while developing the driver I could have an irq_base which started
from the last irq for the first gpio controller (on these SoC we can
two different controller using the same driver). Now I wonder if there
was something wrong when I saw that, but as now I moved on dynamic
allocation for irq, then we don't have to worry about it.

As I said your patch looks OK but I would like to test it on a Armada
37xx based board to be sure. I planed to do it on Wednesday.

Thanks,

Gregory


>
> Thierry
>
> --- >8 ---
> From fcd87329cf4edf6a6f5d491a1893af401be7dedf Mon Sep 17 00:00:00 2001
> From: Thierry Reding <treding@nvidia.com>
> Date: Mon, 16 Oct 2017 14:40:23 +0200
> Subject: [PATCH] pinctrl: armada-37xx: Stop using struct gpio_chip.irq_base
>
> The Armada 37xx driver always initializes the IRQ base to 0, hence the
> subtraction is a no-op. Remove the subtraction and thereby the last user
> of struct gpio_chip's .irq_base field.
>
> Note that this was also actually a bug and only worked because of the
> above assumption. If the IRQ base had been dynamically allocated, the
> subtraction would've caused the wrong mask to be generated since the
> struct irq_data.hwirq field is an index local to the IRQ domain. As a
> result, it should now be safe to also allocate this chip's IRQ base
> dynamically, unless there are consumers left that refer to the IRQs by
> their global number.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 71b944748304..ac299a6cdfd6 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -627,14 +627,14 @@ static void armada_37xx_irq_handler(struct irq_desc *desc)
>  static unsigned int armada_37xx_irq_startup(struct irq_data *d)
>  {
>  	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> -	int irq = d->hwirq - chip->irq_base;
> +
>  	/*
>  	 * The mask field is a "precomputed bitmask for accessing the
>  	 * chip registers" which was introduced for the generic
>  	 * irqchip framework. As we don't use this framework, we can
>  	 * reuse this field for our own usage.
>  	 */
> -	d->mask = BIT(irq % GPIO_PER_REG);
> +	d->mask = BIT(d->hwirq % GPIO_PER_REG);
>  
>  	armada_37xx_irq_unmask(d);
>  
> -- 
> 2.14.1
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
