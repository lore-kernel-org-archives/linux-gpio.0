From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/2] gpiolib: use kstrdup_const() for gpio_device label
Date: Wed, 13 Dec 2017 11:44:39 -0800
Message-ID: <1513194279.27409.37.camel@perches.com>
References: <20171213112520.7479-1-brgl@bgdev.pl>
         <20171213112520.7479-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171213112520.7479-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 2017-12-13 at 12:25 +0100, Bartosz Golaszewski wrote:
> Users often pass a pointer to a static string to gpiochip_add_data()
> family of functions. Avoid unnecessary memory allocations with the
> provided helper routine.
[]
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
[]
> @@ -1171,9 +1171,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>  	}
>  
>  	if (chip->label)
> -		gdev->label = kstrdup(chip->label, GFP_KERNEL);
> +		gdev->label = kstrdup_const(chip->label, GFP_KERNEL);
>  	else
> -		gdev->label = kstrdup("unknown", GFP_KERNEL);
> +		gdev->label = kstrdup_const("unknown", GFP_KERNEL);

A plain ?: would be more intelligible
and a bit smaller object code too.

ie:
	gdev->label = kstrdup_const(chip->label ?: "unknown", GFP_KERNEL);

>  	if (!gdev->label) {
>  		status = -ENOMEM;
>  		goto err_free_descs;
