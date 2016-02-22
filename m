From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: add userspace ABI for GPIO line information
Date: Mon, 22 Feb 2016 13:25:00 +0100
Message-ID: <CACRpkdYRfo5mOBjXN586=C1_Xs14SysbgMMy=MWWyqA0J5D6zA@mail.gmail.com>
References: <1455542435-3182-1-git-send-email-linus.walleij@linaro.org>
	<2514414.NA40e3BBdd@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36236 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754787AbcBVMZB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2016 07:25:01 -0500
Received: by mail-ob0-f180.google.com with SMTP id gc3so161799197obb.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 Feb 2016 04:25:00 -0800 (PST)
In-Reply-To: <2514414.NA40e3BBdd@adelgunde>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>

On Mon, Feb 22, 2016 at 1:05 PM, Markus Pargmann <mpa@pengutronix.de> wrote:

>> +             /*
>> +              * Userspace only need to know that the kernel is using
>> +              * this GPIO so it can't use it.
>> +              */
>> +             lineinfo.flags = 0;
>> +             if (desc->flags & (FLAG_REQUESTED | FLAG_IS_HOGGED |
>> +                                FLAG_USED_AS_IRQ | FLAG_EXPORT |
>> +                                FLAG_SYSFS))
>> +                     lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
>> +             if (desc->flags & FLAG_IS_OUT)
>> +                     lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
>> +             if (desc->flags & FLAG_ACTIVE_LOW)
>> +                     lineinfo.flags |= GPIOLINE_FLAG_ACTIVE_LOW;
>> +             if (desc->flags & FLAG_OPEN_DRAIN)
>> +                     lineinfo.flags |= GPIOLINE_FLAG_OPEN_DRAIN;
>> +             if (desc->flags & FLAG_OPEN_SOURCE)
>> +                     lineinfo.flags |= GPIOLINE_FLAG_OPEN_SOURCE;
>
> I just noticed while working on DT name parsing that these flags are bit
> numbers and not the real bits. So we have to use test_bit() here. I will
> send a patch later.

Ooops don't worry I will fix it and send a v3. If there are no
further comments I will then  APPLY it so we have this in
place for v4.6.

Yours,
Linus Walleij
