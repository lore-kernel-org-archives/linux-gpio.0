From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Fri, 4 Dec 2015 16:31:17 -0600
Message-ID: <20151204223117.GA2861@qwerty.qwertyembedded>
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
Received: from mail-pa0-f49.google.com ([209.85.220.49]:35525 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751869AbbLDWbn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 17:31:43 -0500
Received: by pacej9 with SMTP id ej9so93225058pac.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2015 14:31:42 -0800 (PST)
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

Still quite a few place where a gpio_device is being access as if a gpio_chip:
gpio_device_set_desc_names
gpio_device_set_multiple
gpiod_hog
gpio_device_free_hogs
gpiolib_dbg_show
gpiolib_seq_show
..

There is still some calls to gpiod_to_chip which was changed to gpiod_to_device.
gpiod_hog
..

The gpiochip_add function prototype was changed in the header but the definition did not change.

Lots of work to do still. Let me know if and how I can help.

> Yours,
> Linus Walleij
