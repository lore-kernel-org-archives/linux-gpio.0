From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/5] gpio: pca953x: remove an unused variable
Date: Wed, 07 Sep 2016 14:36:28 +0300
Message-ID: <1473248188.11323.40.camel@linux.intel.com>
References: <1473240297-19881-1-git-send-email-bgolaszewski@baylibre.com>
         <1473240297-19881-5-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:27544 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750954AbcIGLgd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 07:36:33 -0400
In-Reply-To: <1473240297-19881-5-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Vignesh R <vigneshr@ti.com>, Yong Li <yong.b.li@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2016-09-07 at 11:24 +0200, Bartosz Golaszewski wrote:
> The chip_type variable in struct pca953x_chip is no longer required.
> 
> Remove it.

Would it be patch 4 in the series?

> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 6b62898..00bb2ea 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -129,7 +129,6 @@ struct pca953x_chip {
>  	struct i2c_client *client;
>  	struct gpio_chip gpio_chip;
>  	const char *const *names;
> -	int	chip_type;
>  	unsigned long driver_data;
>  
>  	const struct pca953x_offset *offset;
> @@ -760,8 +759,6 @@ static int pca953x_probe(struct i2c_client
> *client,
>  		}
>  	}
>  
> -	chip->chip_type = PCA_CHIP_TYPE(chip->driver_data);
> -
>  	mutex_init(&chip->i2c_lock);
>  
>  	/* initialize cached registers from their original values.
> @@ -774,7 +771,7 @@ static int pca953x_probe(struct i2c_client
> *client,
>  	else if (chip->gpio_chip.ngpio >= 24)
>  		chip->write_regs = pca953x_write_regs_24;
>  
> -	if (chip->chip_type == PCA953X_TYPE)
> +	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE)
>  		ret = device_pca953x_init(chip, invert);
>  	else
>  		ret = device_pca957x_init(chip, invert);

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
