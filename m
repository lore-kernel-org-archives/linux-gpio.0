From: Alan Tull <atull@kernel.org>
Subject: Re: [PATCH] gpio: dwapb: fix bgpio usage
Date: Tue, 24 Oct 2017 15:22:56 -0500
Message-ID: <CANk1AXTVdTeo6LtCHdK-XeRqkyccru4xKaFndoOasa7WpyB+0Q@mail.gmail.com>
References: <20171020102951.6305-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751323AbdJXUXh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Oct 2017 16:23:37 -0400
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com [209.85.217.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 474BB217C1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2017 20:23:37 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id b11so16260098uae.12
        for <linux-gpio@vger.kernel.org>; Tue, 24 Oct 2017 13:23:37 -0700 (PDT)
In-Reply-To: <20171020102951.6305-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Hoan Tran <hotran@apm.com>

On Fri, Oct 20, 2017 at 5:29 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The DW APB GPIO driver uses the generic GPIO library gpio-mmio,
> and initialize the flags as "false", which should be 0.
>
> When no flags are given, the native endianness is used to access
> the MMIO registers, and the pin2mask() call can simply be
> converted to a BIT() call, as per the default pin2mask()
> implementation in gpio-mmio.c.
>
> Cc: Hoan Tran <hotran@apm.com>
> Cc: Alan Tull <atull@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Alan Tull <atull@kernel.org>

> ---
>  drivers/gpio/gpio-dwapb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index d782ad195c89..6730c6642ce3 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -320,7 +320,7 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
>         struct dwapb_gpio_port *port = gpiochip_get_data(gc);
>         struct dwapb_gpio *gpio = port->gpio;
>         unsigned long flags, val_deb;
> -       unsigned long mask = gc->pin2mask(gc, offset);
> +       unsigned long mask = BIT(offset);
>
>         spin_lock_irqsave(&gc->bgpio_lock, flags);
>
> @@ -482,7 +482,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
>                 (pp->idx * GPIO_SWPORT_DDR_SIZE);
>
>         err = bgpio_init(&port->gc, gpio->dev, 4, dat, set, NULL, dirout,
> -                        NULL, false);
> +                        NULL, 0);
>         if (err) {
>                 dev_err(gpio->dev, "failed to init gpio chip for port%d\n",
>                         port->idx);
> --
> 2.13.6
>
