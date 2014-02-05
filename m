From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Question about non-boolean gpio sysfs values
Date: Wed, 5 Feb 2014 22:24:50 +0900
Message-ID: <CAAVeFuL2=jqz6hnOJ4E8mLk3Ucnxvsr1y9yNk0-VgKCs_vYBeQ@mail.gmail.com>
References: <52ED84A5.3050102@contactless.ru> <CAAVeFuLX5Bynin71fRGgThR36kCHszNupx+XJzc+7Kwnoihijw@mail.gmail.com>
 <CACRpkdaEMYmPx+qM-dcAW7QDwV8FpvRrYgGdZoA-uN4aMnr_fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:58712 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775AbaBENZL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 08:25:11 -0500
Received: by mail-vc0-f176.google.com with SMTP id la4so267427vcb.7
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 05:25:10 -0800 (PST)
In-Reply-To: <CACRpkdaEMYmPx+qM-dcAW7QDwV8FpvRrYgGdZoA-uN4aMnr_fQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Evgeny Boger <boger@contactless.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Feb 5, 2014 at 10:06 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Feb 5, 2014 at 2:54 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Sun, Feb 2, 2014 at 8:35 AM, Evgeny Boger <boger@contactless.ru> wrote:
>>> Hello,
>>>
>>> I'm now getting non-boolean values from gpio sysfs interface on 3.13, like
>>> this
>
> You didn't get this before?
>
>> This seems wrong to me, a GPIO should always be 0 or 1.
>
> Yup.
>
>> As it turns out, bgpio_get() does the following:
>>
>>     return bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio);
>
> OK lemme patch this.
>
>> But I suppose it would also be nice to make
>> gpiod_get_value*() more consistent so the whole subsystem gets fixed
>> in one shot (I suspect a few other drivers are doing the same). I
>> mean, we never expect a GPIO to be something else than 0 or 1, do we?
>
> We can clamp the returned value in gpiod_get_value() for sure.
>
> Maybe we should even print a warning there if the driver returns
> anything other that 0,1.
>
> Maybe we should even retype the function to a bool, atleast in
> the driver-facing API.

Agree with the bool retyping, and while we are at it let's also change
the driver function's prototype. That's probably the shortest way to
fix this (yay to implicit type conversion!) and to make sure this
problem isn't reintroduced in the future.

Shall I make a patch for this? It will change every driver around, but
shouldn't be too intrusive.

Alex.
