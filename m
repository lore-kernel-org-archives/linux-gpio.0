From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Do not add all GPIOs to IRQ domain
Date: Wed, 11 Jan 2017 14:12:39 +0100
Message-ID: <CACRpkdbseM1jnEBgAo853cNi8icCML7h81K16hHMfhk=9JsZ-w@mail.gmail.com>
References: <20170110201139.129737-1-andriy.shevchenko@linux.intel.com> <20170111102710.GO2330@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:34434 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937794AbdAKNMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 08:12:40 -0500
Received: by mail-qk0-f175.google.com with SMTP id a20so208602221qkc.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 05:12:40 -0800 (PST)
In-Reply-To: <20170111102710.GO2330@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Robert R . Howell" <rhowell@uwyo.edu>

On Wed, Jan 11, 2017 at 11:27 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Jan 10, 2017 at 10:11:38PM +0200, Andy Shevchenko wrote:
>> It turns out that for some GPIO pins interrupts are bypassing standard
>> chain.
>>
>> Now the reason why some events such as touchscreen communication on ASuS
>> T100TA does not work if we mask all the interrupts is that in order to
>> generate either interrupts or GPEs the INTMASK register must have that
>> particular interrupt unmasked. In case of GPEs the CPU does not trigger
>> normal interrupt (and thus the GPIO driver does not see it) but instead
>> it causes SCI (System Control Interrupt) to be triggered with the GPE in
>> question set.
>>
>> To make this all work as expected we add those GPIOs to the IRQ
>> domain that can actually generate interrupts and skip others.
>
> Actually what happens is that when DIRECT_IRQ_EN is set, the pin is
> routed directly to the IO-APIC bypassing the GPIO driver completely.
> However, the mask register is still used to determine if the pin is
> supposed to generate IRQ or not.
>
> So with commit 3ae02c14d964 the IRQ core masks all IRQs (because of
> handle_bad_irq()) the pin connected to the touchscreen gets masked as
> well and hence no interrupts.
>
> This has nothing to do with GPEs, though.
>
> The fix itself looks good to me.

So I guess I wait for a commit with updates commit message
and then apply that for fixes?

Yours,
Linus Walleij
