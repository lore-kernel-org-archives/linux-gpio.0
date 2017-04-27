From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] gpiolib: Add stubs for gpiod lookup table interface
Date: Thu, 27 Apr 2017 17:07:23 +0300
Message-ID: <CAHp75Vc4yEaH8OvWthh0huBeZChE-MutHXPEH5vZgMHDNc4oaw@mail.gmail.com>
References: <1493275956-14759-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:32979 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033530AbdD0OHZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2017 10:07:25 -0400
In-Reply-To: <1493275956-14759-1-git-send-email-agust@denx.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Apr 27, 2017 at 9:52 AM, Anatolij Gustschin <agust@denx.de> wrote:
> Add stubs for gpiod_add_lookup_table() and gpiod_remove_lookup_table()
> for the !GPIOLIB case to prevent build errors. Also add prototypes.
>
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Oh, has to take my tag back. See below why.


> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h

It is already defined in machine.h.

What you basically need is to add stubs for !GPIOLIB case

#ifdef ...
...existing prototypes...
#else /* GPIOLIB */
static inline void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
static inline void gpiod_remove_lookup_table(struct gpiod_lookup_table
*table) {}
#endif /* !GPIOLIB */

P.S. please notice how I put the stubs. It would be good to keep them
in two lines.

-- 
With Best Regards,
Andy Shevchenko
