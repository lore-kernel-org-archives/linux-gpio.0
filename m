From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Sun, 21 Jan 2018 23:18:59 +0100
Message-ID: <CAK8P3a1JeOREOXWz+BBurs3odtDTGEUnpotbLEZEOsX7YUNfeA@mail.gmail.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
 <CACRpkdb9JRsL1UFZ0+ipPmhYjd01Gy8+dL7yQ2RTkHJJdhf20w@mail.gmail.com> <CAMRc=MdgntKcwO9ub3XOT6=hFaTZj_rT9O0SpWv=ANm4xRpttw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:41444 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750853AbeAUWTB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jan 2018 17:19:01 -0500
Received: by mail-oi0-f67.google.com with SMTP id m83so2245092oik.8
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jan 2018 14:19:01 -0800 (PST)
In-Reply-To: <CAMRc=MdgntKcwO9ub3XOT6=hFaTZj_rT9O0SpWv=ANm4xRpttw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

On Sun, Jan 21, 2018 at 10:30 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 2018-01-21 16:49 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Fri, Jan 19, 2018 at 2:28 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> I was not aware of this, but it seems you're right! Nice catch, thanks.
>
> How about defining a local struct gpiod_timespec with both seconds and
> nanoseconds explicitly defined to uint64_t?

Where is that timestamp generated? Is this purely a user space interface
with the time read from gettimeofday(), or are we talking about  a new
kernel-to-user interface?

In a lot of cases, a simple 64-bit nanosecond counter using CLOCK_MONOTONIC
timestamps is the most robust and simple solution.

         Arnd
