From: Antonio Ospite <ao2@ao2.it>
Subject: Re: [PATCH] pinctrl: baytrail: explicitly set gpio chip base
Date: Mon, 4 May 2015 13:36:45 +0200
Message-ID: <20150504133646.391d1f3897ec2d51493ac28a@ao2.it>
References: <1430298162-20238-1-git-send-email-ao2@ao2.it>
	<20150430110237.GV1534@lahna.fi.intel.com>
	<20150430235141.2928e7fa8a193437346b76aa@ao2.it>
	<20150504104000.GZ1534@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp207.alice.it ([82.57.200.103]:22275 "EHLO smtp207.alice.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752171AbbEDLhN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 4 May 2015 07:37:13 -0400
In-Reply-To: <20150504104000.GZ1534@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>

On Mon, 4 May 2015 13:40:00 +0300
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> On Thu, Apr 30, 2015 at 11:51:41PM +0200, Antonio Ospite wrote:
> > Hi Mika,
> > 
> > On Thu, 30 Apr 2015 14:02:37 +0300
> > Mika Westerberg <mika.westerberg@linux.intel.com> wrote:
> > 
> > > On Wed, Apr 29, 2015 at 11:02:42AM +0200, Antonio Ospite wrote:
> > > > Having the gpio chip base set explicitly makes it easier to compare the
> > > > GPIOs definitions with the ones found on some Android kernels.
> > > > 
> > > > Signed-off-by: Antonio Ospite <ao2@ao2.it>
> > > > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: linux-gpio@vger.kernel.org
> > > > ---
> > > >  drivers/pinctrl/intel/pinctrl-baytrail.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> > > > index 2062c22..4b2f594 100644
> > > > --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> > > > +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> > > > @@ -548,6 +548,7 @@ static int byt_gpio_probe(struct platform_device *pdev)
> > > >  	struct acpi_device *acpi_dev;
> > > >  	struct pinctrl_gpio_range *range;
> > > >  	acpi_handle handle = ACPI_HANDLE(dev);
> > > > +	int base_offset;
> > > >  	int ret;
> > > >  
> > > >  	if (acpi_bus_get_device(handle, &acpi_dev))
> > > > @@ -559,12 +560,14 @@ static int byt_gpio_probe(struct platform_device *pdev)
> > > >  		return -ENOMEM;
> > > >  	}
> > > >  
> > > > +	base_offset = 0;
> > > >  	for (range = byt_ranges; range->name; range++) {
> > > >  		if (!strcmp(acpi_dev->pnp.unique_id, range->name)) {
> > > >  			vg->chip.ngpio = range->npins;
> > > >  			vg->range = range;
> > > >  			break;
> > > >  		}
> > > > +		base_offset += range->npins;
> > > >  	}
> > > >  
> > > >  	if (!vg->chip.ngpio || !vg->range)
> > > > @@ -590,7 +593,7 @@ static int byt_gpio_probe(struct platform_device *pdev)
> > > >  	gc->get = byt_gpio_get;
> > > >  	gc->set = byt_gpio_set;
> > > >  	gc->dbg_show = byt_gpio_dbg_show;
> > > > -	gc->base = -1;
> > > > +	gc->base = base_offset;
> > > 
> > > But this changes the base from being dynamically allocated to always
> > > start from 0, right?
> > >
> > 
> > Yes, that's the point: to have exactly the same bases as in the Android
> > kernels found in the wild, that is:
> > 
> >   $ ls -1 /sys/class/gpio
> >   export
> >   gpiochip0
> >   gpiochip102
> >   gpiochip130
> >   unexport
> > 
> > This makes it easier for me to verify the mappings when trying to make
> > my tablet work with the mainline kernel.
> > 
> > I might as well keep the change local, but I thought that others may
> > find it useful.
> > 
> > Are there drawbacks of such fixed scheme?
> 
> Well, if you happen to have another GPIO chip (a GPIO expander for
> example) and it somehow gets loaded before this driver. It may take the
> range you have reserved for the BYT driver.
> 
> Not sure how realistic case that is, though...

Indeed, being this for the SoC gpio controller I thought it was
unlikely, however I do not have a huge experience on these matters.

I have no strong opinion on this, Mika, so whether or not you merge the
change it'll be fine by me.

Thanks,
   Antonio

-- 
Antonio Ospite
http://ao2.it

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
