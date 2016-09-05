From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 05/33] gpio: add generic single-register fixed-direction
 GPIO driver
Date: Mon, 5 Sep 2016 11:06:28 +0200
Message-ID: <CACRpkdZBNH=4qZEfcLzqZAN=tum2f3YeoQj0D5PsH+P0Cf+7LQ@mail.gmail.com>
References: <20160829102328.GA28796@n2100.armlinux.org.uk> <E1beJjz-0000mA-0o@rmk-PC.armlinux.org.uk>
 <87eg57e54l.fsf@belgarion.home> <20160830091805.GL1041@n2100.armlinux.org.uk>
 <87k2eycip0.fsf@belgarion.home> <20160830184612.GO1041@n2100.armlinux.org.uk>
 <87fupmc59b.fsf@belgarion.home> <20160831084938.GQ1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34389 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753763AbcIEJG3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2016 05:06:29 -0400
Received: by mail-oi0-f49.google.com with SMTP id m11so112085114oif.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2016 02:06:29 -0700 (PDT)
In-Reply-To: <20160831084938.GQ1041@n2100.armlinux.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pcmcia@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>

On Wed, Aug 31, 2016 at 10:49 AM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:

> git://git.armlinux.org.uk/~rmk/linux-arm.git sa1100
>
> It would be great to have this tested on Lubbock, and get the PCMCIA
> issues fixed.  Maybe we can look at converting mainstone as well?

I couldn't resist testing on the Compaq iPAQ h3600. It works the
same as before so:
Tested-by: Linus Walleij <linus.walleij@linaro.org> [for Compaq iPAQ H3600]

The only news in the bootlog is this:
sa11x0-pcmcia: probe of sa11x0-pcmcia failed with error -2

This device does have a PCMCIA "sleeve" where I slotted in an
ethernet card at one time to see if I could network this thing.
But I never got the PCMCIA working. Now it seems like I could
actually start looking into that as the driver gives its first sign
of life.

I don't think PCMCIA ever worked on this thing upstream,
but I have a copy of the old linux-handheld kernel tree where
it supposedly was working at one point.

Yours,
Linus Walleij
