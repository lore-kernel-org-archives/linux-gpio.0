From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH RFC/RFT 1/2] gpio: allow atomic registration of gpio chip
 with pin ranges
Date: Tue, 13 Oct 2015 13:32:47 -0700
Message-ID: <561D6A6F.2080009@broadcom.com>
References: <1444578499-17980-1-git-send-email-jogo@openwrt.org>
 <1444578499-17980-2-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-gw1-out.broadcom.com ([216.31.210.62]:27360 "EHLO
	mail-gw1-out.broadcom.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751973AbbJMUdO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Oct 2015 16:33:14 -0400
In-Reply-To: <1444578499-17980-2-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Pramod KUMAR <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>

++ Broadcom engineers working on Cygnus GPIO driver

On 10/11/2015 8:48 AM, Jonas Gorski wrote:
> Allow registering gpio chip with ranges at the same time, so we know
> at registration time whether there is an associated pin controller.
> 
> This allows us to automatically populate the request/free callbacks,
> so that drivers are free to omit the assignment, if they do not need
> any special handling.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>  drivers/gpio/gpiolib-of.c   |  5 +++++
>  drivers/gpio/gpiolib.c      | 43 +++++++++++++++++++++++++++++++++++--------
>  drivers/gpio/gpiolib.h      |  9 +++++++++
>  include/linux/gpio/driver.h | 10 +++++++++-
>  4 files changed, 58 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 5fe34a9..e05f0c2e 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -415,6 +415,11 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>  	return 0;
>  }
>  
> +bool of_gpiochip_has_pin_range(struct gpio_chip *chip)
> +{
> +	return !!of_find_property(chip->of_node, "gpio-ranges", NULL);
> +}
> +
>  #else
>  static int of_gpiochip_add_pin_range(struct gpio_chip *chip) { return 0; }
>  #endif
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8eba02d..09d87ae 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -280,30 +280,47 @@ static int gpiochip_set_desc_names(struct gpio_chip *gc)
>  }
>  
>  /**
> - * gpiochip_add() - register a gpio_chip
> + * gpiochip_add_with_ranges() - register a gpio_chip with pin ranges
>   * @chip: the chip to register, with chip->base initialized
> + * @pinctrl_name: the dev_name() of the pin controller to map to
> + * @ranges: the mappings of relative gpio offsets to pins
> + * @nranges: the number of ranges
>   * Context: potentially before irqs will work
>   *
>   * Returns a negative errno if the chip can't be registered, such as
>   * because the chip->base is invalid or already associated with a
>   * different chip.  Otherwise it returns zero as a success code.
>   *
> - * When gpiochip_add() is called very early during boot, so that GPIOs
> - * can be freely used, the chip->dev device must be registered before
> - * the gpio framework's arch_initcall().  Otherwise sysfs initialization
> - * for GPIOs will fail rudely.
> + * When gpiochip_add_with_ranges() is called very early during boot, so
> + * that GPIOs can be freely used, the chip->dev device must be
> + * registered before the gpio framework's arch_initcall().  Otherwise
> + * sysfs initialization for GPIOs will fail rudely.
>   *
>   * If chip->base is negative, this requests dynamic assignment of
>   * a range of valid GPIOs.
> + *
> + * If nranges is zero, pinctrl_name and ranges may be NULL.
> + * If nranges is not zero or chip->of_node is populated and has a
> + * "gpio-ranges" property, chip->request and chip->free will be populated
> + * with generic callbacks if not yet set.
>   */
> -int gpiochip_add(struct gpio_chip *chip)
> +int gpiochip_add_with_ranges(struct gpio_chip *chip, const char *pinctl_name,
> +			     const struct pinctrl_gpio_range *ranges,
> +			     unsigned int nranges)
>  {
>  	unsigned long	flags;
>  	int		status = 0;
> -	unsigned	id;
> +	unsigned	id, i;
>  	int		base = chip->base;
>  	struct gpio_desc *descs;
>  
> +	if ((ranges > 0) || of_gpiochip_has_pin_range(chip)) {
> +		if (!chip->request)
> +			chip->request = gpiochip_generic_request;
> +		if (!chip->free)
> +			chip->free = gpiochip_generic_free;
> +	}
> +
>  	descs = kcalloc(chip->ngpio, sizeof(descs[0]), GFP_KERNEL);
>  	if (!descs)
>  		return -ENOMEM;
> @@ -359,6 +376,15 @@ int gpiochip_add(struct gpio_chip *chip)
>  	if (status)
>  		goto err_remove_chip;
>  
> +	for (i = 0; i < nranges; i++) {
> +		const struct pinctrl_gpio_range *range = &ranges[i];
> +
> +		status = gpiochip_add_pin_range(chip, pinctl_name, range->base,
> +						range->pin_base, range->npins);
> +		if (status)
> +			goto err_remove_chip;
> +	}
> +
>  	acpi_gpiochip_add(chip);
>  
>  	status = gpiochip_sysfs_register(chip);
> @@ -373,6 +399,7 @@ int gpiochip_add(struct gpio_chip *chip)
>  
>  err_remove_chip:
>  	acpi_gpiochip_remove(chip);
> +	gpiochip_remove_pin_ranges(chip);
>  	gpiochip_free_hogs(chip);
>  	of_gpiochip_remove(chip);
>  err_remove_from_list:
> @@ -389,7 +416,7 @@ err_free_descs:
>  		chip->label ? : "generic");
>  	return status;
>  }
> -EXPORT_SYMBOL_GPL(gpiochip_add);
> +EXPORT_SYMBOL_GPL(gpiochip_add_with_ranges);
>  
>  /**
>   * gpiochip_remove() - unregister a gpio_chip
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 78e634d..6f49e25 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -72,6 +72,15 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
>  
>  struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
>  
> +#if defined(CONFIG_OF_GPIO) && defined(CONFIG_PINCTRL)
> +bool of_gpiochip_has_pin_range(struct gpio_chip *chip);
> +#else
> +static inline bool of_gpiochip_has_pin_range(struct gpio_chip *chip)
> +{
> +	return false;
> +}
> +#endif
> +
>  extern struct spinlock gpio_lock;
>  extern struct list_head gpio_chips;
>  
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index d1baebf..727ae9e 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -166,7 +166,15 @@ extern const char *gpiochip_is_requested(struct gpio_chip *chip,
>  			unsigned offset);
>  
>  /* add/remove chips */
> -extern int gpiochip_add(struct gpio_chip *chip);
> +int gpiochip_add_with_ranges(struct gpio_chip *chip, const char *pinctl_name,
> +			     const struct pinctrl_gpio_range *ranges,
> +			     unsigned int nranges);
> +
> +static inline int gpiochip_add(struct gpio_chip *chip)
> +{
> +	return gpiochip_add_with_ranges(chip, NULL, NULL, 0);
> +}
> +
>  extern void gpiochip_remove(struct gpio_chip *chip);
>  extern struct gpio_chip *gpiochip_find(void *data,
>  			      int (*match)(struct gpio_chip *chip, void *data));
> 
