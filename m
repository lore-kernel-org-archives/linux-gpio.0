From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 121/182] pinctrl: exynos5440: use gpiochip data pointer
Date: Fri, 11 Dec 2015 15:21:52 +0900
Message-ID: <CA+Ln22HJwjBzgjvvn4x0wURYx6PqgLLKc=_5x5dfSuhSPXLV+g@mail.gmail.com>
References: <1449668063-3532-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f54.google.com ([209.85.192.54]:33572 "EHLO
	mail-qg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752895AbbLKGVw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 01:21:52 -0500
Received: by qgea14 with SMTP id a14so187377750qge.0
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 22:21:52 -0800 (PST)
In-Reply-To: <1449668063-3532-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Kukjin Kim <kgene@kernel.org>

Hi Linus,

Please see my comments inline.

2015-12-09 22:34 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos5440.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos5440.c b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
> index f61f9a6fa9af..00ab63abf1d9 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos5440.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
> @@ -15,7 +15,7 @@
>  #include <linux/io.h>
>  #include <linux/slab.h>
>  #include <linux/err.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>

Commit message doesn't mention this change. Do I assume correctly that
it's needed for gpiochip_get_data() and also gives the driver access
to all definitions it needed from linux/gpio.h?

Other than that (and the fact that, as opposed to the other Exynos
patch, this one is actually cleaner):
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Best regards,
Tomasz
