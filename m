From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] gpio: mockup: use irq_sim_fire_edge()
Date: Mon, 3 Dec 2018 12:09:16 +0100
Message-ID: <20181203110916.eseh2udxvhi4lf3v@pengutronix.de>
References: <20181120134032.31645-1-brgl@bgdev.pl>
 <20181120134032.31645-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120134032.31645-3-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 20, 2018 at 02:40:32PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We now have a specialized variant of irq_sim_fire() - use it in
> gpio-mockup so that we only generate events of types that were
> requested with the LINEEVENT ioctl().
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpio-mockup.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index a4c054cf9c5f..18563d2c7876 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -199,7 +199,7 @@ static ssize_t gpio_mockup_event_write(struct file *file,
>  	struct gpio_mockup_chip *chip;
>  	struct seq_file *sfile;
>  	struct gpio_desc *desc;
> -	int rv, val;
> +	int rv, val, edge;
>  
>  	rv = kstrtoint_from_user(usr_buf, size, 0, &val);
>  	if (rv)
> @@ -213,7 +213,8 @@ static ssize_t gpio_mockup_event_write(struct file *file,
>  	chip = priv->chip;
>  
>  	gpiod_set_value_cansleep(desc, val);
> -	irq_sim_fire(&chip->irqsim, priv->offset);
> +	edge = val == 0 ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
> +	irq_sim_fire_edge(&chip->irqsim, priv->offset, edge);

If I write 0 twice into the debugfs file, does it fire two irqs or only
one? I think it fires two but only one would be the right behaviour?!

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
