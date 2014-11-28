From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] usb: phy: generic: migrate to gpio_desc
Date: Fri, 28 Nov 2014 11:37:47 +0100
Message-ID: <CACRpkdZtwYb77ytGiadFnZAUOkr8y_HPQoM3vmXBc+N6dszAJw@mail.gmail.com>
References: <1415535787-21868-1-git-send-email-robert.jarzmik@free.fr>
	<20141121154358.GF7508@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:48555 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750895AbaK1Khs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Nov 2014 05:37:48 -0500
Received: by mail-ig0-f176.google.com with SMTP id l13so10402833iga.9
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2014 02:37:47 -0800 (PST)
In-Reply-To: <20141121154358.GF7508@saruman>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 21, 2014 at 4:43 PM, Felipe Balbi <balbi@ti.com> wrote:
> On Sun, Nov 09, 2014 at 01:23:07PM +0100, Robert Jarzmik wrote:
>>
>> Change internal gpio handling from integer gpios into gpio
>> descriptors. This change only addresses the internal API and
>> device-tree/ACPI, while the legacy platform data remains integer space
>> based.
>>
>> This change is only build compile tested, and very prone to error. I
>> leave this comment for now in the commit message so that this patch gets
>> some testing as I'm pretty sure it's buggy.
>>
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> To my eyes, patch looks fine, but let's get a review from Linus W.
>
> Linus, can you have a look below ? Is this being used the way you
> intended ? BTW, we need support DT and pdata platforms here.

This definately make things better so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

One comment though:

>>       if (dev->of_node) {
(...)
>> +             nop->gpiod_reset = devm_gpiod_get(dev, "reset-gpios");
>> +             err = PTR_ERR(nop->gpiod_reset);
>>       } else if (pdata) {
(...)
>> +             err = devm_gpio_request_one(dev, pdata->gpio_reset, 0,
>> +                                         dev_name(dev));
>> +             if (!err)
>> +                     nop->gpiod_reset = gpio_to_desc(pdata->gpio_reset);
>> +     }

This construction implies that if we don't have a DT node, the
GPIO is passed as a fixed number in pdata->gpio_reset,
but it is actually possible to use descriptors in board files
by adding a fixed table.

So a next step would be to add support for getting the
devm_gpiod_get(dev, "reset-gpios"); outside of the if (dev->of_node)
clause, and possibly convert the board files for affected
platforms to use descriptors, if they will not be replaced by
device tree only.

I know this is a major work, so this patch is still a good start!
Using descriptors internally is always preferred.

Yours,
Linus Walleij
