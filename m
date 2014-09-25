From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib:change to use irq_alloc_descs_from to alloc virqs
Date: Thu, 25 Sep 2014 15:18:16 +0200
Message-ID: <CACRpkdawGzikHPR30ZCSH4+=gZNsOwr8EhEFXswDwOPUWn9h1g@mail.gmail.com>
References: <35FD53F367049845BC99AC72306C23D103CDBFBFB017@CNBJMBX05.corpusers.net>
	<CACRpkdbmnPcDFHu6oLhXQERyFzXD2K1QHH1hRUtci41KuEDdtQ@mail.gmail.com>
	<35FD53F367049845BC99AC72306C23D103D6DB4D6F29@CNBJMBX05.corpusers.net>
	<54216EA5.5010506@ti.com>
	<CACRpkdaM-1btosNFGMJy_U4F6rQfiG7sQXyyM0gyQ6OhC=_c8Q@mail.gmail.com>
	<35FD53F367049845BC99AC72306C23D103D6DB491636@CNBJMBX05.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:38778 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751641AbaIYNSQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Sep 2014 09:18:16 -0400
Received: by mail-ie0-f169.google.com with SMTP id rp18so11735708iec.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Sep 2014 06:18:16 -0700 (PDT)
In-Reply-To: <35FD53F367049845BC99AC72306C23D103D6DB491636@CNBJMBX05.corpusers.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Wang, Yalin" <Yalin.Wang@sonymobile.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>

On Thu, Sep 25, 2014 at 9:47 AM, Wang, Yalin <Yalin.Wang@sonymobile.com> wrote:
>> From: Linus Walleij [mailto:linus.walleij@linaro.org]
>>
>> On Tue, Sep 23, 2014 at 2:59 PM, Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>
>> > Now the "irq_base" is used only twice in gpiolib code and below diff
>> > should allow to drop it completely from gpiolib code.
>> >
>> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c index
>> > 15cc0bb..81762ed 100644
>> > --- a/drivers/gpio/gpiolib.c
>> > +++ b/drivers/gpio/gpiolib.c
>> > @@ -524,7 +524,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip
>> *gpiochip)
>> >         /* Remove all IRQ mappings and delete the domain */
>> >         if (gpiochip->irqdomain) {
>> >                 for (offset = 0; offset < gpiochip->ngpio; offset++)
>> > -                       irq_dispose_mapping(gpiochip->irq_base + offset);
>> > +
>> > + irq_dispose_mapping(irq_find_mapping(gpiochip->irqdomain, offset));
>> >                 irq_domain_remove(gpiochip->irqdomain);
>> >         }
>> >
>> > not tested.
>>
>> I like the looks of this.
>>
>> Grygorii, can you send a proper, tested patch for this? Thansk!
>
> Could we also remove gpiochip->irq_base if use this solution?
> It seems gpiochip->irq_base is useless .

I think it is used in some drivers and especially for pin ranges
visavis the pin control subsystem, so that could be a complex
operation.

Yours,
Linus Walleij
