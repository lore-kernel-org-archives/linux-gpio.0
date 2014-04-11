From: Florian Fainelli <florian@openwrt.org>
Subject: Re: gpio: rdc321x: Question about rdc_gpio_direction_input implementation
Date: Thu, 10 Apr 2014 21:53:11 -0700
Message-ID: <CAGVrzcbDmm3T7D8GszzeG__fqWuN_fk6SPD1GS8b+bLyqPa+tg@mail.gmail.com>
References: <1397186924.30538.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:39078 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750839AbaDKExw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Apr 2014 00:53:52 -0400
Received: by mail-qa0-f45.google.com with SMTP id cm18so4384833qab.18
        for <linux-gpio@vger.kernel.org>; Thu, 10 Apr 2014 21:53:51 -0700 (PDT)
In-Reply-To: <1397186924.30538.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

Hi Axel,

2014-04-10 20:28 GMT-07:00 Axel Lin <axel.lin@ingics.com>:
> Hi Florian,
> Current implementation in rdc_gpio_direction_input() looks wrong to me
> because calling rdc_gpio_config(chip, gpio, 1) actually set the gpio to
> OUTPUT HIGH rather than set the direction to INPUT.
>
> I cannot find the datasheet, I'm wondering if below diff works.
> Any chance to test it? I can send a formal patch if it works.

The datasheet is available here:
http://www.atekmicro.com/download/r8610/R8610-G.pdf

I do not have access to the hardware at this very moment, but I should
be able to give this a try. I do not think GPIO input was tested at
all, the GPIO LEDs and such were driven as active outputs.

>
> diff --git a/drivers/gpio/gpio-rdc321x.c b/drivers/gpio/gpio-rdc321x.c
> index 88577c3..ccef383 100644
> --- a/drivers/gpio/gpio-rdc321x.c
> +++ b/drivers/gpio/gpio-rdc321x.c
> @@ -119,10 +119,29 @@ unlock:
>         return err;
>  }
>
> -/* configure GPIO pin as input */
>  static int rdc_gpio_direction_input(struct gpio_chip *chip, unsigned
> gpio)
>  {
> -       return rdc_gpio_config(chip, gpio, 1);
> +       struct rdc321x_gpio *gpch;
> +       int reg, err;
> +       u32 val;
> +
> +       gpch = container_of(chip, struct rdc321x_gpio, chip);
> +       reg = gpio < 32 ? gpch->reg1_ctrl_base : gpch->reg2_ctrl_base;
> +
> +       spin_lock(&gpch->lock);
> +
> +       err = pci_read_config_dword(gpch->sb_pdev, reg, &val);
> +       if (err)
> +               goto unlock;
> +
> +       val &= ~(1 << (gpio & 0x1f));
> +
> +       err = pci_write_config_dword(gpch->sb_pdev, reg, val);
> +
> +unlock:
> +       spin_unlock(&gpch->lock);
> +
> +       return err;
>  }
>
>  /*

-- 
Florian
