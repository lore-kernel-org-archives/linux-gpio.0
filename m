From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: gpio: ARCH_MB86S7X?
Date: Fri, 23 Jan 2015 16:04:04 +0530
Message-ID: <CAJe_ZhcVZNzbEiVBsvHDqsYOdCXA9fmZuHrQMQ-jFDWuoobovQ@mail.gmail.com>
References: <1422008501.30730.22.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:40032 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754039AbbAWKeF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jan 2015 05:34:05 -0500
Received: by mail-qc0-f175.google.com with SMTP id c9so5597474qcz.6
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2015 02:34:04 -0800 (PST)
In-Reply-To: <1422008501.30730.22.camel@x220>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, Andy Green <andy.green@linaro.org>, Vincent Yang <Vincent.Yang@tw.fujitsu.com>, Tetsuya Nuriya <nuriya.tetsuya@jp.fujitsu.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi Paul,

On 23 January 2015 at 15:51, Paul Bolle <pebolle@tiscali.nl> wrote:
> Jassi,
>
> Your commit 0da094d82c27 ("gpio: Add Fujitsu MB86S7x GPIO driver") is
> included in today's linux-next (ie, next-20150123). I noticed because a
> script I use to check linux-next spotted a problem in it.
>
> That commit added the Kconfig symbol GPIO_MB86S7X and made it depend on
> ARCH_MB86S7X. But there's no Kconfig symbol ARCH_MB86S7X in linux-next.
> I assume a patch to add that symbol is queued somewhere. Is that
> correct?
>
We are adding support for new Fujitsu platform MB86S7x. v4 of the
patchset has been submitted, we are hoping it gets upstream coming
merge window. However, the arch patches haven't been picked so far.

> Please note that I actually managed to cross-compile
> drivers/gpio/gpio-mb86s7x.c with this command:
>     make ARCH=arm CROSS_COMPILE=arm-linux-gnu- EXTRA_CFLAGS="-DCONFIG_GPIOLIB=y" drivers/gpio/gpio-mb86s7x.o
>
> So, for what it's worth, that dependency appears to be not needed to
> build this driver.
>
Linus.W, what do you suggest? Just drop the dependency?

Thanks
-Jassi
