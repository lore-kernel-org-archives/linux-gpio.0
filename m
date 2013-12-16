From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v3] gpio: driver for Xtensa GPIO32
Date: Mon, 16 Dec 2013 07:50:32 +0200
Message-ID: <20131216055032.GB3807@tarshish>
References: <36330381d07aed97fa587a6600ddee5f0be16da5.1386839921.git.baruch@tkos.co.il>
 <20131212181558.GA12555@psi-dev26.jf.intel.com>
 <20131212182442.GN1217@tarshish>
 <20131212192300.GB14726@psi-dev26.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:32845 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750802Ab3LPFuh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 16 Dec 2013 00:50:37 -0500
Content-Disposition: inline
In-Reply-To: <20131212192300.GB14726@psi-dev26.jf.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-xtensa@linux-xtensa.org

Hi David,

On Thu, Dec 12, 2013 at 11:23:00AM -0800, David Cohen wrote:
> On Thu, Dec 12, 2013 at 08:24:42PM +0200, Baruch Siach wrote:
> > On Thu, Dec 12, 2013 at 10:15:58AM -0800, David Cohen wrote:
> > > On Thu, Dec 12, 2013 at 11:18:41AM +0200, Baruch Siach wrote:
> > > > +static int __init xtensa_gpio_init(void)
> > > > +{
> > > > +	struct platform_device *pdev;
> > > > +
> > > > +	pdev = platform_device_register_simple("xtensa-gpio", 0, NULL, 0);
> > > 
> > > Is it what you really want to do? It means this driver will probe
> > > regardless it really should or not.
> > 
> > If you have XCHAL_CP_ID_XTIOP defined in your xtensa variant tie.h header, 
> > then this device is available. Otherwise, this driver doesn't even build. If 
> > you don't want the kernel to manage the GPIO32 IO port, then just disable the 
> > driver in the kernel configuration.
> > 
> > Does this sound reasonable enough?
> 
> Then I think it's a bit worse :)
> You can't make kernel compilation to fail when this GPIO driver is not
> meant to be probed.
> I'm not familiar with xtensa, so can't be strongly against platform
> device registration inside the driver's init function. But you need to
> fix your Kconfig to not make this driver available when it's not
> compilable.

I understand your concern, as currently randconfig enabling this driver will 
break the build. I'm not sure what is the right solution though. We could 
depend on, say HAVE_XTENSA_GPIO32, and select it from arch/xtensa/Kconfig for 
the appropriate xtensa variants. The problem is that no current mainline 
xtensa variant supports GPIO32. So, at some future point one of those who are 
looking for unreferenced Kconfig symbols will just remove the whole driver.

Suggestions for a better solution are welcome.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
