From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio
 before querying its direction"
Date: Thu, 31 Aug 2017 10:22:12 +0100
Message-ID: <20170831092211.GP20805@n2100.armlinux.org.uk>
References: <20170830112424.7a3a7c36@windsurf.lan>
 <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
 <87ziah2m3f.fsf@free-electrons.com>
 <20170830161730.41919554@windsurf.lan>
 <CACRpkdbxdkHukALfYMrM7w=1KNJKLBhGebbkEpMb3C3+nCfWOA@mail.gmail.com>
 <20170831091812.6f7d417e@windsurf.lan>
 <CAMuHMdVGkTQ0vnOg5o+t1J9qe79ySm0R8aE4msyuNLoVGHLD6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:46308 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750982AbdHaJW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 05:22:28 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGkTQ0vnOg5o+t1J9qe79ySm0R8aE4msyuNLoVGHLD6A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Timur Tabi <timur@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Aug 31, 2017 at 09:30:54AM +0200, Geert Uytterhoeven wrote:
> > Note that on my side, I've however not been convinced by this semantic:
> > I find it weird that when you request a GPIO, it gets automatically
> > muxed as such, without an explicit pinctrl configuration in the DT.
> 
> On lots of hardware, you first have to select between GPIO and "other
> function".
> For "other function", you have to select the actual function later.
> In that case, switching to a GPIO can be done by flipping a single bit.

What about hardware which you can configure for some alternate function
but still monitor the pin via GPIO, even though it's not mux'd as GPIO.

For instance, you may have a timer block which can capture on both
edges of an external event signal, which needs the pin to be muxed for
that function.  However, you need to read the state of the pin, and
that is only available through GPIO.  Muxing the pin to be a GPIO just
because someone requests the GPIO is, imho, ill thought-out and breaks
some use cases.

IMHO, the pinmux settings should always be specified in DT, and that's
what we should be using everywhere, not doing broken backdoor games like
"the gpio is being requested, it's obvious that we want this pin to be
a gpio" - that really doesn't follow.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
