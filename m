From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio / ACPI: Add label to the gpio request
Date: Mon, 15 Jun 2015 18:34:11 +0300
Message-ID: <20150615153411.GS1478@lahna.fi.intel.com>
References: <20150614220057.GC29802@yumi.tdiedrich.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:46860 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755945AbbFOPgY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 15 Jun 2015 11:36:24 -0400
Content-Disposition: inline
In-Reply-To: <20150614220057.GC29802@yumi.tdiedrich.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tobias Diedrich <ranma+kernel@tdiedrich.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 15, 2015 at 12:00:57AM +0200, Tobias Diedrich wrote:
> In leds-gpio.c create_gpio_led only the legacy path propagates the label
> by passing it into devm_gpio_request_one. Similarily gpio_keys_polled.c
> also neglects to propagate the name to the gpio subsystem.
> 
> On the newer devicetree/acpi path the label is lost as far as the GPIO
> subsystem goes (it is only retained as name in struct gpio_led.
> 
> Amend devm_get_gpiod_from_child to take an additonal (optional) label
                                             ^^^^^^^^^
additional

Also please spell ACPI consistently with capital letters.

> argument and propagate it so it will show up in /sys/kernel/debug/gpio.
> 
> So instead of:
> 
> GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
>  gpio-475 (?                   ) in  hi
>  gpio-477 (?                   ) out hi
>  gpio-478 (?                   ) out lo
>  gpio-479 (?                   ) out hi
> 
> we get the much nicer output:
> 
> GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
>  gpio-475 (switch1             ) in  hi
>  gpio-477 (led1                ) out hi
>  gpio-478 (led2                ) out lo
>  gpio-479 (led3                ) out hi

That is nicer, indeed :-)

> Signed-off-by: Tobias Diedrich <ranma+kernel@tdiedrich.de>
> ---
>  drivers/gpio/devres.c                     |  6 ++++--
>  drivers/gpio/gpiolib.c                    |  6 ++++--
>  drivers/input/keyboard/gpio_keys_polled.c |  9 +++++----
>  drivers/leds/leds-gpio.c                  | 20 +++++++++++---------
>  include/linux/gpio/consumer.h             |  6 ++++--
>  5 files changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
> index 07ba823..40a6089 100644
> --- a/drivers/gpio/devres.c
> +++ b/drivers/gpio/devres.c
> @@ -127,13 +127,15 @@ EXPORT_SYMBOL(__devm_gpiod_get_index);
>   * @dev:	GPIO consumer
>   * @con_id:	function within the GPIO consumer
>   * @child:	firmware node (child of @dev)
> + * @label:	a literal description string of this GPIO

It should say that this is optional and passing NULL is just as fine.

>   *
>   * GPIO descriptors returned from this function are automatically disposed on
>   * driver detach.
>   */
>  struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>  					    const char *con_id,
> -					    struct fwnode_handle *child)
> +					    struct fwnode_handle *child,
> +					    const char *label)
>  {
>  	static const char * const suffixes[] = { "gpios", "gpio" };
>  	char prop_name[32]; /* 32 is max size of property name */
> @@ -154,7 +156,7 @@ struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>  			snprintf(prop_name, sizeof(prop_name), "%s",
>  							       suffixes[i]);
>  
> -		desc = fwnode_get_named_gpiod(child, prop_name);
> +		desc = fwnode_get_named_gpiod(child, prop_name, label);
>  		if (!IS_ERR(desc) || (PTR_ERR(desc) == -EPROBE_DEFER))
>  			break;
>  	}
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6bc612b..b3f2e5c 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2017,6 +2017,7 @@ EXPORT_SYMBOL_GPL(__gpiod_get_index);
>   * fwnode_get_named_gpiod - obtain a GPIO from firmware node
>   * @fwnode:	handle of the firmware node
>   * @propname:	name of the firmware property representing the GPIO
> + * @label:	label for the GPIO

ditto.

Otherwise this is fine by me.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

>   *
>   * This function can be used for drivers that get their configuration
>   * from firmware.
> @@ -2028,7 +2029,8 @@ EXPORT_SYMBOL_GPL(__gpiod_get_index);
>   * In case of error an ERR_PTR() is returned.
>   */
>  struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
> -					 const char *propname)
> +					 const char *propname,
> +					 const char *label)
>  {
>  	struct gpio_desc *desc = ERR_PTR(-ENODEV);
>  	bool active_low = false;
> @@ -2056,7 +2058,7 @@ struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
>  	if (IS_ERR(desc))
>  		return desc;
>  
> -	ret = gpiod_request(desc, NULL);
> +	ret = gpiod_request(desc, label);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
> index 097d721..4cf3d23 100644
> --- a/drivers/input/keyboard/gpio_keys_polled.c
> +++ b/drivers/input/keyboard/gpio_keys_polled.c
> @@ -124,8 +124,12 @@ static struct gpio_keys_platform_data *gpio_keys_polled_get_devtree_pdata(struct
>  
>  	device_for_each_child_node(dev, child) {
>  		struct gpio_desc *desc;
> +		button = &pdata->buttons[pdata->nbuttons++];
> +
> +		fwnode_property_read_string(child, "label", &button->desc);
>  
> -		desc = devm_get_gpiod_from_child(dev, NULL, child);
> +		desc = devm_get_gpiod_from_child(dev, NULL, child,
> +						 button->desc);
>  		if (IS_ERR(desc)) {
>  			error = PTR_ERR(desc);
>  			if (error != -EPROBE_DEFER)
> @@ -136,7 +140,6 @@ static struct gpio_keys_platform_data *gpio_keys_polled_get_devtree_pdata(struct
>  			return ERR_PTR(error);
>  		}
>  
> -		button = &pdata->buttons[pdata->nbuttons++];
>  		button->gpiod = desc;
>  
>  		if (fwnode_property_read_u32(child, "linux,code", &button->code)) {
> @@ -146,8 +149,6 @@ static struct gpio_keys_platform_data *gpio_keys_polled_get_devtree_pdata(struct
>  			return ERR_PTR(-EINVAL);
>  		}
>  
> -		fwnode_property_read_string(child, "label", &button->desc);
> -
>  		if (fwnode_property_read_u32(child, "linux,input-type",
>  					     &button->type))
>  			button->type = EV_KEY;
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 15eb3f8..082ad40 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -184,13 +184,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>  		struct gpio_led led = {};
>  		const char *state = NULL;
>  
> -		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child);
> -		if (IS_ERR(led.gpiod)) {
> -			fwnode_handle_put(child);
> -			ret = PTR_ERR(led.gpiod);
> -			goto err;
> -		}
> -
>  		np = of_node(child);
>  
>  		if (fwnode_property_present(child, "label")) {
> @@ -198,9 +191,18 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>  		} else {
>  			if (IS_ENABLED(CONFIG_OF) && !led.name && np)
>  				led.name = np->name;
> -			if (!led.name)
> -				return ERR_PTR(-EINVAL);
>  		}
> +		if (!led.name)
> +			return ERR_PTR(-EINVAL);
> +
> +		led.gpiod = devm_get_gpiod_from_child(dev, NULL, child,
> +						      led.name);
> +		if (IS_ERR(led.gpiod)) {
> +			fwnode_handle_put(child);
> +			ret = PTR_ERR(led.gpiod);
> +			goto err;
> +		}
> +
>  		fwnode_property_read_string(child, "linux,default-trigger",
>  					    &led.default_trigger);
>  
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 3a7c9ff..51654cf 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -134,10 +134,12 @@ int desc_to_gpio(const struct gpio_desc *desc);
>  struct fwnode_handle;
>  
>  struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
> -					 const char *propname);
> +					 const char *propname,
> +					 const char *label);
>  struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>  					    const char *con_id,
> -					    struct fwnode_handle *child);
> +					    struct fwnode_handle *child,
> +					    const char *label);
>  #else /* CONFIG_GPIOLIB */
>  
>  static inline int gpiod_count(struct device *dev, const char *con_id)
> -- 
> 2.1.4
