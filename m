From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH v2] gpiolib: Add stubs for gpiod lookup table interface
Date: Thu, 27 Apr 2017 16:25:34 +0200
Message-ID: <20170427162534.0499344f@crub>
References: <1493275956-14759-1-git-send-email-agust@denx.de>
        <CAHp75Vc4yEaH8OvWthh0huBeZChE-MutHXPEH5vZgMHDNc4oaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:43435 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932155AbdD0OZm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2017 10:25:42 -0400
In-Reply-To: <CAHp75Vc4yEaH8OvWthh0huBeZChE-MutHXPEH5vZgMHDNc4oaw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, 27 Apr 2017 17:07:23 +0300
Andy Shevchenko andy.shevchenko@gmail.com wrote:

>On Thu, Apr 27, 2017 at 9:52 AM, Anatolij Gustschin <agust@denx.de> wrote:
>> Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
>> for the !GPIOLIB case to prevent build errors. Also add prototypes.
>>
>> Signed-off-by: Anatolij Gustschin <agust@denx.de>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>  
>
>Oh, has to take my tag back. See below why.
>
>
>> --- a/include/linux/gpio/consumer.h
>> +++ b/include/linux/gpio/consumer.h  
>
>It is already defined in machine.h.
>
>What you basically need is to add stubs for !GPIOLIB case
>
>#ifdef ...
>...existing prototypes...
>#else /* GPIOLIB */
>static inline void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
>static inline void gpiod_remove_lookup_table(struct gpiod_lookup_table
>*table) {}
>#endif /* !GPIOLIB */
>
>P.S. please notice how I put the stubs. It would be good to keep them
>in two lines.

this will exceed 80 char line limit.

Thanks,

Anatolij
