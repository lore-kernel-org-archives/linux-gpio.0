From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mxs: remove __init annotation
Date: Fri, 30 Dec 2016 09:03:32 +0100
Message-ID: <CACRpkdZ2v962cg3Y-ZurQthTpZVH4RQzcoUay=EHwd55Bh3QAQ@mail.gmail.com>
References: <20161216090825.2299257-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:36706 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751557AbcL3IDd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Dec 2016 03:03:33 -0500
Received: by mail-qt0-f181.google.com with SMTP id k15so150777636qtg.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Dec 2016 00:03:33 -0800 (PST)
In-Reply-To: <20161216090825.2299257-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Marek Vasut <marex@denx.de>, Sascha Hauer <s.hauer@pengutronix.de>, Gregory Fong <gregory.0xf0@gmail.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Dec 16, 2016 at 10:08 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> Building with an old toolchain, I ran into this warning:
>
> WARNING: vmlinux.o(.text+0x63eef0): Section mismatch in reference from the function mxs_gpio_probe() to the function .init.text:mxs_gpio_init_gc()
>
> Clearly the annotation is wrong, since the function is called from the
> non-init probe, so let's remove it.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied for fixes.

Yours,
Linus Walleij
