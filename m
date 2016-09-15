From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/8] gpio: ath79: fix implicit assumption module.h is present
Date: Thu, 15 Sep 2016 14:02:05 +0200
Message-ID: <CACRpkdZNd6aLvZTN7Q2u6VMxxm+UAgZ20KYjDQ=EhGzUG8QGfw@mail.gmail.com>
References: <20160912221631.15812-1-paul.gortmaker@windriver.com> <20160912221631.15812-6-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:34939 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933540AbcIOMCH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2016 08:02:07 -0400
Received: by mail-oi0-f46.google.com with SMTP id w11so65457155oia.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2016 05:02:06 -0700 (PDT)
In-Reply-To: <20160912221631.15812-6-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 13, 2016 at 12:16 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for this file is:
>
> drivers/gpio/Kconfig:config GPIO_ATH79
> drivers/gpio/Kconfig: tristate "Atheros AR71XX/AR724X/AR913X GPIO support"
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
