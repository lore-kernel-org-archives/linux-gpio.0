From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 13:43:23 +0100
Message-ID: <20151102124323.GA12503@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <20151102122514.GE20228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34071 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751738AbbKBMnS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 07:43:18 -0500
Received: by lfgh9 with SMTP id h9so14350237lfg.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 04:43:17 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151102122514.GE20228@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>

On Mon, Nov 02, 2015 at 12:25:14PM +0000, Mark Brown wrote:
> On Mon, Nov 02, 2015 at 11:31:16AM +0100, Johan Hovold wrote:
> > On Thu, Oct 22, 2015 at 10:32:25AM +0200, Linus Walleij wrote:
> 
> > > +	/*
> > > +	 * The "dev" member of gpiochip is the parent, and the actual
> > > +	 * device is named "device" for historical reasons.
> > > +	 *
> > > +	 * We memset the struct to zero to avoid reentrance issues.
> > > +	 */
> > > +	memset(&chip->device, 0, sizeof(chip->device));
> 
> > This is an indication of a larger problem.
> 
> > First of all, you must never register the same device structure twice.
> 
> Well, you can unregister and reregister (and it is reasonable practice
> to make sure that the struct isn't full of noise) - we usually allocate
> things out of kzalloc().

Actually, no. It's an explicitly forbidden practise to reregister the
same struct device.

> > And the larger problem is: With the current interface where a struct
> > gpio_chip is passed and registered, how would you prevent the device
> > from going away while in use?
> 
> Hrm, indeed.  Why aren't there complaints about a missing release
> function there?
> 
> > You grab a reference to the chip->device when opening the node (in a
> > later patch), but it is not used to manage the life time of struct
> > gpio_chip.
> 
> That's a slightly separate thing and even with a different
> implementation of the file we still have to assume that the driver core
> might hold a reference to the device for longer (for example as a result
> of sysfs interactions).

Yes, there may be other references, but sysfs should be ok due to the
kernfs active protection.

Johan
