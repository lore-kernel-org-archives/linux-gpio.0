From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] gpio: zx: depend on ARCH_ZX
Date: Mon, 7 Nov 2016 11:31:49 +0900
Message-ID: <CAK7LNAQrpjs4jKt_LM=g_bd3L7RDYF-4ZWo6Szv+ZcAwiSWbsg@mail.gmail.com>
References: <20161106182931.20381-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:65485 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751492AbcKGCbz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Nov 2016 21:31:55 -0500
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com [209.85.161.176]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id uA72Vo2m017369
        for <linux-gpio@vger.kernel.org>; Mon, 7 Nov 2016 11:31:51 +0900
Received: by mail-yw0-f176.google.com with SMTP id r204so124361448ywb.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Nov 2016 18:31:51 -0800 (PST)
In-Reply-To: <20161106182931.20381-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

2016-11-07 3:29 GMT+09:00 Peter Robinson <pbrobinson@gmail.com>:
> Set GPIO_ZX to depend on ARCH_ZX as it's SOC specific.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index d011cb8..2c458c8 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -524,6 +524,7 @@ config GPIO_ZYNQ
>
>  config GPIO_ZX
>         bool "ZTE ZX GPIO support"
> +       depends on ARCH_ZX
>         select GPIOLIB_IRQCHIP
>         help
>           Say yes here to support the GPIO device on ZTE ZX SoCs.



Maybe

      depends on ARCH_ZX || COMPILE_TEST

to keep the COMPILE_TEST'ability?

Likewise for the other two patches.


-- 
Best Regards
Masahiro Yamada
