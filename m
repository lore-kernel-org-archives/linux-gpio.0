From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Thu, 3 Dec 2015 15:04:14 +0100
Message-ID: <CACRpkdbeFJMZ5vbHGFmPeG_5qTdKsL+2xL4RjKHF759PFiz5Yw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
	<20151102103116.GE8676@localhost>
	<CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
	<CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
	<20151105094411.GD7561@localhost>
	<CACRpkdavyg8f8fWoQBQCqRAJKxiZDiC72QDSsWjbk1b1v=u3Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:32844 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755560AbbLCOEP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2015 09:04:15 -0500
Received: by obbww6 with SMTP id ww6so53439331obb.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Dec 2015 06:04:14 -0800 (PST)
In-Reply-To: <CACRpkdavyg8f8fWoQBQCqRAJKxiZDiC72QDSsWjbk1b1v=u3Lw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Mon, Nov 16, 2015 at 3:27 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> If I don't use device_add()/device_del(), I see this must mean I have to use
> device_register()/device_unregister() as the latter only decrease the refcount
> and wait for the instance to die off.
>
> So am I reading it correctly if I understand that this is what we should be
> doing? I.e device_register()/device_unregister() and then wait for the
> .remove() call to do its deed, so the kobj/struct device is kept around if
> e.g. sysfs or the chardev has open files.

Hard to get advice on design here I see. Anyways, the clean thing to
do (after some weeks of thinking) seems to be this:

1. Introduce a void *data into gpio_chip and gpiochip_set_data()
   gpiochip_get_data() set/get it.

2. Replace all occurences of container_of() dereferencing in all
   GPIO drivers with gpiochip_[set|get]_data() so as to avoid having
   gpio_chip to be embedded into state containers.

3-1. Split gpio_chip in a static descriptor with a vtable for callbacks
   and other static config called struct gpio_chip, and
   struct gpio_device that is returned as a pointer from
   gpiochip_add(). It will need to be free:ed by gpiodevice_remove()
   after that.

3-2. In the same patch set rename all functions to indicate that
   we are now operating on a gpio_device not a gpio_chip.

3-3. After a GPIO driver issues gpio_device_unregister()
   it may stay around if there are still references to the
   struct device.

This is a very tiresome refactoring, but I'm growing confident that
it is what needs to happen to manage gpio devices in the future.

After step 3-3 we have a clean gpio_device containing a
struct device, and from there we apply the initial chardev
interface.

Yours,
Linus Walleij
