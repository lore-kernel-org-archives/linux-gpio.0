From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] GPIO support for Socionext Synquacer
Date: Tue, 31 Oct 2017 14:19:05 +0100
Message-ID: <CACRpkdZofzS+bNL4UjwHUb-jVev-1NbENVGuxCY3Q3hchdZCbA@mail.gmail.com>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
 <CACRpkdbfM6SuXxkbfcmJ-JxK1Mt=oxy1qN3rEawoNb8gpmjM9Q@mail.gmail.com> <CAKv+Gu-20f8VXW1x1T5BVoFwFiiNsS1XYvrA7XPo438-C6=u+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:49793 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751565AbdJaNTH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 09:19:07 -0400
Received: by mail-io0-f196.google.com with SMTP id n137so35015111iod.6
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 06:19:06 -0700 (PDT)
In-Reply-To: <CAKv+Gu-20f8VXW1x1T5BVoFwFiiNsS1XYvrA7XPo438-C6=u+A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>

On Tue, Oct 31, 2017 at 1:27 PM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> On 31 October 2017 at 12:20, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Fri, Oct 27, 2017 at 10:21 PM, Ard Biesheuvel
>> <ard.biesheuvel@linaro.org> wrote:
>>
>>> The Socionext Synquacer SC2A11, which is used in the arm64 Developer Box,
>>> shares its GPIO IP with a Fujitsu SoC for which we already have support
>>> in the tree. So let's tweak it so that we can reuse it.
>>>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> Ard Biesheuvel (2):
>>>   gpio: mb86s7x: share with other SoCs as module
>>>   gpio: mb86s70: Revert "Return error if requesting an already assigned
>>>     gpio"
>>
>> Nice. We might need to look into the following wrt this driver:
>>
>> - Using generic MMIO GPIO, i.e. select GPIO_GENERIC in Kconfig
>>   and a patch such as commit 6d125412fc16802012a17665638f49b0b0c81f18
>>   "gpio: iop: Use generic GPIO MMIO functions for driver"
>>   apart from reduced code size this brings the .get_multiple() and
>>   .set_multiple() callbacks for FREE.
>>   The fact that the driver is so simple that it should have been using
>>   MMIO/GENERIC GPIO is a plain oversight during review.
>
> Does this work with the layout if this chip? It has 32 GPIO lines,
> whose controls are mapped onto the lowest 8 bits of 4 adjacent 32-bit
> registers.

I didn't look close enough. No GPIO MMIO is just for simple
1:1 mapping of say 32 bits, so it won't work.

There is opportunity to exploit [get|set]_multiple() callbacks
for any bits that end up in the same group of 8 though,
but it requires some elaborate code for just this driver.
It does make for a nice 8-line oscilloscope to sample
all 8 lines simultaneously with .get_multiple() for example.

But that is just optimization.

If you have the datasheet, also check if the block is really this
simple and whether it maybe actually supports some pin config
like open drain or debounce etc, we have support for that
as well these days using .set_config() in the drivers.

Yours,
Linus Walleij
