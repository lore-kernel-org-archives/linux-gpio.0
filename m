From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/3] Renesas RZ PFC and GPIO driver
Date: Tue, 10 Jan 2017 00:49:30 +0200
Message-ID: <1923903.Gi7z59W6W3@avalon>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org> <11976735.hueksWqZOA@avalon> <SG2PR06MB1165EE67EA2969815758A3038A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:37647 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753301AbdAIWtV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2017 17:49:21 -0500
In-Reply-To: <SG2PR06MB1165EE67EA2969815758A3038A640@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Chris,

On Monday 09 Jan 2017 21:08:49 Chris Brandt wrote:
> On Monday, January 09, 2017, Laurent Pinchart wrote:
> > Pin control on the Renesas RZ chips is performed per pin instead of per
> > function (but unfortunately with the various bits of configuration split
> > across a bunch of registers, otherwise we could have used pinctrl-single).
> 
> I will say this...'spoilier alert'...you're not going to see this particular
> PFC HW much anymore in the RZA series.
> 
> It will still be a 'per pin control' like the existing RZ/A1, but the bits
> will not be spread out over a bunch of registers. So something like
> pinctrl-single should work.

Both the existing RZ/A model and the pinctrl model are in my opinion 
improvements over the RZ/G and R-Car models. I don't care much about whether 
pinctrl-single can be used, but we really need hardware architectures that 
don't require those huge data tables.

> No idea about the future of RZG series.

I'll cross my fingers.

> > This gives us an opportunity to move away from the sh-pfc awful (but more
> > or less needed for the R-Car family) architecture and implement something
> > much, much cleaner without all those obscure data tables and macros, with
> > per-pin configuration. Shouldn't we rejoice and embrace that opportunity ?
> 
> Honestly, that driver structure confuses the heck out of me. I guess you
> have to understand the restrictions of the R-Car PFC HW to really
> appreciate it.

No, you can't appreciate it, no matter what :-)

> Of course I like the idea of a simple PFC for Renesas SoCs, of course the
> existing RZ/A1 would be (hopefully) the worst case scenario.
> 
> I assume to make a one-size-fits-all per-pin driver, instead of filling out
> structures and enums, you'd have to have callback functions that basically
> you pass "set pin X to function #3"...which basically brings you back to
> what the core of the pinctrl system does now any (if I understand it
> correctly).

It's more complex than that. Both the pin-based and group-based models have 
their pros and cons, and the pinctrl API is some kind of mix that allows both 
options.

-- 
Regards,

Laurent Pinchart

