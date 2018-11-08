From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/3] gpio: mockup: add locking
Date: Thu, 8 Nov 2018 22:13:59 +0100
Message-ID: <20181108211359.44scwickq4pxsuqy@pengutronix.de>
References: <20181108165255.9940-1-brgl@bgdev.pl>
 <20181108165255.9940-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108165255.9940-3-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Nov 08, 2018 at 05:52:54PM +0100, Bartosz Golaszewski wrote:
> While no user reported any race condition problems with gpio-mockup,
> let's be on the safe side and use a mutex when performing any changes
> on the dummy chip structures.
> 
> Suggested-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  drivers/gpio/gpio-mockup.c | 50 ++++++++++++++++++++++++++++++++------
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 6a50f9f59c90..3cd92912c414 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -54,6 +54,7 @@ struct gpio_mockup_chip {
>  	struct gpio_mockup_line_status *lines;
>  	struct irq_sim irqsim;
>  	struct dentry *dbg_dir;
> +	struct mutex lock;
>  };
>  
>  struct gpio_mockup_dbgfs_private {
> @@ -82,29 +83,53 @@ static int gpio_mockup_range_ngpio(unsigned int index)
>  	return gpio_mockup_ranges[index * 2 + 1];
>  }
>  
> -static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
> +static int __gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
>  
>  	return chip->lines[offset].value;
>  }
>  
> -static void gpio_mockup_set(struct gpio_chip *gc,
> -			    unsigned int offset, int value)
> +static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
> +	int val;
> +
> +	mutex_lock(&chip->lock);
> +	val = __gpio_mockup_get(gc, offset);
> +	mutex_unlock(&chip->lock);
> +
> +	return val;
> +}

I think this function doesn't need locking. I returns a single value and
if there is a race and some other process currently changes the value it
matters little if the return value is zero or not.

But even with this kept unchanged the patch looks good.

Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks
Uwe


-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
