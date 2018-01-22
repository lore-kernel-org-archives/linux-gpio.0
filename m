From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Mon, 22 Jan 2018 10:28:53 +0100
Message-ID: <CAK8P3a1t3MquLPuZqgds4osrTNTOG494s4fk_nhdn+N=B3qdhg@mail.gmail.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
 <CACRpkdb9JRsL1UFZ0+ipPmhYjd01Gy8+dL7yQ2RTkHJJdhf20w@mail.gmail.com>
 <CAMRc=MdgntKcwO9ub3XOT6=hFaTZj_rT9O0SpWv=ANm4xRpttw@mail.gmail.com>
 <CAK8P3a1JeOREOXWz+BBurs3odtDTGEUnpotbLEZEOsX7YUNfeA@mail.gmail.com>
 <CACRpkdbJUOvNDwM=wZw5iLwPAf-D+i27E9JRzV=Gr0mnZbX3kg@mail.gmail.com> <CAK8P3a3Y4Coj9Y5NT5KsQLpSkTqCDDY6B3sU199uvhoPb9GEYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:39328 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbeAVJ2y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 04:28:54 -0500
Received: by mail-oi0-f65.google.com with SMTP id t8so5476328oie.6
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2018 01:28:54 -0800 (PST)
In-Reply-To: <CAK8P3a3Y4Coj9Y5NT5KsQLpSkTqCDDY6B3sU199uvhoPb9GEYw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

On Mon, Jan 22, 2018 at 10:25 AM, Arnd Bergmann <arnd@arndb.de> wrote:
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
> - 'real' timestamps are inconvenient because time may jump in
>   either direction. Time stamps should use 'monotonic' time, i.e.
>   ktime_get_ns().

and third:

- On anything other than x86-32, you are leaking 32 bits of kernel stack
  data for each event, which might be a security issue.

         Arnd
