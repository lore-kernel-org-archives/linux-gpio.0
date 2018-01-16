From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: [PATCH] gpio: mmio: Also read bits that are zero
Date: Tue, 16 Jan 2018 11:01:37 +0100
Message-ID: <20180116100137.GA4146@archie.localdomain>
References: <20180116091714.20963-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:52133 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750846AbeAPKBk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 05:01:40 -0500
Content-Disposition: inline
In-Reply-To: <20180116091714.20963-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Lukas Wunner <lukas@wunner.de>

Hi Linus,

On Tue, Jan 16, 2018 at 10:17:14AM +0100, Linus Walleij wrote:
> The code for .get_multiple() has bugs:
> 
> 1. The simple .get_multiple() just reads a register, masks it
> and sets the return value. This is not correct: we only want to
> assign values (whether 0 or 1) to the bits that are set in the
> mask. Fix this by using &= ~mask to clear all bits in the mask
> and then |= val & mask to set the corresponding bits from the
> read.
> 
> 2. The bgpio_get_multiple_be() call has a similar problem: it
> uses the |= operator to set the bits, so only the bits in the
> mask are affected, but it misses to clear all returned bits
> from the mask initially, so some bits will be returned
> erroneously set to 1.
> 
> 3. The bgpio_get_set_multiple() again fails to clear the bits
> from the mask.
> 
> Fixes: 80057cb417b2 ("gpio-mmio: Use the new .get_multiple() callback")
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Reported-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> Reported-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Clemens: it would be great if you could test this, I want to
> push the fix ASAP if it solves the problem.

It does not fix the regression, there is still an infinite loop. I
commented below, what I had to do to fix it:

> ---
>  drivers/gpio/gpio-mmio.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index f9042bcc27a4..eae078d43611 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -154,6 +154,9 @@ static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  	unsigned long set_mask = 0;
>  	int bit = 0;

Changing this to int bit = -1;

>  
> +	/* Make sure we first clear any bits that are zero when we read the register */
> +	*bits &= ~*mask;
> +
>  	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio) {

And this to ..        find_next_bit(mask, gc->ngpio, bit + 1) < gc->ngpio) {

Fixes the problem for me.

Lukas suggested we could remove the while loop and assign the masks
directly, which would be even simpler/better, e.g.
set_mask = mask & gc->bgpio_dir;
get_mask = mask & ~gc->bgpio_dir;

>  		if (gc->bgpio_dir & BIT(bit))
>  			set_mask |= BIT(bit);
> @@ -176,13 +179,13 @@ static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
>  
>  /*
>   * This only works if the bits in the GPIO register are in native endianness.
> - * It is dirt simple and fast in this case. (Also the most common case.)
>   */
>  static int bgpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
>  			      unsigned long *bits)
>  {
> -
> -	*bits = gc->read_reg(gc->reg_dat) & *mask;
> +	/* Make sure we first clear any bits that are zero when we read the register */
> +	*bits &= ~*mask;
> +	*bits |= gc->read_reg(gc->reg_dat) & *mask;
>  	return 0;
>  }
>  
> @@ -196,6 +199,9 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
>  	unsigned long val;
>  	int bit;
>  
> +	/* Make sure we first clear any bits that are zero when we read the register */
> +	*bits &= ~*mask;
> +
>  	/* Create a mirrored mask */
>  	bit = 0;
>  	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio)
> -- 
> 2.14.3
> 

Cheers,
Clemens
