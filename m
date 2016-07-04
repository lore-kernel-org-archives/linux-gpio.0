From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO configuration"
Date: Mon, 04 Jul 2016 23:33:16 +0300
Message-ID: <58708801.29lRIIaT3y@avalon>
References: <1467563525-30227-1-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34601 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753747AbcGDUcz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2016 16:32:55 -0400
In-Reply-To: <1467563525-30227-1-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Johan,

Thank you for the patch.

On Sunday 03 Jul 2016 18:32:05 Johan Hovold wrote:
> This reverts commit 923b93e451db876d1479d3e4458fce14fec31d1c.
> 
> Make sure consumers do not overwrite gpio flags for pins that have
> already been claimed.
> 
> While adding support for gpio drivers to refuse a request using
> unsupported flags, the order of when the requested flag was checked and
> the new flags were applied was reversed to that consumers could
> overwrite flags for already requested gpios.
> 
> This not only affects device-tree setups where two drivers could request
> the same gpio using conflicting configurations, but also allowed user
> space to clear gpio flags for already claimed pins simply by attempting
> to export them through the sysfs interface. By for example clearing the
> FLAG_ACTIVE_LOW flag this way, user space could effectively change the
> polarity of a signal.
> 
> Reverting this change obviously prevents gpio drivers from doing sanity
> checks on the flags in their request callbacks. Fortunately only one
> recently added driver (gpio-tps65218 in v4.6) appears to do this, and a
> follow up patch could restore this functionality through a different
> interface.

As we're not dealing with a v4.7 regression that would need to be applied this 
week, can't you propose a proper fix instead of a revert ?

> Cc: stable <stable@vger.kernel.org>	# 4.4
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpio/gpiolib-legacy.c |  8 +++----
>  drivers/gpio/gpiolib.c        | 52
> +++++++++++++------------------------------ 2 files changed, 20
> insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
> index 3a5c7011ad3b..8b830996fe02 100644
> --- a/drivers/gpio/gpiolib-legacy.c
> +++ b/drivers/gpio/gpiolib-legacy.c
> @@ -28,6 +28,10 @@ int gpio_request_one(unsigned gpio, unsigned long flags,
> const char *label) if (!desc && gpio_is_valid(gpio))
>  		return -EPROBE_DEFER;
> 
> +	err = gpiod_request(desc, label);
> +	if (err)
> +		return err;
> +
>  	if (flags & GPIOF_OPEN_DRAIN)
>  		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> 
> @@ -37,10 +41,6 @@ int gpio_request_one(unsigned gpio, unsigned long flags,
> const char *label) if (flags & GPIOF_ACTIVE_LOW)
>  		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> 
> -	err = gpiod_request(desc, label);
> -	if (err)
> -		return err;
> -
>  	if (flags & GPIOF_DIR_IN)
>  		err = gpiod_direction_input(desc);
>  	else
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 570771ed19e6..be74bd370f1f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1352,14 +1352,6 @@ static int __gpiod_request(struct gpio_desc *desc,
> const char *label) spin_lock_irqsave(&gpio_lock, flags);
>  	}
>  done:
> -	if (status < 0) {
> -		/* Clear flags that might have been set by the caller before
> -		 * requesting the GPIO.
> -		 */
> -		clear_bit(FLAG_ACTIVE_LOW, &desc->flags);
> -		clear_bit(FLAG_OPEN_DRAIN, &desc->flags);
> -		clear_bit(FLAG_OPEN_SOURCE, &desc->flags);
> -	}
>  	spin_unlock_irqrestore(&gpio_lock, flags);
>  	return status;
>  }
> @@ -2587,28 +2579,13 @@ struct gpio_desc *__must_check
> gpiod_get_optional(struct device *dev, }
>  EXPORT_SYMBOL_GPL(gpiod_get_optional);
> 
> -/**
> - * gpiod_parse_flags - helper function to parse GPIO lookup flags
> - * @desc:	gpio to be setup
> - * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
> - *		of_get_gpio_hog()
> - *
> - * Set the GPIO descriptor flags based on the given GPIO lookup flags.
> - */
> -static void gpiod_parse_flags(struct gpio_desc *desc, unsigned long lflags)
> -{
> -	if (lflags & GPIO_ACTIVE_LOW)
> -		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> -	if (lflags & GPIO_OPEN_DRAIN)
> -		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> -	if (lflags & GPIO_OPEN_SOURCE)
> -		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> -}
> 
>  /**
>   * gpiod_configure_flags - helper function to configure a given GPIO
>   * @desc:	gpio whose value will be assigned
>   * @con_id:	function within the GPIO consumer
> + * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
> + *		of_get_gpio_hog()
>   * @dflags:	gpiod_flags - optional GPIO initialization flags
>   *
>   * Return 0 on success, -ENOENT if no GPIO has been assigned to the
> @@ -2616,10 +2593,17 @@ static void gpiod_parse_flags(struct gpio_desc
> *desc, unsigned long lflags) * occurred while trying to acquire the GPIO.
>   */
>  static int gpiod_configure_flags(struct gpio_desc *desc, const char
> *con_id, -				 enum gpiod_flags dflags)
> +		unsigned long lflags, enum gpiod_flags dflags)
>  {
>  	int status;
> 
> +	if (lflags & GPIO_ACTIVE_LOW)
> +		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> +	if (lflags & GPIO_OPEN_DRAIN)
> +		set_bit(FLAG_OPEN_DRAIN, &desc->flags);
> +	if (lflags & GPIO_OPEN_SOURCE)
> +		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
> +
>  	/* No particular flag request, return here... */
>  	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
>  		pr_debug("no flags found for %s\n", con_id);
> @@ -2686,13 +2670,11 @@ struct gpio_desc *__must_check
> gpiod_get_index(struct device *dev, return desc;
>  	}
> 
> -	gpiod_parse_flags(desc, lookupflags);
> -
>  	status = gpiod_request(desc, con_id);
>  	if (status < 0)
>  		return ERR_PTR(status);
> 
> -	status = gpiod_configure_flags(desc, con_id, flags);
> +	status = gpiod_configure_flags(desc, con_id, lookupflags, flags);
>  	if (status < 0) {
>  		dev_dbg(dev, "setup of GPIO %s failed\n", con_id);
>  		gpiod_put(desc);
> @@ -2748,6 +2730,10 @@ struct gpio_desc *fwnode_get_named_gpiod(struct
> fwnode_handle *fwnode, if (IS_ERR(desc))
>  		return desc;
> 
> +	ret = gpiod_request(desc, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	if (active_low)
>  		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
> 
> @@ -2758,10 +2744,6 @@ struct gpio_desc *fwnode_get_named_gpiod(struct
> fwnode_handle *fwnode, set_bit(FLAG_OPEN_SOURCE, &desc->flags);
>  	}
> 
> -	ret = gpiod_request(desc, NULL);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
>  	return desc;
>  }
>  EXPORT_SYMBOL_GPL(fwnode_get_named_gpiod);
> @@ -2814,8 +2796,6 @@ int gpiod_hog(struct gpio_desc *desc, const char
> *name, chip = gpiod_to_chip(desc);
>  	hwnum = gpio_chip_hwgpio(desc);
> 
> -	gpiod_parse_flags(desc, lflags);
> -
>  	local_desc = gpiochip_request_own_desc(chip, hwnum, name);
>  	if (IS_ERR(local_desc)) {
>  		status = PTR_ERR(local_desc);
> @@ -2824,7 +2804,7 @@ int gpiod_hog(struct gpio_desc *desc, const char
> *name, return status;
>  	}
> 
> -	status = gpiod_configure_flags(desc, name, dflags);
> +	status = gpiod_configure_flags(desc, name, lflags, dflags);
>  	if (status < 0) {
>  		pr_err("setup of hog GPIO %s (chip %s, offset %d) failed, 
%d\n",
>  		       name, chip->label, hwnum, status);

-- 
Regards,

Laurent Pinchart

