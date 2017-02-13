From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] gpio:mcp23s08 Fixed missing interrupts
Date: Mon, 13 Feb 2017 13:15:16 +0800
Message-ID: <8aa3227c-c55c-6319-42ac-97e90c9098dd@electromag.com.au>
References: <1486843355-2386-1-git-send-email-robert.middleton@rm5248.com>
 <1486843355-2386-2-git-send-email-robert.middleton@rm5248.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:57456 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750711AbdBMFPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2017 00:15:25 -0500
In-Reply-To: <1486843355-2386-2-git-send-email-robert.middleton@rm5248.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: robert.middleton@rm5248.com
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

G'day Rob,

I've tested this and it works for my use case.
Which has rising & falling irqs and not very fast inputs.

A couple of comment below. I'm no expert on the kernel standards thou.

I've also cc-dd the gpio maintainers. See MAINTAINERS file for a list people to copy for different subfolder etc.


On 12/02/2017 04:02, robert.middleton@rm5248.com wrote:
> From: Robert Middleton <robert.middleton@rm5248.com>
>
> When an interrupt occurs on an MCP23S08 chip, the INTF register will only contain one bit as causing the interrupt.  If more than two pins change at the same time on the chip, this causes one of the pins to not be reported.  This patch fixes the logic for checking if a pin has changed, so that multiple pins will always cause more than one change.

Comments need to be wrapped to 75 chars.
Also needs signed-by. "git format-patch -s" will do it for you.


> ---
>  drivers/gpio/gpio-mcp23s08.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
> index 99d37b5..b7ceee3 100644
> --- a/drivers/gpio/gpio-mcp23s08.c
> +++ b/drivers/gpio/gpio-mcp23s08.c
> @@ -337,7 +337,7 @@ mcp23s08_direction_output(struct gpio_chip *chip, unsigned offset, int value)
>  static irqreturn_t mcp23s08_irq(int irq, void *data)
>  {
>  	struct mcp23s08 *mcp = data;
> -	int intcap, intf, i;
> +	int intcap, intf, i, gpio, gpio_cache;
>  	unsigned int child_irq;
>
>  	mutex_lock(&mcp->lock);
> @@ -356,14 +356,30 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
>  	}
>
>  	mcp->cache[MCP_INTCAP] = intcap;
> +
> +	/* This clears the interrupt */
Only for no s18 chips. But it should matter for them.


> +	gpio = mcp->ops->read(mcp, MCP_GPIO);
> +	if (gpio < 0) {
> +		mutex_unlock(&mcp->lock);
> +		return IRQ_HANDLED;
> +	}
> +	gpio_cache = mcp->cache[MCP_GPIO];
> +	mcp->cache[MCP_GPIO] = gpio;
>  	mutex_unlock(&mcp->lock);
>
>
>  	for (i = 0; i < mcp->chip.ngpio; i++) {
> -		if ((BIT(i) & mcp->cache[MCP_INTF]) &&
> -		    ((BIT(i) & intcap & mcp->irq_rise) ||
> -		     (mcp->irq_fall & ~intcap & BIT(i)) ||
> -		     (BIT(i) & mcp->cache[MCP_INTCON]))) {
> +		/* We must check all of the inputs on the chip,
> +		 * otherwise we may not notice a change on >=2 pins
> +		 */
> +		int bit_changed = (BIT(i) & gpio_cache) !=
> +			(BIT(i) & mcp->cache[MCP_GPIO]);
> +		int defval_changed = (BIT(i) & mcp->cache[MCP_GPIO]) !=
> +			(BIT(i) & mcp->cache[MCP_DEFVAL]);
> +		if ((bit_changed && (BIT(i) & mcp->irq_rise)) ||
> +			(bit_changed && (~BIT(i) & mcp->irq_fall)) ||
> +			((BIT(i) & mcp->cache[MCP_INTCON]) &&
trailing space on this line.
I'm not sure what the formatting should be here, but most other kernel code I've looked
using space to align to the open bracket of the if statement when the condition exceeds
one line.

> +			defval_changed)) {
>  			child_irq = irq_find_mapping(mcp->chip.irqdomain, i);
>  			handle_nested_irq(child_irq);
>  		}
>

bit_changed / defval_changed could be of type bool to be clearer that it's meant to
be a bool result. These should also be defined at the top of the function I believe.

I pretty sure the logic will trigger a interrupt on both a rising and falling edge of the input
even if only falling edge is requested. But I may be missing something obvious.

Also what is the impact to short interrupt events. Should the INTCAP / INTF flags still be consider as well.
ie. A short pulse on input which may happen before GPIO input register be read, but captured by INTCAP
be consider as well. This change may break systems relying on that behaviour.

FYI: You can run scripts/checkpatch.pl against you patch to identify some of the problems highlighted above.

not related to your changes: this function always returns IRQ_HANDLED in all cases.
Other GPIO drivers return IRQ_NONE if no handler was called or in some case if an error occurred
in reading the state. I'm not sure what the correct behaviour is supposed to be.
Docs suggest IRQ_NONE helps the kernel detect bad irq.
Someone more knowledgeable may be able to offer a hint on that one.
I can do a patch if this needs changing.

-- 
Regards
Phil Reid

