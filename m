From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pcf857x: handle only enabled irqs
Date: Tue, 16 Jun 2015 10:58:40 +0200
Message-ID: <CACRpkdZdivhsJcYrxYpr+rizcj9ZVGcxr5f1PD5DjxvZSScu8Q@mail.gmail.com>
References: <1433970069-30235-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433970069-30235-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2015 at 11:01 PM, Grygorii Strashko
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
> 21fd3cd1874a ('gpio: pcf857x: call the gpio user handler iff...')
>
> and then it was removed by commit
>  a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip...')
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Fixes: a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip helpers')
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>
> No functional changes.
> It's just rebased on top of "devel" branch
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git

Patch applied since no comments arrived.

Yours,
Linus Walleij
