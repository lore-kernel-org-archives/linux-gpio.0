From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/6] GPIO character device skeleton
Date: Fri, 30 Oct 2015 23:54:48 +0100
Message-ID: <3839397.mYWtgokiUO@wuerfel>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org> <20151024184253.GC22220@pengutronix.de> <CACRpkdYiQ=eQpUNspRH27x=9soExn-Mx5Rhc7USqAk7g5DNG_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:63259 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753286AbbJ3Wyw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2015 18:54:52 -0400
In-Reply-To: <CACRpkdYiQ=eQpUNspRH27x=9soExn-Mx5Rhc7USqAk7g5DNG_A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>

On Friday 30 October 2015 15:43:18 Linus Walleij wrote:
> On Sat, Oct 24, 2015 at 8:42 PM, Markus Pargmann <mpa@pengutronix.de> wrote:
> 
> > What happens if we have two I2C gpio expanders with the same I2C
> > addresses connected to different I2C busses? If I see this correctly
> > they would both show up with the same name. Is there an easy and
> > race-free way to see which GPIO chip is connected to which I2C bus?
> 
> My spontaneous question is: how does ethernet interfaces or whatever
> handle this nowadays to get unique device names?
> 
> Currently we are probe-order dependent. It would be good to fix
> the plug-order business from day 1 but how?

ethernet devices are in their own namespace but can get renamed according
to distro-specific policy. A common method is to keep a record of all
mac addresses that were seen in a file in /etc (e.g.
/etc/udev/rules.d/70-persistent-net.rules) and rename them to whatever
they were previously known as when they show up with a different name.

For character devices, udev has a complex set of (user-overridable) rules
to derive one or more stable name(s) from the sysfs attributes.

	Arnd

