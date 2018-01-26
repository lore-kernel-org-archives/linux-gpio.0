From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] pinctrl: msm: allow the gpio base to be configurable
Date: Fri, 26 Jan 2018 23:13:53 +0100
Message-ID: <CAMRc=McDzELTddEXnKtsE7jG4r5ROodhbjh=QSjVDtLHE0KSPA@mail.gmail.com>
References: <1516915209-28295-1-git-send-email-timur@codeaurora.org>
 <CACRpkda6FLfUhqOPqJfCHm1PHOWg=CY=wOCDyrd78eMx+-zrZw@mail.gmail.com> <5bcf9545-37ee-18b5-33d9-7ce3da9b0048@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:33037 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751375AbeAZWNy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Jan 2018 17:13:54 -0500
Received: by mail-ot0-f195.google.com with SMTP id d7so1712310oti.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jan 2018 14:13:54 -0800 (PST)
In-Reply-To: <5bcf9545-37ee-18b5-33d9-7ce3da9b0048@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>

2018-01-26 14:16 GMT+01:00 Timur Tabi <timur@codeaurora.org>:
> On 1/26/18 7:01 AM, Linus Walleij wrote:
>>
>> This is a feature not a bug. It encourages people not to
>> depend on the global GPIO numberspace.
>>
>> Just set it to -1.
>
>
> If I change it to -1, then I think I'm going to break every existing MSM
> platform that depends on the base address being 0, because then every MSM
> driver will have a non-zero base, and none of the existing drivers register
> more than one GPIO device.
>
> So how about this:
>
>         static int base = 0;
>
>         chip->base = base;
>         base = -1;
>
> This way, existing code works as before.  If any driver registers two GPIO
> devices, the first one will get a base of 0, and the second one will get
> some other base.
>
>>> gpiochip_find_base: found new base at 437
>>
>> (...)
>>>
>>> gpiochip_find_base: found new base at 362
>>
>> These are awesome bases, just beautiful. Use this.
>>
>> If you don't like seeing GPIO base numbers like this: use things
>> like the chardev and the tools in tools/gpio or libgpiod when
>> developing, and you will never see them. They should not make
>> a difference anyway.
>
>
> Can you tell me more about the chardev?  I've always been using "echo X >
> /sys/class/gpio/export", so I guess that's not the right way to do things.
>

Hi Timur,

take a look at the in-project documentation[1] and read the article[2]
about libgpiod. That should get you started.

Let me know if anything's not clear.

Thanks,
Bartosz

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
[2] https://www.cnx-software.com/2017/11/03/learn-more-about-linuxs-new-gpio-user-space-subsystem-libgpiod/
