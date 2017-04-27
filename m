From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] gpiolib: Add stubs for gpiod lookup table interface
Date: Thu, 27 Apr 2017 17:47:05 +0300
Message-ID: <CAHp75Ve2s2iKay4cx0ZEBBo1jV5SSqdEe=n7m-y8Ha1q8CJPEQ@mail.gmail.com>
References: <1493275956-14759-1-git-send-email-agust@denx.de>
 <CAHp75Vc4yEaH8OvWthh0huBeZChE-MutHXPEH5vZgMHDNc4oaw@mail.gmail.com>
 <20170427162534.0499344f@crub> <20170427162936.7064810f@crub>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:35583 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S939354AbdD0OrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Apr 2017 10:47:06 -0400
In-Reply-To: <20170427162936.7064810f@crub>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anatolij Gustschin <agust@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Apr 27, 2017 at 5:29 PM, Anatolij Gustschin <agust@denx.de> wrote:
> On Thu, 27 Apr 2017 16:25:34 +0200
> Anatolij Gustschin agust@denx.de wrote:
>
>>On Thu, 27 Apr 2017 17:07:23 +0300
>>Andy Shevchenko andy.shevchenko@gmail.com wrote:
> ...
>>>static inline void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
>>>static inline void gpiod_remove_lookup_table(struct gpiod_lookup_table
>>>*table) {}
>>>#endif /* !GPIOLIB */
>>>
>>>P.S. please notice how I put the stubs. It would be good to keep them
>>>in two lines.
>>
>>this will exceed 80 char line limit.

Not for many (unimportant) symbols.

> I'll go with
>
> static inline
> void gpiod_add_lookup_table(struct gpiod_lookup_table *table) {}
>
> static inline
> void gpiod_remove_lookup_table(struct gpiod_lookup_table *table) {}
>
> Is it okay?

Whatever Linus prefers. I'm fine with either.

-- 
With Best Regards,
Andy Shevchenko
