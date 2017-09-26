From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH 2/4] pinctrl: bcm: nsp: Use library functions
Date: Tue, 26 Sep 2017 09:45:32 -0700
Message-ID: <ab7fdcd8-cc9e-50ab-78e0-f8bed52cdc0c@broadcom.com>
References: <20170922092243.7546-1-linus.walleij@linaro.org>
 <20170922092243.7546-2-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:45415 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935194AbdIZQpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2017 12:45:38 -0400
Received: by mail-wr0-f170.google.com with SMTP id m18so13733705wrm.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Sep 2017 09:45:37 -0700 (PDT)
In-Reply-To: <20170922092243.7546-2-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Looks fine.


On 17-09-22 02:22 AM, Linus Walleij wrote:
> These request/free functions are just reimplementations of the
> standard helpers in gpiolib. Delete them and replace with the
> helpers.
>
> Cc: Scott Branden <scott.branden@broadcom.com>
If you need an ack
Acked-by: Scott Branden <scott.branden@broadcom.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 21 ++-------------------
>   1 file changed, 2 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> index c1887072936e..e67ae52023ad 100644
> --- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
> @@ -275,23 +275,6 @@ static struct irq_chip nsp_gpio_irq_chip = {
>   	.irq_set_type = nsp_gpio_irq_set_type,
>   };
>   
> -/*
> - * Request the nsp IOMUX pinmux controller to mux individual pins to GPIO
> - */
> -static int nsp_gpio_request(struct gpio_chip *gc, unsigned offset)
> -{
> -	unsigned gpio = gc->base + offset;
> -
> -	return pinctrl_gpio_request(gpio);
> -}
> -
> -static void nsp_gpio_free(struct gpio_chip *gc, unsigned offset)
> -{
> -	unsigned gpio = gc->base + offset;
> -
> -	pinctrl_gpio_free(gpio);
> -}
> -
>   static int nsp_gpio_direction_input(struct gpio_chip *gc, unsigned gpio)
>   {
>   	struct nsp_gpio *chip = gpiochip_get_data(gc);
> @@ -670,8 +653,8 @@ static int nsp_gpio_probe(struct platform_device *pdev)
>   	gc->label = dev_name(dev);
>   	gc->parent = dev;
>   	gc->of_node = dev->of_node;
> -	gc->request = nsp_gpio_request;
> -	gc->free = nsp_gpio_free;
> +	gc->request = gpiochip_generic_request;
> +	gc->free = gpiochip_generic_free;
>   	gc->direction_input = nsp_gpio_direction_input;
>   	gc->direction_output = nsp_gpio_direction_output;
>   	gc->set = nsp_gpio_set;

