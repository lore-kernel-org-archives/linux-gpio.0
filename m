From: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 3/4] gpio: make handler_data configurable while using gpiolib_irqchip
Date: Thu, 24 Apr 2014 07:23:15 +0800
Message-ID: <CAGsJ_4y4H63KxJLF1hKaBwHVYb2b_2wTzjO_kGhKUOzScYpKqA@mail.gmail.com>
References: <1397544229-20545-1-git-send-email-21cnbao@gmail.com>
 <1397544229-20545-4-git-send-email-21cnbao@gmail.com> <CACRpkdb8rmMDXS1kfcq7wgOnG2XsPm_bxb15z9_9d3E+trBfQA@mail.gmail.com>
 <CAGsJ_4wmd-ejfHF+MXbO3JSppUDYcEVKeO1WxRM16FtSFEBxpA@mail.gmail.com> <CACRpkdYcbngMDPRnuQjPHwo-USHdtK26T_6VM=PFnkT71Dg8Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:42561 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996AbaDWXXg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 19:23:36 -0400
Received: by mail-pb0-f52.google.com with SMTP id rq2so1271650pbb.25
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 16:23:36 -0700 (PDT)
In-Reply-To: <CACRpkdYcbngMDPRnuQjPHwo-USHdtK26T_6VM=PFnkT71Dg8Ng@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>, Barry Song <Baohua.Song@csr.com>

2014-04-24 7:09 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Thu, Apr 24, 2014 at 12:55 AM, Barry Song <21cnbao@gmail.com> wrote:
>
>>> NAK, the whole idea with the function gpiochip_set_chained_irqchip()
>>> is that its sets things up so that the gpiochip is passed as handler
>>> data on the parent IRQ, akin to how the gpiochip is passed as
>>> chip data on the cascaded IRQs.
>>
>> i think it is a really bad idea as the parent handler might not want
>> the whole chip if the chip has several parents and each parent want a
>> separate handler_data.
>> this patch doesn't break your way as the parameter is void *, drivers
>> which use your way don't need any change. but for drivers which want
>> more special handler_data, it supports better.
>
> This is perfectly possible, just don't use
> gpiochip_set_chained_irqchip() which has this semantic
> effect.
>
> Use irq_set_chained_handler() and irq_set_handler_data()
> directly instead.
>
> I do see that this is maybe easier for the handler to get the bank
> passed in.
>
> However when I in the RFT patches change the driver to allocate
> and pass a struct for the gpio chip, it all looks a bit different.
> You would have to get the sgpio from the bank instead, which
> may require to introduce a special pointer for that.
>
> What we want to get rid of is this:
>
> for (i = 0; i < SIRFSOC_GPIO_BANK_SIZE; i++) {
>                 bank = &sgpio->sgpio_bank[i];
>                 if (bank->parent_irq == irq)
>                         break;
> }
> BUG_ON (i == SIRFSOC_GPIO_BANK_SIZE);
>
> So what about passing something like that to the handler:
>
> struct sirf_irq_handler_data {
>     struct sirfsoc_gpio_chip *sgpio;
>     struct sirfsoc_gpio_bank *bank;
> };
>
> Then the irq handler instantly have pointers to all it needs.
> But maybe it's better to just pass the bank, whatdoIknow.

only if we move to irq_set_chained_handler() and
irq_set_handler_data() directly and set bank-specific handler_data
manually, it works.
my point is that will we make the gpiochip_set_chained_irqchip() more
general for this kind of cases too since you have had a good API to
wrap things?

>
> Yours,
> Linus Walleij

-barry
