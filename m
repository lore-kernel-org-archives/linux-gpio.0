From: Hoan Tran <hotran@apm.com>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use "stride" rather than "size" for
 register distance
Date: Tue, 13 Feb 2018 17:40:33 -0800
Message-ID: <CAFHUOYx36Xv4KpCw2cbbP4-GTMuBb0RaV0zfW-xg3yvYsk=d8g@mail.gmail.com>
References: <20180212101125.7890-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:39054 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966311AbeBNBkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Feb 2018 20:40:35 -0500
Received: by mail-io0-f196.google.com with SMTP id b198so23442610iof.6
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2018 17:40:35 -0800 (PST)
In-Reply-To: <20180212101125.7890-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Feb 12, 2018 at 2:11 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This terminology is more precise. Also cut the stride calculation
> in the preprocessor, it confuses more than it helps when reading
> the driver.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-dwapb.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 6730c6642ce3..677988f21369 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -53,9 +53,9 @@
>  #define GPIO_EXT_PORTD         0x5c
>
>  #define DWAPB_MAX_PORTS                4
> -#define GPIO_EXT_PORT_SIZE     (GPIO_EXT_PORTB - GPIO_EXT_PORTA)
> -#define GPIO_SWPORT_DR_SIZE    (GPIO_SWPORTB_DR - GPIO_SWPORTA_DR)
> -#define GPIO_SWPORT_DDR_SIZE   (GPIO_SWPORTB_DDR - GPIO_SWPORTA_DDR)
> +#define GPIO_EXT_PORT_STRIDE   0x04 /* register stride 32 bits */
> +#define GPIO_SWPORT_DR_STRIDE  0x0c /* register stride 3*32 bits */
> +#define GPIO_SWPORT_DDR_STRIDE 0x0c /* register stride 3*32 bits */
>
>  #define GPIO_REG_OFFSET_V2     1
>
> @@ -476,10 +476,10 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>                 return -ENOMEM;
>  #endif
>
> -       dat = gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_SIZE);
> -       set = gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_SIZE);
> +       dat = gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_STRIDE);
> +       set = gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_STRIDE);
>         dirout = gpio->regs + GPIO_SWPORTA_DDR +
> -               (pp->idx * GPIO_SWPORT_DDR_SIZE);
> +               (pp->idx * GPIO_SWPORT_DDR_STRIDE);
>
>         err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
>                          NULL, 0);
> @@ -710,13 +710,13 @@ static int dwapb_gpio_suspend(struct device *dev)
>
>                 BUG_ON(!ctx);
>
> -               offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_SIZE;
> +               offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
>                 ctx->dir = dwapb_read(gpio, offset);
>
> -               offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_SIZE;
> +               offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
>                 ctx->data = dwapb_read(gpio, offset);
>
> -               offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_SIZE;
> +               offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_STRIDE;
>                 ctx->ext = dwapb_read(gpio, offset);
>
>                 /* Only port A can provide interrupts */
> @@ -753,13 +753,13 @@ static int dwapb_gpio_resume(struct device *dev)
>
>                 BUG_ON(!ctx);
>
> -               offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_SIZE;
> +               offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
>                 dwapb_write(gpio, offset, ctx->data);
>
> -               offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_SIZE;
> +               offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
>                 dwapb_write(gpio, offset, ctx->dir);
>
> -               offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_SIZE;
> +               offset = GPIO_EXT_PORTA + idx * GPIO_EXT_PORT_STRIDE;
>                 dwapb_write(gpio, offset, ctx->ext);
>
>                 /* Only port A can provide interrupts */
> --
> 2.14.3
>

Acked-by: Hoan Tran <hotran@apm.com>

Regards
Hoan
