From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Tue, 3 Nov 2015 22:24:53 +0100
Message-ID: <CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
	<20151102103116.GE8676@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:36318 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755968AbbKCVYy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2015 16:24:54 -0500
Received: by obdgf3 with SMTP id gf3so23585238obd.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2015 13:24:53 -0800 (PST)
In-Reply-To: <20151102103116.GE8676@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Mon, Nov 2, 2015 at 11:31 AM, Johan Hovold <johan@kernel.org> wrote:
> On Thu, Oct 22, 2015 at 10:32:25AM +0200, Linus Walleij wrote:

>> +      * We memset the struct to zero to avoid reentrance issues.
>> +      */
>> +     memset(&chip->device, 0, sizeof(chip->device));
>
> This is an indication of a larger problem.
>
> First of all, you must never register the same device structure twice.
>
> And the larger problem is: With the current interface where a struct
> gpio_chip is passed and registered, how would you prevent the device
> from going away while in use?

OK I see. What about the design pattern elsewhere to pass a
gpiochip desc and have a new gpiochip_register() create the
gpiochip and delete gpiochip_add()?

That's the usual pattern in subsystems.

> You grab a reference to the chip->device when opening the node (in a
> later patch), but it is not used to manage the life time of struct
> gpio_chip.

OK I think the above approach should solve that?

Yours,
Linus Walleij
