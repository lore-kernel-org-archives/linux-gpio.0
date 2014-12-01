From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [RFC PATCH 1/1] gpio: pca953x: Allow interrupt support when compiled as module
Date: Mon, 01 Dec 2014 08:27:57 +0100
Message-ID: <30172880.4oYHgH2T9B@ws-stein>
References: <1416492379-28433-1-git-send-email-alexander.stein@systec-electronic.com> <CACRpkdYRvBQ3WgJv7hXVbe0ubG+Gw9pgDM1Fd4HgMLPE5kQnrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:57079 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752608AbaLAHZv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Dec 2014 02:25:51 -0500
In-Reply-To: <CACRpkdYRvBQ3WgJv7hXVbe0ubG+Gw9pgDM1Fd4HgMLPE5kQnrA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Friday 28 November 2014 16:11:02, Linus Walleij wrote:
> On Thu, Nov 20, 2014 at 3:06 PM, Alexander Stein
> <alexander.stein@systec-electronic.com> wrote:
> 
> > With commit 2fd36c55264926e268deb50f6de5f43fa5e490f7
> > ("i2c: core: Map OF IRQ at probe time") it seems that there is no need
> > to force this driver to be compiled into the kernel.
> >
> > Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> 
> I don't get this at all.
> 
> >  config GPIO_PCA953X_IRQ
> >         bool "Interrupt controller support for PCA953x"
> > -       depends on GPIO_PCA953X=y
> >         select GPIOLIB_IRQCHIP
> >         help
> >           Say yes here to enable the pca953x to be used as an interrupt
> > -         controller. It requires the driver to be built in the kernel.
> > +         controller.
> 
> Why should this *not* be dependent on GPIO_PCA953X?? The config
> flag is only used inside the file that gets built by exactly that
> config flag!
> 
> Just remove the "=y" part of the line and test if you like.

Doh, you're right. Only the =y part should be removed.

> > This is completely untested, as I lack a board capable of running a v3.18-rcX
> > kernel. But I noticed on an older kernel that this driver failed requesting
> > irq 0 during kernel boot. 0 because it's irq parent was not yet probed (also
> > a compiled in driver).
> 
> If the parent is not probed, it should get an -EPROBE_DEFER
> as irq number from the parent and bail out, then that is the actual bug
> that needs fixing.
> 
> > With the mentioned commit this should work now.
> 
> I want it tested before I believe it...

Sure, I'll come back when I could actually test this on a more recent kernel.

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
Am Windrad 2
08468 Heinsdorfergrund
Tel.: 03765 38600-1156
Fax: 03765 38600-4100
Email: alexander.stein@systec-electronic.com
Website: www.systec-electronic.com
 
Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Chemnitz, HRB 28082

