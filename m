From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH 030/182] gpio: lpc18xx: use gpiochip data pointer
Date: Sun, 13 Dec 2015 13:49:02 +0100
Message-ID: <CAGhQ9VweDMhwTPWrjz6zfhaJqh_McWDMrsyZawQB_LF9RvoumA@mail.gmail.com>
References: <1449667013-31170-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:38322 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064AbbLMMtE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2015 07:49:04 -0500
Received: by igbxm8 with SMTP id xm8so67033577igb.1
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2015 04:49:03 -0800 (PST)
In-Reply-To: <1449667013-31170-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On 9 December 2015 at 14:16, Linus Walleij <linus.walleij@linaro.org> wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Joachim Eastwood <manabian@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Joachim Eastwood <manabian@gmail.com>


> Joachim: this driver looks very simplistic, it seems it can
> be totally replaced with drivers/gpio/gpio-generic.c provided
> that some (optional) clock handling is added to the generic GPIO
> driver, if you have some time, please look into that.

I don't think gpio-generic supports one big gpio namespace of 256
gpios which this driver uses.


regards,
Joachim Eastwood
