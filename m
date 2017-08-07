From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: sirf: atlas7: fix of_irq_get() error check
Date: Mon, 7 Aug 2017 12:53:27 +0300
Message-ID: <1810e3d5-792b-f108-0f1a-1d9bd24c0876@cogentembedded.com>
References: <20170730193855.099325987@cogentembedded.com>
 <CACRpkdbW2efOy+qH+JPHYnbaUHkf2eqcWGm66C9a1K+uj_QNdA@mail.gmail.com>
 <5ce7636a-e839-7aab-ce33-7c1e57437d8a@cogentembedded.com>
 <CACRpkdbftXpS2W+=nBZnfmskjM30f5W0xxChBsCteAm5hy1fsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36937 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752924AbdHGJxa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Aug 2017 05:53:30 -0400
Received: by mail-lf0-f43.google.com with SMTP id m86so27779513lfi.4
        for <linux-gpio@vger.kernel.org>; Mon, 07 Aug 2017 02:53:29 -0700 (PDT)
In-Reply-To: <CACRpkdbftXpS2W+=nBZnfmskjM30f5W0xxChBsCteAm5hy1fsw@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello!

On 8/7/2017 12:07 PM, Linus Walleij wrote:

>>>> of_irq_get() may return  any negative error number as well as 0 on
>>>> failure,
>>>> while the driver only checks for -EPROBE_DEFER, blithely continuing with
>>>> the call to gpiochip_set_chained_irqchip() -- that function expects the
>>>> parent IRQ as *unsigned int*, so would probably do nothing  when a large
>>>> IRQ number resulting from a conversion of a negative error number is
>>>> passed
>>>> to it, however passing 0 would probably work but the driver won't receive
>>>> valid GPIO bank interrupts.
>>>>
>>>> Check for 'ret <= 0' instead and return -ENXIO from the driver's probe
>>>> iff
>>>> of_irq_get() returned 0.
>>>>
>>>> Fixes: f9367793293d ("pinctrl: sirf: add sirf atlas7 pinctrl and gpio
>>>> support")
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>>
>>> Patch applied!
>>
>>
>>    Thanks! But to which branch? I'm not seeing it in linux-pinctrl.git...
> 
> devel.

    Still not seeing the patch, perhaps you forgot to push?

> It seems the SiRF people are not using upstream (see other mails) so I do
> not see we need to expediate it to fixes.

    Up to you.

> Yours,
> Linus Walleij

MBR, Sergei
