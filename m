From: Michael Welling <mwelling@ieee.org>
Subject: Re: Requesting as a GPIO a pin already used through pinctrl
Date: Thu, 22 Sep 2016 10:46:06 -0500
Message-ID: <20160922154606.GA23980@deathstar>
References: <20160916135808.GA17518@lukather>
 <CACRpkdbZ-TCNmmt4NyL2cQ2W3dE42uFGjQtxRyMxrf2ZUA_9Rg@mail.gmail.com>
 <20160921195128.GG8719@lukather>
 <20160921203435.GA14965@sysresccd>
 <20160922104852.GO8719@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35981 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753636AbcIVPqR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2016 11:46:17 -0400
Received: by mail-oi0-f46.google.com with SMTP id t83so102229377oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2016 08:46:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160922104852.GO8719@lukather>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>

On Thu, Sep 22, 2016 at 01:48:52PM +0300, Maxime Ripard wrote:
> On Wed, Sep 21, 2016 at 03:34:35PM -0500, Michael Welling wrote:
> > On Wed, Sep 21, 2016 at 10:51:28PM +0300, Maxime Ripard wrote:
> > > Hi Linus,
> > > 
> > > Thanks for your reply.
> > > 
> > > On Sun, Sep 18, 2016 at 01:30:24PM +0200, Linus Walleij wrote:
> > > > On Fri, Sep 16, 2016 at 3:58 PM, Maxime Ripard
> > > > <maxime.ripard@free-electrons.com> wrote:
> > > > 
> > > > > However, things are getting weird when you have that requested pin
> > > > > assigned to one device, and you try to export the GPIO on that pin
> > > > > (through sysfs for example,
> > > > 
> > > > DON'T use sysfs. Use the new chardev ABI which is by the way enabled
> > > > by default.
> > > > 
> > > > (But you will face the same issue there I guess.)
> > > 
> > > Yeah, well, we could re-do the discussion on ksummit-discuss :)
> > 
> > Are you guys trolling me?
> 
> No, the point I was trying to make is that not every system and
> product kernel out there has been switched to a 4.8+ kernel, for
> exactly the reasons that are discussed right now on ksummit-discuss.
> 

Ah thanks for explaining. I read through the latest posts and assume you are
talking about the lengthy backporting discussion.

> I don't really get how that is trolling.

Nevermind that. I thought you were referring to my one and only post to that list.

https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2015-July/001879.html

Sorry for the noise.

> 
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


