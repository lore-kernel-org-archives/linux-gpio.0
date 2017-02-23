From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pl061: use all specified IRQs for chained handler
Date: Thu, 23 Feb 2017 14:49:39 +0100
Message-ID: <CACRpkdZ0NPH_khZDzcYgd7A=D9E0DprQbjDBRBsCtnriumTFOQ@mail.gmail.com>
References: <20170222123049.17588-1-alexander.sverdlin@nokia.com>
 <CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com>
 <7e183e70-50e0-61ed-6b33-e691046df725@nokia.com> <CACRpkdbO=2PzwFM4RRq4gLSb1OEmfgwkyEeoSRZcB5ya1HBRtg@mail.gmail.com>
 <20170223125801.GB1488@sstepien>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:35133 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbdBWNtl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 08:49:41 -0500
Received: by mail-it0-f54.google.com with SMTP id 203so175632678ith.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2017 05:49:41 -0800 (PST)
In-Reply-To: <20170223125801.GB1488@sstepien>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?U8WCYXdvbWlyIFN0xJlwaWXFhCAoTm9raWEgLSBQTC9Xcm9jbGF3KQ==?= <slawomir.stepien@nokia.com>
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>, Marc Zyngier <marc.zyngier@arm.com>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 23, 2017 at 1:58 PM, S=C5=82awomir St=C4=99pie=C5=84 (Nokia - P=
L/Wroclaw)
<slawomir.stepien@nokia.com> wrote:
> On Feb 23, 2017 10:45, Linus Walleij wrote:
>> On Wed, Feb 22, 2017 at 1:57 PM, Alexander Sverdlin
>> <alexander.sverdlin@nokia.com> wrote:
>>
>> >> - If the component has 8 IRQ lines, create a hierarchical IRQdomain
>> >>   and chip using a gpiolib core helper.
>> >
>> > This was an option of course, the only this is, PL061 spec says, there=
 is
>> > GPIOINTR and if someone has forgot it, we can support it with a quirk.
>>
>> I don't know about that. The PL061 manual says:
>>
>> "The contents of this register are made available externally through the
>> intra-chip (or on-chip) GPIOMIS[7:0] signals."
>>
>> They don't say why, but it is reasonable to assume that this is an
>> either-or not both-and integration point.
>>
>> EITHER you route GPIOMIS[7:0] to individual IRQ lines to the CPU
>> OR you route GPIOINTR to the CPU.
>
> On page 2-10, 2.3.4 you can read:
>
> "a single interrupt output GPIOINTR and/or the individual interrupts can =
be
> sent to the interrupt controller."
>
> Also see figure 2-1, 4-2.
>
> Does it not says that there are two independent options available?

Ah I didn't see that. It just underscores the point even more :)

Anyways, from a software point of view you will want to either use
the individual IRQ lines *or* the aggregated IRQ line. Not both
at the same time (no usecase I can think of atleast).

Yours,
Linus Walleij
