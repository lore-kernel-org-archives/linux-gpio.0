From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/4] gpio: ep93xx: remove private irq_to_gpio function
Date: Tue, 16 Feb 2016 17:12:57 +0100
Message-ID: <12288210.VhBfyMlq8V@wuerfel>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com> <1455551208-2825510-4-git-send-email-arnd@arndb.de> <CACRpkdb3nKTEDCvafURhKRPJipJ=K_y1oyE_kKc=-T8E=Bai0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb3nKTEDCvafURhKRPJipJ=K_y1oyE_kKc=-T8E=Bai0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tuesday 16 February 2016 16:51:57 Linus Walleij wrote:
> On Mon, Feb 15, 2016 at 4:46 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > The ep93xx goes through its own back-and-forth dance every time
> > it wants to know the gpio number for an irq line, when it really
> > just hardcodes a fixed offset in ep93xx_gpio_to_irq().
> >
> > This removes the pointless macro and replaces the conversion inside
> > of the driver with simple add/subtract operations, using an
> > explicit macro.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> (...)
> 
> > -#include <linux/gpio/driver.h>
> > -/* FIXME: this is here for gpio_to_irq() - get rid of this! */
> >  #include <linux/gpio.h>
> 
> No, what you want to get rid of is the #include <linux/gpio.h> not the
> <linux/gpio/driver.h>, we want to be more specific. Sorry for putting the
> comment wrong.

I think I initially did that, but ran into another build error then.

> 
> > @@ -35,6 +31,7 @@ void __iomem *ep93xx_gpio_base; /* FIXME: put this into irq_data */
> >  #define EP93XX_GPIO_LINE_MAX           63
> >
> >  /* maximum value for irq capable line identifiers */
> > +#define EP93XX_GPIO_IRQ_BASE           64
> >  #define EP93XX_GPIO_LINE_MAX_IRQ       23
> 
> This doesn't apply to my tree :O
> 
> My EP93XX_GPIO_LINE_MAX_IRQ is in
> arch/arm/mach-ep93xx/include/mach/gpio-ep93xx.h
> 
> So I think you must be having another patch somewhere in the ARM SoC
> tree. (I can take it, just send it along with an update of this one.)

Ah, that is right. Let's just drop this patch for now,
it's not important.

I have an old patch below to make the driver independent of
the headers, but I have to look at that patch again before
submitting it. I'll sort this one next to it.

	Arnd
