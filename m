From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 05/33] gpio: add generic single-register fixed-direction
 GPIO driver
Date: Sat, 3 Sep 2016 11:25:49 +0100
Message-ID: <20160903102549.GK1041@n2100.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
 <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
 <87eg57e54l.fsf@belgarion.home>
 <20160830091805.GL1041@n2100.armlinux.org.uk>
 <87k2eycip0.fsf@belgarion.home>
 <20160830184612.GO1041@n2100.armlinux.org.uk>
 <87fupmc59b.fsf@belgarion.home>
 <20160831084938.GQ1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:44967 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753202AbcICK0C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Sep 2016 06:26:02 -0400
Content-Disposition: inline
In-Reply-To: <20160831084938.GQ1041@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-pcmcia@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org, Kristoffer Ericson <kristoffer.ericson@gmail.com>, linux-arm-kernel@lists.infradead.org, Daniel Mack <daniel@zonque.org>

On Wed, Aug 31, 2016 at 09:49:38AM +0100, Russell King - ARM Linux wrote:
> On Tue, Aug 30, 2016 at 11:32:16PM +0200, Robert Jarzmik wrote:
> > Russell King - ARM Linux <linux@armlinux.org.uk> writes:
> > 
> > > If you can wait a day or two, I'll push a branch out for everything in
> > > all these multiple series.
> > Sure, just ping me when you have something.
> 
> git://git.armlinux.org.uk/~rmk/linux-arm.git sa1100
> 
> should get you something suitable to test.  It's based on 4.7-rc3 plus
> my fixes branch.

Branch updated, hopefully with everything that we've agreed on so far,
all the bug fixes, plus a few extra bits...

> It would be great to have this tested on Lubbock, and get the PCMCIA
> issues fixed.  Maybe we can look at converting mainstone as well?

... like converting mainstone and pxaficp_ir on mainstone.

I'm not going to be around for most of the rest of this weekend.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
