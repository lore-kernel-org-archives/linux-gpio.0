From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH 1/1] gpio: pca953x: Allow interrupt support when
 compiled as module
Date: Fri, 28 Nov 2014 16:11:02 +0100
Message-ID: <CACRpkdYRvBQ3WgJv7hXVbe0ubG+Gw9pgDM1Fd4HgMLPE5kQnrA@mail.gmail.com>
References: <1416492379-28433-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:33949 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751174AbaK1PLE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 10:11:04 -0500
Received: by mail-ie0-f181.google.com with SMTP id tp5so6115903ieb.40
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2014 07:11:02 -0800 (PST)
In-Reply-To: <1416492379-28433-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Nov 20, 2014 at 3:06 PM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> With commit 2fd36c55264926e268deb50f6de5f43fa5e490f7
> ("i2c: core: Map OF IRQ at probe time") it seems that there is no need
> to force this driver to be compiled into the kernel.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

I don't get this at all.

>  config GPIO_PCA953X_IRQ
>         bool "Interrupt controller support for PCA953x"
> -       depends on GPIO_PCA953X=y
>         select GPIOLIB_IRQCHIP
>         help
>           Say yes here to enable the pca953x to be used as an interrupt
> -         controller. It requires the driver to be built in the kernel.
> +         controller.

Why should this *not* be dependent on GPIO_PCA953X?? The config
flag is only used inside the file that gets built by exactly that
config flag!

Just remove the "=y" part of the line and test if you like.

The dependency makes perfect sense, it'd just that removing it won't
break the build just because it's only used in that file.

> This is completely untested, as I lack a board capable of running a v3.18-rcX
> kernel. But I noticed on an older kernel that this driver failed requesting
> irq 0 during kernel boot. 0 because it's irq parent was not yet probed (also
> a compiled in driver).

If the parent is not probed, it should get an -EPROBE_DEFER
as irq number from the parent and bail out, then that is the actual bug
that needs fixing.

> With the mentioned commit this should work now.

I want it tested before I believe it...

Yours,
Linus Walleij
