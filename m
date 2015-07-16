From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 00/19] gpio: Interrupt cleanups and API change
 preparation
Date: Thu, 16 Jul 2015 16:13:06 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507161611320.18576@nanos>
References: <20150712232317.244138485@linutronix.de> <CACRpkdZqGfB-5e+gt8qk+m+iXnO8+S7K_-qQbL+nvHQaxD36BQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:42620 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751783AbbGPONS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 10:13:18 -0400
In-Reply-To: <CACRpkdZqGfB-5e+gt8qk+m+iXnO8+S7K_-qQbL+nvHQaxD36BQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>

On Thu, 16 Jul 2015, Linus Walleij wrote:
> On Mon, Jul 13, 2015 at 10:41 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > The following patch series contains the following changes:
> >
> >     - Consolidation of chained interrupt handler setup/removal
> >
> >     - Switch to functions which avoid a redundant interrupt
> >       descriptor lookup
> >
> >     - Preparation of interrupt flow handlers for the 'irq' argument
> >       removal
> >
> > The series has no dependencies and is also available as a git branch
> > for your convenience:
> >
> >  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/gpio
> 
> Hmm.....
> 
> git pull git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/gpio
> fatal: Couldn't find remote ref irq/gpio
> 
> Same with pinctrl, did you push it?
> 
> Or am I a shitty git operator ... don't rule that out :/

No, I have moved the branches because they got accidentally pulled
into next :)

 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git queue/irq/gpio
 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git queue/irq/pinctrl

Both have the latest fixes included.

Thanks,

	tglx
