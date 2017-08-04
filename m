From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: sirf: atlas7: fix of_irq_get() error check
Date: Fri, 4 Aug 2017 19:58:51 +0300
Message-ID: <5ce7636a-e839-7aab-ce33-7c1e57437d8a@cogentembedded.com>
References: <20170730193855.099325987@cogentembedded.com>
 <CACRpkdbW2efOy+qH+JPHYnbaUHkf2eqcWGm66C9a1K+uj_QNdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34217 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752433AbdHDQ6z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Aug 2017 12:58:55 -0400
Received: by mail-lf0-f53.google.com with SMTP id g25so9440543lfh.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Aug 2017 09:58:54 -0700 (PDT)
In-Reply-To: <CACRpkdbW2efOy+qH+JPHYnbaUHkf2eqcWGm66C9a1K+uj_QNdA@mail.gmail.com>
Content-Language: en-MW
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 08/04/2017 12:31 AM, Linus Walleij wrote:

>> of_irq_get() may return  any negative error number as well as 0 on failure,
>> while the driver only checks for -EPROBE_DEFER, blithely continuing with
>> the call to gpiochip_set_chained_irqchip() -- that function expects the
>> parent IRQ as *unsigned int*, so would probably do nothing  when a large
>> IRQ number resulting from a conversion of a negative error number is passed
>> to it, however passing 0 would probably work but the driver won't receive
>> valid GPIO bank interrupts.
>>
>> Check for 'ret <= 0' instead and return -ENXIO from the driver's probe iff
>> of_irq_get() returned 0.
>>
>> Fixes: f9367793293d ("pinctrl: sirf: add sirf atlas7 pinctrl and gpio support")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Patch applied!

   Thanks! But to which branch? I'm not seeing it in linux-pinctrl.git...

> Yours,
> Linus Walleij

MBR, Sergei
