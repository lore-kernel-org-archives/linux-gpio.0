From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio before
 querying its direction"
Date: Wed, 30 Aug 2017 21:38:23 +0200
Message-ID: <CAMuHMdUYqZe8CzckGg39ej1AuOwHGMBsNbZN1h+yCOb-vAhAJA@mail.gmail.com>
References: <20170830112424.7a3a7c36@windsurf.lan> <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
 <87ziah2m3f.fsf@free-electrons.com> <20170830161730.41919554@windsurf.lan>
 <442accaa-15a0-4efb-4e5c-cebca7140213@codeaurora.org> <20170830163255.4e7c1422@windsurf.lan>
 <20170830162440.GE1863@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35697 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbdH3TiY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2017 15:38:24 -0400
Received: by mail-pg0-f67.google.com with SMTP id r133so5737112pgr.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2017 12:38:24 -0700 (PDT)
In-Reply-To: <20170830162440.GE1863@w540>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: jmondi <jacopo@jmondi.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Timur Tabi <timur@codeaurora.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@free-electrons.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>

On Wed, Aug 30, 2017 at 6:24 PM, jmondi <jacopo@jmondi.org> wrote:
> On Wed, Aug 30, 2017 at 04:32:55PM +0200, Thomas Petazzoni wrote:
>> On Wed, 30 Aug 2017 09:22:55 -0500, Timur Tabi wrote:
>> > No, that's it.  The question is, what exactly should the 'request'
>> > function do?  Should it be modifying the hardware to satisfy the
>> > request?  When I wrote my patch, I assumed that it wouldn't.  I thought
>> > that request simply answered the question, "can I touch this GPIO"?
>>
>> No, it also muxes the pin in GPIO, and you can see the "reference"
>> implementation pinctrl-single also does it.
>>
>> Let's see what Linus W. has to say about the semantic of the "request"
>> operation.
>>
>> But if we change the semantic of "request" to no longer mux the hardware
>> as GPIO, then you will also have regressions, because there are plenty
>> of GPIOs that are requested, but not explicitly muxed as GPIOs in the
>> DT, precisely because today requesting a GPIO is sufficient to have it
>> re-muxed as GPIO at the pinctrl level.
>
> Just to point out one of Renesas' pin controller devices seems to
> suffer from the same problem, introduced by Timur's commit
>
> https://www.spinics.net/lists/linux-renesas-soc/msg17647.html
>
> This is indeed caused by the "request" introduced by the above said
> commit, that in rza1 pincontroller, actually muxes the requested
> pin as GPIO.

To clarify: which causes havoc if that pin is used as e.g. an SDRAM
address line.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
