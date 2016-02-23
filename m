From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] kernel/resource.c: fix muxed resource handling in
 __request_region()
Date: Tue, 23 Feb 2016 21:38:35 +0000
Message-ID: <20160223213835.50e42ca5@lxorguk.ukuu.org.uk>
References: <20150909220140.GD9892@kw.sim.vm.gnt>
	<1441836918-24159-1-git-send-email-simon.guinot@sequanux.org>
	<20160219221056.23487da2@x2>
	<56C7A459.1090801@virtuousgeek.org>
	<CA+55aFx9-itKjqahUnXAoeDNgbi1MeNH5gDQB8Sw9AguPwGefQ@mail.gmail.com>
	<15300c0ce08.2710.f266623ac48c822f02e65082a71b2734@virtuousgeek.org>
	<1456148952.24303.273.camel@linux.intel.com>
	<56CB7391.30203@virtuousgeek.org>
	<20160223161920.GB3840@kw.sim.vm.gnt>
	<56CC9489.7060706@virtuousgeek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:54094 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751370AbcBWVjS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2016 16:39:18 -0500
In-Reply-To: <56CC9489.7060706@virtuousgeek.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Simon Guinot <simon.guinot@sequanux.org>, Alan Cox <alan@linux.intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, Vincent Pelletier <plr.vincent@gmail.com>, Giel van Schijndel <me@mortis.eu>, linux-gpio@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@sculo.fr>, Linus Walleij <linus.walleij@linaro.org>

> > IORESOURCE_MUXED is a convenient way to deal with that. For some code
> > examples you can look at the superio_* functions in the IT87 drivers:
> > gpio/gpio-it87.c, hwmon/it87.c and watchdog/it87_wdt.c.
> > 
> > I am not aware of any other users for IORESOURCE_MUXED.
> > 
> > Let me know how you want to go and if you need my help.  
> 
> I'd be happy if you proposed a patch.  It would also be nice if we could
> somehow more formally limit the MUXED usage to these super I/O devices,
> just so other users don't get into trouble thinking it's more general
> than it is.

Today I think the problem wouldn't exist. We'd tell the authors of the
drivers to create an mfd or similar to manage the resources and load the
appropriate extra goodies.

Alan
