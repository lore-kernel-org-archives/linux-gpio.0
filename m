From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/6] gpio: make the gpiochip a real device
Date: Mon, 2 Nov 2015 14:25:26 +0100
Message-ID: <20151102132526.GB12752@localhost>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
 <1445502750-22672-2-git-send-email-linus.walleij@linaro.org>
 <20151102103116.GE8676@localhost>
 <20151102122514.GE20228@sirena.org.uk>
 <20151102124323.GA12503@localhost>
 <20151102124737.GG20228@sirena.org.uk>
 <20151102125347.GA12752@localhost>
 <20151102130633.GH20228@sirena.org.uk>
 <20151102131456.GC12503@localhost>
 <20151102131701.GI20228@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:34785 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753469AbbKBNZV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2015 08:25:21 -0500
Received: by lbbwb3 with SMTP id wb3so87768300lbb.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2015 05:25:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151102131701.GI20228@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Amit Kucheria <amit.kucheria@linaro.org>

On Mon, Nov 02, 2015 at 01:17:01PM +0000, Mark Brown wrote:
> On Mon, Nov 02, 2015 at 02:14:56PM +0100, Johan Hovold wrote:
> > On Mon, Nov 02, 2015 at 01:06:33PM +0000, Mark Brown wrote:
> 
> > > > Dynamically allocated struct device are not the problem as then you're
> > > > not *reusing* the same device structure.
> 
> > > You may end up doing exactly that depending on what you get back from
> > > the allocator of course.
> 
> > But then the memory has already been released. You're not deregistering
> > and reregistering the same device as in your example.
> 
> Depends on your definition of "same" :)  You might get the same address
> back which has been known to confuse unhelpfully designed things.

Yeah, I got your point, but again my claim was that 

	device_unregister(dev);
	memset(dev);
	device_initialise(dev);
	...
	device_add(dev);

is not legal (and the current patch does not prevent this).

Johan
