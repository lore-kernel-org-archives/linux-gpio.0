From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 3/3] gpiolib: append SFI helpers for GPIO API
Date: Mon, 09 Dec 2013 12:13:37 +0200
Message-ID: <1386584017.1871.121.camel@smile>
References: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1386261409-13850-4-git-send-email-andriy.shevchenko@linux.intel.com>
	 <52A10A5A.9080100@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:40308 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760524Ab3LIKOP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 05:14:15 -0500
In-Reply-To: <52A10A5A.9080100@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On Thu, 2013-12-05 at 15:20 -0800, David Cohen wrote:
> On 12/05/2013 08:36 AM, Andy Shevchenko wrote:
> > To support some (legacy) firmwares and platforms let's make life easier for
> > their customers.
> >
> > This patch provides a function which converts sfi_gpio_table_entry to
> > gpio_desc. The use of it is integrated into GPIO library to enable generic
> > access to the SFI GPIO resources.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/Kconfig       |  4 ++++
> >  drivers/gpio/Makefile      |  1 +
> >  drivers/gpio/gpiolib-sfi.c | 28 ++++++++++++++++++++++++++++
> >  drivers/gpio/gpiolib.c     |  3 +++
> >  drivers/gpio/gpiolib.h     | 13 +++++++++++++
> >  5 files changed, 49 insertions(+)
> >  create mode 100644 drivers/gpio/gpiolib-sfi.c
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index ae3682d..a12752a 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -51,6 +51,10 @@ config OF_GPIO
> >  	def_bool y
> >  	depends on OF
> >  
> > +config GPIO_SFI
> > +	def_bool y
> > +	depends on SFI
> > +
> >  config GPIO_ACPI
> >  	def_bool y
> >  	depends on ACPI
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index ee95154..5373e3a 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -5,6 +5,7 @@ ccflags-$(CONFIG_DEBUG_GPIO)	+= -DDEBUG
> >  obj-$(CONFIG_GPIO_DEVRES)	+= devres.o
> >  obj-$(CONFIG_GPIOLIB)		+= gpiolib.o
> >  obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
> > +obj-$(CONFIG_GPIO_SFI)		+= gpiolib-sfi.o
> >  obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
> >  
> >  # Device drivers. Generally keep list sorted alphabetically
> > diff --git a/drivers/gpio/gpiolib-sfi.c b/drivers/gpio/gpiolib-sfi.c
> > new file mode 100644
> > index 0000000..c804314
> > --- /dev/null
> > +++ b/drivers/gpio/gpiolib-sfi.c
> > @@ -0,0 +1,28 @@
> > +/*
> > + * Simple Firmware Interface (SFI) helpers for GPIO API
> > + *
> > + * Copyright (C) 2013, Intel Corporation
> > + * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/sfi.h>
> > +#include <linux/errno.h>
> > +#include <linux/err.h>
> > +
> > +#include "gpiolib.h"
> > +
> > +struct gpio_desc *sfi_get_gpiod_by_name(const char *name)
> > +{
> > +	struct sfi_gpio_table_entry *pentry;
> > +
> > +	pentry = sfi_gpio_get_entry_by_name(name);
> > +	if (!pentry)
> > +		return ERR_PTR(-ENODEV);
> 
> With my comments on patch 2/3, I'd suggest here:
> if (!pentry)
>      return ERR_PTR(-EINVAL);

It should never be here. We have to avoid tristate return pointers.

> if (IS_ERR(pentry))
>      return pentry;

This one correct, I agree.

> !pentry == could not find

Rather -ENOENT.

> IS_ERR(pentry) == something else went wrong
> 
> Br, David
> 
> 
> > +
> > +	return gpio_to_desc(pentry->pin_no);
> > +}
> >
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

