From: Robert Middleton <robert.middleton@rm5248.com>
Subject: Re: [PATCH v2] gpio:mcp23s08 Fixed missing interrupts
Date: Wed, 15 Mar 2017 17:01:54 -0400
Message-ID: <CAKpcJVaNxEavuDfEB7MsQ+qr+kyou=1NDzTuVHja10MkAONmrA@mail.gmail.com>
References: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
 <1487777658-12951-2-git-send-email-robert.middleton@rm5248.com>
 <CACRpkdae8rBKrbny3T47FXx+7=hpzDi7kNvQ-VSOjkvsW=zz3w@mail.gmail.com>
 <CAKpcJVZHgTYuncEtTiK3P2xKJ5RAShv564zAsy1_sxrG3abjoQ@mail.gmail.com>
 <CACRpkdYcswm5Wb60aiaxuxdNSjApjXPptHiwgRaf8cohwz7Acw@mail.gmail.com> <CAKpcJVaw5vLtPR_gUVbjRPmh4TTVHh+XX4A5phTcQbXtGtwL9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:58748 "EHLO
        hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751277AbdCOVDY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2017 17:03:24 -0400
Received: from homiemail-a42.g.dreamhost.com (sub5.mail.dreamhost.com [208.113.200.129])
        by hapkido.dreamhost.com (Postfix) with ESMTP id 5C9AF9B050
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 14:02:56 -0700 (PDT)
Received: from homiemail-a42.g.dreamhost.com (localhost [127.0.0.1])
        by homiemail-a42.g.dreamhost.com (Postfix) with ESMTP id BA33E9003022
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 14:01:55 -0700 (PDT)
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com [209.85.217.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: robert.middleton@rm5248.com)
        by homiemail-a42.g.dreamhost.com (Postfix) with ESMTPSA id A0A18900300E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 14:01:55 -0700 (PDT)
Received: by mail-ua0-f177.google.com with SMTP id q7so15514498uaf.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2017 14:01:55 -0700 (PDT)
In-Reply-To: <CAKpcJVaw5vLtPR_gUVbjRPmh4TTVHh+XX4A5phTcQbXtGtwL9A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Mar 14, 2017 at 9:56 PM, Robert Middleton
<robert.middleton@rm5248.com> wrote:
> On Tue, Mar 14, 2017 at 5:16 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Mar 14, 2017 at 6:41 PM, Robert Middleton
>> <robert.middleton@rm5248.com> wrote:
>>> On Tue, Mar 14, 2017 at 9:19 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>>> On Wed, Feb 22, 2017 at 4:34 PM,  <robert.middleton@rm5248.com> wrote:
>>>>
>>>>> From: Robert Middleton <robert.middleton@rm5248.com>
>>>>>
>>>>> When an interrupt occurs on an MCP23S08 chip, the INTF register will only
>>>>> contain one bit as causing the interrupt.  If more than two pins change at
>>>>> the same time on the chip, this causes one of the pins to not be reported.
>>>>> This patch fixes the logic for checking if a pin has changed, so that
>>>>> multiple pins will always cause more than one change.
>>>>>
>>>>> Signed-off-by: Robert Middleton <robert.middleton@rm5248.com>
>>>>
>>>> OMG that looks complicated. But good commit with proper comments,
>>>> so patch applied for fixes. I had to do some fuzzing patch -p1 < foo.patch
>>>> so please check the result.
>>>>
>>>> Yours,
>>>> Linus Walleij
>>>
>>> Linux,
>>>
>>> Thanks, I will check it out once that gets pushed(I'm assuming it will
>>> be in the linux-gpio repository at
>>> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/)
>>
>> Unfortunately it explodes in the build servers due to changes in
>> the driver.
>>
>> Can you rebase and test on v4.11-rc1 and resend?
>>
>> Yours,
>> Linus Walleij
>
> Sure, that will take me a day or two but I can get that done.
>
> -Robert Middleton

Patch v3 has been sent.  Looking at the v2 patch, the biggest problem was
that I had somehow forgot a ), which was causing a parse error in gcc.
I'm not quite sure how that happened.

I tested with Torvalds' 4.11-rc1 kernel, everything still worked properly.

-Robert Middleton
