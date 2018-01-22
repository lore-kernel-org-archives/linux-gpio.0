From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Mon, 22 Jan 2018 12:02:54 +0100
Message-ID: <CAMRc=MfbQ7d8xrooS7sqDPU-EAfhFJx57t4yqRY-zQ=7gYuHbQ@mail.gmail.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
 <CACRpkdb9JRsL1UFZ0+ipPmhYjd01Gy8+dL7yQ2RTkHJJdhf20w@mail.gmail.com>
 <CAMRc=MdgntKcwO9ub3XOT6=hFaTZj_rT9O0SpWv=ANm4xRpttw@mail.gmail.com>
 <CAK8P3a1JeOREOXWz+BBurs3odtDTGEUnpotbLEZEOsX7YUNfeA@mail.gmail.com>
 <CACRpkdbJUOvNDwM=wZw5iLwPAf-D+i27E9JRzV=Gr0mnZbX3kg@mail.gmail.com> <CAK8P3a3Y4Coj9Y5NT5KsQLpSkTqCDDY6B3sU199uvhoPb9GEYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:37552 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751024AbeAVLCz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 06:02:55 -0500
Received: by mail-oi0-f66.google.com with SMTP id t78so1162840oih.4
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2018 03:02:55 -0800 (PST)
In-Reply-To: <CAK8P3a3Y4Coj9Y5NT5KsQLpSkTqCDDY6B3sU199uvhoPb9GEYw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

2018-01-22 10:25 GMT+01:00 Arnd Bergmann <arnd@arndb.de>:
> On Mon, Jan 22, 2018 at 9:21 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Sun, Jan 21, 2018 at 11:18 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> On Sun, Jan 21, 2018 at 10:30 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>> 2018-01-21 16:49 GMT+01:00 Linus Walleij <linus.walleij@linaro.org>:
>>>>> On Fri, Jan 19, 2018 at 2:28 PM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>
>>>> I was not aware of this, but it seems you're right! Nice catch, thanks.
>>>>
>>>> How about defining a local struct gpiod_timespec with both seconds and
>>>> nanoseconds explicitly defined to uint64_t?
>>>
>>> Where is that timestamp generated? Is this purely a user space interface
>>> with the time read from gettimeofday(), or are we talking about  a new
>>> kernel-to-user interface?
>>
>> This is in include/uapi/linux/gpio.h:
>>
>> /**
>>  * struct gpioevent_data - The actual event being pushed to userspace
>>  * @timestamp: best estimate of time of event occurrence, in nanoseconds
>>  * @id: event identifier
>>  */
>> struct gpioevent_data {
>>         __u64 timestamp;
>>         __u32 id;
>> };
>>
>> It is the same as is used for IIO. Inside the kernel this ultimately
>> comes from ktime_get_real_ns();
>
> Ah, too bad, that already contains two mistakes:
>
> - on x86, the structures are incompatible between 32-bit and 64-bit
>   user space, as the former has no padding.

Is this really an issue? Do distros really ship the same bytecode for
32 and 64 bit architecures? I have never run into such problems
despite having used different python bindings for C libraries (I'm not
sure however how many of them dealt with any visible C structs).

> - 'real' timestamps are inconvenient because time may jump in
>   either direction. Time stamps should use 'monotonic' time, i.e.
>   ktime_get_ns().
>

@Linus: this doesn't really break the ABI - how do you feel about
switching to using it in gpiolib.c?

>>> In a lot of cases, a simple 64-bit nanosecond counter using CLOCK_MONOTONIC
>>> timestamps is the most robust and simple solution.
>>
>> Bartosz also seems to think it is the best so would vote to go
>> for that and we have one problem less.
>
> Could we introduce a new ioctl to replace the gpioevent_data() and
> use a better interface then?
>

For the security concern - I guess it would be enough to just zero
gpioevent_data in lineevent_irq_thread() before putting it into the
FIFO?

Best regards,
Bartosz Golaszewski
