From: Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH] gpio: xgene: Fix kconfig for standby GIPO contoller
Date: Fri, 11 Mar 2016 21:03:04 +0100
Message-ID: <1457726584.587.5.camel@suse.com>
References: <1457089198-27171-1-git-send-email-mbrugger@suse.com>
	 <CACRpkdbtRAC4pUQP29SAmL-ge6uJefMt5Cda6dYCR2kZ8u18og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:37949 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751540AbcCKUMF (ORCPT
	<rfc822;groupwise-linux-gpio@vger.kernel.org:0:0>);
	Fri, 11 Mar 2016 15:12:05 -0500
In-Reply-To: <CACRpkdbtRAC4pUQP29SAmL-ge6uJefMt5Cda6dYCR2kZ8u18og@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Quan Nguyen <qnguyen@apm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, 2016-03-11 at 23:01 +0700, Linus Walleij wrote:
> On Fri, Mar 4, 2016 at 5:59 PM, Matthias Brugger <mbrugger@suse.com>
> wrote:
> 
> > The standby GPIO controller can be used as a interrupt controller.
> > Select GPIOLIB_IRQCHIP when compiling this driver. Otherwise we get
> > a compilation error:
> > 
> > drivers/gpio/gpio-xgene-sb.c: In function 'xgene_gpio_sb_probe':
> > drivers/gpio/gpio-xgene-sb.c:312:10: error: 'struct gpio_chip' has
> > no member named 'irqdomain'
> >   priv->gc.irqdomain = priv->irq_domain;
> >           ^
> > scripts/Makefile.build:295: recipe for target 'drivers/gpio/gpio
> > -xgene-sb.o' failed
> > make[2]: *** [drivers/gpio/gpio-xgene-sb.o] Error 1
> > 
> > Fixes: 1013fc41 "gpio: xgene: Enable X-Gene standby GPIO as
> > interrupt controller"
> > Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> 
> Quan's patch exporting the symbols has been merged by tglx
> so dropping this.
> 

Thanks for the info.

Actually this is v1 [1] of the patch, which just addresses the
GPIOLIB_IRQCHIP problem?
With Quan's patch this should still be present.

[1] https://patchwork.kernel.org/patch/8502401/
