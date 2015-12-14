From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 121/182] pinctrl: exynos5440: use gpiochip data pointer
Date: Mon, 14 Dec 2015 15:09:17 +0100
Message-ID: <CACRpkdb37VoZTNp_xn6pn6AFJ+vFiLt_5K5MX-4+nO5WxAj2EA@mail.gmail.com>
References: <1449668063-3532-1-git-send-email-linus.walleij@linaro.org>
	<CA+Ln22HJwjBzgjvvn4x0wURYx6PqgLLKc=_5x5dfSuhSPXLV+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:36683 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986AbbLNOJS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 09:09:18 -0500
Received: by obcno2 with SMTP id no2so12696857obc.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 06:09:17 -0800 (PST)
In-Reply-To: <CA+Ln22HJwjBzgjvvn4x0wURYx6PqgLLKc=_5x5dfSuhSPXLV+g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Kukjin Kim <kgene@kernel.org>

On Fri, Dec 11, 2015 at 7:21 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

>> -#include <linux/gpio.h>
>> +#include <linux/gpio/driver.h>
>
> Commit message doesn't mention this change. Do I assume correctly that
> it's needed for gpiochip_get_data() and also gives the driver access
> to all definitions it needed from linux/gpio.h?

No GPIO driver should ever use anything outside <linux/gpio/driver.h>
and it appears this one doesn't. So it's just me sneaking in some
cleanups.

> Other than that (and the fact that, as opposed to the other Exynos
> patch, this one is actually cleaner):
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>

Thanks, well the thing is that from a helicopter view, everything looks
better after this patch series, so that is why I'm pushing it.

Yours,
Linus Walleij
