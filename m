From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Timestamp events in hardirq handler
Date: Tue, 23 Jan 2018 14:42:40 +0100
Message-ID: <CACRpkdY2U1N+xHAKjxjAEzD-hMuDCveYuxOLNzyy=x8N+CiiLQ@mail.gmail.com>
References: <20171130092655.25965-1-linus.walleij@linaro.org>
 <3058528.dbeyJzq7DI@ws-stein> <CACRpkdZ1PMOC0WuS4O=B1ieJyBCwLDzQ=UHri43yEYJmuNtwNQ@mail.gmail.com>
 <87r2qglpif.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:39095 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751542AbeAWNml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jan 2018 08:42:41 -0500
Received: by mail-io0-f195.google.com with SMTP id b198so950819iof.6
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2018 05:42:41 -0800 (PST)
In-Reply-To: <87r2qglpif.fsf@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

On Tue, Jan 23, 2018 at 1:37 PM, Felipe Balbi
<felipe.balbi@linux.intel.com> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>> On Thu, Nov 30, 2017 at 10:46 AM, Alexander Stein
>> <alexander.stein@systec-electronic.com> wrote:
>>> On Thursday, November 30, 2017, 10:26:55 AM CET Linus Walleij wrote:
>>
>>>> +     s64 timestamp;
>>>     ^^^
>>> u64? ktime_get_real_ns() returns u64 and struct gpioevent_data
>>> has __u64 for timestamp.
>>
>> OK sorry, fixing it. Thanks for noticing!
>
> This is not on next. Will it miss this merge window?

I realized yesterday when doing a security fix that it was missing.

Because I didn't get the merge conflict I expected :D

So I merged it. Don't worry. Sorry for the fuzz!

Yours,
Linus Walleij
