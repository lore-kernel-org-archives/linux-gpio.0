From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: UniPhier: add driver for UniPhier GPIO controller
Date: Thu, 16 Jul 2015 09:07:26 +0200
Message-ID: <CACRpkdZK41P-1JQsL6RiywqFEUj6=g5xJMKy86wDdp6BxLJNzQ@mail.gmail.com>
References: <1436841787-7734-1-git-send-email-yamada.masahiro@socionext.com>
	<CACRpkdYaAMw5U3pctf96j0QpY2Qf+e=LX740F0okCmVU6pXkhA@mail.gmail.com>
	<CAK7LNAQ+_ynWT944fPZsHCzMBLtfNu5AnppzaOxNgPSBTvj_tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35678 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752124AbbGPHH1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 03:07:27 -0400
Received: by oihq81 with SMTP id q81so44674258oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 00:07:26 -0700 (PDT)
In-Reply-To: <CAK7LNAQ+_ynWT944fPZsHCzMBLtfNu5AnppzaOxNgPSBTvj_tw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexandre Courbot <gnurou@gmail.com>

On Thu, Jul 16, 2015 at 5:44 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2015-07-15 23:15 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:

>>> +       for (i = 0; i < chip->ngpio; i += UNIPHIER_GPIO_PORTS_PER_BANK) {
>>> +               bank = i / UNIPHIER_GPIO_PORTS_PER_BANK;
>>> +               shift = i % BITS_PER_LONG;
>>> +               bank_mask = (mask[BIT_WORD(i)] >> shift) &
>>> +                                               UNIPHIER_GPIO_BANK_MASK;
>>> +               bank_bits = bits[BIT_WORD(i)] >> shift;
>>> +
>>> +               uniphier_gpio_bank_write(chip, bank, UNIPHIER_GPIO_REG_DATA,
>>> +                                        bank_mask, bank_bits);
>>> +       }
>>
>> This looks like a piece of algorithm that we could make generic like in a
>> static function in drivers/gpio/gpiolib.h or so, that it may be shared with
>> other drivers. Do you see some clear way to break out the core of this?
>> Or is it as generic as I think?
>
> I assume this comment has no intention to block my patch.

Nah. Just thinking the code looks neat.

>>> +       ret = of_property_read_u32(dev->of_node, "ngpio", &ngpio);
>>> +       if (ret) {
>>> +               dev_err(dev, "failed to get ngpio property\n");
>>> +               return ret;
>>> +       }
>>
>> This needs to be documented, plus I don't see why it's needed.
>> The driver for this very specific hardware should already know
>> how many GPIOs there are in this hardware, it should not come
>> from the device tree.
>
> I want to use this driver on various SoCs, but
> the number of GPIO pins varies by SoC.
>
> ngpio == 248 for some SoCs,
> and ngpio == 136 for some, etc.

That is the wrong way to handle different SoC. That should be handled
by different compatible strings, and then you select the number of GPIOs
for the version corresponding to that compatibe string.

>>> +static const struct of_device_id uniphier_gpio_match[] = {
>>> +       { .compatible = "socionext,uniphier-gpio" },
>>> +       { /* sentinel */ }
>>> +};

i.e. you should use the .data field of of_device_id to carry variant-specific
information.

Yours,
Linus Walleij
