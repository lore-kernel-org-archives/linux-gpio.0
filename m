From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: baytrail: show output gpio state correctly on
 Intel Baytrail
Date: Tue, 4 Nov 2014 09:51:35 +0200
Message-ID: <20141104075135.GE1618@lahna.fi.intel.com>
References: <20141031132005.GB1273@saruman>
 <20141031162339.GA7136@psi-dev26.jf.intel.com>
 <20141031184509.GA2224@psi-dev26.jf.intel.com>
 <20141103092402.GA1304@lahna.fi.intel.com>
 <20141103150048.GB27425@saruman>
 <20141103152743.GB1618@lahna.fi.intel.com>
 <20141103154207.GC1618@lahna.fi.intel.com>
 <20141103155011.GH27425@saruman>
 <20141103184247.GD1618@lahna.fi.intel.com>
 <20141103204038.GB17356@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:44218 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751989AbaKDHvj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 4 Nov 2014 02:51:39 -0500
Content-Disposition: inline
In-Reply-To: <20141103204038.GB17356@saruman>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>, mathias.nyman@linux.intel.com

On Mon, Nov 03, 2014 at 02:40:38PM -0600, Felipe Balbi wrote:
> Hi,
> 
> On Mon, Nov 03, 2014 at 08:42:47PM +0200, Mika Westerberg wrote:
> > > > > > > > > I think adding the module exit + allowing this driver to be a module
> > > > > > > > > would be a good approach. Then we don't need to force generic x86 kernel
> > > > > > > > > binaries to always have this driver. Unless Mathias or Mika knows a
> > > > > > > > > constraint to force this driver to be builtin only.
> > > > > > > > 
> > > > > > > > It helps if I CC them when asking for feedback :)
> > > > > > > > 
> > > > > > > > Mathias, Mika, do you know any constraint that forces pinctrl-baytrail
> > > > > > > > to be bool?
> > > > > > > 
> > > > > > > The only constraint that has been keeping this driver as bool is that
> > > > > > > some machines like, Asus T100, uses ACPI GPIO operation regions for
> > > > > > > toggling GPIOs to get things like sensor hub powered on. The GPIO
> > > > > > > operation region code does not yet handle -EPROBE_DEFER so only way to
> > > > > > > ensure that the operation region is there is to have the driver compiled
> > > > > > > in to the kernel.
> > > > > > 
> > > > > > But that's not enough excuse to have every single x86 in the market
> > > > > > shipping with this driver. Think about a distro kernel, most likely this
> > > > > > gets enabled and it's wrong in 80% of the cases.
> > > > > 
> > > > > True, but see below.
> > > > > 
> > > > > > It would be nicer to add EPROBE_DEFER support, convert this into
> > > > > > tristate and have default = M if BAYTRAIL, or something.
> > > > > 
> > > > > If it were simple as that we would have done that already. Please check
> > > > > drivers/gpio/gpiolib-acpi.c:acpi_gpio_adr_space_handler() and tell me
> > > > > how we can do that.
> > > > 
> > > > Actually the above is not the problem because we already have registered
> > > > the GPIO chip and hence we have the GPIO available to the firmware code.
> > > 
> > > what happens before you registered the gpio chip ? It takes some time
> > > from head.S to gpiochip_irqchip_add(). Anywhere between that time,
> > > firmware could try to access gpios and the same problem would occur.
> > 
> > The operation region is not ready and the firmware does not try to use
> > it. However, the subsys_initcall() is there just to be sure that the
> > GPIO driver gets loaded before anything that is going to use GPIOs from
> > firmware.
> 
> alright, so how does the firmware know that the operation region is
> ready and why can't that be deferred until pinctrl-baytrail (module or
> built-in) has finished probing ? That would sort both issues, would it
> not ?

The firmware checks the dependent object for AVBL or similar variable.
If it is != 0 it assumes that the operation region is there. The problem
is how can you tell the firmware that it should somehow try again?

Here _DEP is the right solution as it forces the dependencies to be
loaded first.

> > > > The real problem is that if the ACPI GPIO operation handler is not there
> > > > at the time firmware decides to do something it will just skip things
> > > > that depend on the operation region. So if it has a GPIO that is used to
> > > > turn on sensor hub or touch panel or whatever, this will not be done and
> > > > it results that the device in question might not work properly.
> > > 
> > > that's an issue that needs solving, but forcing every x86 kernel to ship
> > > with this driver, is not a proper solution.
> > 
> > I would rather have the driver build in to the kernel now (and btw it
> > has been already in mainline quite some time so I suspect many distros
> > have already enabled it), than turning it module and render some devices
> > that have been working previously, fail suddenly.
> 
> that's why I said you should default to Y if BAYTRAIL or make it
> tristate and always default to M.

So you are saying it is better to add config option BAYTRAIL and then
make the driver Y? Well, now generic distros need to select that as Y
which doesn't solve anything.
