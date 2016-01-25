From: Peter Tyser <ptyser@xes-inc.com>
Subject: Re: [PATCH 2/3] mfd: lpc_ich: use a correct mask for the GPIO base
 address
Date: Mon, 25 Jan 2016 10:07:50 -0600
Message-ID: <1453738070.1770.74.camel@xes-inc.com>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
	 <1453566729-30220-3-git-send-email-antoine.tenart@free-electrons.com>
	 <20160125124444.GJ3368@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:58527 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932864AbcAYQKA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 25 Jan 2016 11:10:00 -0500
In-Reply-To: <20160125124444.GJ3368@x1>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>


On Mon, 2016-01-25 at 12:44 +0000, Lee Jones wrote:
> On Sat, 23 Jan 2016, Antoine Tenart wrote:
> 
> > The GPIO base address is read from the GPIOBASE register. The first
> > bit must be cleared as it can be hardwired to 1 to represent the i/o
> > space. Other bits are either containing the base address of are
> > reserved. They should not be cleared as all the chipsets do not have
> > the same reserved bits.
> > 
> > Signed-off-by: Antoine Tenart tenart@free-electrons.com>
> > ---
> >  drivers/mfd/lpc_ich.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> Applied, thanks.

Is it possible to hold off on the application of the change Lee?

> > diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> > index b514f3cf140d..f13a5ded3958 100644
> > --- a/drivers/mfd/lpc_ich.c
> > +++ b/drivers/mfd/lpc_ich.c
> > @@ -921,7 +921,10 @@ static int lpc_ich_init_gpio(struct pci_dev *dev)
> >  gpe0_done:
> >         /* Setup GPIO base register */
> >         pci_read_config_dword(dev, priv->gbase, &base_addr_cfg);
> > -       base_addr = base_addr_cfg & 0x0000ff80;
> > +
> > +       /* Clear the i/o flag */
> > +       base_addr = base_addr_cfg & ~BIT(0);
> > +


Does this patch work around an issue you are seeing?  Looking at the Bay 
Trail EDS, the GPIO base address register looks like it should work fine 
with the original code (it uses 0xff00 as a mask for the address, and 
reserves 0x80 which reads as a 0).  Also, Bay Trail bit 1 is an enable 
flag, which this patch wouldn't mask off.  Eg if the BIOS enables the GPIO 
controller and sets the enable bit, I think things would break with this 
patch.

It's also scary to not mask off the reserved bits on other Intel chipsets -
you're assuming they all read as 0 and I'm not sure if this is true or 
not.  The patch also doesn't make the same change to the other base 
register reads either, and ideally they'd be kept in sync.

Seems like things should be left as-is, or use an accurate chip-specific 
mask.

I'd leave as-is personally.  Like Mika mentioned, Baytrail GPIO should 
already be supported elsewhere, which should make this change unnecessary.

Regards,
Peter
