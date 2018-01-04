From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3] gpio: winbond: add driver
Date: Thu, 04 Jan 2018 19:35:46 +0200
Message-ID: <1515087346.7000.696.camel@linux.intel.com>
References: <834ef274-35fc-0384-fb0f-df36effacf7c@maciej.szmigiero.name>
         <1515006309.7000.635.camel@linux.intel.com>
         <d118e4ed-3faf-ebfc-1ad3-ba3d2c1178eb@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:5758 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751294AbeADRhU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jan 2018 12:37:20 -0500
In-Reply-To: <d118e4ed-3faf-ebfc-1ad3-ba3d2c1178eb@maciej.szmigiero.name>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Linus Walleij <linus.walleij@linaro.org>, William Breathitt Gray <vilhelm.gray@gmail.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Thu, 2018-01-04 at 00:41 +0100, Maciej S. Szmigiero wrote:
> On 03.01.2018 20:05, Andy Shevchenko wrote:
> > On Sat, 2017-12-30 at 22:02 +0100, Maciej S. Szmigiero wrote:
> > > This commit adds GPIO driver for Winbond Super I/Os.

> > First of all, looking more at this driver, why don't we create a
> > gpiochip per real "port" during actual configuration?
> 
> Hmm.. there is only a one 'chip' here, so why would the driver want to
> register multiple ones?
> 
> That would also create at least one additional point of failure if
> one or more such gpiochip(s) register but one fails to do so.
> 
> > And I still have filing that this one suitable for MFD.
> 
> As I wrote previously, that would necessitate rewriting also w83627ehf
> hwmon and w83627hf_wdt drivers, and would make the driver stand out
> against other, similar Super I/O drivers.
> 
> > Anyone, does it make sense?

OK, at least I shared my point.

> > > +/* returns whether changing a pin is allowed */
> > > +static bool winbond_gpio_get_info(unsigned int *gpio_num,
> > > +				  const struct winbond_gpio_info
> > > **info)
> > > +{
> > > +	bool allow_changing = true;
> > > +	unsigned long i;
> > > +

> > > +	for_each_set_bit(i, &gpios, sizeof(gpios)) {

sizeof(gpios) will produce wrong number for you. It's rather
BITS_PER_LONG here. Right?

> > > +		if (*gpio_num < 8)
> > > +			break;
> > > +
> > > +		*gpio_num -= 8;
> > > +	}
> > 
> > Why not hweight() here?
> > 
> > unsigned int shift = hweight_long(gpios) * 8;
> > unsigned int index = fls_long(gpios); // AFAIU
> > 
> > *offset -= *offset >= shift ? shift : shift - 8;
> > *info = &winbond_gpio_infos[index];
> > 
> > ...
> 
> Unfortunately, this code doesn't produce the same results as the code
> above.
> 
> First, in this code "index" does not depend on "gpio_num" (or
> "offset")
> passed to winbond_gpio_get_info() function, so gpio 0 (on the first
> GPIO
> device or port) will access the same winbond_gpio_infos entry as gpio
> 18
> (which is located on the third GPIO port).

Actually, it does depend on gpio_num (it's your point to break the
loop).

So, fls(*offset) then (I renamed gpio_num to offset in my example).

> In fact, the calculated "index" would always point to the last enabled
> GPIO port (since that is the meaning of "gpios" MSB, assuming this
> user-provided parameter was properly verified or sanitized).

Yes, I missed that.

> Second, the calculated "offset" would end negative for anything but
> the
> very last GPIO port (ok, not really negative since it is an unsigned
> type,
> but still not correct either).

So, sounds like hweight_int(*offset) then. No?

> And that even not taking into account the special case of GPIO6 port
> that has only 5 gpios.

This doesn't matter because of check in ternary operator.

> What we want in this code is for "i" (or "index") to contain the GPIO
> port number for the passed "gpio_num" (or "offset") and that this
> last variable ends reduced modulo 8 from its original value.

Yep.

> > > +	if (gpios & ~GENMASK(ARRAY_SIZE(winbond_gpio_infos) - 1,
> > > 0))
> > > {
> > > +		wb_sio_err("unknown ports enabled in GPIO ports
> > > bitmask\n");
> > > +		return 0;
> > > +	}
> > 
> > Do we care? Perhaps just enforce mask based on the size and leave
> > garbage out.
> 
> Can be done either way, but I think notifying user that he or she has
> provided an incorrect parameter value is a good thing - we can use a
> accept-but-warn style.

I would prefer latter (accept-but-warn).

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
