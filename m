From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] gpio: rcar: GPIO_RCAR doesn't relate to ARM
Date: Wed, 26 Aug 2015 09:36:43 +0900
Message-ID: <20150826003643.GC11168@verge.net.au>
References: <871ter7n17.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdXxg+YPHxPdPobNS1C4+khOx6-Ve3nU2UqddTdtdUsCEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59326 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933091AbbHZAgq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Aug 2015 20:36:46 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdXxg+YPHxPdPobNS1C4+khOx6-Ve3nU2UqddTdtdUsCEg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus <magnus.damm@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 25, 2015 at 11:15:18AM +0200, Geert Uytterhoeven wrote:
> On Tue, Aug 25, 2015 at 11:12 AM, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > 8cd1470("gpio: rcar: Add r8a7795 (R-Car H3) support") added
> > GPIO support for r8a7795. r8a7795 based on CONFIG_ARM64.
> > OTOH, GPIO_RCAR driver can be compiled fine on non-ARM.
> > This patch removed ARM dependency for it.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Simon Horman <horms+renesas@verge.net.au>

