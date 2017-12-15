From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: fix "gpio-line-names" property retrieval
Date: Fri, 15 Dec 2017 11:44:03 +0200
Message-ID: <20171215094403.GR22431@lahna.fi.intel.com>
References: <20171215080915.DDA106C974@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:26022 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754520AbdLOJoH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Dec 2017 04:44:07 -0500
Content-Disposition: inline
In-Reply-To: <20171215080915.DDA106C974@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org

On Fri, Dec 15, 2017 at 09:09:15AM +0100, Christophe Leroy wrote:
> Following commit 9427ecbed46cc ("gpio: Rework of_gpiochip_set_names()
> to use device property accessors"), "gpio-line-names" DT property is
> not retrieved anymore when chip->parent is not set by the driver.

Thanks for taking care of this and sorry about the breakage.

I think this changelog should have few more words about the reason it
started to fail.

> This patch fixes that.
> 
> Fixes: 9427ecbed46cc ("gpio: Rework of_gpiochip_set_names()
> to use device property accessors")

Don't wrap the Fixes line.

> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  drivers/gpio/gpiolib-devprop.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-devprop.c b/drivers/gpio/gpiolib-devprop.c
> index 27f383bda7d9..310dbc451a85 100644
> --- a/drivers/gpio/gpiolib-devprop.c
> +++ b/drivers/gpio/gpiolib-devprop.c
> @@ -30,20 +30,24 @@ void devprop_gpiochip_set_names(struct gpio_chip *chip)
>  	struct gpio_device *gdev = chip->gpiodev;
>  	const char **names;
>  	int ret, i;
> +	struct device *dev;
>  
> -	if (!chip->parent) {
> +	if (chip->parent) {
> +		dev = chip->parent;
> +	} else if (gdev->dev.of_node) {
> +		dev = &gdev->dev;
> +	} else {

I wonder if it would be better to change devprop_gpiochip_set_names()
take struct fwnode_handle as second parameter and use that instead of
chip->parent below? The reason why this happens now is that not all DT
enabled drivers seem to set chip->parent (which I guess is pretty valid
thing to do) but they still set of_node accordingly.

>  		dev_warn(&gdev->dev, "GPIO chip parent is NULL\n");
>  		return;
>  	}
>  
> -	ret = device_property_read_string_array(chip->parent, "gpio-line-names",
> +	ret = device_property_read_string_array(dev, "gpio-line-names",
>  						NULL, 0);
>  	if (ret < 0)
>  		return;
>  
>  	if (ret != gdev->ngpio) {
> -		dev_warn(chip->parent,
> -			 "names %d do not match number of GPIOs %d\n", ret,
> +		dev_warn(dev, "names %d do not match number of GPIOs %d\n", ret,
>  			 gdev->ngpio);
>  		return;
>  	}
> @@ -52,10 +56,10 @@ void devprop_gpiochip_set_names(struct gpio_chip *chip)
>  	if (!names)
>  		return;
>  
> -	ret = device_property_read_string_array(chip->parent, "gpio-line-names",
> +	ret = device_property_read_string_array(dev, "gpio-line-names",
>  						names, gdev->ngpio);
>  	if (ret < 0) {
> -		dev_warn(chip->parent, "failed to read GPIO line names\n");
> +		dev_warn(dev, "failed to read GPIO line names\n");
>  		kfree(names);
>  		return;
>  	}
> -- 
> 2.13.3
