From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 11:31:16 +0100
Message-ID: <20151102103116.GE8676@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35158 "EHLO
	mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753024AbbKBKbL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 05:31:11 -0500
Received: by lfbn126 with SMTP id n126so59406413lfb.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 02:31:10 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Oct 22, 2015 at 10:32:25AM +0200, Linus Walleij wrote:
> GPIO chips have been around for years, but were never real devices,
> instead they were piggy-backing on a parent device (such as a
> platform_device or amba_device) but this was always optional.
> GPIO chips could also exist without any device at all, with its
> struct device *dev pointer being set to null.
> 
> When sysfs was in use, a mock device would be created, with the
> optional parent assigned, or just floating orphaned with NULL
> as parent.
> 
> For a proper userspace ABI we need gpiochips to *always have a
> populated struct device, so add this in the gpio_chip struct.
> The name "dev" is unfortunately already take so we use "device"
> to name it.
> 
> If sysfs is active, it will use this device as parent, and the
> former parent device "dev" will be set as parent of the new
> "device" struct member.
> 
> From this point on, gpiochips are devices.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Michael Welling <mwelling@ieee.org>
> Cc: Markus Pargmann <mpa@pengutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib-sysfs.c |  2 +-
>  drivers/gpio/gpiolib.c       | 44 +++++++++++++++++++++++++++++++++++++++-----
>  include/linux/gpio/driver.h  |  9 +++++++--
>  3 files changed, 47 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
> index b57ed8e55ab5..7e5bc5736e47 100644
> --- a/drivers/gpio/gpiolib-sysfs.c
> +++ b/drivers/gpio/gpiolib-sysfs.c
> @@ -605,7 +605,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
>  	if (chip->names && chip->names[offset])
>  		ioname = chip->names[offset];
>  
> -	dev = device_create_with_groups(&gpio_class, chip->dev,
> +	dev = device_create_with_groups(&gpio_class, &chip->device,
>  					MKDEV(0, 0), data, gpio_groups,
>  					ioname ? ioname : "gpio%u",
>  					desc_to_gpio(desc));
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 6798355c61c6..0ab4f75b7f8e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -16,6 +16,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/idr.h>
>  
>  #include "gpiolib.h"
>  
> @@ -42,6 +43,9 @@
>  #define	extra_checks	0
>  #endif
>  
> +/* Device and char device-related information */
> +static DEFINE_IDA(gpio_ida);
> +
>  /* gpio_lock prevents conflicts during gpio_desc[] table updates.
>   * While any GPIO is requested, its gpio_chip is not removable;
>   * each GPIO's "requested" flag serves as a lock and refcount.
> @@ -52,7 +56,6 @@ static DEFINE_MUTEX(gpio_lookup_lock);
>  static LIST_HEAD(gpio_lookup_list);
>  LIST_HEAD(gpio_chips);
>  
> -
>  static void gpiochip_free_hogs(struct gpio_chip *chip);
>  static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip);
>  
> @@ -300,7 +303,7 @@ int gpiochip_add(struct gpio_chip *chip)
>  {
>  	unsigned long	flags;
>  	int		status = 0;
> -	unsigned	id;
> +	unsigned	i;
>  	int		base = chip->base;
>  	struct gpio_desc *descs;
>  
> @@ -308,6 +311,28 @@ int gpiochip_add(struct gpio_chip *chip)
>  	if (!descs)
>  		return -ENOMEM;
>  
> +	/*
> +	 * The "dev" member of gpiochip is the parent, and the actual
> +	 * device is named "device" for historical reasons.
> +	 *
> +	 * We memset the struct to zero to avoid reentrance issues.
> +	 */
> +	memset(&chip->device, 0, sizeof(chip->device));

This is an indication of a larger problem.

First of all, you must never register the same device structure twice.

And the larger problem is: With the current interface where a struct
gpio_chip is passed and registered, how would you prevent the device
from going away while in use?

You grab a reference to the chip->device when opening the node (in a
later patch), but it is not used to manage the life time of struct
gpio_chip.

> +	if (chip->dev) {
> +		chip->device.parent = chip->dev;
> +		chip->device.of_node = chip->dev->of_node;
> +	} else {
> +#ifdef CONFIG_OF_GPIO
> +	/* If the gpiochip has an assigned OF node this takes precedence */
> +	if (chip->of_node)
> +		chip->device.of_node = chip->of_node;
> +#endif
> +	}
> +	chip->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);

Missing error handling.

> +	dev_set_name(&chip->device, "gpiochip%d", chip->id);
> +	device_initialize(&chip->device);
> +	dev_set_drvdata(&chip->device, chip);
> +
>  	spin_lock_irqsave(&gpio_lock, flags);
>  
>  	if (base < 0) {

Johan
