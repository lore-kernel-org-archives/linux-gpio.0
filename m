From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Expose named GPIOs through sysfs
Date: Tue, 14 Jun 2016 09:31:58 +0200
Message-ID: <CACRpkdY1+9qm6WunTkQ3-3udtvOuPYXx5M-O4+vPR3XyqLuAOQ@mail.gmail.com>
References: <573CD3FA.10306@elecsyscorp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35131 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791AbcFNHb7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 03:31:59 -0400
Received: by mail-oi0-f54.google.com with SMTP id w5so164752120oib.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2016 00:31:59 -0700 (PDT)
In-Reply-To: <573CD3FA.10306@elecsyscorp.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kevin Smith <kevin.smith@elecsyscorp.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, May 18, 2016 at 10:43 PM, Kevin Smith
<kevin.smith@elecsyscorp.com> wrote:

> I have several GPIOs that are not associated with kernel drivers that I
> would like to expose to userspace with names corresponding to their
> functions.  I am on Arm, so I would like to be able to specify this
> through a device tree.

You can now use gpio-line-names = ... to name GPIO lines on DT
systems, see
commit fd9c55315db9bc89c54bb644a0f8b1f9306010d4
"gpio: of: make it possible to name GPIO lines"

Using "lsgpio" from tools/gpio you should be able to see a list
of GPIO controllers, their lines, and line names. More details
of the gpiochip topology can then be read from sysfs if need be.

> As a concrete example, I have a USB device that is controlled with a
> userspace libusb driver which has a reset pin connected by GPIO.

This seems super fragile. I hope you are just considering this for
prototyping and not as a permanent solution for random users?

>  I
> would like to expose this line as dev_reset.  Right now, userspace has
> to know the GPIO number, export the gpio, manually configure it as an
> output, then set its value.  Instead, I would like the device to simply
> show up as /sys/class/gpio/dev_reset/ (or similar) with the expected
> GPIO properties in this directory.

This ABI is obsoleted. We are working on the new character device
to do what you want to do. I am busy iterating it and plan to merge it
for kernel v4.8:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/log/?h=chardev-step-2

> As a workaround, I have seen some people configure GPIOs with the LED
> driver and control the pin with "brightness", but this seems like a
> hack.

Urrrk no.

Read Documentation/gpio/drivers-on-gpio.txt

I think two things:

1. Should such a complex device really be handled by libusb?
I mean libusb has this nice microkernel feeling about it for scanners
and media players, but it is implicit that it is "just USB" no extra
wires. I suspect libusb should be used for prototyping but the device
should have a real kernel driver, because the hardware is too complex
for userspace access only. A kernel driver can handle that complexity.

2. If you insist, I think drivers/reset/* should have some external
userspace ABI (which it doesn't today).

> I am aware of gpio-hog, but as far as I can tell, once hogged,
> the GPIO is not exposed and cannot be changed (at least by userspace).

That is not the usecase for hogs. Hogs are "set once, never touch".

Yours,
Linus Walleij
