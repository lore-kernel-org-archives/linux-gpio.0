From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] libgpiod public API reviews needed
Date: Mon, 22 Jan 2018 14:46:12 +0100
Message-ID: <CAK8P3a1Skvm48sje8FNDPLYqyz9Lf8q0qX1QETWtyZTxuX4k1g@mail.gmail.com>
References: <CAMRc=Md09CAQMS=5b7EUeh5AOjJ-zzbnETb_V+RdsxxafVxPdA@mail.gmail.com>
 <CACRpkdb9JRsL1UFZ0+ipPmhYjd01Gy8+dL7yQ2RTkHJJdhf20w@mail.gmail.com>
 <CAMRc=MdgntKcwO9ub3XOT6=hFaTZj_rT9O0SpWv=ANm4xRpttw@mail.gmail.com>
 <CAK8P3a1JeOREOXWz+BBurs3odtDTGEUnpotbLEZEOsX7YUNfeA@mail.gmail.com>
 <CACRpkdbJUOvNDwM=wZw5iLwPAf-D+i27E9JRzV=Gr0mnZbX3kg@mail.gmail.com>
 <CAK8P3a3Y4Coj9Y5NT5KsQLpSkTqCDDY6B3sU199uvhoPb9GEYw@mail.gmail.com> <CACRpkdapAoZ-Gzkx+SwGkkWBmyfeBaAtv1KdJd-wj2dvBamYAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:41211 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751087AbeAVNqO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jan 2018 08:46:14 -0500
Received: by mail-ot0-f196.google.com with SMTP id 44so7466246otk.8
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jan 2018 05:46:14 -0800 (PST)
In-Reply-To: <CACRpkdapAoZ-Gzkx+SwGkkWBmyfeBaAtv1KdJd-wj2dvBamYAQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Clemens Gruber <clemens.gruber@pqgruber.com>, Thierry Reding <thierry.reding@gmail.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>

On Mon, Jan 22, 2018 at 1:02 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Jan 22, 2018 at 10:25 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Mon, Jan 22, 2018 at 9:21 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>>> /**
>>>  * struct gpioevent_data - The actual event being pushed to userspace
>>>  * @timestamp: best estimate of time of event occurrence, in nanoseconds
>>>  * @id: event identifier
>>>  */
>>> struct gpioevent_data {
>>>         __u64 timestamp;
>>>         __u32 id;
>>> };
>>>
>>> It is the same as is used for IIO. Inside the kernel this ultimately
>>> comes from ktime_get_real_ns();
>>
>> Ah, too bad, that already contains two mistakes:
>>
>> - on x86, the structures are incompatible between 32-bit and 64-bit
>>   user space, as the former has no padding.
>
> Sigh yeah that's bad... I guess we will be saved by the 64bit
> word coming first in the struct? (with the security problem
> you mention appearing after the 32 bits in ID.)

The main problem is the size of the data: kfifo_copy_to_user()
can copy multiple records, and while the first one would
remain accessible correctly, the second record contains
garbage if the kernel adds 4 bytes of padding inbetween.

>> - 'real' timestamps are inconvenient because time may jump in
>>   either direction. Time stamps should use 'monotonic' time, i.e.
>>   ktime_get_ns().
>
> So what we have in IIO is that it is configurable what timestamp
> you get.
>
> I've been meaning to fix this by breaking their timestamping
> into lib/ and use the same configurability per-gpiochip for GPIO.
> I guess this is the time to actually do it and stop talking on
> my part :/

Ok, makes sense.

> They also use the same default timestamp though.
>
> commit bc2b7dab629a ("iio:core: timestamping clock selection support")
>
> The code is in IIO in drivers/iio/industrialio-core.c:
>
> /**
>  * iio_get_time_ns() - utility function to get a time stamp for events etc
>  * @indio_dev: device
>  */
> s64 iio_get_time_ns(const struct iio_dev *indio_dev)
> {
>         struct timespec tp;
>
>         switch (iio_device_get_clock(indio_dev)) {
>         case CLOCK_REALTIME:
>                 ktime_get_real_ts(&tp);
>                 break;
>         case CLOCK_MONOTONIC:
>                 ktime_get_ts(&tp);
>                 break;
>         case CLOCK_MONOTONIC_RAW:
>                 getrawmonotonic(&tp);
>                 break;
>         case CLOCK_REALTIME_COARSE:
>                 tp = current_kernel_time();
>                 break;
>         case CLOCK_MONOTONIC_COARSE:
>                 tp = get_monotonic_coarse();
>                 break;
>         case CLOCK_BOOTTIME:
>                 get_monotonic_boottime(&tp);
>                 break;
>         case CLOCK_TAI:
>                 timekeeping_clocktai(&tp);
>                 break;
>         default:
>                 BUG();
>         }
>
>         return timespec_to_ns(&tp);
> }
> EXPORT_SYMBOL(iio_get_time_ns);
>
> Which clock is used is configured per-device in sysfs.
>
> It's pretty neat I think.

To be honest, I think this is overcomplicating things. While I
have a patch to change the interface names and make them
all ktime_get_*_ns(), most of these clocks make no sense
at all for a random user space interface, mainly because
I wouldn't trust user space programmers to make an
informed decision which of those seven to use.

        Arnd
