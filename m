From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH 1/3] gpio: bcm-kona: drop
 ->irq_{request,release}_resources hooks
Date: Tue, 12 Feb 2019 12:53:33 -0800
Message-ID: <b51bb5e5-846e-5982-7a2b-67f6c488f267@broadcom.com>
References: <20190208115201.7518-1-thomas.petazzoni@bootlin.com>
 <20190208115201.7518-2-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208115201.7518-2-thomas.petazzoni@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
List-Id: linux-gpio@vger.kernel.org


On 2019-02-08 3:51 a.m., Thomas Petazzoni wrote:
> Those hooks implement the exact same behavior as the default hooks by
> gpiolib, so there is no point in having a duplicated definition in
> gpio-bcm-kona.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> ---
> Note: this commit was only build tested.
> ---
>   drivers/gpio/gpio-bcm-kona.c | 16 ----------------
>   1 file changed, 16 deletions(-)
>
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index c5536a509b59..0ae806edabc2 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -484,28 +484,12 @@ static void bcm_kona_gpio_irq_handler(struct irq_desc *desc)
>   	chained_irq_exit(chip, desc);
>   }
>   
> -static int bcm_kona_gpio_irq_reqres(struct irq_data *d)
> -{
> -	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> -
> -	return gpiochip_reqres_irq(&kona_gpio->gpio_chip, d->hwirq);
> -}
> -
> -static void bcm_kona_gpio_irq_relres(struct irq_data *d)
> -{
> -	struct bcm_kona_gpio *kona_gpio = irq_data_get_irq_chip_data(d);
> -
> -	gpiochip_relres_irq(&kona_gpio->gpio_chip, d->hwirq);
> -}
> -
>   static struct irq_chip bcm_gpio_irq_chip = {
>   	.name = "bcm-kona-gpio",
>   	.irq_ack = bcm_kona_gpio_irq_ack,
>   	.irq_mask = bcm_kona_gpio_irq_mask,
>   	.irq_unmask = bcm_kona_gpio_irq_unmask,
>   	.irq_set_type = bcm_kona_gpio_irq_set_type,
> -	.irq_request_resources = bcm_kona_gpio_irq_reqres,
> -	.irq_release_resources = bcm_kona_gpio_irq_relres,
>   };
>   
>   static struct of_device_id const bcm_kona_gpio_of_match[] = {
