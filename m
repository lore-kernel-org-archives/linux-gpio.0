From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [RFC/RFT PATCH 2/2] gpiolib: irqchip: get rid of irq_base
Date: Fri, 26 Sep 2014 13:44:44 +0300
Message-ID: <5425439C.7010506@ti.com>
References: <1411661364-19620-1-git-send-email-grygorii.strashko@ti.com>	<1411661364-19620-2-git-send-email-grygorii.strashko@ti.com> <CACRpkdZSOhNTV5eKB10-=1F-pWOkUmUyo1p04bD+bUW2GK54OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:42762 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752464AbaIZKox (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Sep 2014 06:44:53 -0400
In-Reply-To: <CACRpkdZSOhNTV5eKB10-=1F-pWOkUmUyo1p04bD+bUW2GK54OA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "Wang, Yalin" <Yalin.Wang@sonymobile.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 09/26/2014 11:44 AM, Linus Walleij wrote:
> On Thu, Sep 25, 2014 at 6:09 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>
>> Remove irq_base from struct gpio_chip, as it is seems to
>> be unused.
>> Aslo, using this field by drivers is unsafe because it's
>> uncompatible with Sparse IRQ feature.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>> Hi Linus,
>>
>> I've not found users of this field in drivers/gpio/ folder,
>> so I've decided to created this patch to get more comments.
>
> Wut?
>
> git grep '>irq_base'
> (...)
> drivers/gpio/gpio-max732x.c:    return chip->irq_base + off;
^struct max732x_chip *chip;

> drivers/gpio/gpio-ml-ioh.c:     return chip->irq_base + offset;
^struct ioh_gpio *chip

> drivers/gpio/gpio-pch.c:        chip->irq_base = irq_base;
^struct pch_gpio *chip

> etc etc

etc ;)

I've spent some time checking it, but it's possible
that I missed smth or it's used outside gpio directory.

Best regards,
-grygorii
