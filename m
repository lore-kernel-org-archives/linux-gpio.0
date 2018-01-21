From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Sun, 21 Jan 2018 22:14:17 +0100
Message-ID: <CAMRc=McViLgQOdkZDN2m4JfwTqwBuyt0D+oy1YP89_2Y4t2VFg@mail.gmail.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
 <20180120160240.GA4548@archie.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:37403 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751047AbeAUVOS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jan 2018 16:14:18 -0500
Received: by mail-oi0-f45.google.com with SMTP id t78so184777oih.4
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jan 2018 13:14:18 -0800 (PST)
In-Reply-To: <20180120160240.GA4548@archie.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-gpio@vger.kernel.org

2018-01-20 17:02 GMT+01:00 Clemens Gruber <clemens.gruber@pqgruber.com>:
> Hi Bartosz,
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
>
> Looks good to me, great work!
>
> Only one question:
>
> - GPIOD_LINE_BULK_MAX_LINES
> Would increasing this in the future break the API in your opinion? And
> if so, is 64 enough?
>

This value corresponds to GPIOHANDLES_MAX in linux' UAPI. It's not
very likely that'll be ever increased.

Thanks,
Bartosz
