From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Subject: Re: [RFC 09/18] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Tue, 21 Oct 2014 12:59:15 +0400
Message-ID: <CAHNKnsThQb8zstGhRJjFFJx6eKtFd-NZuK9wND-Puex2OCY=Hw@mail.gmail.com>
References: <1410723213-22440-1-git-send-email-ryazanov.s.a@gmail.com>
 <1410723213-22440-10-git-send-email-ryazanov.s.a@gmail.com>
 <CACRpkda3Cq+d47DMm018nAC7ThcHAOv-tOqEbNsUY1mOSnKyoA@mail.gmail.com>
 <CAHNKnsSj-=0aFHD574yRW9BpH1ONhy7K0NA8xri2ez6ab_MPMA@mail.gmail.com> <CACRpkda7XffyCvsG7CAMwF0qDW9bJ_m+xxFhhMAqd_r=O4B8+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f44.google.com ([209.85.213.44]:57447 "EHLO
	mail-yh0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753466AbaJUI7f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Oct 2014 04:59:35 -0400
Received: by mail-yh0-f44.google.com with SMTP id i57so1041717yha.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2014 01:59:35 -0700 (PDT)
In-Reply-To: <CACRpkda7XffyCvsG7CAMwF0qDW9bJ_m+xxFhhMAqd_r=O4B8+g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2014-10-21 12:29 GMT+04:00 Linus Walleij <linus.walleij@linaro.org>:
> On Mon, Sep 29, 2014 at 10:43 PM, Sergey Ryazanov
> <ryazanov.s.a@gmail.com> wrote:
>> 2014-09-29 13:18 GMT+04:00 Linus Walleij <linus.walleij@linaro.org>:
>
>>>> +static u32 ar2315_gpio_intmask;
>>>> +static u32 ar2315_gpio_intval;
>>>> +static unsigned ar2315_gpio_irq_base;
>>>> +static void __iomem *ar2315_mem;
>>>
>>> Get rid of these local variables and put them into an allocated
>>> state container, see
>>> Documentation/driver-model/design-patterns.txt
>>>
>> AR2315 SoC contains only one GPIO unit, so there are no reasons to
>> increase driver complexity. But if you insist, I will add state
>> container.
>
> I insist. It makes the driver easier to maintain if it looks like
> most other drivers instead of using static locals.
>
No problem. I rewrite the driver using the state container.

>>> Convoluted, I would use an if() else construct rather than the ? operator.
>>>
>> Convoluted, but 3 lines shorter :) And checkpatch has no objections.
>
> True but it's me who is going to be maintaining this, not checkpatch.
>
I missed that. Added to my todo list.

BTW, the use of the irq_domain framework is required or I could
opencode some stuff?

> Yours,
> Linus Walleij

-- 
BR,
Sergey
