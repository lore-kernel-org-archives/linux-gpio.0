From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 10/11] w1: Allow compile test of GPIO consumers if !GPIOLIB
Date: Sun, 2 Aug 2015 14:11:32 +0200
Message-ID: <CAMuHMdVWeK0chrG_NZ6diHyBxa13WnesgNZ7gh6dTAENw2bg_A@mail.gmail.com>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
	<1438506594-31888-1-git-send-email-geert@linux-m68k.org>
	<1214241438507507@web3j.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34214 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751215AbbHBMLd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Aug 2015 08:11:33 -0400
Received: by oigu133 with SMTP id u133so15419013oig.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Aug 2015 05:11:32 -0700 (PDT)
In-Reply-To: <1214241438507507@web3j.yandex.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Evgeniy,

On Sun, Aug 2, 2015 at 11:25 AM, Evgeniy Polyakov <zbr@ioremap.net> wrote:
> 02.08.2015, 12:09, "Geert Uytterhoeven" <geert@linux-m68k.org>:
>> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
>> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
>> functionality only, can still be compiled if GPIOLIB is not enabled.
>>
>> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
>> appropriate.
>
>> - depends on GPIOLIB
>> + depends on GPIOLIB || COMPILE_TEST
>
> Does that mean GPIO subsystem is always available and no additional dependency needed
> when COMPILE_TEST is enabled?

The GPIO subsystem is not always available, but it provides dummy GPIO consumer
functions if GPIOLIB is not enabled.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
