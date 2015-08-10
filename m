From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/6] gpiolib-sysfs: Show gpio-name in /sys/class/gpio/gpio*/name
Date: Mon, 10 Aug 2015 11:50:16 +0200
Message-ID: <CACRpkdZCSwWUuhbe2+nrEPTRnqNGvJrrbZLDwy8fkHeEJDujUg@mail.gmail.com>
References: <1438680203-13432-1-git-send-email-mpa@pengutronix.de>
	<1438680203-13432-6-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36301 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754821AbbHJJuQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2015 05:50:16 -0400
Received: by obnw1 with SMTP id w1so119575691obn.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2015 02:50:16 -0700 (PDT)
In-Reply-To: <1438680203-13432-6-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Arun Bharadwaj <arun@gumstix.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>

On Tue, Aug 4, 2015 at 11:23 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> This patch adds a sysfs attribute 'name' to gpios that were exported. It
> exposes the newly added name property of gpio descriptors.
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

This needs to also patch Documentation/ABI/testing/sysfs-gpio
if we should go with it. It says this:

    /sys/class/gpio
        /export ... asks the kernel to export a GPIO to userspace
        /unexport ... to return a GPIO to the kernel
        /gpioN ... for each exported GPIO #N
            /value ... always readable, writes fail for input GPIOs
            /direction ... r/w as: in, out (default low); write: high, low
            /edge ... r/w as: none, falling, rising, both

Anyways I don't know if this is right, and that ABI doc is also lying.

Look at this in gpiolib-sysfs.c:

        if (chip->names && chip->names[offset])
                ioname = chip->names[offset];

        dev = device_create_with_groups(&gpio_class, chip->dev,
                                        MKDEV(0, 0), data, gpio_groups,
                                        ioname ? ioname : "gpio%u",
                                        desc_to_gpio(desc));

I.e. what the ABI doc say about the dirs being named "gpioN" is
a plain lie, it can have a descriptive name as its directory  name
under /sys/class/gpio/foo-line or so.

Since this already exist and is a flat namespace ... we should
use that.

However it has the implication like I said before that two names
cannot be the same. I think Johan's comment that they could
be non-unique did not take into account the fact that two chips
could use the same .names array (and that would already fail,
by the way) so the .names in the struct gpio_chip *MUST* be
unique as compared to all other names.

We *could* deprecate the old line naming mechanism (that create
dirs named after the pin), and from here on only use gpioN and
"name" in a separate file like this patch does. However that is
not really OK either: we want to move away from the GPIO numbers
and to descriptors and descriptive names, so I currently feel
we should name the directories after the line instead, and
require them to be unique.

I'll have to patch this document now anyways because it is
lying about the ABI :(

Yours,
Linus Walleij
