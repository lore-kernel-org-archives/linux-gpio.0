From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 09/18] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Tue, 21 Oct 2014 10:29:27 +0200
Message-ID: <CACRpkda7XffyCvsG7CAMwF0qDW9bJ_m+xxFhhMAqd_r=O4B8+g@mail.gmail.com>
References: <1410723213-22440-1-git-send-email-ryazanov.s.a@gmail.com>
	<1410723213-22440-10-git-send-email-ryazanov.s.a@gmail.com>
	<CACRpkda3Cq+d47DMm018nAC7ThcHAOv-tOqEbNsUY1mOSnKyoA@mail.gmail.com>
	<CAHNKnsSj-=0aFHD574yRW9BpH1ONhy7K0NA8xri2ez6ab_MPMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f175.google.com ([209.85.213.175]:46942 "EHLO
	mail-ig0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507AbaJUI32 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Oct 2014 04:29:28 -0400
Received: by mail-ig0-f175.google.com with SMTP id uq10so843242igb.14
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2014 01:29:27 -0700 (PDT)
In-Reply-To: <CAHNKnsSj-=0aFHD574yRW9BpH1ONhy7K0NA8xri2ez6ab_MPMA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Sep 29, 2014 at 10:43 PM, Sergey Ryazanov
<ryazanov.s.a@gmail.com> wrote:
> 2014-09-29 13:18 GMT+04:00 Linus Walleij <linus.walleij@linaro.org>:

>>> +static u32 ar2315_gpio_intmask;
>>> +static u32 ar2315_gpio_intval;
>>> +static unsigned ar2315_gpio_irq_base;
>>> +static void __iomem *ar2315_mem;
>>
>> Get rid of these local variables and put them into an allocated
>> state container, see
>> Documentation/driver-model/design-patterns.txt
>>
> AR2315 SoC contains only one GPIO unit, so there are no reasons to
> increase driver complexity. But if you insist, I will add state
> container.

I insist. It makes the driver easier to maintain if it looks like
most other drivers instead of using static locals.

>> Convoluted, I would use an if() else construct rather than the ? operator.
>>
> Convoluted, but 3 lines shorter :) And checkpatch has no objections.

True but it's me who is going to be maintaining this, not checkpatch.

Yours,
Linus Walleij
