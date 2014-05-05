From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Tue, 6 May 2014 01:46:23 +0900
Message-ID: <CAAVeFuLgm6seqG_rGkdRdkTwrRQHiQdOa_HK_5_8PBNbgPLv1A@mail.gmail.com>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
 <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com>
 <536767A1.5090701@cit-ec.uni-bielefeld.de> <CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com>
 <53679B6D.2030603@cit-ec.uni-bielefeld.de> <CAAVeFuL22kTEy+QZgPE8ZTVGkD9N1dMx1m+7AxjkPPD=s+oriw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f175.google.com ([209.85.128.175]:41003 "EHLO
	mail-ve0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753938AbaEEQqo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 May 2014 12:46:44 -0400
Received: by mail-ve0-f175.google.com with SMTP id jw12so2199517veb.6
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2014 09:46:43 -0700 (PDT)
In-Reply-To: <CAAVeFuL22kTEy+QZgPE8ZTVGkD9N1dMx1m+7AxjkPPD=s+oriw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Tue, May 6, 2014 at 12:14 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
>> Let's consider my use case for a minute here. I use a table to get gpios
>> from a dt node:
>>
>>     /* parse GPIOs */
>>     for (; *pin_desc; pin_desc++, gpios++) {
>>
>>         index = of_property_match_string(np, "gpio-names",
>> (*pin_desc)->name);
>>         if (index >= 0)
>>             *gpios = of_get_gpiod_flags(np, index, NULL);
>>
>>         [...]
>>
>>     }
>>
>> Now I had no way of knowing that I'm not supposed to use of_get_gpiod_flags.
>> Because every other driver uses of_get_gpio(_flags), I used the similarly
>> named *public* gpiolib functions, because I like the concept of opaque gpio
>> descriptors.
>
> I am not seeing this "gpio-names" property being used anywhere in
> mainline to lookup GPIOs, nor do I see usages of of_get_gpiod_flags()
> outside of gpiolib, so I had no way of knowing you decided to use it.
>
> Besides I don't have a high-level view on your code, but (at first
> sight) couldn't your call to of_get_gpiod_flags() simply be replaced
> by gpiod_get()?

That was meant to read gpiod_get_index(), sorry for the confusion.

Alex.
