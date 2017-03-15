From: Robert Middleton <robert.middleton@rm5248.com>
Subject: Re: [PATCH v2] gpio:mcp23s08 Fixed missing interrupts
Date: Tue, 14 Mar 2017 21:56:12 -0400
Message-ID: <CAKpcJVaw5vLtPR_gUVbjRPmh4TTVHh+XX4A5phTcQbXtGtwL9A@mail.gmail.com>
References: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
 <1487777658-12951-2-git-send-email-robert.middleton@rm5248.com>
 <CACRpkdae8rBKrbny3T47FXx+7=hpzDi7kNvQ-VSOjkvsW=zz3w@mail.gmail.com>
 <CAKpcJVZHgTYuncEtTiK3P2xKJ5RAShv564zAsy1_sxrG3abjoQ@mail.gmail.com> <CACRpkdYcswm5Wb60aiaxuxdNSjApjXPptHiwgRaf8cohwz7Acw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub5.mail.dreamhost.com ([208.113.200.129]:49659 "EHLO
        homiemail-a57.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750818AbdCOB4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Mar 2017 21:56:15 -0400
Received: from homiemail-a57.g.dreamhost.com (localhost [127.0.0.1])
        by homiemail-a57.g.dreamhost.com (Postfix) with ESMTP id 5D54A6004D12
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 18:56:14 -0700 (PDT)
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com [209.85.213.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: robert.middleton@rm5248.com)
        by homiemail-a57.g.dreamhost.com (Postfix) with ESMTPSA id 431F46004D10
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 18:56:14 -0700 (PDT)
Received: by mail-vk0-f43.google.com with SMTP id r136so1785434vke.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 18:56:14 -0700 (PDT)
In-Reply-To: <CACRpkdYcswm5Wb60aiaxuxdNSjApjXPptHiwgRaf8cohwz7Acw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Mar 14, 2017 at 5:16 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Mar 14, 2017 at 6:41 PM, Robert Middleton
> <robert.middleton@rm5248.com> wrote:
>> On Tue, Mar 14, 2017 at 9:19 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Wed, Feb 22, 2017 at 4:34 PM,  <robert.middleton@rm5248.com> wrote:
>>>
>>>> From: Robert Middleton <robert.middleton@rm5248.com>
>>>>
>>>> When an interrupt occurs on an MCP23S08 chip, the INTF register will only
>>>> contain one bit as causing the interrupt.  If more than two pins change at
>>>> the same time on the chip, this causes one of the pins to not be reported.
>>>> This patch fixes the logic for checking if a pin has changed, so that
>>>> multiple pins will always cause more than one change.
>>>>
>>>> Signed-off-by: Robert Middleton <robert.middleton@rm5248.com>
>>>
>>> OMG that looks complicated. But good commit with proper comments,
>>> so patch applied for fixes. I had to do some fuzzing patch -p1 < foo.patch
>>> so please check the result.
>>>
>>> Yours,
>>> Linus Walleij
>>
>> Linux,
>>
>> Thanks, I will check it out once that gets pushed(I'm assuming it will
>> be in the linux-gpio repository at
>> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/)
>
> Unfortunately it explodes in the build servers due to changes in
> the driver.
>
> Can you rebase and test on v4.11-rc1 and resend?
>
> Yours,
> Linus Walleij

Sure, that will take me a day or two but I can get that done.

-Robert Middleton
