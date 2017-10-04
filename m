From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/4] gpio: Introduce ->get_multiple callback
Date: Wed, 4 Oct 2017 22:32:03 +0200
Message-ID: <20171004203203.GC9195@wunner.de>
References: <cover.1503319573.git.lukas@wunner.de>
 <46dea76d0adfe25f30b564d9dc5b3f2b4de099c9.1503319573.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bmailout2.hostsharing.net ([83.223.90.240]:42011 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751135AbdJDUjM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2017 16:39:12 -0400
Content-Disposition: inline
In-Reply-To: <46dea76d0adfe25f30b564d9dc5b3f2b4de099c9.1503319573.git.lukas@wunner.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Duckeck <m.duckeck@kunbus.de>, Phil Elwell <phil@raspberrypi.org>, linux-gpio@vger.kernel.org

Hi Linus,

one question popped up regarding this patch that I'd like to clarify
before reposting a revised series:

On Mon, Aug 21, 2017 at 03:12:00PM +0200, Lukas Wunner wrote:
> SPI-attached GPIO controllers typically read out all inputs in one go.
> If callers desire the values of multipe inputs, ideally a single readout
> should take place to return the desired values.  However the current
> driver API only offers a ->get callback but no ->get_multiple (unlike
> ->set_multiple, which is present).  Thus, to read multiple inputs, a
> full readout needs to be performed for every single value (barring
> driver-internal caching), which is inefficient.
[...]
> Introduce the missing callback.  Add corresponding consumer functions
> such as gpiod_get_array_value().  Amend linehandle_ioctl() to take
> advantage of the newly added infrastructure.
[...]
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -365,28 +365,28 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
>  	struct linehandle_state *lh = filep->private_data;
>  	void __user *ip = (void __user *)arg;
>  	struct gpiohandle_data ghd;
> +	int vals[GPIOHANDLES_MAX];
>  	int i;
>  
>  	if (cmd == GPIOHANDLE_GET_LINE_VALUES_IOCTL) {
> -		int val;
> +		/* TODO: check if descriptors are really input */
> +		int ret = gpiod_get_array_value_complex(false,
> +							true,
> +							lh->numdescs,
> +			     (const struct gpio_desc **)lh->descs,
> +							vals);

I've designed the function signature of

    gpiod_get_array_value_complex()
    gpiod_get_raw_array_value()
    gpiod_get_array_value()
    gpiod_get_raw_array_value_cansleep()
    gpiod_get_array_value_cansleep()

such that a "const struct gpio_desc **" argument is passed in (the point
being the const).  This was done to enforce const-correctness and for
consistency with the family of functions to read a single GPIO, such as
gpiod_get_value() which take a "const struct gpio_desc *".

However after actually using the newly introduced functions in a driver,
I've discovered that the const keyword is mostly just an annoyance in this
case:  When acquiring GPIOs with gpiod_get_array(), the resulting
struct gpio_desc ** is not const.  Thus, a cast is necessary whenever
feeding the result of gpiod_get_array() to gpiod_get_array_value(),
which may well be the most common use case.  (It's probably less common
that folks construct the array by hand.)  A cast is also already necessary
for the invocation of gpiod_get_array_value_complex() quoted above.

So I'm wondering if the const keyword does more harm than good in this case.
Let me know what you think.

Thanks,

Lukas
