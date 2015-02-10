From: Rojhalat Ibrahim <imr@rtschenk.de>
Subject: Re: [PATCH v3 2/4] gpiolib: add gpiod_get_array and gpiod_put_array functions
Date: Tue, 10 Feb 2015 13:59:37 +0100
Message-ID: <1974932.dtRe9ZZYRo@pcimr>
References: <5520672.Jf0M3ih51r@pcimr> <74928007.UMhZGNk44t@pcimr> <20150210124118.GA29259@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:47634 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751973AbbBJM7m (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Feb 2015 07:59:42 -0500
In-Reply-To: <20150210124118.GA29259@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Tuesday 10 February 2015 14:41:18 Mika Westerberg wrote:
> On Tue, Feb 10, 2015 at 01:21:19PM +0100, Rojhalat Ibrahim wrote:
> > On Tuesday 10 February 2015 12:40:34 Mika Westerberg wrote:
> > 
> > > > +
> > > > +	for (descs->array_size = 0; descs->array_size < count; ) {
> > >                                                               ^
> > >                                                               |
> > >                                                               +-- extra whitespace
> > > 
> > > > +		desc = gpiod_get_index(dev, con_id, descs->array_size, flags);
> > > > +		if (IS_ERR(desc)) {
> > > > +			gpiod_put_array(descs);
> > > > +			return ERR_PTR(PTR_ERR(desc));
> > > 
> > > Uh, why not
> > > 
> > > 	return desc
> > > 
> > > ?
> > 
> > Because of the different pointer type. desc is a pointer to a GPIO descriptor
> > whereas the return type of the function is a pointer to struct gpio_descs.
> 
> Right. I wonder if ERR_CAST() may be used here.
> 

Didn't know about that one. I'll use it in the next revision.

Thanks for looking at this.


