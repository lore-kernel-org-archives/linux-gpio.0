From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio:mcp23s08 Fixed missing interrupts
Date: Tue, 14 Mar 2017 22:16:08 +0100
Message-ID: <CACRpkdYcswm5Wb60aiaxuxdNSjApjXPptHiwgRaf8cohwz7Acw@mail.gmail.com>
References: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
 <1487777658-12951-2-git-send-email-robert.middleton@rm5248.com>
 <CACRpkdae8rBKrbny3T47FXx+7=hpzDi7kNvQ-VSOjkvsW=zz3w@mail.gmail.com> <CAKpcJVZHgTYuncEtTiK3P2xKJ5RAShv564zAsy1_sxrG3abjoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:38229 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750997AbdCNVQL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Mar 2017 17:16:11 -0400
Received: by mail-it0-f42.google.com with SMTP id m27so7989921iti.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Mar 2017 14:16:10 -0700 (PDT)
In-Reply-To: <CAKpcJVZHgTYuncEtTiK3P2xKJ5RAShv564zAsy1_sxrG3abjoQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Middleton <robert.middleton@rm5248.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Mar 14, 2017 at 6:41 PM, Robert Middleton
<robert.middleton@rm5248.com> wrote:
> On Tue, Mar 14, 2017 at 9:19 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, Feb 22, 2017 at 4:34 PM,  <robert.middleton@rm5248.com> wrote:
>>
>>> From: Robert Middleton <robert.middleton@rm5248.com>
>>>
>>> When an interrupt occurs on an MCP23S08 chip, the INTF register will only
>>> contain one bit as causing the interrupt.  If more than two pins change at
>>> the same time on the chip, this causes one of the pins to not be reported.
>>> This patch fixes the logic for checking if a pin has changed, so that
>>> multiple pins will always cause more than one change.
>>>
>>> Signed-off-by: Robert Middleton <robert.middleton@rm5248.com>
>>
>> OMG that looks complicated. But good commit with proper comments,
>> so patch applied for fixes. I had to do some fuzzing patch -p1 < foo.patch
>> so please check the result.
>>
>> Yours,
>> Linus Walleij
>
> Linux,
>
> Thanks, I will check it out once that gets pushed(I'm assuming it will
> be in the linux-gpio repository at
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/)

Unfortunately it explodes in the build servers due to changes in
the driver.

Can you rebase and test on v4.11-rc1 and resend?

Yours,
Linus Walleij
