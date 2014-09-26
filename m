From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: set parent irq on chained handlers
Date: Fri, 26 Sep 2014 14:37:11 +0200
Message-ID: <CACRpkdYkK_kQ+mwMedjabjvvjOB0u-FSLTjPnjRxCnZ1oNaeMg@mail.gmail.com>
References: <1411732349-19178-1-git-send-email-linus.walleij@linaro.org>
	<54255A07.9060708@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f177.google.com ([209.85.223.177]:48285 "EHLO
	mail-ie0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753707AbaIZMhM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Sep 2014 08:37:12 -0400
Received: by mail-ie0-f177.google.com with SMTP id x19so15438514ier.22
        for <linux-gpio@vger.kernel.org>; Fri, 26 Sep 2014 05:37:11 -0700 (PDT)
In-Reply-To: <54255A07.9060708@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Fri, Sep 26, 2014 at 2:20 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 09/26/2014 02:52 PM, Linus Walleij wrote:
>> If the IRQ from the parent is nested the IRQ may need to be
>> resent under certain conditions. Currently the chained IRQ
>> handler in gpiolib does not handle connecting nested IRQs
>
> Seems there is still some misunderstanding ( - chained vs nested IRQs

Yeah trying to hash it out...

>> but it is conceptually correct to indicate the actual parent
>> IRQ.
>>
>> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
>
> + Reported-by: Lothar Wa=C3=9Fmann <LW@karo-electronics.de>

OK.

>>       if (gpiochip->can_sleep) {
>>               chip_err(gpiochip, "you cannot have chained interrupts=
 on a chip that may sleep\n");
>>               return;
>>       }
>
>
> This function can't be called by gpio-pca953x.c driver  (

Yeah I'm toying around with solutions for this...

> May be some simple helper can be added instead:
>  void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
>                                   int parent_irq)

That's one option. I'm trying to come up with something that
duplicates as little code as possible.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
