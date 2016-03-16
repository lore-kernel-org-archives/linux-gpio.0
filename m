From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xgene: Fix kconfig for standby GIPO contoller
Date: Wed, 16 Mar 2016 13:00:09 +0100
Message-ID: <CACRpkdad10S_X_cj6MBHU2yRoWV7GojteHTwM7MxyNsxBc2YUw@mail.gmail.com>
References: <1457089198-27171-1-git-send-email-mbrugger@suse.com>
	<CACRpkdbtRAC4pUQP29SAmL-ge6uJefMt5Cda6dYCR2kZ8u18og@mail.gmail.com>
	<1457726584.587.5.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:34247 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932460AbcCPMAK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2016 08:00:10 -0400
Received: by mail-oi0-f54.google.com with SMTP id m82so36457706oif.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2016 05:00:10 -0700 (PDT)
In-Reply-To: <1457726584.587.5.camel@suse.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthias Brugger <mbrugger@suse.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Quan Nguyen <qnguyen@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Mar 11, 2016 at 9:03 PM, Matthias Brugger <mbrugger@suse.com> wrote:
> On Fri, 2016-03-11 at 23:01 +0700, Linus Walleij wrote:
>> On Fri, Mar 4, 2016 at 5:59 PM, Matthias Brugger <mbrugger@suse.com>
>> wrote:
>>
>> > The standby GPIO controller can be used as a interrupt controller.
>> > Select GPIOLIB_IRQCHIP when compiling this driver. Otherwise we get
>> > a compilation error:
>> >
>> > drivers/gpio/gpio-xgene-sb.c: In function 'xgene_gpio_sb_probe':
>> > drivers/gpio/gpio-xgene-sb.c:312:10: error: 'struct gpio_chip' has
>> > no member named 'irqdomain'
>> >   priv->gc.irqdomain = priv->irq_domain;
>> >           ^
>> > scripts/Makefile.build:295: recipe for target 'drivers/gpio/gpio
>> > -xgene-sb.o' failed
>> > make[2]: *** [drivers/gpio/gpio-xgene-sb.o] Error 1
>> >
>> > Fixes: 1013fc41 "gpio: xgene: Enable X-Gene standby GPIO as
>> > interrupt controller"
>> > Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>
>> Quan's patch exporting the symbols has been merged by tglx
>> so dropping this.
>>
>
> Thanks for the info.
>
> Actually this is v1 [1] of the patch, which just addresses the
> GPIOLIB_IRQCHIP problem?
> With Quan's patch this should still be present.

Ah sorry I screwed up here and confused the patches.

Patch applied.

Yours,
Linus Walleij
