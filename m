From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: move varargs hack outside #ifdef GPIOLIB
Date: Mon, 1 Sep 2014 13:47:24 -0700
Message-ID: <CAAVeFuJDXHpoPgZ9yi=-+ya2orRpq_D4OHZsMV-0FCAMNVsSTA@mail.gmail.com>
References: <1409577507-6752-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:47577 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbaIAUro (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Sep 2014 16:47:44 -0400
Received: by mail-ie0-f171.google.com with SMTP id rp18so6596374iec.16
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2014 13:47:44 -0700 (PDT)
In-Reply-To: <1409577507-6752-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Mon, Sep 1, 2014 at 6:18 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> commit 39b2bbe3d715cf5013b5c48695ccdd25bd3bf120
> "gpio: add flags argument to gpiod_get*() functions"
> added a dynamic flags argument to all the GPIOD getter
> functions, however this did not cover the stubs so
> when people used gpiod stubs to compile out descriptor
> code, compilation failed.
>
> Solve this by:
> - Also rename all the stub functions __gpiod_*
> - Moving the vararg hack outside of #ifdef CONFIG_GPIOLIB
>   so these will always be available.
Damn, haven't thought about this.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Also it is indeed much nicer to have the macro hacks all in one place. Thanks.
