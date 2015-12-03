From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Thu, 3 Dec 2015 15:26:04 -0600
Message-ID: <20151203212604.GA10240@qwerty.qwertyembedded>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
 <CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
 <20151105094411.GD7561@localhost>
 <CACRpkdavyg8f8fWoQBQCqRAJKxiZDiC72QDSsWjbk1b1v=u3Lw@mail.gmail.com>
 <CACRpkdbeFJMZ5vbHGFmPeG_5qTdKsL+2xL4RjKHF759PFiz5Yw@mail.gmail.com>
 <CACRpkdYhKnzccriPkL7B0xv5B0qOvpj3myK+ggk-7vKcT=q4kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34191 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950AbbLCV0a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2015 16:26:30 -0500
Received: by padhx2 with SMTP id hx2so75250777pad.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Dec 2015 13:26:30 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYhKnzccriPkL7B0xv5B0qOvpj3myK+ggk-7vKcT=q4kw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Thu, Dec 03, 2015 at 03:06:48PM +0100, Linus Walleij wrote:
> On Thu, Dec 3, 2015 at 3:04 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > 3-1. Split gpio_chip in a static descriptor with a vtable for callbacks
> >    and other static config called struct gpio_chip, and
> >    struct gpio_device that is returned as a pointer from
> >    gpiochip_add(). It will need to be free:ed by gpiodevice_remove()
> >    after that.
> 
> This will look something like this uglyhack:
> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/?h=gpiochip-desc&id=610b19c1832acfdf6ff62523addfa08b76f77343
>

Lots of red and green just in time for Christmas.

Let me take a look at what it would take to recover from said theoretical stab.
 
> Yours,
> Linus Walleij

