From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Add Intel Merrifield pin
 controller support
Date: Wed, 22 Jun 2016 13:13:13 +0300
Message-ID: <20160622101313.GD1739@lahna.fi.intel.com>
References: <1466351099-22282-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20160620092007.GB1739@lahna.fi.intel.com>
 <1466514261.30123.221.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:39824 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751485AbcFVKNg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 22 Jun 2016 06:13:36 -0400
Content-Disposition: inline
In-Reply-To: <1466514261.30123.221.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, Jun 21, 2016 at 04:04:21PM +0300, Andy Shevchenko wrote:
> On Mon, 2016-06-20 at 12:20 +0300, Mika Westerberg wrote:
> > On Sun, Jun 19, 2016 at 06:44:59PM +0300, Andy Shevchenko wrote:
> > > This driver adds pinctrl support for Intel Merrifield. The IP block
> > > which is
> > > called Family-Level Interface Shim is a separate entity in SoC. The
> > > GPIO driver
> > > (gpio-intel-mid.c) will be updated accordingly to support pinctrl
> > > interface.
> > > 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Mika, my answers below. (For the rest I agree with you and fixed that
> locally)
> 
> > > +
> > > +/**
> > > + * struct mrfld_pinctrl_soc_data - Intel pin controller per-SoC
> > > configuration
> > > + * @name: Name of the family
> > > + * @pins: Array if pins this pinctrl controls
> > > + * @npins: Number of pins in the array
> > > + * @groups: Array of pin groups
> > > + * @ngroups: Number of groups in the array
> > > + * @functions: Array of functions
> > > + * @nfunctions: Number of functions in the array
> > > + * @families: Array of families this pinctrl handles
> > > + * @nfamilies: Number of families in the array
> > > + *
> > > + * The @families is used as a template by the core driver. It will
> > > make
> > > + * copy of all families and fill in rest of the information.
> > > + */
> > > +struct mrfld_pinctrl_soc_data {
> > > +	const char *name;
> > > +	const struct pinctrl_pin_desc *pins;
> > > +	size_t npins;
> > > +	const struct intel_pingroup *groups;
> > > +	size_t ngroups;
> > > +	const struct intel_function *functions;
> > > +	size_t nfunctions;
> > > +	const struct mrfld_family *families;
> > > +	size_t nfamilies;
> > > +};
> > > +
> > > +static const struct mrfld_pinctrl_soc_data mrfld_soc_data = {
> > > +	.pins = mrfld_pins,
> > > +	.npins = ARRAY_SIZE(mrfld_pins),
> > > +	.groups = mrfld_groups,
> > > +	.ngroups = ARRAY_SIZE(mrfld_groups),
> > > +	.functions = mrfld_functions,
> > > +	.nfunctions = ARRAY_SIZE(mrfld_functions),
> > > +	.families = mrfld_families,
> > > +	.nfamilies = ARRAY_SIZE(mrfld_families),
> > > +};
> > > +
> > 
> > These are pointless. There can be only one kind of SoC data in
> > Merrifield so please drop these. See for example pinctrl-cherryview.c.
> 
> I didn't quite get what should I look for? In mentioned driver we have
> struct chv_community which contains same fields. IIRC I took it from
> exactly that driver.

There is no unnecessary soc_data in pinctrl-cherryview.c.

> > +static int mrfld_pinmux_set_mux(struct pinctrl_dev *pctldev,
> > > unsigned function,
> > > +				unsigned group)
> > > +{
> > > +	struct mrfld_pinctrl *mp =
> > > pinctrl_dev_get_drvdata(pctldev);
> > > +	const struct intel_pingroup *grp = &mp->soc->groups[group];
> > > +	unsigned long flags;
> > > +	unsigned int i;
> > > +
> > > +	spin_lock_irqsave(&mp->lock, flags);
> > 
> > If you ever need to call the backing pinctrl functions from irqchip
> > driver, please use raw_spinlock instead.
> 
> Frankly speaking I dunno. How may I check this?

If the GPIO driver calling to this pinctrl is implementing irqchip then
most probably you need to use raw_spinlock.
