From: Robert Middleton <robert.middleton@rm5248.com>
Subject: MCP23S08 driver bug - multiple inputs changing
Date: Thu, 9 Feb 2017 15:11:33 -0500
Message-ID: <CAKpcJVYw9MzWU6HUtZ35GXakMfRxS1U0fzu7SO-8bExgsEAtzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub5.mail.dreamhost.com ([208.113.200.129]:56378 "EHLO
        homiemail-a59.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752060AbdBIUMF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Feb 2017 15:12:05 -0500
Received: from homiemail-a59.g.dreamhost.com (localhost [127.0.0.1])
        by homiemail-a59.g.dreamhost.com (Postfix) with ESMTP id 2FA32600270C
        for <linux-gpio@vger.kernel.org>; Thu,  9 Feb 2017 12:11:34 -0800 (PST)
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com [74.125.82.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: robert.middleton@rm5248.com)
        by homiemail-a59.g.dreamhost.com (Postfix) with ESMTPSA id 1BD57600270B
        for <linux-gpio@vger.kernel.org>; Thu,  9 Feb 2017 12:11:34 -0800 (PST)
Received: by mail-ot0-f177.google.com with SMTP id 65so12031929otq.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Feb 2017 12:11:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

I'm using Microchip's MCP23S17 as a GPIO expander on a board of mine
and I've run into an issue with the driver.  One of my coworkers today
discovered that if you switch on two inputs on the GPIO expander at
once, only one will show up as changed from poll()(the code waits for
the GPIO change as described in the documentation:
https://www.kernel.org/doc/Documentation/gpio/sysfs.txt).  Looking at
the driver, I eventually tracked it down to the fact that the MCP23S17
seems to only set 1 bit in the INTF register, so if multiple inputs
are changed at the same time the kernel will only process the first
one.

I fixed this on my side by reading the MCP_GPIO register when the
interrupt comes in, but this changes the logic slightly for how the
IRQ is handled(in mcp23s08_irq).  In my particular case, it doesn't
seem to matter but I'm also running an older kernel(4.4.11).

Two questions with this:

1. Is the IRQ handler the correct place to handle this?  It seems like
it to me, but one of the comments in mcp23s08_get says "REVISIT
reading this clears any IRQ ..." when reading the GPIO register.
2. If that is the right place to fix it, where is the correct place to
send a patch/what is the process?  My understanding is that I would do
a git send-email to this list, but I wanted to make sure my
understanding is correct.

My current patch is on github, if that's easy for people to look at.

-Robert Middleton
