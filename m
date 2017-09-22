From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: syscon: do not use raw "set" callback in syscon_gpio_dir_out
Date: Fri, 22 Sep 2017 15:47:20 +0200
Message-ID: <CACRpkdaJVf1BCaXk-BWnc3tjuB7kGbq_7M-5JLzC-dei86NHZA@mail.gmail.com>
References: <1504104641-8369-1-git-send-email-vladimir.murzin@arm.com>
 <CACRpkdayo0Upfx21q7FJbVRRiqWTuHGfF=vYUpZHd+17TDUQbQ@mail.gmail.com>
 <1505994978.366886647@f249.i.mail.ru> <7e4a2e92-1186-4bad-986e-e3cb39b9c36c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:49480 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752070AbdIVNrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2017 09:47:21 -0400
Received: by mail-it0-f51.google.com with SMTP id c195so1388066itb.4
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2017 06:47:21 -0700 (PDT)
In-Reply-To: <7e4a2e92-1186-4bad-986e-e3cb39b9c36c@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Alexander Shiyan <shc_work@mail.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Lee Jones <lee.jones@linaro.org>

On Fri, Sep 22, 2017 at 12:23 PM, Vladimir Murzin
<vladimir.murzin@arm.com> wrote:

> I tried to use gpio-syscon to fit into my case which is very
> similar to those pseudo-GPIOs in drivers/mfd/vexpress-sysreg.c

I do not like what that driver is doing and it should not be
taken as inspiration.

I have several times slammed down on people trying to shoehorn
things that are not GPIO into the GPIO subsystem just out of
convenience.

The question to ask is always: is this bit/line/pin really
"general purpose input/output"?

Not "how can I quickly code up something that makes this
thing work?"

See for example drivers/leds/leds-syscon.c
That was my response to someone trying to first use
syscon-gpio on a register and then gpio-leds on top of
that, hilarious layers of indirection!

If the use case is MMC card detect, we need card detection
using syscon directly in the MMC subsystem, not hacks
like what the Vexpress MFD driver is doing.

I have the Versatile Express in my office and one day I will
fix up this thing.

Yours,
Linus Walleij
