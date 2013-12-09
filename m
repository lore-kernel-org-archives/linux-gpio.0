From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 2/2] gpiolib: append SFI helpers for GPIO API
Date: Mon, 9 Dec 2013 15:04:39 +0200
Message-ID: <20131209130439.GE2281@intel.com>
References: <1386589829-2877-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1386589829-2877-3-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:28364 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933349Ab3LIM6G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 07:58:06 -0500
Content-Disposition: inline
In-Reply-To: <1386589829-2877-3-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On Mon, Dec 09, 2013 at 01:50:29PM +0200, Andy Shevchenko wrote:
> diff --git a/drivers/gpio/gpiolib-sfi.c b/drivers/gpio/gpiolib-sfi.c
> new file mode 100644
> index 0000000..43db749
> --- /dev/null
> +++ b/drivers/gpio/gpiolib-sfi.c
> @@ -0,0 +1,28 @@
> +/*
> + * Simple Firmware Interface (SFI) helpers for GPIO API
> + *
> + * Copyright (C) 2013, Intel Corporation
> + * Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/sfi.h>
> +#include <linux/errno.h>
> +#include <linux/err.h>
> +
> +#include "gpiolib.h"
> +
> +struct gpio_desc *sfi_get_gpiod_by_name(const char *name)
> +{
> +	struct sfi_gpio_table_entry *pentry;
> +
> +	pentry = sfi_gpio_get_entry_by_name(name);
> +	if (IS_ERR(pentry))
> +		return pentry;
> +
> +	return gpio_to_desc(pentry->pin_no);
> +}

Do you really need add a new file just to have the above supported? I mean
that if you place that function to drivers/gpio/gpiolib.c with the
appropriate:

#ifdef CONFIG_SFI
#else
#endif

you can get rid of that file (and Kconfig + Makefile changes) completely,
no?
