From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3] gpio: winbond: add driver
Date: Wed, 03 Jan 2018 21:05:09 +0200
Message-ID: <1515006309.7000.635.camel@linux.intel.com>
References: <834ef274-35fc-0384-fb0f-df36effacf7c@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:48459 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750829AbeACTLN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 3 Jan 2018 14:11:13 -0500
In-Reply-To: <834ef274-35fc-0384-fb0f-df36effacf7c@maciej.szmigiero.name>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Linus Walleij <linus.walleij@linaro.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Jonathan Cameron <jic23@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org

On Sat, 2017-12-30 at 22:02 +0100, Maciej S. Szmigiero wrote:
> This commit adds GPIO driver for Winbond Super I/Os.
> 
> Currently, only W83627UHG model (also known as Nuvoton NCT6627UD) is
> supported but in the future a support for other Winbond models, too,
> can
> be added to the driver.
> 
> A module parameter "gpios" sets a bitmask of GPIO ports to enable (bit
> 0 is
> GPIO1, bit 1 is GPIO2, etc.).
> One should be careful which ports one tinkers with since some might be
> managed by the firmware (for functions like powering on and off,
> sleeping,
> BIOS recovery, etc.) and some of GPIO port pins are physically shared
> with
> other devices included in the Super I/O chip.
> 

Thanks for an update.
My comments below.

First of all, looking more at this driver, why don't we create a
gpiochip per real "port" during actual configuration?

And I still have filing that this one suitable for MFD.

Anyone, does it make sense?

> +#define WB_SIO_REG_G1MF_G2PP		7
> +#define WB_SIO_REG_G1MF_G1PP		6

Forgot to swap.

> +#define wb_sio_notice(...) pr_notice(WB_GPIO_DRIVER_NAME ": "
> __VA_ARGS__)
> +#define wb_sio_warn(...) pr_warn(WB_GPIO_DRIVER_NAME ": "
> __VA_ARGS__)
> +#define wb_sio_err(...) pr_err(WB_GPIO_DRIVER_NAME ": " __VA_ARGS__)

What I meant is to

#define pr_fmt(x) ...

Look at the kernel sources, there are a lot of examples.

> +/* returns whether changing a pin is allowed */
> +static bool winbond_gpio_get_info(unsigned int *gpio_num,
> +				  const struct winbond_gpio_info
> **info)
> +{
> +	bool allow_changing = true;
> +	unsigned long i;
> +
> +	for_each_set_bit(i, &gpios, sizeof(gpios)) {
> +		if (*gpio_num < 8)
> +			break;
> +
> +		*gpio_num -= 8;
> +	}

Why not hweight() here?

unsigned int shift = hweight_long(gpios) * 8;
unsigned int index = fls_long(gpios); // AFAIU

*offset -= *offset >= shift ? shift : shift - 8;
*info = &winbond_gpio_infos[index];

...

> +
> +	*info = &winbond_gpio_infos[i];
> +
> +	/*
> +	 * GPIO2 (the second port) shares some pins with a basic PC
> +	 * functionality, which is very likely controlled by the
> firmware.
> +	 * Don't allow changing these pins by default.
> +	 */
> +	if (i == 1) {
> +		if (*gpio_num == 0 && !pledgpio)
> +			allow_changing = false;
> +		else if (*gpio_num == 1 && !beepgpio)
> +			allow_changing = false;
> +		else if ((*gpio_num == 5 || *gpio_num == 6) &&
> !i2cgpio)
> +			allow_changing = false;
> +	}
> +
> +	return allow_changing;
> +}

> +static int winbond_gpio_configure(unsigned long base)
> +{
> +	unsigned long i;
> +
> +	for_each_set_bit(i, &gpios, sizeof(gpios))
> +		if (!winbond_gpio_configure_port(base, i))
> +			gpios &= ~BIT(i);

> +
> +	if (!gpios) {
> +		wb_sio_err("please use 'gpios' module parameter to
> select some active GPIO ports to enable\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> 

> +static int winbond_gpio_imatch(struct device *dev, unsigned int id)
> +{
> +	int ret;
> +

> +	if (gpios & ~GENMASK(ARRAY_SIZE(winbond_gpio_infos) - 1, 0))
> {
> +		wb_sio_err("unknown ports enabled in GPIO ports
> bitmask\n");
> +		return 0;
> +	}

Do we care? Perhaps just enforce mask based on the size and leave
garbage out.

> +	/*
> +	 * if the 'base' module parameter is unset probe two chip
> default
> +	 * I/O port bases
> +	 */
> +	baseparam = WB_SIO_BASE;
> +	ret = winbond_gpio_check_chip(baseparam);
> +	if (ret == 0)
> +		return 1;

> +	else if (ret != -ENODEV && ret != -EBUSY)

Redundant 'else'.

> +		return 0;
> +
> +	baseparam = WB_SIO_BASE_HIGH;
> +	return winbond_gpio_check_chip(baseparam) == 0;
> +}
> +
> +static int winbond_gpio_iprobe(struct device *dev, unsigned int id)
> +{
> +	int ret;
> +
> +	if (baseparam == 0)
> +		return -EINVAL;
> +
> +	ret = winbond_sio_enter(baseparam);
> +	if (ret)
> +		return ret;
> +
> +	ret = winbond_gpio_configure(baseparam);

...like registering MFD children in that call directly?

> +
> +	winbond_sio_leave(baseparam);
> +
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Add 8 gpios for every GPIO port that was enabled in gpios
> +	 * module parameter (that wasn't disabled earlier in
> +	 * winbond_gpio_configure() & co. due to, for example, a pin
> conflict).
> +	 */

> +	winbond_gpio_chip.ngpio = hweight_long(gpios) * 8;
> +
> +	/*
> +	 * GPIO6 port has only 5 pins, so if it is enabled we have to
> adjust
> +	 * the total count appropriately
> +	 */
> +	if (gpios & BIT(5))
> +		winbond_gpio_chip.ngpio -= (8 - 5);

So, if we still are going use this, taking into consideration above
proposal, it would make sense just to cache values in some internal
struct and use above, right?

> +
> +	winbond_gpio_chip.parent = dev;
> +
> +	return devm_gpiochip_add_data(dev, &winbond_gpio_chip,
> &baseparam);
> +}

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
