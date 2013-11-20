From: Liu Gang <Gang.Liu@freescale.com>
Subject: Re: [PATCH] powerpc/gpio: Fix the wrong GPIO input data on
 MPC8572/MPC8536
Date: Wed, 20 Nov 2013 10:54:39 +0800
Message-ID: <1384916079.16677.26.camel@linux>
References: <1384499789-3631-1-git-send-email-Gang.Liu@freescale.com>
	 <1384901494.1403.383.camel@snotra.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:54854 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752234Ab3KTCyu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 19 Nov 2013 21:54:50 -0500
In-Reply-To: <1384901494.1403.383.camel@snotra.buserror.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Scott Wood <scottwood@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, b07421@freescale.com, r61911@freescale.com

On Tue, 2013-11-19 at 16:51 -0600, Scott Wood wrote:
> > @@ -71,6 +71,7 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> >  	struct mpc8xxx_gpio_chip *mpc8xxx_gc = to_mpc8xxx_gpio_chip(mm);
> >  
> >  	val = in_be32(mm->regs + GPIO_DAT) & ~in_be32(mm->regs + GPIO_DIR);
> > +	mpc8xxx_gc->data &= in_be32(mm->regs + GPIO_DIR);
> >  
> >  	return (val | mpc8xxx_gc->data) & mpc8xxx_gpio2mask(gpio);
> >  }
> 
> It seems odd to update ->data in a function that's supposed to be
> reading things...  Perhaps it would be better to keep ->data in a good
> state from the beginning.
> 
> -Scott

Yes, keeping the ->data in a good state from the beginning will be
better. But this will need more code in different functions to cover
all the scenarios.
First, we should check the direct of the pin in the function
"mpc8xxx_gpio_set", and clean the input bit in ->data after setting
operation.
In addition, we may change a output pin to input and then read the
input status. So we also should update the ->data in
"mpc8xxx_gpio_dir_in" function.
So maybe it's better to eliminate the effects of the ->data to the
input pins when reading the status, regardless of the possible changes
of the pins and the data.
Do you think so?

Best Regards,
Liu Gang


