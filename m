From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] gpio: mxs: Use PIN2IRQ register to mask interrupts
Date: Tue, 13 Jan 2015 22:21:59 +0800
Message-ID: <20150113142156.GD19355@dragon>
References: <1418639312-12520-1-git-send-email-robin@protonic.nl>
 <CACRpkdaqPVED6U6mYWEzfrbtoYdfmdGZ34jjmokMp_KfOCZnaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:65392 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752505AbbAMOWk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jan 2015 09:22:40 -0500
Received: by mail-pd0-f181.google.com with SMTP id v10so3685288pde.12
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2015 06:22:40 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdaqPVED6U6mYWEzfrbtoYdfmdGZ34jjmokMp_KfOCZnaQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Robin van der Gracht <robin@protonic.nl>, Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Sascha Hauer <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, David Jander <david@protonic.nl>, Marek Vasut <marex@denx.de>

On Tue, Jan 13, 2015 at 07:34:31AM +0100, Linus Walleij wrote:
> On Mon, Dec 15, 2014 at 11:28 AM, Robin van der Gracht
> <robin@protonic.nl> wrote:
> 
> > The PIN2IRQ register should be used to mask an interrupt. Clearing a

No, PIN2IRQ implements a function select, not a mask.

> > bit in the IRQEN register only prevents the interrupt from propagating but
> > still allows hardware to set the status bit when triggered.

Isn't it what a mask implementation supposed to do?

> > So when
> > unmasking the interrupt, it will immediately re-trigger if an interrupt
> > condition occurred during masking.

Per my understanding, this is the correct behavior.  If you do not want
that interrupt triggering, you should clear the interrupt status before
unmasking the interrupt.

Shawn

> >
> > This is unwanted behavior especially when using level triggered
> > interrupts. In this case every interrupt triggers twice. If the
> > interrupt is handled in the handler, the second interrupt will be
> > the first one to be able to ack the interrupt.
> >
> > Signed-off-by: Robin van der Gracht <robin@protonic.nl>
> 
> Apparently MXS is a popular GPIO controller without a real maintainer.
> 
> Adding some random users to the To: line hoping we get some
> review of this patch.
> 
> Yours,
> Linus Walleij
