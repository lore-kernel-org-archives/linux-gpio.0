From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] gpio: acpi: Ignore -EPROBE_DEFER for unselected
 gpioints
Date: Mon, 13 Mar 2017 23:06:34 +0100
Message-ID: <0d9e36ac-590c-b4cf-d0b9-b70af19fe238@redhat.com>
References: <20170313220421.27314-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58142 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752578AbdCMWGm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Mar 2017 18:06:42 -0400
In-Reply-To: <20170313220421.27314-1-hdegoede@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org

Hi,

A note about the v2 in the subject, this patch moving from me to
Andy and back again has resulted in the inline changelog being
eaten.

This is basically a new patch replacing my 2 patch series
which tried to deal with -EPROBE_DEFER errors for not
selected gpioints. It uses a different (simpler) approach
then that series.

Regards,

Hans

On 13-03-17 23:04, Hans de Goede wrote:
> When acpi_dev_gpio_irq_get gets called with an index of say 2, it should
> not care if acpi_get_gpiod for index 0 or 1 returns -EPROBE_DEFER.
>
> This allows drivers which request a gpioint with index > 0 to function
> if there is no gpiochip driver (loaded) for gpioints with a lower index.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-acpi.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 9b37a36..8cd3f66 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -653,20 +653,24 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
>  {
>  	int idx, i;
>  	unsigned int irq_flags;
> -	int ret = -ENOENT;
>
>  	for (i = 0, idx = 0; idx <= index; i++) {
>  		struct acpi_gpio_info info;
>  		struct gpio_desc *desc;
>
>  		desc = acpi_get_gpiod_by_index(adev, NULL, i, &info);
> -		if (IS_ERR(desc)) {
> -			ret = PTR_ERR(desc);
> -			break;
> -		}
> +
> +		/* Ignore -EPROBE_DEFER, it only matters if idx matches */
> +		if (IS_ERR(desc) && PTR_ERR(desc) != -EPROBE_DEFER)
> +			return PTR_ERR(desc);
> +
>  		if (info.gpioint && idx++ == index) {
> -			int irq = gpiod_to_irq(desc);
> +			int irq;
> +
> +			if (IS_ERR(desc))
> +				return PTR_ERR(desc);
>
> +			irq = gpiod_to_irq(desc);
>  			if (irq < 0)
>  				return irq;
>
> @@ -682,7 +686,7 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
>  		}
>
>  	}
> -	return ret;
> +	return -ENOENT;
>  }
>  EXPORT_SYMBOL_GPL(acpi_dev_gpio_irq_get);
>
>
