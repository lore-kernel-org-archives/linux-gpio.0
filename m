From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xra1403: select REGMAP_SPI
Date: Wed, 31 May 2017 02:14:14 +0200
Message-ID: <CACRpkdbE7q=DNO6Cdmq4v_uO-6DWm7-yS0Rnu22-buAQe+3-xw@mail.gmail.com>
References: <20170530111332.3829080-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:34513 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750811AbdEaAOQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 20:14:16 -0400
Received: by mail-io0-f182.google.com with SMTP id k91so2838149ioi.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2017 17:14:16 -0700 (PDT)
In-Reply-To: <20170530111332.3829080-1-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nandor Han <nandor.han@ge.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 30, 2017 at 1:13 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> Without the regmap code, we get a link error:
>
> drivers/gpio/built-in.o: In function `xra1403_probe':
> (.text+0x132e0): undefined reference to `__devm_regmap_init_spi'
>
> Fixes: 5704520d7880 ("gpio: xra1403: Add EXAR XRA1403 SPI GPIO expander driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
