From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpio: add Intel WhiskeyCove GPIO driver
Date: Mon, 20 Jun 2016 10:37:24 +0300
Message-ID: <20160620073724.GS1739@lahna.fi.intel.com>
References: <20160616212208.GA60092@worksta>
 <20160617090342.GH1739@lahna.fi.intel.com>
 <20160620035431.GA236937@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:53626 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751815AbcFTHhr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 20 Jun 2016 03:37:47 -0400
Content-Disposition: inline
In-Reply-To: <20160620035431.GA236937@worksta>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>

On Sun, Jun 19, 2016 at 08:54:32PM -0700, Bin Gao wrote:
> > > +#define DRV_NAME "bxt_wcove_gpio"
> > 
> > Drop this.
> We have _TWO_ places using DRV_NAME(near the end of the file):
> static struct platform_driver wcove_gpio_driver = {
>        .driver = {
>                .name = DRV_NAME,
>        },
> 
> and
> 
> MODULE_ALIAS("platform:" DRV_NAME);
> 
> You are suggesting to replace DRV_NAME with bxt_wcove_gpio(but why?)
> or something else?

Do instead this:

	.driver = {
		.name ="bxt_wcove_gpio",
	},

and

MODULE_ALIAS("platform:bxt_wcove_gpio");
