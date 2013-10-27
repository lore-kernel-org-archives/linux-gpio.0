From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH v2] gpio: provide stubs for devres gpio functions
Date: Sun, 27 Oct 2013 14:38:24 -0700
Message-ID: <526D87D0.3030702@linux.intel.com>
References: <1382715613-3435-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:28974 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752982Ab3J0VkI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 27 Oct 2013 17:40:08 -0400
In-Reply-To: <1382715613-3435-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On 10/25/2013 08:40 AM, Linus Walleij wrote:
> commit 6b3d8145dcfdbbb43f13544e16f44f4574f941dd
> "gpiolib: make GPIO_DEVRES depend on GPIOLIB"
> breaks builds when device drivers are using devm_gpio*
> devres functions without enabling GPIOLIB, relying on
> the devres code to be compiled anyway.
> 
> Provide stubs so that we get these if we're using the
> devres functions without GPIOLIB.
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Actually add the keywords "static inline" in the proper place
>   for all stubs.
> ---
>  include/linux/gpio.h | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index c691df044458..0c56b9e9c209 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -77,6 +77,15 @@ static inline int irq_to_gpio(unsigned int irq)
>  
>  #endif /* ! CONFIG_ARCH_HAVE_CUSTOM_GPIO_H */
>  
> +/* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
> +
> +struct device;
> +
> +int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
> +int devm_gpio_request_one(struct device *dev, unsigned gpio,
> +			  unsigned long flags, const char *label);
> +void devm_gpio_free(struct device *dev, unsigned int gpio);
> +
>  #else /* ! CONFIG_GPIOLIB */
>  
>  #include <linux/kernel.h>
> @@ -241,14 +250,25 @@ gpiochip_remove_pin_ranges(struct gpio_chip *chip)
>  	WARN_ON(1);
>  }
>  
> -#endif /* ! CONFIG_GPIOLIB */
> +static inline int devm_gpio_request(struct device *dev, unsigned gpio,
> +				    const char *label)
> +{
> +	WARN_ON(1);
> +	return -EINVAL;

I wonder if -ENODEV is a better error code.

Br, David Cohen
