From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: interrupt consistency check for OF GPIO IRQs
Date: Thu, 22 Aug 2013 01:36:15 +0200
Message-ID: <CACRpkdYUeyVZcN1-jOzg0zo4eSJK1S+M5fJ0FcMsgwaPKW4Obw@mail.gmail.com>
References: <1377092334-770-1-git-send-email-larsi@wh2.tu-dresden.de>
	<1507189.CRWvzVJqTV@flatron>
	<521548E3.6010703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:38374 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806Ab3HUXgP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2013 19:36:15 -0400
Received: by mail-ob0-f175.google.com with SMTP id xn12so2216245obc.34
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2013 16:36:15 -0700 (PDT)
In-Reply-To: <521548E3.6010703@wwwdotorg.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Lars Poeschel <larsi@wh2.tu-dresden.de>, Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, galak@codeaurora.org, Pawel Moll <pawel.moll@arm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Enric Balletbo i Serra <eballetbo@gmail.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@linaro.org>, Balaji T K <balajitk@ti.com>, Tony Lindgren <tony@atomide.com>, Jon Hunter <jgchunter@gmail.com>

On Thu, Aug 22, 2013 at 1:10 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
[Me]
>>> check if these in turn reference the interrupt-controller, and
>>> if they do, loop over the interrupts used by that child and
>>> perform gpio_request() and gpio_direction_input() on these,
>>> making them unreachable from the GPIO side.
>
> What about bindings that require a GPIO to be specified, yet don't allow
> an IRQ to be specified, and the driver internally does perform
> gpio_to_irq() on it? I don't think one can detect that case.

This is still allowed. Consumers that prefer to have a GPIO
passed and convert it to IRQ by that call can still do so,
they will know what they're doing and will not cause the
double-command situation that we're trying to solve.

> Isn't it better to have the IRQ chip's .request() operation convert the
> IRQ to a GPIO if relevant (which it can do since it has specific
> knowledge of the HW) and take ownership of the GPIO at that level?

We tried this in the OMAP case, but apart from that the OMAP
driver blew up so we had to revert the patches, it also means
the same code needs to go into each and every driver
instead of solving the dilemma centrally like this.

> I vaguely recall seeing patches along those lines before, but there must
> have been some other problem pointed out...

You bet. It turns out these patches break the case which you
just described above, whereas this patch does not.

OMAP had drivers that used gpio_to_irq() *and* it had drivers
that used the GPIO controller node as interrupt parent.
So when they fixes .request() as per above, the latter started
working properly whereas the former started breaking.

Yours,
Linus Walleij
