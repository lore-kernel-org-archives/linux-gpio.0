From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/8] gpio: loongson1: fix implicit assumption module.h is present
Date: Thu, 15 Sep 2016 14:03:02 +0200
Message-ID: <CACRpkdYV_uKMaOX1ZLw_hq3BNGXbrtAerwhwnJQixdbLwAP2Uw@mail.gmail.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com> <20160912221631.15812-7-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:33328 "EHLO
        mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934380AbcIOMDE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 08:03:04 -0400
Received: by mail-oi0-f54.google.com with SMTP id r126so65511355oib.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2016 05:03:03 -0700 (PDT)
In-Reply-To: <20160912221631.15812-7-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Linux MIPS <linux-mips@linux-mips.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 13, 2016 at 12:16 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for this file is:
>
> drivers/gpio/Kconfig:config GPIO_LOONGSON1
> drivers/gpio/Kconfig:   tristate "Loongson1 GPIO support"
>
> ...but however it does not include module.h -- it in turn gets it from
> another header (gpio/driver.h) and we'd like to replace that with a
> forward delcaration of "struct module;" but if we do, this file will
> fail to compile.
>
> So we fix this first to avoid putting build failures into the bisect
> commit history.
>
> Cc: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-mips@linux-mips.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
