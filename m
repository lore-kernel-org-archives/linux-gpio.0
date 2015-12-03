From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Thu, 3 Dec 2015 15:06:48 +0100
Message-ID: <CACRpkdYhKnzccriPkL7B0xv5B0qOvpj3myK+ggk-7vKcT=q4kw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
	<20151102103116.GE8676@localhost>
	<CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
	<CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
	<20151105094411.GD7561@localhost>
	<CACRpkdavyg8f8fWoQBQCqRAJKxiZDiC72QDSsWjbk1b1v=u3Lw@mail.gmail.com>
	<CACRpkdbeFJMZ5vbHGFmPeG_5qTdKsL+2xL4RjKHF759PFiz5Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:35493 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519AbbLCOGt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2015 09:06:49 -0500
Received: by obbnk6 with SMTP id nk6so53446011obb.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Dec 2015 06:06:48 -0800 (PST)
In-Reply-To: <CACRpkdbeFJMZ5vbHGFmPeG_5qTdKsL+2xL4RjKHF759PFiz5Yw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Dec 3, 2015 at 3:04 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> 3-1. Split gpio_chip in a static descriptor with a vtable for callbacks
>    and other static config called struct gpio_chip, and
>    struct gpio_device that is returned as a pointer from
>    gpiochip_add(). It will need to be free:ed by gpiodevice_remove()
>    after that.

This will look something like this uglyhack:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/?h=gpiochip-desc&id=610b19c1832acfdf6ff62523addfa08b76f77343

Yours,
Linus Walleij
