From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xgene: Fix kconfig for standby GIPO contoller
Date: Fri, 11 Mar 2016 23:01:32 +0700
Message-ID: <CACRpkdbtRAC4pUQP29SAmL-ge6uJefMt5Cda6dYCR2kZ8u18og@mail.gmail.com>
References: <1457089198-27171-1-git-send-email-mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:35419 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932534AbcCKQBd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Mar 2016 11:01:33 -0500
Received: by mail-oi0-f43.google.com with SMTP id c203so88816647oia.2
        for <linux-gpio@vger.kernel.org>; Fri, 11 Mar 2016 08:01:33 -0800 (PST)
In-Reply-To: <1457089198-27171-1-git-send-email-mbrugger@suse.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Quan Nguyen <qnguyen@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

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

Quan's patch exporting the symbols has been merged by tglx
so dropping this.

Yours,
Linus Walleij
