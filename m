From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio before
 querying its direction"
Date: Thu, 31 Aug 2017 11:50:42 +0200
Message-ID: <CAMuHMdXeWBbSkvwh_hpGhPe_s-GA8BptQPJWG_bu0Ln12N93Aw@mail.gmail.com>
References: <20170830112424.7a3a7c36@windsurf.lan> <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
 <87ziah2m3f.fsf@free-electrons.com> <20170830161730.41919554@windsurf.lan>
 <CACRpkdbxdkHukALfYMrM7w=1KNJKLBhGebbkEpMb3C3+nCfWOA@mail.gmail.com>
 <20170831091812.6f7d417e@windsurf.lan> <CAMuHMdVGkTQ0vnOg5o+t1J9qe79ySm0R8aE4msyuNLoVGHLD6A@mail.gmail.com>
 <20170831092211.GP20805@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f52.google.com ([74.125.83.52]:36241 "EHLO
        mail-pg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751504AbdHaJun (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 05:50:43 -0400
Received: by mail-pg0-f52.google.com with SMTP id r133so573109pgr.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2017 02:50:43 -0700 (PDT)
In-Reply-To: <20170831092211.GP20805@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Timur Tabi <timur@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Russell,

On Thu, Aug 31, 2017 at 11:22 AM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Thu, Aug 31, 2017 at 09:30:54AM +0200, Geert Uytterhoeven wrote:
>> > Note that on my side, I've however not been convinced by this semantic:
>> > I find it weird that when you request a GPIO, it gets automatically
>> > muxed as such, without an explicit pinctrl configuration in the DT.
>>
>> On lots of hardware, you first have to select between GPIO and "other
>> function".
>> For "other function", you have to select the actual function later.
>> In that case, switching to a GPIO can be done by flipping a single bit.
>
> What about hardware which you can configure for some alternate function
> but still monitor the pin via GPIO, even though it's not mux'd as GPIO.
>
> For instance, you may have a timer block which can capture on both
> edges of an external event signal, which needs the pin to be muxed for
> that function.  However, you need to read the state of the pin, and
> that is only available through GPIO.  Muxing the pin to be a GPIO just
> because someone requests the GPIO is, imho, ill thought-out and breaks
> some use cases.

Yes, reading from the GPIO can work if the pin is muxed to another function.

> IMHO, the pinmux settings should always be specified in DT, and that's
> what we should be using everywhere, not doing broken backdoor games like
> "the gpio is being requested, it's obvious that we want this pin to be
> a gpio" - that really doesn't follow.

Do we need to specify pinmux setting for pins used by e.g. the SDRAM
controller, which doesn't have a Linux driver?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
