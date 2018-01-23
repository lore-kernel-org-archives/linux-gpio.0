From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Tue, 23 Jan 2018 16:05:16 +0100
Message-ID: <CAMRc=MfQacFHbbsOgkEqp_iUTN+z3L+oYNbCSn2AfGyXdp2Exg@mail.gmail.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
 <20180123141540.GJ3055@rfolt0960.corp.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f170.google.com ([74.125.82.170]:37520 "EHLO
        mail-ot0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751353AbeAWPFR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jan 2018 10:05:17 -0500
Received: by mail-ot0-f170.google.com with SMTP id a24so657081otd.4
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2018 07:05:17 -0800 (PST)
In-Reply-To: <20180123141540.GJ3055@rfolt0960.corp.atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

2018-01-23 15:15 GMT+01:00 Ludovic Desroches <ludovic.desroches@microchip.com>:
> Hi,
>
> On Fri, Jan 19, 2018 at 02:28:40PM +0100, Bartosz Golaszewski wrote:
>> Hi,
>>
>> I would like to release libgpiod v1.0 soon (preferably before FOSDEM
>> 2018). The first version (v0.x series) was written in a matter of two
>> weeks and the API was not well designed. Since v0.3 release I've been
>> working on redesigning the public API to make it simplier and more
>> useful.
>>
>> I want to commit to a stable interface for the library starting from
>> v1.0 but it would be great if I could get some reviews first - it's
>> basically only about reviewing a single public header: include/gpiod.h
>> in which all public symbols are documented. Any implementation details
>> can always be changed later.
>>
>> The most prominent changes since 0.3 include:
>> - removal of custom error handling in favor of errnos
>> - merge of two separate interfaces for event requests and regular line requests
>> - redesign of the simple API
>> - addition of a bunch of helpers for line requests
>> - redesign of the iterator API
>> - making the use of prefixes more consistent
>> - renaming of symbols all over the place
>> - and various minor tweaks
>>
>> As far as usefulness goes - the user space tools that are included all
>> use this API and it looks pretty clean.
>>
>> The project is hosted at kernel.org:
>>
>>     https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
>>
>> and the code that needs review is on the master branch.
>>
>> Thanks in advance to anyone who'll find the time to take a look.
>>
>
> Thanks for your work, I am using your library and I am trying to promote it.
>
> Some people were confused concerning the naming when requesting line(s)
> as output. 'init_val(s)' may be better than 'default_val(s)'.
>
> The callback for gpiod_simple_set_value(_multiple) is optional, you may mention
> it. Concerning the multiple variant, I would enforce that the callback
> is called when ALL the values are set.
> I don't see the added value of this callback. What's the difference with
> executing it depending on gpiod_simple_set_value(_multiple) return value?
>

It exists to allow to execute some code or pause the execution while
the device file of the gpiochip is open and the lines are requested.
You can take a look at src/tools/gpioset.c to see how it's used in an
actual program.

For other hints: they make sense, I'll add them soon.

Thanks,
Bartosz
