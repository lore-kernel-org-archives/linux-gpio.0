From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: gpio-ftdi-cbus: add driver for FTDI CBUS GPIOs
Date: Wed, 15 Jul 2015 09:42:02 +0200
Message-ID: <CACRpkdYk4-74h2WziSdMcA8Yoe1h8V0O_QizWTZU1DmHEEdYPg@mail.gmail.com>
References: <1434838377-8042-1-git-send-email-stefan@agner.ch>
	<1434838377-8042-3-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33976 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751624AbbGOHmE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2015 03:42:04 -0400
Received: by obre1 with SMTP id e1so21380595obr.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2015 00:42:02 -0700 (PDT)
In-Reply-To: <1434838377-8042-3-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Greg KH <gregkh@linuxfoundation.org>, Sascha Silbe <x-linux@infra-silbe.de>, Philipp Hachtmann <hachti@hachti.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Jun 21, 2015 at 12:12 AM, Stefan Agner <stefan@agner.ch> wrote:

> This driver allows to use the CBUS pins, e.g. CBUS 0-3 on FT232R
> type of devices. Note that the pins need to be configured first
> by using I/O mode signal option in the EEPROM. This is _not_ the
> factory default configuration of any of the four pins.
>
> See also FTDI's Application Note AN_232R-01.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

I see no big problems with this driver but I guess the serial portions
are the controversial parts.

> +++ b/drivers/gpio/gpio-ftdi-cbus.c
> @@ -0,0 +1,167 @@
> +/*
> + * gpiolib support for FTDI SIO chips supporting CBUS GPIO's (FT232R class)
> + *
> + * Copyright 2015 Stefan Agner
> + *
> + * Author: Stefan Agner <stefan@agner.ch>
> + *
> + *  This program is free software; you can redistribute  it and/or modify it
> + *  under  the terms of  the GNU General  Public License as published by the
> + *  Free Software Foundation;  either version 2 of the  License, or (at your
> + *  option) any later version.
> + *
> + * Note: To use the GPIOs on CBUS the signal option need to be set to
> + * I/O mode in EEPROM!
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/gpio.h>

#include <linux/gpio/driver.h>

should be enough.

> +static int ftdi_cbus_gpio_direction_input(struct gpio_chip *chip,
> +                                         unsigned offset)
> +{
> +       struct ftdi_cbus_gpio *fcg = to_ftdi_cbus_gpio(chip);
> +
> +       fcg->cbus_mask &= ~((1 << offset) << 4);

I usually replace:

(1 << offset)

with

#include <linux/bitops.h>

BIT(offset)

so it's clear what is happening.

Yours,
Linus Walleij
