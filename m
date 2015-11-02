From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 14:14:56 +0100
Message-ID: <20151102131456.GC12503@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <20151102122514.GE20228@sirena.org.uk>
 <20151102124323.GA12503@localhost>
 <20151102124737.GG20228@sirena.org.uk>
 <20151102125347.GA12752@localhost>
 <20151102130633.GH20228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34511 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbbKBNOu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 08:14:50 -0500
Received: by lfgh9 with SMTP id h9so14720624lfg.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 05:14:49 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151102130633.GH20228@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>

On Mon, Nov 02, 2015 at 01:06:33PM +0000, Mark Brown wrote:
> On Mon, Nov 02, 2015 at 01:53:47PM +0100, Johan Hovold wrote:
> > On Mon, Nov 02, 2015 at 12:47:37PM +0000, Mark Brown wrote:
> 
> > > A memset() should be enough, if not then we have problems with any
> > > dynamically allocated struct device.
> 
> > And how would you know that it is safe to memset that struct device?
> > There can still be references to it. And driver core explicitly forbids
> > this (see device_add() for example).
> 
> My point here is that the memset() of something that was passed in
> externally isn't really a problem, it's the suspicious lack of
> integration with a release function (hence my question about why the
> driver core isn't complaining when the device gets registered).  The
> comment is more of a concern than the memset() itself.

Precisely, the memset itself is not the problem, but rather why was done
in the first place:

	*  We memset the struct to zero to avoid reentrance issues.
	*/

And to that point, I mentioned that it is illegal to register the same
struct device twice (and that this was indicative of a larger problem).

> > Dynamically allocated struct device are not the problem as then you're
> > not *reusing* the same device structure.
> 
> You may end up doing exactly that depending on what you get back from
> the allocator of course.

But then the memory has already been released. You're not deregistering
and reregistering the same device as in your example.

> The point is to make sure that that the driver
> model called release(), dynamically allocating and freeing in the
> release function is the easiest way to do this but it's not magic.

Agreed.

Johan
