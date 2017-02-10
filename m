From: Phil Reid <preid@electromag.com.au>
Subject: Re: MCP23S08 driver bug - multiple inputs changing
Date: Fri, 10 Feb 2017 09:21:19 +0800
Message-ID: <d2c6dce1-f7d1-3cb2-046b-46d68774a18c@electromag.com.au>
References: <CAKpcJVYw9MzWU6HUtZ35GXakMfRxS1U0fzu7SO-8bExgsEAtzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:56463 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750946AbdBJBWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2017 20:22:24 -0500
In-Reply-To: <CAKpcJVYw9MzWU6HUtZ35GXakMfRxS1U0fzu7SO-8bExgsEAtzQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Middleton <robert.middleton@rm5248.com>, linux-gpio@vger.kernel.org

On 10/02/2017 04:11, Robert Middleton wrote:
> Hi,
>
> I'm using Microchip's MCP23S17 as a GPIO expander on a board of mine
> and I've run into an issue with the driver.  One of my coworkers today
> discovered that if you switch on two inputs on the GPIO expander at
> once, only one will show up as changed from poll()(the code waits for
> the GPIO change as described in the documentation:
> https://www.kernel.org/doc/Documentation/gpio/sysfs.txt).  Looking at
> the driver, I eventually tracked it down to the fact that the MCP23S17
> seems to only set 1 bit in the INTF register, so if multiple inputs
> are changed at the same time the kernel will only process the first
> one.
>
> I fixed this on my side by reading the MCP_GPIO register when the
> interrupt comes in, but this changes the logic slightly for how the
> IRQ is handled(in mcp23s08_irq).  In my particular case, it doesn't
> seem to matter but I'm also running an older kernel(4.4.11).
>
> Two questions with this:
>
> 1. Is the IRQ handler the correct place to handle this?  It seems like
> it to me, but one of the comments in mcp23s08_get says "REVISIT
> reading this clears any IRQ ..." when reading the GPIO register.

Would need to see the patch to see what effect it may have.
I'm using the s18 variant for some interrupt driver keypad inputs so can test
your changes.

This is true for the mcp32s17, but the mcp23s18 is configurable with respect
to which register clears the interrupt.

> 2. If that is the right place to fix it, where is the correct place to
> send a patch/what is the process?  My understanding is that I would do
> a git send-email to this list, but I wanted to make sure my
> understanding is correct.

Yes.
 From memory the driver was recently updated to use regmap so you patch will need to apply against
those changes (if it doesn't already).


-- 
Regards
Phil Reid

