From: Alban <albeu@free.fr>
Subject: Re: [PATCH] gpio: ath79: Convert to the state container design
 pattern
Date: Fri, 2 Oct 2015 08:52:54 +0200
Message-ID: <20151002085254.6a929c58@tock>
References: <1441100282-13584-1-git-send-email-albeu@free.fr>
	<CACRpkdbX+cMmS-j85zqhPSa8XRQHtus6HXqZrLo9b++KAHDc5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtpfb1-g21.free.fr ([212.27.42.9]:46222 "EHLO
	smtpfb1-g21.free.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751189AbbJBGxM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 02:53:12 -0400
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 8C32177C9E4
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2015 08:53:06 +0200 (CEST)
In-Reply-To: <CACRpkdbX+cMmS-j85zqhPSa8XRQHtus6HXqZrLo9b++KAHDc5g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aban Bedel <albeu@free.fr>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Gabor Juhos <juhosg@openwrt.org>, Linux MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, 25 Sep 2015 09:39:51 -0700
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Tue, Sep 1, 2015 at 2:38 AM, Alban Bedel <albeu@free.fr> wrote:
> 
> > Turn the ath79 driver into a true driver supporting multiple
> > instances. While at it also removed unneed includes and make use of
> > the BIT() macro.
> >
> > Signed-off-by: Alban Bedel <albeu@free.fr>
> > ---
> >
> > This patch apply on top of my previous MIPS GPIO patches that are
> > pending for 4.3, so it might be better to take it thru the MIPS
> > tree.
> 
> Patch applied (for v4.4).
> 
> Would you consider sending a patch adding yourself as maintainer
> for this file in MAINTAINERS?

Yes, I'll send that soon.

However while looking at adding IRQ support I stumbled upon the bgpio
API from the generic gpio driver. I think it might make more sense
to simply move to this API instead of doing the above cleanup. I'll
send a patch for this in the next days.

Alban
