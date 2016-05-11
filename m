From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: Let gpio_chip.to_irq() return zero on error
Date: Wed, 11 May 2016 13:29:14 +0200
Message-ID: <CACRpkdaWMQYi81SALcN4n3W8_=Bm5-e+-BGpFv2jF-9c6JAOrg@mail.gmail.com>
References: <1462350113-20216-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33847 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751386AbcEKL3P (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2016 07:29:15 -0400
Received: by mail-oi0-f45.google.com with SMTP id k142so62130651oib.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2016 04:29:15 -0700 (PDT)
In-Reply-To: <1462350113-20216-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org

On Wed, May 4, 2016 at 10:21 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currrently the gpio_chip.to_irq() callback returns -ENOSYS on error,
> which causes bad interactions with the serial_mctrl_gpio helpers.
>
> mctrl_gpio_init() returns -ENOSYS if GPIOLIB is not enabled, which is
> intended to be ignored by its callers. However, ignoring -ENOSYS when it
> was caused by a gpiod_to_irq() failure will lead to a crash later:
>
>     Unable to handle kernel paging request at virtual address ffffffde
>     ...
>     PC is at mctrl_gpio_set+0x14/0x78
>
> Fix this by returning zero instead, like gpiochip_to_irq() does.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "gpio: make gpiod_to_irq() return negative for NO_IRQ"
> for proper handling by callers of mctrl_gpio_init().
> Hence I think it's best to take this through the GPIO tree, after the
> above has been applied.
>
> v2:
>   - Return zero instead of -ENXIO.

Patch applied.

Yours,
Linus Walleij
