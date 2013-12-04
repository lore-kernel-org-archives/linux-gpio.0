From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 4/4] gpiolib: fix potential crash in gpiod_get() et alia
Date: Wed, 4 Dec 2013 15:27:07 +0900
Message-ID: <529ECB3B.6040803@nvidia.com>
References: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com> <1386097406-24585-5-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:13883 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753110Ab3LDG1L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2013 01:27:11 -0500
In-Reply-To: <1386097406-24585-5-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

It seems like your subject line is wrong/truncated.

On 12/04/2013 04:03 AM, Andy Shevchenko wrote:
> Since we may have dev parameter equial to NULL we can't use dev_* macros to

s/equial/equal.

> print messages. Instead we must switch to plain pr_*.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpio/gpiolib.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 222f544..1517093 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2389,16 +2389,14 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
>   			continue;
>
>   		chip = find_chip_by_name(p->chip_label);
> -
>   		if (!chip) {
> -			dev_warn(dev, "cannot find GPIO chip %s\n",
> -				 p->chip_label);
> +			pr_warn("%s: GPIO chip: cannot find\n", p->chip_label);
>   			continue;
>   		}
>
>   		if (chip->ngpio <= p->chip_hwnum) {
> -			dev_warn(dev, "GPIO chip %s has %d GPIOs\n",
> -				 chip->label, chip->ngpio);
> +			pr_warn("%s: GPIO chip: has %d GPIOs\n", chip->label,
> +				chip->ngpio);
>   			continue;
>   		}

I don't think this is needed, the dev_* macros are safe to use with a 
NULL device (see the definition of __dev_printk in drivers/base/core.c).

>
> @@ -2425,7 +2423,7 @@ EXPORT_SYMBOL_GPL(gpiod_get);
>
>   /**
>    * gpiod_get_index - obtain a GPIO from a multi-index GPIO function
> - * @dev:	GPIO consumer
> + * @dev:	GPIO consumer, can be NULL for system-global GPIOs
>    * @con_id:	function within the GPIO consumer
>    * @idx:	index of the GPIO to obtain in the consumer
>    *
> @@ -2442,15 +2440,17 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
>   	int status;
>   	enum gpio_lookup_flags flags = 0;
>
> -	dev_dbg(dev, "GPIO lookup for consumer %s\n", con_id);
> +	pr_debug("%s: GPIO lookup for consumer %s\n", __func__, con_id);
>
> -	/* Using device tree? */
> -	if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node) {
> -		dev_dbg(dev, "using device tree for GPIO lookup\n");
> -		desc = of_find_gpio(dev, con_id, idx, &flags);
> -	} else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev)) {
> -		dev_dbg(dev, "using ACPI for GPIO lookup\n");
> -		desc = acpi_find_gpio(dev, con_id, idx, &flags);
> +	if (dev) {
> +		if (IS_ENABLED(CONFIG_OF) && dev->of_node) {
> +			pr_debug("%s: using device tree for GPIO lookup\n",
> +				 __func__);
> +			desc = of_find_gpio(dev, con_id, idx, &flags);
> +		} else if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(dev)) {
> +			pr_debug("%s: using ACPI for GPIO lookup\n", __func__);
> +			desc = acpi_find_gpio(dev, con_id, idx, &flags);
> +		}

Here I'd argue it is useful to know which device is making the request.

>   	}
>
>   	/*
> @@ -2459,15 +2459,18 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
>   	 */
>   	if (!desc || IS_ERR(desc)) {
>   		struct gpio_desc *pdesc;
> -		dev_dbg(dev, "using lookup tables for GPIO lookup");
> +
> +		pr_debug("%s: using lookup tables for GPIO lookup\n", __func__);
> +
>   		pdesc = gpiod_find(dev, con_id, idx, &flags);
> +
>   		/* If used as fallback, do not replace the previous error */
>   		if (!IS_ERR(pdesc) || !desc)
>   			desc = pdesc;
>   	}
>
>   	if (IS_ERR(desc)) {
> -		dev_dbg(dev, "lookup for GPIO %s failed\n", con_id);
> +		pr_debug("%s: lookup for GPIO %s failed\n", __func__, con_id);
>   		return desc;
>   	}

Unless I missed something, I'd suggest to drop this patch.

Alex.

