From: Davide Hug <d@videhug.ch>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines
 used as irq?
Date: Thu, 13 Jul 2017 22:17:29 +0200
Message-ID: <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
        <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
        <alpine.DEB.2.20.1707122330060.2510@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from s067.cyon.net ([149.126.4.76]:39900 "EHLO s067.cyon.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753097AbdGMUTL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Jul 2017 16:19:11 -0400
In-Reply-To: <alpine.DEB.2.20.1707122330060.2510@nanos>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Thanks. I probably should have pointed out that I'm just getting started.
I thought this driver that does not load would be a good place to do that. But
obviously a "completely broken" driver that "breaks with the current semantics
of the GPIO interrupt" is the wrong place to get started and learn how things
should be done.

So this driver should probably be rewritten using timer based polling and the
descriptor based gpio interface. But since it is a really specific driver for
sensors that are already discontinued it probably doesn't make much sense. And
I'm not yet up to the task anyway.

Are the drivers listed in Documentation/gpio/drivers-on-gpio.txt good examples
of GPIO consumer drivers?

Thanks again.
Davide
