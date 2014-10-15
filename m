From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/16] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Wed, 15 Oct 2014 09:33:01 +0200
Message-ID: <CACRpkda-DkGfEhWw14Dhw0ovf6Kmv6SYeefVFGuy83ZTzn=Caw@mail.gmail.com>
References: <1411929195-23775-1-git-send-email-ryazanov.s.a@gmail.com>
	<1411929195-23775-10-git-send-email-ryazanov.s.a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:42565 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239AbaJOHdC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Oct 2014 03:33:02 -0400
Received: by mail-ie0-f178.google.com with SMTP id rl12so660291iec.37
        for <linux-gpio@vger.kernel.org>; Wed, 15 Oct 2014 00:33:02 -0700 (PDT)
In-Reply-To: <1411929195-23775-10-git-send-email-ryazanov.s.a@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Sep 28, 2014 at 8:33 PM, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:

> Atheros AR5312 SoC have a builtin GPIO controller, which could be accessed
> via memory mapped registers. This patch adds new driver for them.
>
> Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org

This driver is extremely simple. You should be able to use
drivers/gpio/gpio-generic.c for this.

NAK for the time being.

> +#define AR5312_GPIO_CR_INT(x)  (1 << ((x)+8))  /* mask for interrupt */

Seems to be unused.
For a MMIO gpiochip using interrupts it's still possible
to use gpio-generic.c as a library-

> +#define AR5312_GPIO_CR_UART(x) (1 << ((x)+16)) /* uart multiplex */

That sounds like pin control business.

Yours,
Linus Walleij
