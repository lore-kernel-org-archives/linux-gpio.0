From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/3] arm: dts: r7s72100: Add peripherals nodes
Date: Wed, 11 Jan 2017 11:33:17 +0100
Message-ID: <20170111103316.GD12030@verge.net.au>
References: <1483990318-26927-1-git-send-email-jacopo+renesas@jmondi.org>
 <1483990318-26927-4-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVWVsHqdOTxeiD6zXaVJqdHPLvry9EjjPc9XvF8QsXkDw@mail.gmail.com>
 <2351875.0S8UmoVGa8@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55320 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763424AbdAKKda (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 05:33:30 -0500
Content-Disposition: inline
In-Reply-To: <2351875.0S8UmoVGa8@avalon>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jan 10, 2017 at 09:58:19PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> On Tuesday 10 Jan 2017 16:07:01 Geert Uytterhoeven wrote:
> > On Mon, Jan 9, 2017 at 8:31 PM, Jacopo Mondi wrote:
> > > From: Magnus Damm <damm@opensource.se>
> > > 
> > > This is a squash of several commits, adding peripherals groups
> > > configuration to r7s72100 device tree, and enabling some of them on
> > > Genmai evaluation board
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > 
> > Thanks for the rework!
> > 
> > >  arch/arm/boot/dts/r7s72100-genmai.dts |  51 ++++++++++++
> > >  arch/arm/boot/dts/r7s72100.dtsi       | 151 +++++++++++++++++++++++++++++
> >
> > This path should be split in multiple parts:
> >   - Add the pfc node to r7s72100.dtsi,
> >   - Add the gpio nodes to r7s72100.dtsi,
> >   - 4 patches for r7s72100-genmai.dts, adding support for LEDs, SCIF,
> >     Ethernet, and SPI.
> 
> I can agree about the .dtsi/.dts split, but isn't this going a bit overboard ?

I would like the split so that different patches touch different files
to be made.

I am willing to be flexible regarding adding more than one IP block in a
single patch if the patches would otherwise be very small and unlikely to
lead to breakage.

>From my PoV a key motivation for splitting things up is to make it easier
to selectively revert or backport individual features. I personally don't
have much cause to do either on a fine-grained basis of late. So I'm happy
to consider being more flexible with regards to patch granularity.
