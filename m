From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/8] gpio: ts4800: fix implicit assumption module.h is present
Date: Thu, 15 Sep 2016 14:00:19 +0200
Message-ID: <CACRpkdb53DF6EdMX0_ZD0uhvYdZ376-a6gHshfoFTLTRyyW6-A@mail.gmail.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com> <20160912221631.15812-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36647 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934712AbcIOMAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 08:00:21 -0400
Received: by mail-oi0-f47.google.com with SMTP id q188so65294909oia.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2016 05:00:20 -0700 (PDT)
In-Reply-To: <20160912221631.15812-4-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 13, 2016 at 12:16 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for this file is:
>
> drivers/gpio/Kconfig:config GPIO_TS4800
> drivers/gpio/Kconfig: tristate "TS-4800 DIO blocks and compatibles"
>
> ...but however it does not include module.h -- it in turn gets it from
> another header (gpio/driver.h) and we'd like to replace that with a
> forward delcaration of "struct module;" but if we do, this file will
> fail to compile.
>
> So we fix this first to avoid putting build failures into the bisect
> commit history.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
