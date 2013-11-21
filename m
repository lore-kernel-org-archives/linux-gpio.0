From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 2/3] gpiolib: append SFI helpers for GPIO API
Date: Thu, 21 Nov 2013 12:40:06 +0200
Message-ID: <20131121104006.GB2281@intel.com>
References: <1384957896-3477-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1384957896-3477-3-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:58885 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752079Ab3KUKdw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 Nov 2013 05:33:52 -0500
Content-Disposition: inline
In-Reply-To: <1384957896-3477-3-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, David Cohen <david.a.cohen@intel.com>, "linux-gpio @ vger . kernel . org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>, "linux-kernel @ vger . kernel . org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Len Brown <len.brown@intel.com>

On Wed, Nov 20, 2013 at 04:31:35PM +0200, Andy Shevchenko wrote:
> diff --git a/include/linux/gpio/sfi.h b/include/linux/gpio/sfi.h
> new file mode 100644
> index 0000000..3e111ad
> --- /dev/null
> +++ b/include/linux/gpio/sfi.h
> @@ -0,0 +1,37 @@
> +#ifndef _LINUX_SFI_GPIO_H_
> +#define _LINUX_SFI_GPIO_H_
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/sfi.h>
> +
> +#ifdef CONFIG_GPIO_SFI
> +
> +struct gpio_desc *sfi_get_gpiod_by_name(const char *name);

I'm wondering should this function be exported at all? What the drivers
should be using is gpiod_get_xxx() APIs and not DT/ACPI/SFI specific
interfaces.

Yeah, we have the same in ACPI version but I'm planning to get rid of it
completely.
