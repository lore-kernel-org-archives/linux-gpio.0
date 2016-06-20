From: Bin Gao <bin.gao@linux.intel.com>
Subject: Re: [PATCH v2] gpio: add Intel WhiskeyCove GPIO driver
Date: Sun, 19 Jun 2016 20:54:32 -0700
Message-ID: <20160620035431.GA236937@worksta>
References: <20160616212208.GA60092@worksta>
 <20160617090342.GH1739@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:45110 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752570AbcFTDul (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 19 Jun 2016 23:50:41 -0400
Content-Disposition: inline
In-Reply-To: <20160617090342.GH1739@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>

> 
> Looks good. I have couple of minor comments, see below.
Thanks for review again.

> 
> > + * Copyright (C) 2015 Intel Corporation. All rights reserved.
> 
> It is 2016 now isn't it? :-)
Will fix this in v3.

> > +#define DRV_NAME "bxt_wcove_gpio"
> 
> Drop this.
We have _TWO_ places using DRV_NAME(near the end of the file):
static struct platform_driver wcove_gpio_driver = {
       .driver = {
               .name = DRV_NAME,
       },

and

MODULE_ALIAS("platform:" DRV_NAME);

You are suggesting to replace DRV_NAME with bxt_wcove_gpio(but why?)
or something else?

> > + * struct wcove_gpio - Whiskey Cove GPIO controller
> > + * @buslock: for bus lock/sync and unlock.
> > + * @chip: the abstract gpio_chip structure.
> > + * @regmap: the regmap from the parent device.
> 
> Missing kernel-doc for regmap_irq_chip.
Will fix this in v3.

> > +static void wcove_update_irq_mask(struct wcove_gpio *wg,
> > +					int gpio)
> 
> Does this with into 80 chars?
Yes, it fits into 80 chars. Will fix in v3.

