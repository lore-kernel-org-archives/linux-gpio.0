From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Add Intel Sunrisepoint pin controller
 and GPIO support
Date: Tue, 7 Apr 2015 16:42:01 +0300
Message-ID: <20150407134201.GA1734@lahna.fi.intel.com>
References: <1427725909-79500-1-git-send-email-mika.westerberg@linux.intel.com>
 <CACRpkdbhwOd9P56Hwn5XaOMrSTp--XW-i9aDXwmYR+GbzAWurQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:46965 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753286AbbDGNoM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 7 Apr 2015 09:44:12 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbhwOd9P56Hwn5XaOMrSTp--XW-i9aDXwmYR+GbzAWurQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Apr 07, 2015 at 03:18:20PM +0200, Linus Walleij wrote:
> On Mon, Mar 30, 2015 at 4:31 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> 
> > This driver supports pinctrl/GPIO hardware found on Intel Sunrisepoint (a
> > Skylake PCH) providing users a pinctrl and GPIO interfaces (including GPIO
> > interrupts).
> >
> > The driver is split into core and platform parts so that the same core
> > driver can be reused in other drivers for other Intel GPIO hardware that is
> > based on the same host controller design.
> >
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> How could I possibly resist this gorgeous driver that just
> does everything right? Patch applied for 4.1.

Thanks!

> > +config PINCTRL_INTEL
> > +       tristate
> > +       select PINMUX
> > +       select PINCONF
> > +       select GENERIC_PINCONF
> > +       select GPIOLIB
> > +       select GPIOLIB_IRQCHIP
> 
> Is this opening a refactoring possibility sharing more code/infrastructure
> amongst the Intel drivers or just something that will be used for
> new SoCs going forward?

We are going to use the same core for newer hardware as much as
possible. Hopefully all new SoCs will have GPIO controller which is
based on the same hardware design.

For the existing, unfortunately the hardware differentiates too much
from Sunrisepoint that it does not make much sense to factor them to use
this new core.
