From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] USB: ftdi_sio: add GPIO support
Date: Fri, 13 Jun 2014 09:25:07 +0200
Message-ID: <CACRpkdbiob-2d4sTmj8bZxo5GVZ0TvF5CT_W94BDsSNiEfB7kQ@mail.gmail.com>
References: <1402320115-13171-1-git-send-email-x-linux@infra-silbe.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:46349 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbaFMHZI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jun 2014 03:25:08 -0400
Received: by mail-ob0-f171.google.com with SMTP id nu7so2525229obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jun 2014 00:25:08 -0700 (PDT)
In-Reply-To: <1402320115-13171-1-git-send-email-x-linux@infra-silbe.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sascha Silbe <x-linux@infra-silbe.de>
Cc: Johan Hovold <jhovold@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 9, 2014 at 3:21 PM, Sascha Silbe <x-linux@infra-silbe.de> wrote:

> The chips can operate either in regular or in bitbang mode. Care was
> taken to prevent using GPIOs if the serial device is in use and vice
> versa.

Very interesting patch! I've seen USB-based GPIO things before
but never a dual-mode thing.

There was already a comment to move the implementation to a
separate file, which I won't repeat.

But I also want to bring the device model into question: normally
when a mother device spawns children across different subsystems
we model them as MFD devices (drivers/mfd) that instantiate
children for the different subsystems. So you could spawn a
serial and a GPIO device from a USB-based hub device there.

I do not know if that is really apropriate in this case. It seems the
device is first and foremost FTDI.

But it could still spawn a child platform device for the GPIO stuff
so that this can live as a separate driver under drivers/gpio/gpio-ftdi.c
or similar.

You could then use something like:

struct platform_device *gdev;

gdev = platform_device_alloc("gpio-ftdi", PLATFORM_DEVID_AUTO);
/* pdata contains communication cookie for callbacks etc */
ret = platform_device_add_data(gdev, pdata, sizeof(*pdata));
ret = platform_device_add(gdev);

Then we can probe that device normally in the GPIO subsystem
like any other driver, just that it needs some
<linux/usb/ftdi.h> header or similar to define the function
calls to communicate with the FTDI driver.

However Greg is device core maintainer and may have better
ideas about this!

Yours,
Linus Walleij
