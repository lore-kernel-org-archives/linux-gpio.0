From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mvebu: fix warning when building on 64-bit
Date: Wed, 11 Jan 2017 16:47:46 +0100
Message-ID: <CACRpkdZ_LciV5a5Sj+YfGtfws2hvdSjscx0tu4=1RNYTXWU4gw@mail.gmail.com>
References: <E1cR5IG-0008Gw-HV@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:34477 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935658AbdAKPrx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 10:47:53 -0500
Received: by mail-qk0-f178.google.com with SMTP id a20so213500870qkc.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 07:47:48 -0800 (PST)
In-Reply-To: <E1cR5IG-0008Gw-HV@rmk-PC.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 10, 2017 at 11:53 PM, Russell King
<rmk+kernel@armlinux.org.uk> wrote:

> Casting a pointer to an int is not portable, and provokes a compiler
> warning.  Cast to unsigned long instead to avoid the warning.
>
> drivers/gpio/gpio-mvebu.c: In function 'mvebu_gpio_probe':
> drivers/gpio/gpio-mvebu.c:662:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>    soc_variant = (int) match->data;
>                  ^
>
> This will be needed when building gpio-mvebu for Armada 7k/8k ARM64
> SoCs.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
> Linus,
>
> I don't think this is necessary to push into -rc, as its not yet used
> on ARM64 - GPIO support is not yet present in the DTS files, and the
> Kconfig doesn't allow the driver to be built on ARM64.  Hence, please
> queue for the next merge window as a low priority fix.

Fair enough, queued for next. Thanks!

Yours,
Linus Walleij
