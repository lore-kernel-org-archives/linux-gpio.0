From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 6/6] ARM: shmobile: lager: Enable UHS-I SDR-50
Date: Mon, 25 May 2015 14:07:30 +0900
Message-ID: <20150525050727.GA28560@verge.net.au>
References: <1431822459.4222.166.camel@xylophone.i.decadent.org.uk>
 <1431823184.4222.180.camel@xylophone.i.decadent.org.uk>
 <20150525010724.GD24690@verge.net.au>
 <87fv6ljokk.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44507 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751040AbbEYFHe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2015 01:07:34 -0400
Content-Disposition: inline
In-Reply-To: <87fv6ljokk.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>, Ian Molton <ian@mnementh.co.uk>, linux-mmc@vger.kernel.org, linux-sh@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@lists.codethink.co.uk, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

On Mon, May 25, 2015 at 04:00:11AM +0000, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > On Sun, May 17, 2015 at 01:39:44AM +0100, Ben Hutchings wrote:
> > > Add the "1v8" pinctrl state and sd-uhs-sdr50 property to SDHI{0,2}.
> > > 
> > > Signed-off-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
> > > ---
> > > None of the states includes the CD pins, as they can't be allocated both
> > > through pinctrl and as GPIOs.  But the Lager manual shows these signals
> > > being pulled up to the same variable voltage as the other signals.  This
> > > might possibly lead to spurious card detect interrupts after switching
> > > to 1.8V signalling.
> > 
> > Morimoto-san,
> > 
> > I would appreciate your opinion on this change.
> 
> Ben will send new version patch set if my understanding is correct

Thanks, got it.
