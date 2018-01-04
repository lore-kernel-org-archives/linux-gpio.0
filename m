From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1] gpio: merrifield: Add support of ACPI enabled
 platforms
Date: Thu, 4 Jan 2018 11:36:04 +0200
Message-ID: <20180104093604.GL27654@lahna.fi.intel.com>
References: <20180103173240.45755-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:56972 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752434AbeADJgI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jan 2018 04:36:08 -0500
Content-Disposition: inline
In-Reply-To: <20180103173240.45755-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Jan 03, 2018 at 07:32:40PM +0200, Andy Shevchenko wrote:
> The driver needs the pin control device name for ACPI.
> 
> We are looking through ACPI namespace and return first found device
> based on ACPI HID for Intel Merrifield FLIS.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-merrifield.c | 43 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
> index dd67a31ac337..61e75d10669d 100644
> --- a/drivers/gpio/gpio-merrifield.c
> +++ b/drivers/gpio/gpio-merrifield.c
> @@ -9,6 +9,7 @@
>   * published by the Free Software Foundation.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/bitops.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/init.h>
> @@ -380,9 +381,48 @@ static void mrfld_irq_init_hw(struct mrfld_gpio *priv)
>  	}
>  }
>  
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id mrfld_pinctrl_acpi_ids[] = {
> +	{"INTC1002"},
> +	{}
> +};
> +
> +static acpi_status
> +mrfld_acpi_find_pinctrl(acpi_handle handle, u32 lvl, void *context, void **rv)
> +{
> +	const char **name = context;
> +	struct acpi_device *adev;
> +
> +	if (acpi_bus_get_device(handle, &adev))
> +		return AE_OK;
> +
> +	if (acpi_match_device_ids(adev, mrfld_pinctrl_acpi_ids))
> +		return AE_OK;
> +
> +	*name = dev_name(&adev->dev);
> +	return AE_CTRL_TERMINATE;
> +}
> +
> +static const char *mrfld_acpi_get_pinctrl_dev_name(const char *fallback)
> +{
> +	const char *pinctrl_dev_name = fallback;
> +
> +	acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
> +			    ACPI_UINT32_MAX, mrfld_acpi_find_pinctrl, NULL,
> +			    &pinctrl_dev_name, NULL);
> +	return pinctrl_dev_name;
> +}

I wonder if there is a better way to "connect" these things without need
to walk ACPI namespace in GPIO drivers? How does DT handle handle
separated GPIO and pinctrl drivers? Maybe there is a binding that we
could reuse in ACPI side.
