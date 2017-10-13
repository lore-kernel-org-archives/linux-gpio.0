From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 5/5] gpio: Add driver for Maxim MAX3191x industrial
 serializer
Date: Fri, 13 Oct 2017 13:11:24 +0200
Message-ID: <20171013111124.GA12351@wunner.de>
References: <cover.1507797496.git.lukas@wunner.de>
 <165c5061f7f309ecb7f1a3d32c8f7df5026f4a47.1507797496.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bmailout1.hostsharing.net ([83.223.95.100]:58407 "EHLO
        bmailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757911AbdJMLL0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2017 07:11:26 -0400
Content-Disposition: inline
In-Reply-To: <165c5061f7f309ecb7f1a3d32c8f7df5026f4a47.1507797496.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Phil Reid <preid@electromag.com.au>, David Daney <david.daney@cavium.com>, Iban Rodriguez <irodriguez@cemitec.com>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org

[cc += William Breathitt Gray, Geert Uytterhoeven, Phil Reid,
       David Daney, Iban Rodriguez]

The drivers

       gpio-104-dio-48e.c, gpio-74x164.c, gpio-gpio-mm.c,
       gpio-pca953x.c, gpio-thunderx.c, gpio-ws16c48.c,
       gpio-xilinx.c

currently use an inefficient algorithm for their ->set_multiple
callback:  They iterate over every chip (or bank or gpio pin),
check if any bits are set in the mask for this particular chip,
and if so, update the affected GPIOs.  If the mask is sparsely
populated, you'll waste CPU time checking chips even though
they're not affected by the operation at all.

Iterating over the chips is backwards, it is more efficient to
iterate over the bits set in the mask, identify the corresponding
chip and update its affected GPIOs.  The gpio-max3191x.c driver
I posted yesterday contains an example for such an algorithm and
you may want to improve your ->set_mutiple implementation accordingly:


> +static int max3191x_get_multiple(struct gpio_chip *gpio, unsigned long *mask,
> +				 unsigned long *bits)
> +{
> +	struct max3191x_chip *max3191x = gpiochip_get_data(gpio);
> +	int ret, bit = 0, wordlen = max3191x_wordlen(max3191x);
> +
> +	mutex_lock(&max3191x->lock);
> +	ret = max3191x_readout_locked(max3191x);
> +	if (ret)
> +		goto out_unlock;
> +
> +	while ((bit = find_next_bit(mask, gpio->ngpio, bit)) != gpio->ngpio) {
> +		unsigned int chipnum = bit / MAX3191X_NGPIO;
> +		unsigned long in, shift, index;
> +
> +		if (max3191x_chip_is_faulting(max3191x, chipnum)) {
> +			ret = -EIO;
> +			goto out_unlock;
> +		}
> +
> +		in = ((u8 *)max3191x->xfer.rx_buf)[chipnum * wordlen];
> +		shift = round_down(bit % BITS_PER_LONG, MAX3191X_NGPIO);
> +		index = bit / BITS_PER_LONG;
> +		bits[index] &= ~(mask[index] & (0xff << shift));
> +		bits[index] |= mask[index] & (in << shift); /* copy bits */
> +
> +		bit = (chipnum + 1) * MAX3191X_NGPIO; /* go to next chip */
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&max3191x->lock);
> +	return ret;
> +}


I've used a while loop, obviously the same can be achieved with a
for loop but I found that harder to read and it didn't save any LoC.

This particular chip has 8 inputs (= MAX3191X_NGPIO) that can be read
concurrently.

The series containing this driver introduces a ->get_multiple callback.
Since you've implemented a ->set_multiple callback, you may want to
add a ->get_multiple callback to your driver as well.  (If supported
by the hardware, which is not the case for output-only chips such as
gpio-74x164.c.)

You can find the full series here:
https://www.spinics.net/lists/linux-gpio/msg25997.html

If you want to fetch the series from a git repo, use this branch:
https://github.com/RevolutionPi/linux/commits/revpi-4.9

Thanks,

Lukas
