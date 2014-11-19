From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH V4 2/6] MIPS: Move Loongson GPIO driver to drivers/gpio
Date: Wed, 19 Nov 2014 11:11:58 +0100
Message-ID: <20141119101157.GB7213@linux-mips.org>
References: <1415891560-8915-1-git-send-email-chenhc@lemote.com>
 <CAAVeFuKYgXhV_372FBQnArEFT4xEVB73P+yurJ9mF0CkKCx7eQ@mail.gmail.com>
 <CAAVeFuJoo3X9aNYdrn5TJ-PjTzvFuEm5QTPmKYMy9NyWFy1_WA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([148.251.95.138]:44862 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752006AbaKSKMJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Nov 2014 05:12:09 -0500
Received: from localhost.localdomain ([127.0.0.1]:35086 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27013992AbaKSKMIIL7aB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Nov 2014 11:12:08 +0100
Content-Disposition: inline
In-Reply-To: <CAAVeFuJoo3X9aNYdrn5TJ-PjTzvFuEm5QTPmKYMy9NyWFy1_WA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Huacai Chen <chenhc@lemote.com>, John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Nov 19, 2014 at 05:21:56PM +0900, Alexandre Courbot wrote:

> > On Fri, Nov 14, 2014 at 12:12 AM, Huacai Chen <chenhc@lemote.com> wrote:
> >> Move Loongson-2's GPIO driver to drivers/gpio and add Kconfig options.
> >
> > Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> >
> > Guess this should go through the GPIO tree once the platform
> > maintainers have acked this?
> 
> Ouch. After looking at this driver's implementation I think I have to
> take my Ack back. This driver comes with custom definitions of
> gpio_get_value() and other functions, which we will want to get rid of
> before moving this into drivers/gpio. Can you port this to a proper
> gpiolib driver before doing the move?

As the arch maintainer I'm happy to say farewell to driver code in arch/mips.

Also, can we split the whole procedure into two patches, one for the cleanup
and one for the move?  I don't care in which order.

  Ralf
