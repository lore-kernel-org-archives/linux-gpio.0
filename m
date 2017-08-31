From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio
 before querying its direction"
Date: Thu, 31 Aug 2017 11:39:35 +0200
Message-ID: <20170831113935.38028ff8@windsurf.lan>
References: <20170830112424.7a3a7c36@windsurf.lan>
        <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
        <87ziah2m3f.fsf@free-electrons.com>
        <20170830161730.41919554@windsurf.lan>
        <CACRpkdbxdkHukALfYMrM7w=1KNJKLBhGebbkEpMb3C3+nCfWOA@mail.gmail.com>
        <20170831091812.6f7d417e@windsurf.lan>
        <CAMuHMdVGkTQ0vnOg5o+t1J9qe79ySm0R8aE4msyuNLoVGHLD6A@mail.gmail.com>
        <20170831092211.GP20805@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:44007 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbdHaJ5y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2017 05:57:54 -0400
In-Reply-To: <20170831092211.GP20805@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWlxdcOobA==?= Raynal <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Timur Tabi <timur@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hello,

On Thu, 31 Aug 2017 10:22:12 +0100, Russell King - ARM Linux wrote:

> What about hardware which you can configure for some alternate function
> but still monitor the pin via GPIO, even though it's not mux'd as GPIO.
> 
> For instance, you may have a timer block which can capture on both
> edges of an external event signal, which needs the pin to be muxed for
> that function.  However, you need to read the state of the pin, and
> that is only available through GPIO.  Muxing the pin to be a GPIO just
> because someone requests the GPIO is, imho, ill thought-out and breaks
> some use cases.
> 
> IMHO, the pinmux settings should always be specified in DT, and that's
> what we should be using everywhere, not doing broken backdoor games like
> "the gpio is being requested, it's obvious that we want this pin to be
> a gpio" - that really doesn't follow.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
