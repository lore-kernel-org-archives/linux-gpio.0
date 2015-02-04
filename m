From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Re: [PATCH] gpio: mmp: add GPIO driver for Marvell MMP series
Date: Wed, 4 Feb 2015 09:24:13 +0100
Message-ID: <CACRpkdbOws5a8uBe+yf8d5wvF3_Ym-5xehjyW9YKnVSUw7gOGg@mail.gmail.com>
References: <1422412229-23640-1-git-send-email-chao.xie@marvell.com>
	<CACRpkdbUqCQZiSDbiD994ecF4h6xHShE8yfdrE2vNVNW+082zw@mail.gmail.com>
	<17285839.2a29.14b5259f780.Coremail.xiechao_mail@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:36159 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754253AbbBDIYO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Feb 2015 03:24:14 -0500
Received: by mail-oi0-f52.google.com with SMTP id h136so166287oig.11
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2015 00:24:14 -0800 (PST)
In-Reply-To: <17285839.2a29.14b5259f780.Coremail.xiechao_mail@163.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chao Xie <xiechao_mail@163.com>
Cc: Chao Xie <chao.xie@marvell.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>

On Wed, Feb 4, 2015 at 3:10 AM, Chao Xie <xiechao_mail@163.com> wrote:
> At 2015-02-03 21:21:43, "Linus Walleij" <linus.walleij@linaro.org> wrote:

>>Since this looks like a basic MMIO driver I think
>>you should also use:
>>
>>select GPIO_GENERIC
>>
>
> I think the gpio-mmp is not same as gpio-generic.
> gpio-mmp need control the level/direction/rising edge detect enable/falling edge detect enable.
> For each of them, there are three registers: status register,  setting register and clear register.

This is quite common. Notice that GPIO_GENERIC does not require
you to use the library for *all* reading/writing of registers. Just those
that you select.

> For example, for direction, if you configure it as output.
> You need SET the bit in setting register.

The library function bgpio_dir_out first calls gc->set()
(which may also be a generic implementation) and then
sets the direction bit.

This is the nominal behaviour.

> If you want to configure it as input
> You need SET the bit in clear register.

OK this is different from the default implementation so
override the dirin function to get the right behaviour.
You may still use the library for everything else.

> It is same for level/rising edege detect enable/falling edge detect enable.

irqchip is completely orthogonal and implemented
separately in the struct irq_chip callbacks.

> If you want to read the status of the pin. For example, the current level of the pin.
> You CAN NOT read the setting/clear register. You need read
> the level status register.

That's cool. You pass a separate register for reading.
Check how it actually works.

>>> +#define mmp_gpio_to_bank_idx(gpio)     ((gpio) >> BANK_GPIO_ORDER)
>>> +#define mmp_gpio_to_bank_offset(gpio)  ((gpio) & BANK_GPIO_MASK)
>>> +#define mmp_bank_to_gpio(idx, offset)  (((idx) << BANK_GPIO_ORDER)     \
>>> +                                               | ((offset) & BANK_GPIO_MASK))
>>
>>This looks convoluted. Why not just register each bank as a separate
>>device instead of trying to figure out bank index like this?
>>
>
> There are the following reasons
> 1. There is only one IRQ for the whole GPIO, even there are 3 or more banks.
> 2. The registers are not formatted into group. They are interleaved.
>     For example, there are three banks, So for the registers order are
>     LEVEL_STATUS_BANK0, LEVEL_STASTUS_BANK1, LEVEL_STATUS_BANK2
>     DIRECTION_STATUS_BANK0, DIRECTION_STATUS_BANK1, DIRECTION_STATUS_BANK2
> 3. each bank has 32 bits. Formatting them into one driver will make other driver easier.
>     For example, the MMC driver has GPIO detection for card. So it knows the GPIO is GPIO56.
>     In the device tree of MMC driver, you can simple add as
>     cd-gpios = <&gpio 56 X>
>     if you format them into different devices, the mmc driver owner need to know how much bits a bank is, and calculate out correct GPIOx and offset
>     cd-gpios = <&gpio1 24 X>

OK I buy this, atleast points 1 & 2.

I think you can still use GPIOLIB_IRQCHIP though,
since it's just one linear array of GPIO numbers.

Yours,
Linus Walleij
