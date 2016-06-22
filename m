From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: convince line to become input in irq helper
Date: Wed, 22 Jun 2016 23:23:18 +0200
Message-ID: <CACRpkda3MH7R2HT8ZuagLAiQu7SF2eqFeG8PXfCV5Dz3xFvjSg@mail.gmail.com>
References: <1466606015-16326-1-git-send-email-linus.walleij@linaro.org> <20160622171227.GQ1256@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34394 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751432AbcFVVXU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2016 17:23:20 -0400
Received: by mail-oi0-f48.google.com with SMTP id s66so41858743oif.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2016 14:23:19 -0700 (PDT)
In-Reply-To: <20160622171227.GQ1256@tuxbot>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

On Wed, Jun 22, 2016 at 7:12 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 22 Jun 07:33 PDT 2016, Linus Walleij wrote:
>
>> The generic IRQ helper library just checks if the IRQ line is
>> set as input before activating it for interrupts. As we
>> recently started to check things better with .get_dir() it
>> turns out that it's good to try to convince the line to become
>> an input before attempting to lock it as IRQ.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> I really like this.

Thanks :)

>> +     /*
>> +      * If it is possible to switch this GPIO to an input
>> +      * this is a good time to do it.
>> +      */
>> +     if (chip->direction_input) {
>> +             struct gpio_desc *desc;
>> +             int ret;
>> +
>> +             desc = gpiochip_get_desc(chip, d->hwirq);
>> +             if (IS_ERR(desc))
>> +                     return PTR_ERR(desc);
>> +
>> +             ret = chip->direction_input(chip, d->hwirq);
>> +             if (!ret)
>> +                     clear_bit(FLAG_IS_OUT, &desc->flags);
>
> With this updated semantics I think it's a mistake to not propagate this
> error. Clients will not be able to rely on it and have to continue
> configuring their pins as input just to be sure.

OK good point I'll propagate it. But it will only be used by those
driver utilizing the generic IRQchip helper.

It's especially for the usecase where you take an IRQ off a DT
resource without gpiod_to_irq() first.

Yours,
Linus Walleij
