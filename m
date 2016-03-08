From: Quan Nguyen <qnguyen@apm.com>
Subject: Re: [PATCH] gpio: xgene: Fix kconfig for standby GIPO contoller
Date: Tue, 8 Mar 2016 11:29:54 +0700
Message-ID: <CAFopSPTZBbXHd5Jvm=VUVZTBokTakUK-9gYXrsMARnVGFuq=kQ@mail.gmail.com>
References: <1457089198-27171-1-git-send-email-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f45.google.com ([209.85.213.45]:34468 "EHLO
	mail-vk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753530AbcCHE34 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2016 23:29:56 -0500
Received: by mail-vk0-f45.google.com with SMTP id e185so4242411vkb.1
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2016 20:29:55 -0800 (PST)
In-Reply-To: <1457089198-27171-1-git-send-email-mbrugger@suse.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 4, 2016 at 5:59 PM, Matthias Brugger <mbrugger@suse.com> wrote:
> The standby GPIO controller can be used as a interrupt controller.
> Select GPIOLIB_IRQCHIP when compiling this driver. Otherwise we get
> a compilation error:
>
> drivers/gpio/gpio-xgene-sb.c: In function 'xgene_gpio_sb_probe':
> drivers/gpio/gpio-xgene-sb.c:312:10: error: 'struct gpio_chip' has no member named 'irqdomain'
>   priv->gc.irqdomain = priv->irq_domain;
>           ^
> scripts/Makefile.build:295: recipe for target 'drivers/gpio/gpio-xgene-sb.o' failed
> make[2]: *** [drivers/gpio/gpio-xgene-sb.o] Error 1
>
> Fixes: 1013fc41 "gpio: xgene: Enable X-Gene standby GPIO as interrupt controller"
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  drivers/gpio/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Acked-by: Quan Nguyen <qnguyen@apm.com>
