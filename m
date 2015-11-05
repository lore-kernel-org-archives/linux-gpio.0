From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Thu, 5 Nov 2015 10:44:11 +0100
Message-ID: <20151105094411.GD7561@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <CACRpkdaVu_1pAPd-7sUeGLEYymynA10WtuxJcnVPKZVYQOeruw@mail.gmail.com>
 <CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:36515 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932889AbbKEJoD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2015 04:44:03 -0500
Received: by lbblt2 with SMTP id lt2so12303592lbb.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2015 01:44:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkda6Ad4SGW5H4ZDLn0VLZzq0LqLxSC7f2gcCBDNWH5FMnA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Wed, Nov 04, 2015 at 11:48:47AM +0100, Linus Walleij wrote:
> On Tue, Nov 3, 2015 at 10:24 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Mon, Nov 2, 2015 at 11:31 AM, Johan Hovold <johan@kernel.org> wrote:
> >> On Thu, Oct 22, 2015 at 10:32:25AM +0200, Linus Walleij wrote:
> >
> >>> +      * We memset the struct to zero to avoid reentrance issues.
> >>> +      */
> >>> +     memset(&chip->device, 0, sizeof(chip->device));
> >>
> >> This is an indication of a larger problem.
> >>
> >> First of all, you must never register the same device structure twice.
> >>
> >> And the larger problem is: With the current interface where a struct
> >> gpio_chip is passed and registered, how would you prevent the device
> >> from going away while in use?
> >
> > OK I see. What about the design pattern elsewhere to pass a
> > gpiochip desc and have a new gpiochip_register() create the
> > gpiochip and delete gpiochip_add()?
> >
> > That's the usual pattern in subsystems.
> 
> Thinking about it maybe it's simplest to just make ->dev a pointer
> and kzalloc() it at gpiochip_add().
> 
> That should solve this.

You'd avoid ever reregistering the same struct device, but that would
not solve the bigger life-time issue by itself.

Johan
