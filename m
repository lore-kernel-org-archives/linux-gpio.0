From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Clear the event latch register when
 disabling interrupts
Date: Thu, 16 Jul 2015 15:33:09 +0200
Message-ID: <CACRpkdY8+7JHi2KMvTW257DUSr=NzwqZAz5pWn46iTnxtRaNXQ@mail.gmail.com>
References: <55927F0B.80602@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:32805 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752346AbbGPNdJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 09:33:09 -0400
Received: by obbgp5 with SMTP id gp5so46775489obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 06:33:09 -0700 (PDT)
In-Reply-To: <55927F0B.80602@raspberrypi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonathan Bell <jonathan@raspberrypi.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>

On Tue, Jun 30, 2015 at 1:35 PM, Jonathan Bell <jonathan@raspberrypi.org> wrote:

> It's possible to hit a race condition if interrupts are generated on a GPIO
> pin when the IRQ line in question is being disabled.
>
> If the interrupt is freed, bcm2835_gpio_irq_disable() is called which
> disables the event generation sources (edge, level). If an event occurred
> between the last disabling of hard IRQs and the write to the event
> source registers, a bit would be set in the GPIO event detect register
> (GPEDSn) which goes unacknowledged by bcm2835_gpio_irq_handler()
> so Linux complains loudly.
>
> There is no per-GPIO mask register, so when disabling GPIO interrupts
> write 1 to the relevant bit in GPEDSn to clear out any stale events.
>
> Signed-off-by: Jonathan Bell <jonathan@raspberrypi.org>

Patch applied for fixes with Stephen's ACK, I had to rebase it
because of something, maybe whitespace mangling.

Yours,
Linus Walleij
