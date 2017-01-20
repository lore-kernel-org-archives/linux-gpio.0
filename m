From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl / gpio: Introduce .set_config() callback for
 GPIO chips
Date: Fri, 20 Jan 2017 10:49:25 +0100
Message-ID: <CACRpkdbju9yFxuNtn+GsjNc=PSH=dF6AOEZygujm+sJVdv-eWQ@mail.gmail.com>
References: <20170119094820.83595-1-mika.westerberg@linux.intel.com>
 <20170119094820.83595-4-mika.westerberg@linux.intel.com> <CACRpkdbsOvJkpNtjvCXRNWV6dA6onzomn-E+9n=xJabmcRGbEQ@mail.gmail.com>
 <d4624a94-7a09-e28a-30bb-5d0e367722c0@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:33524 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751549AbdATJu3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2017 04:50:29 -0500
Received: by mail-io0-f169.google.com with SMTP id v96so58750401ioi.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2017 01:49:26 -0800 (PST)
In-Reply-To: <d4624a94-7a09-e28a-30bb-5d0e367722c0@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 20, 2017 at 10:24 AM, Neil Armstrong
<narmstrong@baylibre.com> wrote:

>>> -       return ret;
>>> +       return pinctrl_gpio_set_config(chip->base + offset, config);
>>>  }
>>
>> This is the beauty of it all..
>
> It would be even cooler it this becomes a generic helper !

It does, with this series we can push debounce and open source/drain
back to the pinctrl back-end.

Then the road is open to push any config this way, which I think will
also be needed for userspace GPIO to set up not just this but also
pull-ups etc. But we will add that step by step.

This provides a piece of much-needed infrastructure for this.

Yours,
Linus Walleij
