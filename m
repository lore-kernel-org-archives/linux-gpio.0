From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] gpio: em: depnd on ARCH_SHMOBILE
Date: Thu, 24 Nov 2016 10:38:48 +0100
Message-ID: <CAMuHMdWKcfOb6v0GQrcAadhPeM1d8M_EmNicZqpO0+2VfeoBog@mail.gmail.com>
References: <20161120174836.1787-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wj0-f196.google.com ([209.85.210.196]:32879 "EHLO
        mail-wj0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934194AbcKXJiu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2016 04:38:50 -0500
In-Reply-To: <20161120174836.1787-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

CC linux-renesas-soc

On Sun, Nov 20, 2016 at 6:48 PM, Peter Robinson <pbrobinson@gmail.com> wrote:
> The GPIO_EM is part of the Renesas SoCs so depend on the arch.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> v1->v2:
>         - Add COMPILE_TEST
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index d011cb8..a09e237 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -171,7 +171,7 @@ config GPIO_DWAPB
>
>  config GPIO_EM
>         tristate "Emma Mobile GPIO"
> -       depends on ARM && OF_GPIO
> +       depends on (ARCH_SHMOBILE || COMPILE_TEST) && OF_GPIO

For ARM SoCs, ARCH_SHMOBILE is being phased out in favor of ARCH_RENESAS.
Note that ARCH_SHMOBILE is also set for some SuperH SoCs.

However, ARCH_EMEV2 is even more suitable here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
