From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Initialize GPIO properly when used
 through irqchip
Date: Wed, 29 Nov 2017 15:11:09 +0200
Message-ID: <20171129131109.GR22431@lahna.fi.intel.com>
References: <20171120151936.68726-1-mika.westerberg@linux.intel.com>
 <CACRpkdbkt_=g0TGhPyh+s-oCFQniXEeKMG=Z56_WZHGqkr4nwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:62971 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752750AbdK2NLO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Nov 2017 08:11:14 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdbkt_=g0TGhPyh+s-oCFQniXEeKMG=Z56_WZHGqkr4nwg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 29, 2017 at 01:39:00PM +0100, Linus Walleij wrote:
> On Mon, Nov 20, 2017 at 4:19 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > When a GPIO is requested using gpiod_get_* APIs the intel pinctrl driver
> > switches the pin to GPIO mode and makes sure interrupts are routed to
> > the GPIO hardware instead of IOAPIC. However, if the GPIO is used
> > directly through irqchip, as is the case with many I2C-HID devices where
> > I2C core automatically configures interrupt for the device, the pin is
> > not initialized as GPIO. Instead we rely that the BIOS configures the
> > pin accordingly which seems not to be the case at least in Asus X540NA
> > SKU3 with Focaltech touchpad.
> >
> > When the pin is not properly configured it might result weird behaviour
> > like interrupts suddenly stop firing completely and the touchpad stops
> > responding to user input.
> >
> > Fix this by properly initializing the pin to GPIO mode also when it is
> > used directly through irqchip.
> >
> > Reported-by: Daniel Drake <drake@endlessm.com>
> > Reported-by: Chris Chiu <chiu@endlessm.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Should this have a Fixes:?
> 
> Should this have a Cc: stable@vger.kernel.org?

Right, I'll add those in v2.

> > Chris, Daniel,
> >
> > Could you check that this still solves the issue and maybe provide your
> > Tested-by? Thanks!
> 
> Pls pick up Tested-by's when resending.

Sure.

> > +static void __intel_gpio_init_gpio(void __iomem *padcfg0)
> 
> I just don't like __underscore_means_inner_function() I
> strongly prefer function_has_a_proper_name() so please
> come up with something that describes what it is really doing
> and name it like that.
> 
> With that fixes, I'll apply it pronto.

No problem. I'll make v2 and send it out soon.
