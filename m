From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] Revert "gpiolib: Split GPIO flags parsing and GPIO
 configuration"
Date: Tue, 5 Jul 2016 10:56:02 +0200
Message-ID: <20160705085602.GB17168@localhost>
References: <1467563525-30227-1-git-send-email-johan@kernel.org>
 <58708801.29lRIIaT3y@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33952 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754553AbcGEJKx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2016 05:10:53 -0400
Content-Disposition: inline
In-Reply-To: <58708801.29lRIIaT3y@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 04, 2016 at 11:33:16PM +0300, Laurent Pinchart wrote:
> Hi Johan,
> 
> Thank you for the patch.
> 
> On Sunday 03 Jul 2016 18:32:05 Johan Hovold wrote:
> > This reverts commit 923b93e451db876d1479d3e4458fce14fec31d1c.
> > 
> > Make sure consumers do not overwrite gpio flags for pins that have
> > already been claimed.
> > 
> > While adding support for gpio drivers to refuse a request using
> > unsupported flags, the order of when the requested flag was checked and
> > the new flags were applied was reversed to that consumers could
> > overwrite flags for already requested gpios.
> > 
> > This not only affects device-tree setups where two drivers could request
> > the same gpio using conflicting configurations, but also allowed user
> > space to clear gpio flags for already claimed pins simply by attempting
> > to export them through the sysfs interface. By for example clearing the
> > FLAG_ACTIVE_LOW flag this way, user space could effectively change the
> > polarity of a signal.
> > 
> > Reverting this change obviously prevents gpio drivers from doing sanity
> > checks on the flags in their request callbacks. Fortunately only one
> > recently added driver (gpio-tps65218 in v4.6) appears to do this, and a
> > follow up patch could restore this functionality through a different
> > interface.
> 
> As we're not dealing with a v4.7 regression that would need to be
> applied this week, can't you propose a proper fix instead of a
> revert ?

The patch that caused this regression is just plain broken, and AFAICT
trying to fix that will amount to something that is hardly stable
material (e.g. modifying the request callback prototype for all gpio
drivers, after effectively reverting most of the patch anyway).

On the up-side no one seems to be relying on the new feature of allowing
gpio drivers to nak requests using unsupported flags before 4.6, and in
4.6 only the one driver mentioned above does use it.

So by reverting now, before 4.7 is out, we have unbroken all gpio
drivers in all released kernels at the expense of a removed sanity check
from one driver in 4.6.

This new feature can then be implemented properly in the 4.8-rc
time frame (or even before 4.7 is out if you're fast).

As to the severity of the regression, it's bad enough to have an
unrelated driver or user space be able to overwrite the flags of an
already requested pin. Inverting polarity, for example, could lead to
all sorts of interesting breakage and in the worst case even damage
hardware.

The bug is also made harder to track down due to the fact that the
corrupted flags will typically only take effect on subsequent state
changes after the pin has first been initialised. This means that a
system can appear to work for example up until a suspend cycle where a
regulator is disabled (or so you thought).

I hit this myself over the weekend, and it's possible others have too
even if this regression hasn't been reported until now.

Thanks,
Johan
