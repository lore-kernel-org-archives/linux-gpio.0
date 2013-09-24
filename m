From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH] RFC: gpio: add API to be strict about GPIO IRQ usage
Date: Tue, 24 Sep 2013 17:42:09 +0200
Message-ID: <5241B2D1.7060405@collabora.co.uk>
References: <1380022390-21262-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:60320 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753005Ab3IXPmj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Sep 2013 11:42:39 -0400
In-Reply-To: <1380022390-21262-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Stephen Warren <swarren@wwwdotorg.org>

On 09/24/2013 01:33 PM, Linus Walleij wrote:
> It is currently often possible in many GPIO drivers to request
> a GPIO line to be used as IRQ after calling gpio_to_irq() and,
> as the gpiolib is not aware of this, set the same line to
> output and start driving it, with undesired side effects.
> 
> As it is a bogus usage scenario to request a line flagged as
> output to used as IRQ, we introduce APIs to let gpiolib track
> the use of a line as IRQ, and also set this flag from the
> userspace ABI.
> 
> In this RFC patch we also augment the Nomadik pinctrl driver
> to use this API to give an idea of how it is to be used.
> It is probably not possible to lock line as IRQ in the gpiolib
> .to_irq() callback, as the line may have different use cases
> over time in a system. For a certain system or driver it may
> however be possible to lock the line as IRQ in the .to_irq()
> path. An alternative approach is to let the irq_chip
> .irq_enable() callback do this.
> 
> The API is symmetric so that lines can also be unflagged from
> IRQ use by e.g. .irq_disable(). The debugfs file is altered
> so that we see if a line is reserved for IRQ.
> 
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Enric Balletbo i Serra <eballetbo@gmail.com>
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c            | 86 ++++++++++++++++++++++++++++++++++++++-
>  drivers/pinctrl/pinctrl-nomadik.c |  8 ++++
>  include/asm-generic/gpio.h        |  3 ++
>  include/linux/gpio.h              | 11 +++++
>  4 files changed, 106 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 4fc2860..199ba51 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -60,6 +60,7 @@ struct gpio_desc {
>  #define FLAG_ACTIVE_LOW	6	/* sysfs value has active low */
>  #define FLAG_OPEN_DRAIN	7	/* Gpio is open drain type */
>  #define FLAG_OPEN_SOURCE 8	/* Gpio is open source type */
> +#define FLAG_USED_AS_IRQ 9	/* GPIO is connected to an IRQ */
>  
>  #define ID_SHIFT	16	/* add new flags before this one */
>  
> @@ -163,6 +164,17 @@ static struct gpio_desc *gpio_to_desc(unsigned gpio)
>  }
>  
>  /**
> + * Convert an offset on a certain chip to a corresponding descriptor
> + */
> +static struct gpio_desc *gpiochip_offset_to_desc(struct gpio_chip *chip,
> +						 unsigned int offset)
> +{
> +	unsigned int gpio = chip->base + offset;
> +
> +	return gpio_to_desc(gpio);
> +}
> +
> +/**
>   * Convert a GPIO descriptor to the integer namespace.
>   * This should disappear in the future but is needed since we still
>   * use GPIO numbers for error messages and sysfs nodes
> @@ -466,6 +478,13 @@ static int gpio_setup_irq(struct gpio_desc *desc, struct device *dev,
>  	if (ret < 0)
>  		goto free_id;
>  
> +	ret = gpiod_lock_as_irq(desc);
> +	if (ret < 0) {
> +		gpiod_warn(desc,
> +			   "failed to flag the GPIO for IRQ\n");
> +		goto free_id;
> +	}
> +
>  	desc->flags |= gpio_flags;
>  	return 0;
>  
> @@ -1730,6 +1749,14 @@ static int gpiod_direction_output(struct gpio_desc *desc, int value)
>  		return -EINVAL;
>  	}
>  
> +	/* GPIOs used for IRQs shall not be set as output */
> +	if (test_bit(FLAG_USED_AS_IRQ, &desc->flags)) {
> +		gpiod_err(desc,
> +			  "%s: tried to set a GPIO tied to an IRQ as output\n",
> +			  __func__);
> +		return -EIO;
> +	}
> +
>  	/* Open drain pin should not be driven to 1 */
>  	if (value && test_bit(FLAG_OPEN_DRAIN,  &desc->flags))
>  		return gpiod_direction_input(desc);
> @@ -2050,6 +2077,58 @@ int __gpio_to_irq(unsigned gpio)
>  }
>  EXPORT_SYMBOL_GPL(__gpio_to_irq);
>  
> +/**
> + * gpiod_lock_as_irq() - lock a GPIO to be used as IRQ
> + * @gpio: the GPIO line to lock as used for IRQ
> + *
> + * This is used directly by GPIO drivers that want to lock down
> + * a certain GPIO line to be used as IRQs, for example in the
> + * .to_irq() callback of their gpio_chip, or in the .irq_enable()
> + * of its irq_chip implementation if the GPIO is known from that
> + * code.
> + */
> +static int gpiod_lock_as_irq(struct gpio_desc *desc)
> +{
> +	if (!desc)
> +		return -EINVAL;
> +
> +	if (test_bit(FLAG_IS_OUT, &desc->flags)) {
> +		gpiod_err(desc,
> +			  "%s: tried to flag a GPIO set as output for IRQ\n",
> +			  __func__);
> +		return -EIO;
> +	}
> +
> +	set_bit(FLAG_USED_AS_IRQ, &desc->flags);
> +	return 0;
> +}
> +
> +int gpio_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +	return gpiod_lock_as_irq(gpiochip_offset_to_desc(chip, offset));
> +}
> +EXPORT_SYMBOL_GPL(gpio_lock_as_irq);
> +
> +/**
> + * gpiod_unlock_as_irq() - unlock a GPIO used as IRQ
> + * @gpio: the GPIO line to unlock from IRQ usage
> + *
> + * This is used directly by GPIO drivers that want to indicate
> + * that a certain GPIO is no longer used exclusively for IRQ.
> + */
> +static void gpiod_unlock_as_irq(struct gpio_desc *desc)
> +{
> +	if (!desc)
> +		return;
> +
> +	clear_bit(FLAG_USED_AS_IRQ, &desc->flags);
> +}
> +
> +void gpio_unlock_as_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +	return gpiod_unlock_as_irq(gpiochip_offset_to_desc(chip, offset));
> +}
> +EXPORT_SYMBOL_GPL(gpio_unlock_as_irq);
>  
>  /* There's no value in making it easy to inline GPIO calls that may sleep.
>   * Common examples include ones connected to I2C or SPI chips.
> @@ -2091,6 +2170,7 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  	unsigned		gpio = chip->base;
>  	struct gpio_desc	*gdesc = &chip->desc[0];
>  	int			is_out;
> +	int			is_irq;
>  
>  	for (i = 0; i < chip->ngpio; i++, gpio++, gdesc++) {
>  		if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
> @@ -2098,12 +2178,14 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
>  
>  		gpiod_get_direction(gdesc);
>  		is_out = test_bit(FLAG_IS_OUT, &gdesc->flags);
> -		seq_printf(s, " gpio-%-3d (%-20.20s) %s %s",
> +		is_irq = test_bit(FLAG_USED_AS_IRQ, &gdesc->flags);
> +		seq_printf(s, " gpio-%-3d (%-20.20s) %s %s %s",
>  			gpio, gdesc->label,
>  			is_out ? "out" : "in ",
>  			chip->get
>  				? (chip->get(chip, i) ? "hi" : "lo")
> -				: "?  ");
> +				: "?  ",
> +			is_irq ? "IRQ" : "   ");
>  		seq_printf(s, "\n");
>  	}
>  }
> diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
> index d7c3ae3..e2d9e36 100644
> --- a/drivers/pinctrl/pinctrl-nomadik.c
> +++ b/drivers/pinctrl/pinctrl-nomadik.c
> @@ -795,6 +795,14 @@ static int nmk_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct nmk_gpio_chip *nmk_chip =
>  		container_of(chip, struct nmk_gpio_chip, chip);
> +	int ret;
> +
> +	ret = gpio_lock_as_irq(chip, offset);
> +	if (ret) {
> +		dev_err(chip->dev, "unable to lock offset %d for IRQ\n",
> +			offset);
> +		return ret;
> +	}
>  
>  	return irq_create_mapping(nmk_chip->domain, offset);
>  }
> diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
> index bde6469..b309a5c 100644
> --- a/include/asm-generic/gpio.h
> +++ b/include/asm-generic/gpio.h
> @@ -192,6 +192,9 @@ extern int __gpio_cansleep(unsigned gpio);
>  
>  extern int __gpio_to_irq(unsigned gpio);
>  
> +extern int gpio_lock_as_irq(struct gpio_chip *chip, unsigned int offset);
> +extern void gpio_unlock_as_irq(struct gpio_chip *chip, unsigned int offset);
> +
>  extern int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
>  extern int gpio_request_array(const struct gpio *array, size_t num);
>  extern void gpio_free_array(const struct gpio *array, size_t num);
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index 552e3f4..68e5523 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -204,6 +204,17 @@ static inline int gpio_to_irq(unsigned gpio)
>  	return -EINVAL;
>  }
>  
> +static inline int gpio_lock_as_irq(struct gpio_chip *chip, unsigned int offset)
> +{
> +	WARN_ON(1);
> +}
> +
> +static inline void gpio_unlock_as_irq(struct gpio_chip *chip,
> +				      unsigned int offset)
> +{
> +	WARN_ON(1);
> +}
> +
>  static inline int irq_to_gpio(unsigned irq)
>  {
>  	/* irq can never have been returned from gpio_to_irq() */
> 

Hi Linus,

Thanks a lot for the patch, with your changes to gpiolib I could get rid of my
custom check on gpio_chip .direction_output function handler in gpio-omap.

I call gpio_lock_as_irq() in the irq_chip .irq_set_type and unlock it on
.irq_shutdown functions handlers.

I thought about posting a new version of my RFC path with these changes but it
seems that Tony is fond to first fix the regression and then take care of this.

By the way, I had to declare the function prototypes for
gpiod_{lock,unlock}_as_irq() since at least the lock function was used in
gpio_setup_irq() before its definition.

So with the following change [1] feel free to add my Reviewed-by when you post
this as a patch.

Thanks a lot and best regards,
Javier

[1]: diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c5dfc44..f96b79c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -97,6 +97,8 @@ static int gpiod_get_value(const struct gpio_desc *desc);
 static void gpiod_set_value(struct gpio_desc *desc, int value);
 static int gpiod_cansleep(const struct gpio_desc *desc);
 static int gpiod_to_irq(const struct gpio_desc *desc);
+static int gpiod_lock_as_irq(struct gpio_desc *desc);
+static void gpiod_unlock_as_irq(struct gpio_desc *desc);
 static int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
 static int gpiod_export_link(struct device *dev, const char *name,
                             struct gpio_desc *desc);




