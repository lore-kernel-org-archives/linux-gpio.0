From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Question about non-boolean gpio sysfs values
Date: Wed, 5 Feb 2014 14:06:26 +0100
Message-ID: <CACRpkdaEMYmPx+qM-dcAW7QDwV8FpvRrYgGdZoA-uN4aMnr_fQ@mail.gmail.com>
References: <52ED84A5.3050102@contactless.ru>
	<CAAVeFuLX5Bynin71fRGgThR36kCHszNupx+XJzc+7Kwnoihijw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:36711 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbaBENG0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Feb 2014 08:06:26 -0500
Received: by mail-ob0-f169.google.com with SMTP id wo20so367937obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Feb 2014 05:06:26 -0800 (PST)
In-Reply-To: <CAAVeFuLX5Bynin71fRGgThR36kCHszNupx+XJzc+7Kwnoihijw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Evgeny Boger <boger@contactless.ru>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Feb 5, 2014 at 2:54 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Sun, Feb 2, 2014 at 8:35 AM, Evgeny Boger <boger@contactless.ru> wrote:
>> Hello,
>>
>> I'm now getting non-boolean values from gpio sysfs interface on 3.13, like
>> this

You didn't get this before?

> This seems wrong to me, a GPIO should always be 0 or 1.

Yup.

> As it turns out, bgpio_get() does the following:
>
>     return bgc->read_reg(bgc->reg_dat) & bgc->pin2mask(bgc, gpio);

OK lemme patch this.

> But I suppose it would also be nice to make
> gpiod_get_value*() more consistent so the whole subsystem gets fixed
> in one shot (I suspect a few other drivers are doing the same). I
> mean, we never expect a GPIO to be something else than 0 or 1, do we?

We can clamp the returned value in gpiod_get_value() for sure.

Maybe we should even print a warning there if the driver returns
anything other that 0,1.

Maybe we should even retype the function to a bool, atleast in
the driver-facing API.

Yours,
Linus Walleij
