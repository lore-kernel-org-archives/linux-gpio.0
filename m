From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] gpio-mmio: Use the new .get_multiple() callback
Date: Mon, 15 Jan 2018 19:47:28 +0100
Message-ID: <20180115184728.GA7999@wunner.de>
References: <20171020151030.25094-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:35839 "EHLO
        mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751205AbeAOSqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jan 2018 13:46:51 -0500
Content-Disposition: inline
In-Reply-To: <20171020151030.25094-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Anton Vorontsov <anton@enomsg.org>, Clemens Gruber <clemens.gruber@pqgruber.com>, Bartosz Golaszewski <brgl@bgdev.pl>

On Fri, Oct 20, 2017 at 05:10:30PM +0200, Linus Walleij wrote:
> It is possible to read all lines of a generic MMIO GPIO chip
> with a single register read so support this if we are in
> native endianness.
> 
> Add an especially quirky callback to read multiple lines for
> the variants that require you to read values from the
> output registers if and only if the line is set as output.
> We managed to do that with a maximum of two register reads,
> and just one read if the requested lines are all input or all
> output.
> 
> Cc: Anton Vorontsov <anton@enomsg.org>
> Cc: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I was cc'ed on this patch but unfortunately never got around to
reviewing it as I was swamped with other stuff.  Making up on that
now as the patch is causing a regression.


> +/*
> + * This assumes that the bits in the GPIO register are in native endianness.
> + * We only assign the function pointer if we have that.
> + */
> +static int bgpio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
> +				  unsigned long *bits)
> +{
> +	unsigned long get_mask = 0;
> +	unsigned long set_mask = 0;
> +	int bit = 0;
> +
> +	while ((bit = find_next_bit(mask, gc->ngpio, bit)) != gc->ngpio) {
> +		if (gc->bgpio_dir & BIT(bit))
> +			set_mask |= BIT(bit);
> +		else
> +			get_mask |= BIT(bit);
> +	}
> +
> +	if (set_mask)
> +		*bits |= gc->read_reg(gc->reg_set) & set_mask;
> +	if (get_mask)
> +		*bits |= gc->read_reg(gc->reg_dat) & get_mask;
> +
> +	return 0;
> +}

The while loop needs a "bit++;" at the end lest it becomes an
infinite loop.  That's because find_next_bit() starts searching
from "bit", not the bit after "bit".

Second, the while loop appears to be unnecessary, it seems it would
be possible to simply do this:

	set_mask = mask & gc->bgpio_dir;
	get_mask = mask & ~gc->bgpio_dir;

Third, I think we need to initialize *bits = 0 in case it contains
garbage.

Fourth, I notice bgpio_dir is an unsigned long.  Not a pointer to
an unsigned long, so not a bitmap.  Which means we cannot handle
gc->ngpio > sizeof(unsigned long).  Yet the driver doesn't check this
condition on ->probe and bail out if it's true.  Of course, once we
*do* support more than sizeof(unsigned long) pins, we need the while
loop again.

These issues are repeated in the remainder of the patch.

Thanks,

Lukas
