From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v2] gpio: em: depnd on ARCH_SHMOBILE
Date: Thu, 24 Nov 2016 15:59:09 +0000
Message-ID: <CALeDE9ONU-d_jih6TxuT8_g-aKmKk+fvOmHHLExm2N3aX7Uxog@mail.gmail.com>
References: <20161120174836.1787-1-pbrobinson@gmail.com> <CAMuHMdWKcfOb6v0GQrcAadhPeM1d8M_EmNicZqpO0+2VfeoBog@mail.gmail.com>
 <CACRpkdZBfZBiJm2XLo+vw8r8CO7EBv4=jARvpe_f4bfDHbhDBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34782 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965905AbcKXP7M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2016 10:59:12 -0500
In-Reply-To: <CACRpkdZBfZBiJm2XLo+vw8r8CO7EBv4=jARvpe_f4bfDHbhDBQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Thu, Nov 24, 2016 at 3:19 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 24, 2016 at 10:38 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Sun, Nov 20, 2016 at 6:48 PM, Peter Robinson <pbrobinson@gmail.com> wrote:
>>> The GPIO_EM is part of the Renesas SoCs so depend on the arch.
>
>>>  config GPIO_EM
>>>         tristate "Emma Mobile GPIO"
>>> -       depends on ARM && OF_GPIO
>>> +       depends on (ARCH_SHMOBILE || COMPILE_TEST) && OF_GPIO
>>
>> For ARM SoCs, ARCH_SHMOBILE is being phased out in favor of ARCH_RENESAS.
>> Note that ARCH_SHMOBILE is also set for some SuperH SoCs.
>>
>> However, ARCH_EMEV2 is even more suitable here.
>
> I fixed the patch in-tree to use ARCH_EMEV2 instead.

Awesome, thanks, I was going to do a follow up patch.

Peter
