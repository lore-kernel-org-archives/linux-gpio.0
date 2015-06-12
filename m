From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio / ACPI: Add label to the gpio request
Date: Fri, 12 Jun 2015 17:49:27 +0300
Message-ID: <20150612144927.GE1478@lahna.fi.intel.com>
References: <20150611000822.GA21213@yumi.tdiedrich.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:63706 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752968AbbFLOtc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 12 Jun 2015 10:49:32 -0400
Content-Disposition: inline
In-Reply-To: <20150611000822.GA21213@yumi.tdiedrich.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tobias Diedrich <ranma+kernel@tdiedrich.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 11, 2015 at 02:08:22AM +0200, Tobias Diedrich wrote:
> In create_gpio_led only the legacy pass propagates the label by passing it into
> devm_gpio_request_one.
> 
> On the newer devicetree/acpi path the label is lost as far as the GPIO
> subsystem goes (it is only retained as name in struct gpio_led.
> 
> Amend devm_get_gpiod_from_child to also pass the label into the GPIO layer, so
> it will show up in /sys/kernel/debug/gpio, so instead of:
> 
> GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
>  gpio-477 (?                   ) out hi
>  gpio-478 (?                   ) out lo
>  gpio-479 (?                   ) out hi
> 
> we get the much nicer output:
> 
> GPIOs 288-511, platform/PRP0001:00, AMD SBX00:
>  gpio-477 (led1                ) out hi
>  gpio-478 (led2                ) out lo
>  gpio-479 (led3                ) out hi

I wonder if we can just put the con_id there?

> Signed-off-by: Tobias Diedrich <ranma+kernel@tdiedrich.de>
> ---
>  drivers/gpio/devres.c         | 6 +++++-
>  drivers/gpio/gpiolib.c        | 6 ++++--
>  include/linux/gpio/consumer.h | 3 ++-
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/devres.c b/drivers/gpio/devres.c
> index 07ba823..089db97 100644
> --- a/drivers/gpio/devres.c
> +++ b/drivers/gpio/devres.c
> @@ -103,13 +103,17 @@ struct gpio_desc *__must_check __devm_gpiod_get_index(struct device *dev,
>  {
>  	struct gpio_desc **dr;
>  	struct gpio_desc *desc;
> +	const char *label = NULL;
>  
>  	dr = devres_alloc(devm_gpiod_release, sizeof(struct gpio_desc *),
>  			  GFP_KERNEL);
>  	if (!dr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	desc = gpiod_get_index(dev, con_id, idx, flags);
> +	if (fwnode_property_present(child, "label"))
> +		fwnode_property_read_string(child, "label", &label);

This binding needs to be documented, I suppose.

But then again, does it really describe the hardware? We already have
names like "linux,label" in the bindings but as far as I understand
adding such things is not recommended.

> +
> +	desc = gpiod_get_index(dev, con_id, idx, flags, label);
>  	if (IS_ERR(desc)) {
>  		devres_free(dr);
>  		return desc;
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6bc612b..fb2be68 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2017,6 +2017,7 @@ EXPORT_SYMBOL_GPL(__gpiod_get_index);
>   * fwnode_get_named_gpiod - obtain a GPIO from firmware node
>   * @fwnode:	handle of the firmware node
>   * @propname:	name of the firmware property representing the GPIO
> + * @label:	optional label for the GPIO
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
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index 3a7c9ff..ef7d322 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -134,7 +134,8 @@ int desc_to_gpio(const struct gpio_desc *desc);
>  struct fwnode_handle;
>  
>  struct gpio_desc *fwnode_get_named_gpiod(struct fwnode_handle *fwnode,
> -					 const char *propname);
> +					 const char *propname,
> +					 const char *label);
>  struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
>  					    const char *con_id,
>  					    struct fwnode_handle *child);
> -- 
> 2.1.4
