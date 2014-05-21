From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v2] gpio / ACPI: use *_cansleep version of gpiod_get/set APIs
Date: Wed, 21 May 2014 11:35:57 +0900
Message-ID: <CAAVeFu+MMN5O1E6z1_Q1cjkKKCHfZDf3ZTj6KX8ADMq3nG8H3Q@mail.gmail.com>
References: <537B15A0.3080406@intel.com> <20140520085050.GF1651@lahna.fi.intel.com>
 <537B1940.5060005@intel.com> <537B1B5A.1090602@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f170.google.com ([209.85.128.170]:40293 "EHLO
	mail-ve0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751413AbaEUCgT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 20 May 2014 22:36:19 -0400
Received: by mail-ve0-f170.google.com with SMTP id db11so1725317veb.15
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2014 19:36:18 -0700 (PDT)
In-Reply-To: <537B1B5A.1090602@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Aaron Lu <aaron.lu@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, May 20, 2014 at 6:07 PM, Aaron Lu <aaron.lu@intel.com> wrote:
> The GPIO operation region handler should be called where sleep is
> allowed, so we should use the *_cansleep version of gpiod_get/set APIs
> or we will get a warning message complaining invalid context if the GPIO
> chip has the cansleep flag set.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

>
> Signed-off-by: Aaron Lu <aaron.lu@intel.com>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> v2: remove the inclusion of linux/gpio.h as pointed out by Mika.
>
>  drivers/gpio/gpiolib-acpi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 401add28933f..4a987917c186 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -449,9 +449,10 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>                 mutex_unlock(&achip->conn_lock);
>
>                 if (function == ACPI_WRITE)
> -                       gpiod_set_raw_value(desc, !!((1 << i) & *value));
> +                       gpiod_set_raw_value_cansleep(desc,
> +                                                    !!((1 << i) & *value));
>                 else
> -                       *value |= (u64)gpiod_get_raw_value(desc) << i;
> +                       *value |= (u64)gpiod_get_raw_value_cansleep(desc) << i;
>         }
>
>  out:
> --
> 1.9.0
>
