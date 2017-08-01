From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines used
 as irq?
Date: Tue, 1 Aug 2017 09:37:12 +0200
Message-ID: <CACRpkdZ2gm6gE+M2OLHBchUtS+F-L+UYSVSZyXOJin9j9Q4EVg@mail.gmail.com>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
 <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
 <alpine.DEB.2.20.1707122330060.2510@nanos> <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f44.google.com ([209.85.214.44]:34917 "EHLO
        mail-it0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750832AbdHAHhO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 03:37:14 -0400
Received: by mail-it0-f44.google.com with SMTP id h199so3705953ith.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 00:37:13 -0700 (PDT)
In-Reply-To: <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Davide Hug <d@videhug.ch>
Cc: Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jul 13, 2017 at 10:17 PM, Davide Hug <d@videhug.ch> wrote:

> Thanks. I probably should have pointed out that I'm just getting started.
> I thought this driver that does not load would be a good place to do that. But
> obviously a "completely broken" driver that "breaks with the current semantics
> of the GPIO interrupt" is the wrong place to get started and learn how things
> should be done.
>
> So this driver should probably be rewritten using timer based polling and the
> descriptor based gpio interface. But since it is a really specific driver for
> sensors that are already discontinued it probably doesn't make much sense. And
> I'm not yet up to the task anyway.

I'm not so sure about that. You might be the only one with the right hardware
to fix the problem. Also it is never our intention to discourage anyone to
hack on the kernel.

If you have this hardware and know what you want to get out of it, go for it.

> Are the drivers listed in Documentation/gpio/drivers-on-gpio.txt good examples
> of GPIO consumer drivers?

I think some, I am fixing others, anything just including
<linux/gpio/consumer.h>
and no other GPIO header are usually good examples.

Yours,
Linus Walleij
