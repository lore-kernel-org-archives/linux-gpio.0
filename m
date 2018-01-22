From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: Fix kernel stack leak to userspace
Date: Mon, 22 Jan 2018 13:23:36 +0100
Message-ID: <CAMRc=Mc-uOMHLf2rn-kv+DqWceVmTCXZyFqa-GJu13HmaTJtpg@mail.gmail.com>
References: <20180122122146.25689-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34530 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750970AbeAVMXh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 07:23:37 -0500
Received: by mail-oi0-f68.google.com with SMTP id k15so3117673oib.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2018 04:23:36 -0800 (PST)
In-Reply-To: <20180122122146.25689-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, stable@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

2018-01-22 13:21 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
> The GPIO event descriptor was leaking kernel stack to
> userspace because we don't zero the variable before
> use. Ooops. Fix this.
>
> Cc: stable@vger.kernel.org
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 37e31ba82ca0..754836e4ca0e 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -744,6 +744,9 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
>         struct gpioevent_data ge;
>         int ret, level;
>
> +       /* Do not leak kernel stack to userspace */
> +       memset(&ge, 0, sizeof(ge));
> +
>         ge.timestamp = ktime_get_real_ns();
>         level = gpiod_get_value_cansleep(le->desc);
>
> --
> 2.14.3
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
