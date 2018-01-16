From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: [PATCH v2] gpio: mmio: Also read bits that are zero
Date: Tue, 16 Jan 2018 12:52:57 +0100
Message-ID: <20180116115257.GA7035@archie.localdomain>
References: <20180116110031.20533-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:49059 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751101AbeAPLxA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 06:53:00 -0500
Content-Disposition: inline
In-Reply-To: <20180116110031.20533-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Bartosz Golaszewski <brgl@bgdev.pl>

On Tue, Jan 16, 2018 at 12:00:31PM +0100, Linus Walleij wrote:
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
> 4. find_next_bit() wasn't handled correctly, use a totally
> different approach for one function and change the other
> function to follow the design pattern of assigning the first
> bit to -1, then use bit + 1 in the for loop and < num_iterations
> as break condition.
> 
> Fixes: 80057cb417b2 ("gpio-mmio: Use the new .get_multiple() callback")
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Reported-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> Reported-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix the bug initializing the bit counter to -1 rather than 0
>   by rewriting to exploit cached direction bits for one function
>   and following the kernel design pattern for the other.
> 
> Clemens: it would be great if you could test this, I want to
> push the fix ASAP if it solves the problem.
> ---
>  drivers/gpio/gpio-mmio.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index f9042bcc27a4..7b14d6280e44 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -152,14 +152,13 @@ static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
>  {
>  	unsigned long get_mask = 0;
>  	unsigned long set_mask = 0;
> -	int bit = 0;
>  
> -	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio) {
> -		if (gc->bgpio_dir & BIT(bit))
> -			set_mask |= BIT(bit);
> -		else
> -			get_mask |= BIT(bit);
> -	}
> +	/* Make sure we first clear any bits that are zero when we read the register */
> +	*bits &= ~*mask;
> +
> +	/* Exploit the fact that we know which directions are set */
> +	set_mask = *mask & gc->bgpio_dir;
> +	get_mask = *mask & ~gc->bgpio_dir;
>  
>  	if (set_mask)
>  		*bits |= gc->read_reg(gc->reg_set) & set_mask;
> @@ -176,13 +175,13 @@ static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
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
> @@ -196,9 +195,12 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
>  	unsigned long val;
>  	int bit;
>  
> +	/* Make sure we first clear any bits that are zero when we read the register */
> +	*bits &= ~*mask;
> +
>  	/* Create a mirrored mask */
> -	bit = 0;
> -	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio)
> +	bit = -1;
> +	while ((bit = find_next_bit(mask, gc->ngpio, bit + 1)) < gc->ngpio)
>  		readmask |= bgpio_line2mask(gc, bit);
>  
>  	/* Read the register */
> @@ -208,8 +210,8 @@ static int bgpio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
>  	 * Mirror the result into the "bits" result, this will give line 0
>  	 * in bit 0 ... line 31 in bit 31 for a 32bit register.
>  	 */
> -	bit = 0;
> -	while ((bit = find_next_bit(&val, gc->ngpio, bit)) != gc->ngpio)
> +	bit = -1;
> +	while ((bit = find_next_bit(&val, gc->ngpio, bit + 1)) < gc->ngpio)
>  		*bits |= bgpio_line2mask(gc, bit);
>  
>  	return 0;
> -- 
> 2.14.3
>

v2 fixes the problem on my little-endian i.MX6 board!

Tested-by: Clemens Gruber <clemens.gruber@pqgruber.com>

Thanks,
Clemens
