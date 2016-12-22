From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: fix implicit module.h usage in xway_nand.c
Date: Thu, 22 Dec 2016 10:01:44 +0100
Message-ID: <20161222100144.2ea9f7fe@bbrezillon>
References: <20161220211800.4701-1-paul.gortmaker@windriver.com>
        <63347d92-15b6-917c-b9f7-d239faaacdeb@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:45151 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750796AbcLVJBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Dec 2016 04:01:47 -0500
In-Reply-To: <63347d92-15b6-917c-b9f7-d239faaacdeb@hauke-m.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>

+Brian

On Wed, 21 Dec 2016 16:19:00 +0100
Hauke Mehrtens <hauke@hauke-m.de> wrote:

> On 12/20/2016 10:18 PM, Paul Gortmaker wrote:
> > In commit d47529b2e9fe0ec2eb1f072afad8849f52e385c4 ("gpio: don't
> > include module.h in shared driver header") we fixed a bunch of
> > implicit includes and then did what the shortlog says -- remove
> > module.h from a gpio header.
> > 
> > In parallel, commit 024366750c2e04fdcda8bca685194ef0196b35fe
> > ("mtd: nand: xway: convert to normal platform driver") added new
> > modular function calls to a file that now became relying on the
> > above module.h presence in the gpio header, since it did not
> > explicitly include module.h header for them as part of the change.
> > 
> > The problem only appears when the two dev streams are merged.
> > 
> > Since the file is tristate, the fix is obvious -- it needs an
> > explicit include of module.h header.  
> 
> Hi Paul,
> 
> the xway nand driver does not build as a module, so I made it bool, this
> patch:
> http://lists.infradead.org/pipermail/linux-mtd/2016-December/070800.html
> And then made it use the non module versions here:
> http://lists.infradead.org/pipermail/linux-mtd/2016-December/070801.html
> 
> In the beginning I also came up with the same patch as you, but the mtd
> people suggested to do it differently. I hope my two patches are on
> their way into Linus tree.

Yep. Just waiting for Linus to release 4.10-rc1 to rebase my nand/next
branch and start applying new patches. It should be queued for 4.11 and
backported to all previous release (thanks to the Cc-stable + Fixes
tags).

I didn't plan to take these fixes in one of the 4.10-rc fixes PR, since
this bug is here for several releases, and no-one complained before.
Let me know if you think otherwise, I'll add my ack and ask Brian to
take it in the MTD tree.

Regards,

Boris

