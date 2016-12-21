From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] mtd: nand: fix implicit module.h usage in xway_nand.c
Date: Wed, 21 Dec 2016 12:44:45 -0500
Message-ID: <20161221174445.GQ12113@windriver.com>
References: <20161220211800.4701-1-paul.gortmaker@windriver.com>
 <63347d92-15b6-917c-b9f7-d239faaacdeb@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:40803 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754530AbcLURpI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Dec 2016 12:45:08 -0500
Content-Disposition: inline
In-Reply-To: <63347d92-15b6-917c-b9f7-d239faaacdeb@hauke-m.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

[Re: [PATCH] mtd: nand: fix implicit module.h usage in xway_nand.c] On 21/12/2016 (Wed 16:19) Hauke Mehrtens wrote:

> 
> 
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

Yes, if it makes no sense to be modular, then using the non module
versions is the way to go.  Odd that the kbuild test robot decided to
start complaining about it this week...  both of the commits I mentioned
above have been in linux-next for months.

Paul.
--

> 
> Hauke
> 
