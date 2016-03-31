From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] gpio: Do not accept gpio chip additions before gpiolib
 initialization
Date: Thu, 31 Mar 2016 08:59:00 -0700
Message-ID: <20160331155900.GA5605@roeck-us.net>
References: <1459275638-11717-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38710 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515AbcCaP67 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 11:58:59 -0400
Content-Disposition: inline
In-Reply-To: <1459275638-11717-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 29, 2016 at 11:20:38AM -0700, Guenter Roeck wrote:
> Since commit ff2b13592299 ("gpio: make the gpiochip a real device"),
> attempts to add a gpio chip prior to gpiolib initialization cause the
> system to crash. Dump a warning to the console and return an error
> if the situation is encountered.
> 
> Fixes: ff2b13592299 ("gpio: make the gpiochip a real device")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Please drop this one; I think the other series I sent out earlier today
is much better.

Guenter

> ---
>  drivers/gpio/gpiolib.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 72065532c1c7..ac66219f0611 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -68,6 +68,7 @@ LIST_HEAD(gpio_devices);
>  static void gpiochip_free_hogs(struct gpio_chip *chip);
>  static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
>  
> +static bool gpiolib_initialized;
>  
>  static inline void desc_set_label(struct gpio_desc *d, const char *label)
>  {
> @@ -457,6 +458,9 @@ static void gpiodevice_release(struct device *dev)
>   * the gpio framework's arch_initcall().  Otherwise sysfs initialization
>   * for GPIOs will fail rudely.
>   *
> + * gpiochip_add_data() must only be called after gpiolib initialization,
> + * ie after core_initcall().
> + *
>   * If chip->base is negative, this requests dynamic assignment of
>   * a range of valid GPIOs.
>   */
> @@ -468,6 +472,11 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
>  	int		base = chip->base;
>  	struct gpio_device *gdev;
>  
> +	if (!gpiolib_initialized) {
> +		WARN(1, "gpiolib not initialized\n");
> +		return -EPROBE_DEFER;
> +	}
> +
>  	/*
>  	 * First: allocate and populate the internal stat container, and
>  	 * set up the struct device.
> @@ -2829,6 +2838,8 @@ static int __init gpiolib_dev_init(void)
>  	if (ret < 0) {
>  		pr_err("gpiolib: failed to allocate char dev region\n");
>  		bus_unregister(&gpio_bus_type);
> +	} else {
> +		gpiolib_initialized = true;
>  	}
>  	return ret;
>  }
> -- 
> 2.5.0
> 
