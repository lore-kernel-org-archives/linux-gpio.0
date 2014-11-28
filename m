From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH V5 2/7] MIPS: Cleanup Loongson-2F's gpio driver
Date: Fri, 28 Nov 2014 16:48:36 +0900
Message-ID: <CAAVeFu+CUCja6jxb0XONj80-6te1t31A49F4owNkWkoy7PcHuQ@mail.gmail.com>
References: <1416561389-1046-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:45208 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbaK1Hs5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 02:48:57 -0500
Received: by mail-ie0-f169.google.com with SMTP id y20so5714354ier.28
        for <linux-gpio@vger.kernel.org>; Thu, 27 Nov 2014 23:48:56 -0800 (PST)
In-Reply-To: <1416561389-1046-1-git-send-email-chenhc@lemote.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 21, 2014 at 6:16 PM, Huacai Chen <chenhc@lemote.com> wrote:
> This cleanup is prepare to move the driver to drivers/gpio. Custom
> definitions of gpio_get_value()/gpio_set_value() are dropped.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/mach-loongson/gpio.h |   15 +++---
>  arch/mips/loongson/common/gpio.c           |   82 +++++++++++-----------------
>  2 files changed, 39 insertions(+), 58 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson/gpio.h b/arch/mips/include/asm/mach-loongson/gpio.h
> index 211a7b7..b3b2169 100644
> --- a/arch/mips/include/asm/mach-loongson/gpio.h
> +++ b/arch/mips/include/asm/mach-loongson/gpio.h
> @@ -1,8 +1,9 @@
>  /*
> - * STLS2F GPIO Support
> + * Loongson GPIO Support
>   *
>   * Copyright (c) 2008  Richard Liu, STMicroelectronics <richard.liu@st.com>
>   * Copyright (c) 2008-2010  Arnaud Patard <apatard@mandriva.com>
> + * Copyright (c) 2014  Huacai Chen <chenhc@lemote.com>
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -10,14 +11,14 @@
>   * (at your option) any later version.
>   */
>
> -#ifndef __STLS2F_GPIO_H
> -#define __STLS2F_GPIO_H
> +#ifndef __LOONGSON_GPIO_H
> +#define __LOONGSON_GPIO_H
>
>  #include <asm-generic/gpio.h>
>
> -extern void gpio_set_value(unsigned gpio, int value);
> -extern int gpio_get_value(unsigned gpio);
> -extern int gpio_cansleep(unsigned gpio);
> +#define gpio_get_value __gpio_get_value
> +#define gpio_set_value __gpio_set_value
> +#define gpio_cansleep __gpio_cansleep

Since this architecture is using the standard GPIO functions, can't we
simply get rid of this file and the ARCH_HAVE_CUSTOM_GPIO_H option so
the already-defined inline functions in include/linux/gpio.h are used
instead?

>
>  /* The chip can do interrupt
>   * but it has not been tested and doc not clear
> @@ -32,4 +33,4 @@ static inline int irq_to_gpio(int gpio)
>         return -EINVAL;
>  }
>
> -#endif                         /* __STLS2F_GPIO_H */
> +#endif /* __LOONGSON_GPIO_H */
> diff --git a/arch/mips/loongson/common/gpio.c b/arch/mips/loongson/common/gpio.c
> index 29dbaa2..087aac3 100644
> --- a/arch/mips/loongson/common/gpio.c
> +++ b/arch/mips/loongson/common/gpio.c
> @@ -24,55 +24,6 @@
>
>  static DEFINE_SPINLOCK(gpio_lock);
>
> -int gpio_get_value(unsigned gpio)
> -{
> -       u32 val;
> -       u32 mask;
> -
> -       if (gpio >= STLS2F_N_GPIO)
> -               return __gpio_get_value(gpio);
> -
> -       mask = 1 << (gpio + STLS2F_GPIO_IN_OFFSET);
> -       spin_lock(&gpio_lock);
> -       val = LOONGSON_GPIODATA;
> -       spin_unlock(&gpio_lock);
> -
> -       return (val & mask) != 0;
> -}
> -EXPORT_SYMBOL(gpio_get_value);
> -
> -void gpio_set_value(unsigned gpio, int state)
> -{
> -       u32 val;
> -       u32 mask;
> -
> -       if (gpio >= STLS2F_N_GPIO) {
> -               __gpio_set_value(gpio, state);
> -               return ;
> -       }
> -
> -       mask = 1 << gpio;
> -
> -       spin_lock(&gpio_lock);
> -       val = LOONGSON_GPIODATA;
> -       if (state)
> -               val |= mask;
> -       else
> -               val &= (~mask);
> -       LOONGSON_GPIODATA = val;
> -       spin_unlock(&gpio_lock);
> -}
> -EXPORT_SYMBOL(gpio_set_value);
> -
> -int gpio_cansleep(unsigned gpio)
> -{
> -       if (gpio < STLS2F_N_GPIO)
> -               return 0;
> -       else
> -               return __gpio_cansleep(gpio);
> -}
> -EXPORT_SYMBOL(gpio_cansleep);
> -
>  static int ls2f_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
>  {
>         u32 temp;
> @@ -113,13 +64,41 @@ static int ls2f_gpio_direction_output(struct gpio_chip *chip,
>
>  static int ls2f_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
>  {
> -       return gpio_get_value(gpio);
> +       u32 val;
> +       u32 mask;
> +
> +       if (gpio >= STLS2F_N_GPIO)
> +               return __gpio_get_value(gpio);

This condition should not be needed. gpiolib will always use the right chip now.

> +
> +       mask = 1 << (gpio + STLS2F_GPIO_IN_OFFSET);
> +       spin_lock(&gpio_lock);
> +       val = LOONGSON_GPIODATA;
> +       spin_unlock(&gpio_lock);
> +
> +       return (val & mask) != 0;
>  }
>
>  static void ls2f_gpio_set_value(struct gpio_chip *chip,
>                 unsigned gpio, int value)
>  {
> -       gpio_set_value(gpio, value);
> +       u32 val;
> +       u32 mask;
> +
> +       if (gpio >= STLS2F_N_GPIO) {
> +               __gpio_set_value(gpio, value);
> +               return;
> +       }

Same here, this should not be needed at all.

Also, have you tested that this driver still works after being moved
to drivers/gpio? You are including a <loongson.h> that I am not sure
the compiler will find from there. I also suspect the arch_initcall is
not ideal anymore if you compile the driver as a module - you may want
to remove that option if GPIOs are used early in system boot.
