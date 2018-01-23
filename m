From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Tue, 23 Jan 2018 16:14:21 +0100
Message-ID: <CAMRc=Mc2f7RAoYE3-0MbxUC=1eua0wYjGqd-R+PMwDzLXxcS3Q@mail.gmail.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
 <CACRpkdb9JRsL1UFZ0+ipPmhYjd01Gy8+dL7yQ2RTkHJJdhf20w@mail.gmail.com>
 <CAMRc=MdgntKcwO9ub3XOT6=hFaTZj_rT9O0SpWv=ANm4xRpttw@mail.gmail.com>
 <CAK8P3a1JeOREOXWz+BBurs3odtDTGEUnpotbLEZEOsX7YUNfeA@mail.gmail.com>
 <CACRpkdbJUOvNDwM=wZw5iLwPAf-D+i27E9JRzV=Gr0mnZbX3kg@mail.gmail.com>
 <CAK8P3a3Y4Coj9Y5NT5KsQLpSkTqCDDY6B3sU199uvhoPb9GEYw@mail.gmail.com>
 <CAMRc=MfbQ7d8xrooS7sqDPU-EAfhFJx57t4yqRY-zQ=7gYuHbQ@mail.gmail.com> <CAK8P3a1MSToyMTnqN1bVvzwK92CdDvAnJCZctbSgu8iM8t3KAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:42337 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750960AbeAWPOW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jan 2018 10:14:22 -0500
Received: by mail-oi0-f47.google.com with SMTP id c8so542579oiy.9
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2018 07:14:22 -0800 (PST)
In-Reply-To: <CAK8P3a1MSToyMTnqN1bVvzwK92CdDvAnJCZctbSgu8iM8t3KAQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

2018-01-22 12:12 GMT+01:00 Arnd Bergmann <arnd@arndb.de>:
> On Mon, Jan 22, 2018 at 12:02 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> 2018-01-22 10:25 GMT+01:00 Arnd Bergmann <arnd@arndb.de>:
>>>
>>> - on x86, the structures are incompatible between 32-bit and 64-bit
>>>   user space, as the former has no padding.
>>
>> Is this really an issue? Do distros really ship the same bytecode for
>> 32 and 64 bit architecures? I have never run into such problems
>> despite having used different python bindings for C libraries (I'm not
>> sure however how many of them dealt with any visible C structs).
>
> It's a huge issue, yes. You should be able to run an 32-bit distro
> or just a standalone 32-bit binary with a 64-bit kernel. This driver
> is otherwise written carefully to allow that, and it will work on all
> other architectures AFAICT, just not on x86.
>

Besides using struct timespec, I have other structs in gpiod.h which
would pose problems for ctypes-based python bindings - for example
struct gpiod_line_request_config which contains a pointer (C string).
If instead of using ctypes, I'd just use python's C extension modules,
is there any other trap caused by different data layout between 32 and
64 bit architectures that I should be aware of?

Also: if python bindings are the only victim of that - I'm ok with
timespec. It's up to bindings to provide a correct interface after
all, isn't it?

Best regards,
Bartosz Golaszewski
