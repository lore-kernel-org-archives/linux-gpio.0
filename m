From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: lockdep: incorrect deadlock warning with two GPIO expanders
Date: Tue, 13 Sep 2016 14:29:24 +0200
Message-ID: <CACRpkdb00e=YexmCRwv=evVLjBDM6Pjqtcs+Mnc8JVD1Ssa5mA@mail.gmail.com>
References: <CAMpxmJUuj5VrzEu4YZUVxr-ZqFU4VGJpjyHimMJug23EC7j=sQ@mail.gmail.com>
 <20160912120938.GR10153@twins.programming.kicks-ass.net> <CAMpxmJW5WNF2zE+fjmpDxubAYA_A67iQhNGTvSAL-MD-6dFTCw@mail.gmail.com>
 <20160912153356.GD10121@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:33289 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbcIMM3Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2016 08:29:25 -0400
Received: by mail-oi0-f41.google.com with SMTP id y2so379299847oie.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2016 05:29:25 -0700 (PDT)
In-Reply-To: <20160912153356.GD10121@twins.programming.kicks-ass.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>

On Mon, Sep 12, 2016 at 5:33 PM, Peter Zijlstra <peterz@infradead.org> wrote:
> On Mon, Sep 12, 2016 at 05:16:14PM +0200, Bartosz Golaszewski wrote:

>> AFAIK there is no clean way to tell that a GPIO is used by an I2C
>> multiplexer at probe time. Linus, Alexandre could you confirm?

Nominally, the GPIO descriptors are just abstract resources such
as regulators or clocks, they can be used for a lot but just like
a clock, regulator, dma channel etc does not know who is using
it and for what, it does not know this, no.

> You cannot inspect the device tree while probing?

Of course it *can* but we would end up encoding a special
case every time something like this happens, tied to just
device tree, then another bolt-on for ACPI etc.

I have a hard time following the problem really, I'm
afraid I'm simply just not smart enough :(

Yours,
Linus Walleij
