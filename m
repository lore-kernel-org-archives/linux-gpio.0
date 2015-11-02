From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 13:53:47 +0100
Message-ID: <20151102125347.GA12752@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <20151102122514.GE20228@sirena.org.uk>
 <20151102124323.GA12503@localhost>
 <20151102124737.GG20228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35284 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752479AbbKBMxl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 07:53:41 -0500
Received: by lbbes7 with SMTP id es7so87174821lbb.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 04:53:40 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151102124737.GG20228@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>

On Mon, Nov 02, 2015 at 12:47:37PM +0000, Mark Brown wrote:
> On Mon, Nov 02, 2015 at 01:43:23PM +0100, Johan Hovold wrote:
> > On Mon, Nov 02, 2015 at 12:25:14PM +0000, Mark Brown wrote:
> 
> > > > First of all, you must never register the same device structure twice.
> 
> > > Well, you can unregister and reregister (and it is reasonable practice
> > > to make sure that the struct isn't full of noise) - we usually allocate
> > > things out of kzalloc().
> 
> > Actually, no. It's an explicitly forbidden practise to reregister the
> > same struct device.
> 
> A memset() should be enough, if not then we have problems with any
> dynamically allocated struct device.

And how would you know that it is safe to memset that struct device?
There can still be references to it. And driver core explicitly forbids
this (see device_add() for example).

Dynamically allocated struct device are not the problem as then you're
not *reusing* the same device structure.

Johan
