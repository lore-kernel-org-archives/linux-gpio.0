From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [RFC PATCH 00/33] SA11x0/PXA GPIO rework (Core + PCMCIA only)
Date: Thu, 1 Sep 2016 16:34:16 +0100
Message-ID: <20160901153416.GY1041@n2100.armlinux.org.uk>
References: <20160829100232.GC1041@n2100.armlinux.org.uk>
 <20160829102328.GA28796@n2100.armlinux.org.uk>
 <CACRpkdYuAh1r+N_yJkb9G24Y4zVvEdR8=U-K7etCQvuSZtr+6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56271 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754360AbcIAPei (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2016 11:34:38 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYuAh1r+N_yJkb9G24Y4zVvEdR8=U-K7etCQvuSZtr+6g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>

On Tue, Aug 30, 2016 at 11:31:58PM +0200, Linus Walleij wrote:
> For all the GPIO patches:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> With the smallish changes needed to patch 5/33 that one is acked too.
> 
> In fact I would ACK it anyway, because the net total cleanup is so
> nice on the kernel at large... SA11x0 has never been prettier than
> after this series.

Thanks, ack applied to all the gpio patches.

> I suspect you want to keep the series together and queue it in the ARM
> tree? Else tell me what to apply in the GPIO tree.

Yes, I need to keep the series together because of the dependencies -
trying to split it up will lead to conflicts and breakage from missing
include files, and when it's not from missing include files, it'll be
non-functional.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
