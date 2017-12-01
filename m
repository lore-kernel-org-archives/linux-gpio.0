From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Mask all interrupts on Intel_Strago
 based systems
Date: Fri, 1 Dec 2017 15:33:12 +0200
Message-ID: <20171201133312.GR22431@lahna.fi.intel.com>
References: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
 <1512131732.25007.534.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:59149 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752379AbdLANdR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Dec 2017 08:33:17 -0500
Content-Disposition: inline
In-Reply-To: <1512131732.25007.534.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-gpio@vger.kernel.org

On Fri, Dec 01, 2017 at 02:35:32PM +0200, Andy Shevchenko wrote:
> On Fri, 2017-12-01 at 13:25 +0300, Mika Westerberg wrote:
> > Guenter Roeck reported an interrupt storm on a prototype system which
> > is
> > based on Cyan Chromebook. The root cause turned out to be a
> > incorrectly
> > configured pin that triggers spurious interrupts. This will be fixed
> > in
> > coreboot but currently we need to prevent the interrupt storm from
> > happening by masking all interrupts (but not GPEs) on those systems.
> > 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> 
> Shouldn't be this URL to the bug mentioned in the comments below?

Doh! Yes, it should. I'll fix it up.

> > +	/*
> > +	 * The same set of machines in chv_no_valid_mask[] have
> > incorrectly
> > +	 * configured GPIOs that generate spurious interrupts so we
> > use
> > +	 * this same list to apply another quirk for them.
> > +	 *
> > +	 * See also https://bugzilla.kernel.org/show_bug.cgi?id=19795
> > 3.
> > +	 */
> 
> > +		chv_writel(~(BIT(pctrl->community->nirqs) - 1),
> > +			   pctrl->regs + CHV_INTMASK);
> 
> It might be considered to use
> 
> GENMASK(32, pctrl->community->nirqs)
> 
> instead of
> 
> ~(BIT(pctrl->community->nirqs) - 1)

Indeed it looks better with GENMASK() so I'll change it in the next
version.
