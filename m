From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] powerpc/gpio: Fix the wrong GPIO input data on
 MPC8572/MPC8536
Date: Wed, 20 Nov 2013 18:32:46 -0600
Message-ID: <1384993966.1403.466.camel@snotra.buserror.net>
References: <1384499789-3631-1-git-send-email-Gang.Liu@freescale.com>
	 <1384901494.1403.383.camel@snotra.buserror.net>
	 <1384916079.16677.26.camel@linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]:38115
	"EHLO co9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752891Ab3KUAdN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 20 Nov 2013 19:33:13 -0500
In-Reply-To: <1384916079.16677.26.camel@linux>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Liu Gang <Gang.Liu@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, b07421@freescale.com, r61911@freescale.com

On Wed, 2013-11-20 at 10:54 +0800, Liu Gang wrote:
> On Tue, 2013-11-19 at 16:51 -0600, Scott Wood wrote:
> > > @@ -71,6 +71,7 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> > >  	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
> > >  
> > >  	val = in_be32(mm->regs + GPIO_DAT) & ~in_be32(mm->regs + GPIO_DIR);
> > > +	mpc8xxx_gc->data &= in_be32(mm->regs + GPIO_DIR);
> > >  
> > >  	return (val | mpc8xxx_gc->data) & mpc8xxx_gpio2mask(gpio);
> > >  }
> > 
> > It seems odd to update ->data in a function that's supposed to be
> > reading things...  Perhaps it would be better to keep ->data in a good
> > state from the beginning.
> > 
> > -Scott
> 
> Yes, keeping the ->data in a good state from the beginning will be
> better. But this will need more code in different functions to cover
> all the scenarios.
> First, we should check the direct of the pin in the function
> "mpc8xxx_gpio_set", and clean the input bit in ->data after setting
> operation.

For userspace value setting, it looks like gpiolib blocks the write if
the pin if FLAG_IS_OUT is set.  This suggests that this is an error
condition for other uses as well.  Though, I notice that
mpc8xxx_gpio_dir_out() calls gpio_set() before actually changing the
direction.  So it may be useful to avoid races where the wrong value is
output briefly after the direction is changed (especially in open drain
situations, where the signal could have a meaningful default even before
we begin outputting).  But that raises the question of how you'd do that
from userspace, and it also renders the to-be-output value as write-only
data (until the direction is actually changed), since a readback would
get the input value instead.

> So maybe it's better to eliminate the effects of the ->data to the
> input pins when reading the status, regardless of the possible changes
> of the pins and the data.
> Do you think so?

Perhaps, but that doesn't require you to modify ->data in the get()
function.

-Scott



