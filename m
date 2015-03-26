From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-dwapb: reset mask register on probe
Date: Thu, 26 Mar 2015 10:29:34 +0100
Message-ID: <CACRpkdbGOc4Rh4KUY5Z7cavE1QkdvFxkM7Q+oE5OXQdWPx9cmg@mail.gmail.com>
References: <1425372461-17859-1-git-send-email-abrodkin@synopsys.com>
	<CACRpkdaknfTMb=1LVqNLTtV8Te+mjRdSZ=grk4NUGxKBt6gpCg@mail.gmail.com>
	<1425934566.2312.16.camel@synopsys.com>
	<CACRpkdYMtAzWyshP0_x-qucz2j=1JE_=DE3Y7TARWGxDQxnurA@mail.gmail.com>
	<1426754640.2742.19.camel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:36218 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751718AbbCZJ3f (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Mar 2015 05:29:35 -0400
Received: by obdfc2 with SMTP id fc2so40768788obd.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2015 02:29:34 -0700 (PDT)
In-Reply-To: <1426754640.2742.19.camel@synopsys.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>

On Thu, Mar 19, 2015 at 9:44 AM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:

> So IMHO we need to update "gpio-dwapb" driver in the following manner:
>
>  [1] In dwapb_configure_irqs() in accordance to "snps,nr-gpios" in the
> first bank set a value in GPIO_INTEN. This way we turn N pins in that
> port/bank in "interrupt" mode from their default gpio mode.
>
>  [2] Don't expose dwapb_irq_enable()/dwapb_irq_disable() through
> ct->chip.irq_enable/ct->chip.irq_disable. Because we don't want to
> toggle modes of pins, right?
>
>  [3] Use ct->chip.irq_mask/ct->chip.irq_unmask for purpose of real
> enabling/disabling interrupts.
>
> If I'm not missing something that would be implementation that matches
> real device specification.
>
> If we do these changes then indeed we'll want to make sure GPIO_INTMASK
> is initialized with all interrupts masked out:
> --->8---
> dwapb_write(gpio, GPIO_INTMASK, 0xffffffff);
> --->8---
>
> Let me know if my proposal makes sense and then I'll send patch that
> implements it.

Sure as long as you can test it and it works, I'm fine with this.

I might be looking at migrating this quite popular driver to
GPIOLIB_IRQCHIP so would be happy if you can help out
testing it if I do this later.

Yours,
Linus Walleij
