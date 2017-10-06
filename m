From: "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH] pinctrl/amd: fix masking of GPIO interrupts
Date: Fri, 6 Oct 2017 08:56:44 +0530
Message-ID: <888cd27e-d25b-f88c-c7eb-683a3ec0a5c8@amd.com>
References: <20171002040054.2604-1-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bl2nam02on0080.outbound.protection.outlook.com ([104.47.38.80]:4272
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751083AbdJFD1S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Oct 2017 23:27:18 -0400
In-Reply-To: <20171002040054.2604-1-drake@endlessm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>, ken.xue@amd.com, shyam-sundar.s-k@amd.com, linus.walleij@linaro.org
Cc: linux@endlessm.com, linux-gpio@vger.kernel.org



On 10/2/2017 9:30 AM, Daniel Drake wrote:
> On Asus laptop models X505BA, X505BP, X542BA and X542BP, the i2c-hid
> touchpad (using a GPIO for interrupts) becomes unresponsive after a
> few minutes of usage, or after placing two fingers on the touchpad,
> which seems to have the effect of queuing up a large amount of input
> data to be transferred.
> 
> When the touchpad is in unresponsive state, we observed that the GPIO
> level-triggered interrupt is still at it's active level, however the
> pinctrl-amd driver is not receiving/dispatching more interrupts at this
> point.
> 
> After the initial interrupt arrives, amd_gpio_irq_mask() is called
> however we then see amd_gpio_irq_handler() being called repeatedly for
> the same irq; the interrupt mask is not taking effect because of the
> following sequence of events:
>  - amd_gpio_irq_handler fires, reads and caches pin reg
>  - amd_gpio_irq_handler calls generic_handle_irq()
>  - During IRQ handling, amd_gpio_irq_mask() is called and modifies pin reg
>  - amd_gpio_irq_handler clears interrupt by writing cached value
> 
> The stale cached value written at the final stage undoes the masking.
> Fix this by re-reading the register before clearing the interrupt.
> 
> I also spotted that the interrupt-clearing code can race against
> amd_gpio_irq_mask() / amd_gpio_irq_unmask(), so add locking there.
> Presumably this race was leading to the loss of interrupts.
> 
> After these changes, the touchpad appears to be working fine.
> 
> Signed-off-by: Daniel Drake <drake@endlessm.com>
> ---
>  drivers/pinctrl/pinctrl-amd.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 3f6b34febbf1..433af328d981 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -534,8 +534,16 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
>  				continue;
>  			irq = irq_find_mapping(gc->irqdomain, irqnr + i);
>  			generic_handle_irq(irq);
> -			/* Clear interrupt */
> +
> +			/* Clear interrupt.
> +			 * We must read the pin register again, in case the
> +			 * value was changed while executing
> +			 * generic_handle_irq() above.
> +			 */
> +			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
> +			regval = readl(regs + i);
>  			writel(regval, regs + i);
> +			raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>  			ret = IRQ_HANDLED;
>  		}
>  	}
> 
Hi Darek

Looks good .

Thanks

Nehal Shah
