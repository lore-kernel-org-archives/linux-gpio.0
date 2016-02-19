From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Fri, 19 Feb 2016 09:55:41 +0100
Message-ID: <CACRpkdYgxJme3V1RSkvmsBL=b5zroNKwPJH70mgDbxMD=XQJtw@mail.gmail.com>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
	<20160217205445.GA2394@deathstar>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33671 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1426727AbcBSIzm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Feb 2016 03:55:42 -0500
Received: by mail-oi0-f46.google.com with SMTP id j125so7979082oih.0
        for <linux-gpio@vger.kernel.org>; Fri, 19 Feb 2016 00:55:42 -0800 (PST)
In-Reply-To: <20160217205445.GA2394@deathstar>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Wed, Feb 17, 2016 at 9:54 PM, Michael Welling <mwelling@ieee.org> wrote:

> After applying the patch from Josh Cartwright:
> http://www.spinics.net/lists/arm-kernel/msg484070.html

Sorry for screwing up :(

> root@dragonboard-410c:/sys/class/gpio# ~/lsgpio
> GPIO chip: gpiochip0, "1000000.pinctrl", 122 GPIO lines
>         line 0: unnamed unlabeled
> (...)
>
> Tested-by: Michael Welling <mwelling@ieee.org>

I hope that means you also like where this is going :D

I merged this to my main branch now.

Yours,
Linus Walleij
