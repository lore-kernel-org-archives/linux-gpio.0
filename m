From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: twl4030: Remove redundant assignment
Date: Thu, 27 Feb 2014 10:24:20 +0100
Message-ID: <CACRpkdbgr5_i2XCCeTDUw3SVsEJ4Q3BjHh++0BSSYSzkxPa8iA@mail.gmail.com>
References: <1392471277-16981-1-git-send-email-shc_work@mail.ru>
	<CACRpkdbfWhWj6CYJB96L3GS7HCuyL9DaBS5Lxgh424SYRHzp7A@mail.gmail.com>
	<530B6669.9080602@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f170.google.com ([209.85.220.170]:40021 "EHLO
	mail-vc0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750844AbaB0JYV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Feb 2014 04:24:21 -0500
Received: by mail-vc0-f170.google.com with SMTP id hu8so2267356vcb.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2014 01:24:20 -0800 (PST)
In-Reply-To: <530B6669.9080602@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>
Cc: Alexander Shiyan <shc_work@mail.ru>, Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Mon, Feb 24, 2014 at 4:34 PM, Roger Quadros <rogerq@ti.com> wrote:
> On 02/24/2014 04:25 PM, Linus Walleij wrote:
>> On Sat, Feb 15, 2014 at 2:34 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
>>
>>> -       status = twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
>>> -                                 TWL4030_LED_LEDEN_REG);
>>> +
>>> +       twl_i2c_write_u8(TWL4030_MODULE_LED, cached_leden,
>>> +                        TWL4030_LED_LEDEN_REG);
>>
>> Isn't the right fix to actually *check* this status instead?
>>
>> TI dudes?
>
> Yes we should check for error. But the only action we can take is maybe print an error message
> as all the users of this function return void. e.g. twl_set().
>
> It seems the set() hook of struct gpio_chip also doesn't expect any return value. Wondering if that should change.

I think in this case simply printing an error and bailing out is
just fine, people will be able to debug from there.

Yours,
Linus Walleij
