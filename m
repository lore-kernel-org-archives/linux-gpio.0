From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: pl061: hook request if gpio-ranges avaiable
Date: Fri, 17 Oct 2014 18:26:12 +0900
Message-ID: <CAAVeFuJf0V6erNuzgipB1O4hSU_E+HiotEWVE5byYkj=0u+HbA@mail.gmail.com>
References: <1412847735-498-1-git-send-email-haojian.zhuang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f172.google.com ([209.85.213.172]:53835 "EHLO
	mail-ig0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751373AbaJQJ0c (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Oct 2014 05:26:32 -0400
Received: by mail-ig0-f172.google.com with SMTP id r2so1220040igi.11
        for <linux-gpio@vger.kernel.org>; Fri, 17 Oct 2014 02:26:32 -0700 (PDT)
In-Reply-To: <1412847735-498-1-git-send-email-haojian.zhuang@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Thu, Oct 9, 2014 at 6:42 PM, Haojian Zhuang
<haojian.zhuang@linaro.org> wrote:
> gpio-ranges property could binds gpio to pinctrl. But there may be some
> gpios without pinctrl operation. So check whether gpio-ranges property
> exists in device node first.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@linaro.org>
> ---
>  drivers/gpio/gpio-pl061.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
> index 84b49cf..d1813f0 100644
> --- a/drivers/gpio/gpio-pl061.c
> +++ b/drivers/gpio/gpio-pl061.c
> @@ -52,28 +52,34 @@ struct pl061_gpio {
>
>         void __iomem            *base;
>         struct gpio_chip        gc;
> +       int                     uses_pinctrl;
>
>  #ifdef CONFIG_PM
>         struct pl061_context_save_regs csave_regs;
>  #endif
>  };
>
> -static int pl061_gpio_request(struct gpio_chip *chip, unsigned offset)
> +static int pl061_gpio_request(struct gpio_chip *gc, unsigned offset)
>  {
>         /*
>          * Map back to global GPIO space and request muxing, the direction
>          * parameter does not matter for this controller.
>          */
> -       int gpio = chip->base + offset;
> +       struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
> +       int gpio = gc->base + offset;
>
> -       return pinctrl_request_gpio(gpio);
> +       if (chip->uses_pinctrl)
> +               return pinctrl_request_gpio(gpio);
> +       return 0;
>  }
>
> -static void pl061_gpio_free(struct gpio_chip *chip, unsigned offset)
> +static void pl061_gpio_free(struct gpio_chip *gc, unsigned offset)
>  {
> -       int gpio = chip->base + offset;
> +       struct pl061_gpio *chip = container_of(gc, struct pl061_gpio, gc);
> +       int gpio = gc->base + offset;
>
> -       pinctrl_free_gpio(gpio);
> +       if (chip->uses_pinctrl)
> +               pinctrl_free_gpio(gpio);
>  }
>
>  static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
> @@ -264,6 +270,9 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
>
>         spin_lock_init(&chip->lock);
>
> +       /* Hook the request()/free() for pinctrl operation */
> +       if (of_property_read_bool(dev->of_node, "gpio-ranges"))
> +               chip->uses_pinctrl = true;

You probably want to document this property in
Documentation/devicetree/bindings/gpio/pl061-gpio.txt.
