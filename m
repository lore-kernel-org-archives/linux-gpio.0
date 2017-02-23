From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pl061: use all specified IRQs for chained handler
Date: Thu, 23 Feb 2017 10:45:00 +0100
Message-ID: <CACRpkdbO=2PzwFM4RRq4gLSb1OEmfgwkyEeoSRZcB5ya1HBRtg@mail.gmail.com>
References: <20170222123049.17588-1-alexander.sverdlin@nokia.com>
 <CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com> <7e183e70-50e0-61ed-6b33-e691046df725@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f49.google.com ([209.85.214.49]:37799 "EHLO
        mail-it0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbdBWJqC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Feb 2017 04:46:02 -0500
Received: by mail-it0-f49.google.com with SMTP id 203so10132948ith.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Feb 2017 01:45:02 -0800 (PST)
In-Reply-To: <7e183e70-50e0-61ed-6b33-e691046df725@nokia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?B?U8WCYXdvbWlyIFN0xJlwaWXFhA==?= <slawomir.stepien@nokia.com>

On Wed, Feb 22, 2017 at 1:57 PM, Alexander Sverdlin
<alexander.sverdlin@nokia.com> wrote:

>> - If the component has 8 IRQ lines, create a hierarchical IRQdomain
>>   and chip using a gpiolib core helper.
>
> This was an option of course, the only this is, PL061 spec says, there is
> GPIOINTR and if someone has forgot it, we can support it with a quirk.

I don't know about that. The PL061 manual says:

"The contents of this register are made available externally through the
intra-chip (or on-chip) GPIOMIS[7:0] signals."

They don't say why, but it is reasonable to assume that this is an
either-or not both-and integration point.

EITHER you route GPIOMIS[7:0] to individual IRQ lines to the CPU
OR you route GPIOINTR to the CPU.

The first approach is in a sense more efficient, because you do not
need a second level read to figure out what IRQ was fired.

> It's not specified to work this way at all, so why spend any resources
> and add second implementation to the driver?

It's not specified at all how it's supposed to work. But can you really
see any other reason to make both GPIOMIS[7:0] and GPIOINTR
available that what I describe above?

>> - If not 1 or 8 lines, bail out with an error.
>
> Well, I'd divide it into "1" and "!= 1" cases... Who knows, maybe
> only 4 GPIOs will be implemented...

If you mean that the hardware engineer only route 4 of the signals,
then the ngpio property of the device tree node must be specified.
That is exactly what that property is for, see:
Documentation/devicetree/bindings/gpio/gpio.txt

If that is not specified, it should be 1 using GPIOINTR, 8 and
using GPIOMIS[7:0] or error.

Yours,
Linus Walleij
