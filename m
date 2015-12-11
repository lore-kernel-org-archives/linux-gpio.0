From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Fri, 11 Dec 2015 18:58:23 +0100
Message-ID: <CACRpkdaRyuusbmn0O+2GsAAFGPX3yn3GTx4pzYyucnn74PgkqQ@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
	<20151102103116.GE8676@localhost>
	<CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
	<CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
	<20151105094411.GD7561@localhost>
	<CACRpkdavyg8f8fWoQBQCqRAJKxiZDiC72QDSsWjbk1b1v=u3Lw@mail.gmail.com>
	<CACRpkdbeFJMZ5vbHGFmPeG_5qTdKsL+2xL4RjKHF759PFiz5Yw@mail.gmail.com>
	<CACRpkdYhKnzccriPkL7B0xv5B0qOvpj3myK+ggk-7vKcT=q4kw@mail.gmail.com>
	<20151204223117.GA2861@qwerty.qwertyembedded>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:34268 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876AbbLKR6Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2015 12:58:24 -0500
Received: by obciw8 with SMTP id iw8so88838182obc.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2015 09:58:23 -0800 (PST)
In-Reply-To: <20151204223117.GA2861@qwerty.qwertyembedded>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Welling <mwelling@ieee.org>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Fri, Dec 4, 2015 at 11:31 PM, Michael Welling <mwelling@ieee.org> wrote:
> On Thu, Dec 03, 2015 at 03:06:48PM +0100, Linus Walleij wrote:
>> On Thu, Dec 3, 2015 at 3:04 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> > 3-1. Split gpio_chip in a static descriptor with a vtable for callbacks
>> >    and other static config called struct gpio_chip, and
>> >    struct gpio_device that is returned as a pointer from
>> >    gpiochip_add(). It will need to be free:ed by gpiodevice_remove()
>> >    after that.
>>
>> This will look something like this uglyhack:
>> https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/?h=gpiochip-desc&id=610b19c1832acfdf6ff62523addfa08b76f77343
>>
>
> Still quite a few place where a gpio_device is being access as if a gpio_chip:
> gpio_device_set_desc_names
> gpio_device_set_multiple
> gpiod_hog
> gpio_device_free_hogs
> gpiolib_dbg_show
> gpiolib_seq_show
> ..
>
> There is still some calls to gpiod_to_chip which was changed to gpiod_to_device.
> gpiod_hog
> ..
>
> The gpiochip_add function prototype was changed in the header but the definition did not change.
>
> Lots of work to do still. Let me know if and how I can help.

Yeah it doesn't even compile. It was more to illustrate.

I am now figuring out how to proceed after merging 187 patches
removing the use of container_of() from all GPIO drivers.

Yours,
Linus Walleij
