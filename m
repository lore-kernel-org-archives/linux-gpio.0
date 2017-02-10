From: Robert Middleton <robert.middleton@rm5248.com>
Subject: Re: MCP23S08 driver bug - multiple inputs changing
Date: Fri, 10 Feb 2017 10:02:57 -0500
Message-ID: <CAKpcJVbv3K1NQ20GZSx59hy_9t9UmnOBOoF1AR2x-n9jCLLpsg@mail.gmail.com>
References: <CAKpcJVYw9MzWU6HUtZ35GXakMfRxS1U0fzu7SO-8bExgsEAtzQ@mail.gmail.com>
 <d2c6dce1-f7d1-3cb2-046b-46d68774a18c@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:54340 "EHLO
        hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751990AbdBKDF4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Feb 2017 22:05:56 -0500
Received: from homiemail-a92.g.dreamhost.com (sub5.mail.dreamhost.com [208.113.200.129])
        by hapkido.dreamhost.com (Postfix) with ESMTP id 5BC1198708
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2017 07:03:59 -0800 (PST)
Received: from homiemail-a92.g.dreamhost.com (localhost [127.0.0.1])
        by homiemail-a92.g.dreamhost.com (Postfix) with ESMTP id 97F04801D512
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2017 07:02:58 -0800 (PST)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com [74.125.82.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: robert.middleton@rm5248.com)
        by homiemail-a92.g.dreamhost.com (Postfix) with ESMTPSA id 8729F801D511
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2017 07:02:58 -0800 (PST)
Received: by mail-ot0-f180.google.com with SMTP id 65so29787560otq.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2017 07:02:58 -0800 (PST)
In-Reply-To: <d2c6dce1-f7d1-3cb2-046b-46d68774a18c@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linux-gpio@vger.kernel.org

Thanks for the info.

I will do more testing on my side with an updated kernel this weekend
and send a patch once I have done that.

-Robert Middleton

On Thu, Feb 9, 2017 at 8:21 PM, Phil Reid <preid@electromag.com.au> wrote:
> On 10/02/2017 04:11, Robert Middleton wrote:
>>
>> Hi,
>>
>> I'm using Microchip's MCP23S17 as a GPIO expander on a board of mine
>> and I've run into an issue with the driver.  One of my coworkers today
>> discovered that if you switch on two inputs on the GPIO expander at
>> once, only one will show up as changed from poll()(the code waits for
>> the GPIO change as described in the documentation:
>> https://www.kernel.org/doc/Documentation/gpio/sysfs.txt).  Looking at
>> the driver, I eventually tracked it down to the fact that the MCP23S17
>> seems to only set 1 bit in the INTF register, so if multiple inputs
>> are changed at the same time the kernel will only process the first
>> one.
>>
>> I fixed this on my side by reading the MCP_GPIO register when the
>> interrupt comes in, but this changes the logic slightly for how the
>> IRQ is handled(in mcp23s08_irq).  In my particular case, it doesn't
>> seem to matter but I'm also running an older kernel(4.4.11).
>>
>> Two questions with this:
>>
>> 1. Is the IRQ handler the correct place to handle this?  It seems like
>> it to me, but one of the comments in mcp23s08_get says "REVISIT
>> reading this clears any IRQ ..." when reading the GPIO register.
>
>
> Would need to see the patch to see what effect it may have.
> I'm using the s18 variant for some interrupt driver keypad inputs so can
> test
> your changes.
>
> This is true for the mcp32s17, but the mcp23s18 is configurable with respect
> to which register clears the interrupt.
>
>> 2. If that is the right place to fix it, where is the correct place to
>> send a patch/what is the process?  My understanding is that I would do
>> a git send-email to this list, but I wanted to make sure my
>> understanding is correct.
>
>
> Yes.
> From memory the driver was recently updated to use regmap so you patch will
> need to apply against
> those changes (if it doesn't already).
>
>
> --
> Regards
> Phil Reid
>
