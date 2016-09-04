From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 05/33] gpio: add generic single-register fixed-direction
 GPIO driver
Date: Sun, 4 Sep 2016 21:18:30 +0100
Message-ID: <20160904201830.GM1041@n2100.armlinux.org.uk>
References: <20160829102328.GA28796@n2100.armlinux.org.uk>
 <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
 <87eg57e54l.fsf@belgarion.home>
 <20160830091805.GL1041@n2100.armlinux.org.uk>
 <87k2eycip0.fsf@belgarion.home>
 <20160830184612.GO1041@n2100.armlinux.org.uk>
 <87fupmc59b.fsf@belgarion.home>
 <20160831084938.GQ1041@n2100.armlinux.org.uk>
 <20160903102549.GK1041@n2100.armlinux.org.uk>
 <878tv7jxk4.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:57786 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754167AbcIDUSm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Sep 2016 16:18:42 -0400
Content-Disposition: inline
In-Reply-To: <878tv7jxk4.fsf@belgarion.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-pcmcia@lists.infradead.org, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-gpio@vger.kernel.org, Kristoffer Ericson <kristoffer.ericson@gmail.com>, linux-arm-kernel@lists.infradead.org, Daniel Mack <daniel@zonque.org>

On Sun, Sep 04, 2016 at 09:04:59PM +0200, Robert Jarzmik wrote:
> And retested with my 3 patches on top of it. Everything works fine :
>  - CF insertion is correctly detected now !
>  - AT/2 keyboard interrupts fire, keys are there, etc ...
>  - the AT/2 warning is now gone
> 
> The pxa_cplds_irqs patch will make it work as before, better than today for
> sure. I think edge type interrupts (such as sa1111), if they come close enough,
> might be lost with the current implementation, but anyway, that's for another
> time.

Good news, but I suspect CF probably isn't working as it should do (see
my reply to the clock alias patch.)

> There is one patch in my serie that I left up to you, as I wasn't very sure
> about the accuracy of my commit message, nor been able to write down all the
> requirements implied on sa1111 with this additional test.

That's basically what I have here at the moment, but since I made the
suggestion, I've been thinking about moving it into the IRQ
initialisation instead.

Also, I think it's a genirq problem that you can install a chained
handler on an interrupt without a registered chip - and then when an
irq chip comes along later, the IRQ isn't unmasked.  We should either
not allow a chained handler to be installed in that situation, /or/
we should unmask chained IRQs when the chip comes along later.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
