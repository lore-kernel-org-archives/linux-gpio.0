From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pcf857x: handle only enabled irqs
Date: Wed, 10 Jun 2015 09:39:09 +0200
Message-ID: <CACRpkdaRb6FruKiYQg0g4ZO8cRnT5FSj==gkDb9GTvnnc=FTvg@mail.gmail.com>
References: <1433359988-3456-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35564 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751398AbbFJHjK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 03:39:10 -0400
Received: by oihd6 with SMTP id d6so26896253oih.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 00:39:09 -0700 (PDT)
In-Reply-To: <1433359988-3456-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

On Wed, Jun 3, 2015 at 9:33 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Now pcf857x_irq() IRQ's dispatcher will try to run nested
> IRQ handlers for each GPIO pin which state has changed.
> Such IRQs are, actually, spurious and nested IRQ handlers
> have to be called only for IRQs wich were enabled by users.
> This is not critical issue - just  /proc/interrupts
> will display counters for unused IRQS:
> 399:          4          0   pcf857x   0 Edge
> 428:          1          0   pcf857x  13 Edge
> 430:          1          0   pcf857x  15 Edge
>
> Hence, fix it by adding irq_enabled field in struct pcf857x to track
> enabled GPIO IRQs and corresponding callbacks in pcf857x_irq_chip.
>
> Similar functionality was presented in pcf857x driver, commit
>  21fd3cd1874a ('gpio: pcf857x: call the gpio user handler iff...')
>
> and then it was removed by commit
>  a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip...')
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Fixes: a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip helpers')
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

This patch does not apply on the "devel" branch in my GPIO
tree, please rebase it. I do not run a "fixes" branch this
late in the kernel cycle.

If the patch should go to stable it may be that you will need
to send this version separately to the stable maintainer
(Greg) after the rebased version goes upstream.

Yours,
Linus Walleij
