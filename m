From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sirf: atlas7: fix of_irq_get() error check
Date: Mon, 7 Aug 2017 11:07:22 +0200
Message-ID: <CACRpkdbftXpS2W+=nBZnfmskjM30f5W0xxChBsCteAm5hy1fsw@mail.gmail.com>
References: <20170730193855.099325987@cogentembedded.com> <CACRpkdbW2efOy+qH+JPHYnbaUHkf2eqcWGm66C9a1K+uj_QNdA@mail.gmail.com>
 <5ce7636a-e839-7aab-ce33-7c1e57437d8a@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:35655 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752331AbdHGJHX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 05:07:23 -0400
Received: by mail-io0-f172.google.com with SMTP id m88so671016iod.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 02:07:23 -0700 (PDT)
In-Reply-To: <5ce7636a-e839-7aab-ce33-7c1e57437d8a@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Aug 4, 2017 at 6:58 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 08/04/2017 12:31 AM, Linus Walleij wrote:
>
>>> of_irq_get() may return  any negative error number as well as 0 on
>>> failure,
>>> while the driver only checks for -EPROBE_DEFER, blithely continuing with
>>> the call to gpiochip_set_chained_irqchip() -- that function expects the
>>> parent IRQ as *unsigned int*, so would probably do nothing  when a large
>>> IRQ number resulting from a conversion of a negative error number is
>>> passed
>>> to it, however passing 0 would probably work but the driver won't receive
>>> valid GPIO bank interrupts.
>>>
>>> Check for 'ret <= 0' instead and return -ENXIO from the driver's probe
>>> iff
>>> of_irq_get() returned 0.
>>>
>>> Fixes: f9367793293d ("pinctrl: sirf: add sirf atlas7 pinctrl and gpio
>>> support")
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>>
>> Patch applied!
>
>
>   Thanks! But to which branch? I'm not seeing it in linux-pinctrl.git...

devel.

It seems the SiRF people are not using upstream (see other mails) so I do
not see we need to expediate it to fixes.

Yours,
Linus Walleij
