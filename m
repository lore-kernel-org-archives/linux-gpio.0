From: Duc Dang <dhdang@apm.com>
Subject: Re: [PATCH] gpio: xgene: implement .get_direction()
Date: Mon, 2 May 2016 19:16:27 -0700
Message-ID: <CADaLNDmPdDmdU+CVZ4VzGKW47+Lc=dc3faOu_F9HX1DhQAMFCQ@mail.gmail.com>
References: <1462091530-27288-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f52.google.com ([209.85.213.52]:34467 "EHLO
	mail-vk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932252AbcECCQ6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 22:16:58 -0400
Received: by mail-vk0-f52.google.com with SMTP id m188so7567446vka.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 19:16:57 -0700 (PDT)
In-Reply-To: <1462091530-27288-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Feng Kan <fkan@apm.com>

On Sun, May 1, 2016 at 1:32 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This implements the .get_direction() callback for the xgene GPIO
> controller.

Thanks, Linus.

I tested your patch with sysfs interface and it works great. Please
feel free to add:

Tested-by: Duc Dang <dhdang@apm.com>

Regards,
Duc Dang.
>
> Cc: Duc Dang <dhdang@apm.com>
> Cc: Feng Kan <fkan@apm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-xgene.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
> index 46faecd1f580..dc85dcd47d19 100644
> --- a/drivers/gpio/gpio-xgene.c
> +++ b/drivers/gpio/gpio-xgene.c
> @@ -85,6 +85,17 @@ static void xgene_gpio_set(struct gpio_chip *gc, unsigned int offset, int val)
>         spin_unlock_irqrestore(&chip->lock, flags);
>  }
>
> +static int xgene_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct xgene_gpio *chip = gpiochip_get_data(gc);
> +       unsigned long bank_offset, bit_offset;
> +
> +       bank_offset = GPIO_SET_DR_OFFSET + GPIO_BANK_OFFSET(offset);
> +       bit_offset = GPIO_BIT_OFFSET(offset);
> +
> +       return !!(ioread32(chip->base + bank_offset) & BIT(bit_offset));
> +}
> +
>  static int xgene_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
>  {
>         struct xgene_gpio *chip = gpiochip_get_data(gc);
> @@ -184,6 +195,7 @@ static int xgene_gpio_probe(struct platform_device *pdev)
>
>         spin_lock_init(&gpio->lock);
>         gpio->chip.parent = &pdev->dev;
> +       gpio->chip.get_direction = xgene_gpio_get_direction;
>         gpio->chip.direction_input = xgene_gpio_dir_in;
>         gpio->chip.direction_output = xgene_gpio_dir_out;
>         gpio->chip.get = xgene_gpio_get;
> --
> 2.4.11
>
