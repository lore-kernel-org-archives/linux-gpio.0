From: Julien Thierry <julien.thierry@arm.com>
Subject: Re: [RFC PATCH 2/7] gpio: gpiolib: split the gpiod_configure_flags
 function
Date: Fri, 15 Dec 2017 09:26:27 +0000
Message-ID: <9194f01a-d6af-5399-c43b-64117f743379@arm.com>
References: <20171214142138.23008-1-ludovic.desroches@microchip.com>
 <20171214142138.23008-3-ludovic.desroches@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:52456 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755741AbdLOJ0a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Dec 2017 04:26:30 -0500
In-Reply-To: <20171214142138.23008-3-ludovic.desroches@microchip.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Ludovic,

On 14/12/17 14:21, Ludovic Desroches wrote:
> The gpiod_configure_flags function doesn't only configure flags, it
> also performs some processing. It implies that it should be called
> after having requested the GPIO. Split configuration and processing
> to allow flags configuration before requesting the GPIO. It is
> needed if we want to set the pin configuration.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>   drivers/gpio/gpiolib.c | 49 +++++++++++++++++++++++++++++++------------------
>   drivers/gpio/gpiolib.h |  7 ++++++-
>   2 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 0621baddfddc..c887602ca0ff 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3564,23 +3564,9 @@ struct gpio_desc *__must_check gpiod_get_optional(struct device *dev,
>   EXPORT_SYMBOL_GPL(gpiod_get_optional);
>   
>   
> -/**
> - * gpiod_configure_flags - helper function to configure a given GPIO
> - * @desc:	gpio whose value will be assigned
> - * @con_id:	function within the GPIO consumer
> - * @lflags:	gpio_lookup_flags - returned from of_find_gpio() or
> - *		of_get_gpio_hog()
> - * @dflags:	gpiod_flags - optional GPIO initialization flags
> - *
> - * Return 0 on success, -ENOENT if no GPIO has been assigned to the
> - * requested function and/or index, or another IS_ERR() code if an error
> - * occurred while trying to acquire the GPIO.
> - */
> -int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
> +void gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
>   		unsigned long lflags, enum gpiod_flags dflags)
>   {
> -	int status;
> -
>   	if (lflags & GPIO_ACTIVE_LOW)
>   		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
>   
> @@ -3601,6 +3587,11 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
>   	if (lflags & GPIO_OPEN_SOURCE)
>   		set_bit(FLAG_OPEN_SOURCE, &desc->flags);
>   

Small issue, I believe the patch is missing a '}' here to properly split 
the function.

Otherwise:

Reviewed-by: Julien Thierry <julien.thierry@arm.com>

Cheers,

-- 
Julien Thierry
