From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] mmc: core: restore detect line inversion semantics
Date: Wed, 1 Oct 2014 10:22:59 +0200
Message-ID: <CABxcv=kmryUgM-FR97nTHqiB9k-=VGNBcWhcH06h0p8ytxBCLg@mail.gmail.com>
References: <1412085943-16872-1-git-send-email-linus.walleij@linaro.org>
	<CABxcv=n-+H3wrAr_vzEsXK_vOwQc8520wM=LJhzw70ZoSbJ_Ew@mail.gmail.com>
	<CACRpkdZPPZfF9cG-sCSG3agdkE8ToPTGi4yQ5jW2Ab60PW_t2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:38305 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751119AbaJAIXA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Oct 2014 04:23:00 -0400
Received: by mail-wg0-f51.google.com with SMTP id l18so479277wgh.10
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2014 01:22:59 -0700 (PDT)
In-Reply-To: <CACRpkdZPPZfF9cG-sCSG3agdkE8ToPTGi4yQ5jW2Ab60PW_t2Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Chris Ball <cjb@laptop.org>, Ulf Hansson <ulf.hansson@linaro.org>, Linux GPIO List <linux-gpio@vger.kernel.org>

Hello Linus,

On Wed, Oct 1, 2014 at 9:54 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Sep 30, 2014 at 5:07 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
>>>
>>> +       *gpio_invert = gpiod_is_active_low(desc);
>>> +
>>
>> The old code set gpio_inv_cd if (!(flags & OF_GPIO_ACTIVE_LOW)) so the
>> above should be:
>>
>> *gpio_invert = !gpiod_is_active_low(desc);
>
> Argh, done it like this in v2, but isn't that variable name a lie then?
> If it's active low then it's inverted, but if it's not active low it's not
> inverted right...
>

Right, the logic is confusing at the very least. I'm not familiar with
this code though, I just was bitten by this issue :-)

> Sigh, atleast we have restored the semantics, but maybe we need
> to comb over this again.
>

Agreed.

For completeness I just tested v2 of your patch and it makes the card
detection work again. Thanks a lot for all your help!

> Yours,
> Linus Walleij

Best regards,
Javier
