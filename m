From: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Subject: Right amount of info in the DT
Date: Thu, 20 Apr 2017 11:54:19 +0200
Message-ID: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.bemta8.messagelabs.com ([216.82.243.205]:26419 "EHLO
        mail1.bemta8.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S944174AbdDTJyY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 20 Apr 2017 05:54:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, slash.tmp@free.fr, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>

Hello everybody,

I'm a kernel newbie trying to write a GPIO driver for my platform (ARM tango),
and I'd need some advice regarding the oddity of my hardware.

I have a bunch of GPIO groups all over the place (dedicated pins, UART pins,
ethernet pins, etc.), and even though they mainly behave similarly (same way of
handling direction and value), there are some differences between them:
- IRQs, because some groups can generate interrupts and others can't;
- Alternate functions (for instance GPIO mode vs UART mode), because obviously
  dedicated pins don't have an alternate function, and for the others which have
  it, the mode-changing register is sometimes before, sometimes after the other
  regs.

My question is: where to encode this information?

I've noticed that in other device trees, there's an irq-controller property that
could probably handle the first case, but for the second, I'm not sure what I
should do. I've thought of:
1) Making up a property that would tell the driver the offset of the mode
   register in the resource, but I'm afraid this is encoding too much HW
   info in the DT.
2) Making up a property or perhaps different compatible strings that would tell
   the driver which kind of GPIO group it's dealing with, but that would maybe
   make the driver quite ad-hoc.
3) Put in another resource to deal with the mode register, but the thing is,
   this register must not be written the same way for all groups.
4) Encoding all the information (offsets, number of GPIOs, etc.) in a const
   array within the driver, but that would defeat the purpose of a DT, would
   it not?

Any help appreciated!

Yves Lefloch
