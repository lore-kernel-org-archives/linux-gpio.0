From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Sun, 21 Jan 2018 22:30:23 +0100
Message-ID: <CAMRc=MdgntKcwO9ub3XOT6=hFaTZj_rT9O0SpWv=ANm4xRpttw@mail.gmail.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
 <CACRpkdb9JRsL1UFZ0+ipPmhYjd01Gy8+dL7yQ2RTkHJJdhf20w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:38325 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750869AbeAUVaZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jan 2018 16:30:25 -0500
Received: by mail-oi0-f66.google.com with SMTP id m65so4664137oig.5
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jan 2018 13:30:25 -0800 (PST)
In-Reply-To: <CACRpkdb9JRsL1UFZ0+ipPmhYjd01Gy8+dL7yQ2RTkHJJdhf20w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

2018-01-21 16:49 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, Jan 19, 2018 at 2:28 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>> I want to commit to a stable interface for the library starting from
>> v1.0 but it would be great if I could get some reviews first - it's
>> basically only about reviewing a single public header: include/gpiod.h
>
> I have no real objections, then, I'm not a great API designer at all.
>
> - In my opinion, all design should consider Rusty Russell's design
>   manifesto:
>   http://sweng.the-davies.net/Home/rustys-api-design-manifesto
>   Just ask yourself the questions in the manifesto to the function
>   signature.
>
> - Things named with the infix "simple" *_simple_* *SIMPLE* etc.
>   This is a weasel word.
>   https://en.wikipedia.org/wiki/Weasel_word
>   I have been adviced against ever using that in code, because the
>   idea of what is "simple" is extremely subjective. A function with
>   six obscure parameters, is that "simple"?
>
>   I would have called it *rudimentary*, *coarse"* or *plain* or something
>   similar less subjective.
>

I was thinking about something like _contextless_ or _ctxless_ but it
would make the already long function names even longer...

> - gpiod_simple_event_handle_cb uses struct timespec.
>   This can create problems.
>   On 32 vs 64 bit platforms, because struct timespec is of different
>   size on 32 vs 64bit platforms, I think. (Looping in Arnd to verify.)
>   You might think "well it is either used on 32bit or on 64bit,
>   and everything else is compiled for that so what."
>   But in reality you have things like Python bindings, and those get
>   a *real* problem when things are in struct timespec, because they
>   map byte-by-byte and precompile code doing this map and
>   redistribute. Disaster.

I was not aware of this, but it seems you're right! Nice catch, thanks.

How about defining a local struct gpiod_timespec with both seconds and
nanoseconds explicitly defined to uint64_t?

Thanks,
Bartosz Golaszewski

>   With libmtp I often wish I has just used ISO 8601
>   https://en.wikipedia.org/wiki/ISO_8601
>   even if it means creating a string on one side and parsing it on
>   the other, because it is unambigous.
>   This might be an especially bad idea of mine but think it over.
