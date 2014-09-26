From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC/RFT PATCH 2/2] gpiolib: irqchip: get rid of irq_base
Date: Fri, 26 Sep 2014 14:33:55 +0200
Message-ID: <CACRpkdaG6d4Cvkjreo3EKfJF_p-yQ38T-cLLjnnQOCztw1DSFg@mail.gmail.com>
References: <1411661364-19620-1-git-send-email-grygorii.strashko@ti.com>
	<1411661364-19620-2-git-send-email-grygorii.strashko@ti.com>
	<CACRpkdZSOhNTV5eKB10-=1F-pWOkUmUyo1p04bD+bUW2GK54OA@mail.gmail.com>
	<5425439C.7010506@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:46243 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753707AbaIZMd4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Sep 2014 08:33:56 -0400
Received: by mail-ie0-f170.google.com with SMTP id x19so12727745ier.29
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2014 05:33:56 -0700 (PDT)
In-Reply-To: <5425439C.7010506@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Wang, Yalin" <Yalin.Wang@sonymobile.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Sep 26, 2014 at 12:44 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 09/26/2014 11:44 AM, Linus Walleij wrote:
>>
>> On Thu, Sep 25, 2014 at 6:09 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>
>>> Remove irq_base from struct gpio_chip, as it is seems to
>>> be unused.
>>> Aslo, using this field by drivers is unsafe because it's
>>> uncompatible with Sparse IRQ feature.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>> ---
>>> Hi Linus,
>>>
>>> I've not found users of this field in drivers/gpio/ folder,
>>> so I've decided to created this patch to get more comments.
>>
>>
>> Wut?
>>
>> git grep '>irq_base'
>> (...)
>> drivers/gpio/gpio-max732x.c:    return chip->irq_base + off;
>
> ^struct max732x_chip *chip;
>
>> drivers/gpio/gpio-ml-ioh.c:     return chip->irq_base + offset;
>
> ^struct ioh_gpio *chip
>
>> drivers/gpio/gpio-pch.c:        chip->irq_base = irq_base;
>
> ^struct pch_gpio *chip
>
>> etc etc
>
> etc ;)

Aha now the variable names are confusing me at no end too :-)

> I've spent some time checking it, but it's possible
> that I missed smth or it's used outside gpio directory.

It'd be good if we could estimate this, I'd prefer if we could do
some semantic grep like cocinelle does to see if the (foo)->irq_base
affects a case where (foo) is struct gpio_chip...

But I guess I can also just apply the patch and throw it at
the autobuilders. I'm just worried about cases the autobuilder
would miss.

Yours,
Linus Walleij
