From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [RESEND PATCH] pinctrl: at91: fix null pointer dereference
Date: Tue, 28 Jul 2015 15:12:53 +0200
Message-ID: <20150728131253.GA4055@odux.rfo.atmel.com>
References: <20150715133048.GD14886@odux.rfo.atmel.com>
 <1438069696-25303-1-git-send-email-ludovic.desroches@atmel.com>
 <CACRpkdaiwcTzxG=KqPZxk6ijLOE0PAh9ybkNqUYhkmAcQV40eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaiwcTzxG=KqPZxk6ijLOE0PAh9ybkNqUYhkmAcQV40eg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, davidcdueck@googlemail.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 28, 2015 at 02:48:09PM +0200, Linus Walleij wrote:
> On Tue, Jul 28, 2015 at 9:48 AM, Ludovic Desroches
> <ludovic.desroches@atmel.com> wrote:
> 
> > From: David Dueck <davidcdueck@googlemail.com>
> >
> > Not all gpio banks are necessarily enabled, in the current code this can
> > lead to null pointer dereferences.
> >
> > [   51.130000] Unable to handle kernel NULL pointer dereference at virtual address 00000058
> (...)
> >
> > Signed-off-by: David Dueck <davidcdueck@googlemail.com>
> > Acked-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> > Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > CC: Nicolas Ferre <nicolas.ferre@atmel.com>
> > CC: Boris Brezillon <boris.brezillon@free-electrons.com>
> > CC: linux-arm-kernel@lists.infradead.org
> > CC: linux-kernel@vger.kernel.org
> > ---
> >
> > This patch fixes a oops in the kernel because of a NULL pointer in a table.
> > Having a NULL pointer in this table is the normal behavior if a PIO controller
> > is not enabled. So this fix is not a quick and dirty hack, it's usual to skip
> > an entry from a table if it is not filled.
> 
> Fair enough, better too many checks than too few.
> 
> Is this a regression to v4.2 that should go to stable or v4.3 material?

Yes it is a regression from v4.0, it applies well on v4.0.9

Fixes: a0b957f306fa ("pinctrl: at91: allow to have disabled gpio bank")
Cc: stable@vger.kernel.org # 4.0

Thanks

Ludovic
