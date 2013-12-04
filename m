From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Tue, 03 Dec 2013 17:06:15 -0800
Message-ID: <529E8007.6060407@linux.intel.com>
References: <1386116613-5241-1-git-send-email-br1@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:45708 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754721Ab3LDBBi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 3 Dec 2013 20:01:38 -0500
In-Reply-To: <1386116613-5241-1-git-send-email-br1@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: linus.walleij@linaro.org, wim@iguana.be, linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com, mathias.nyman@linux.intel.com, simon.guinot@sequanux.org

Hi Bruno,

I've got a small suggestion below.
But regardless that, your patch looks fine.

On 12/03/2013 04:23 PM, Bruno Randolf wrote:
> This patch adds support for the GPIOs found on the SMSC "Super I/O" chips
> SCH311x.
>
> The chip detection and I/O functions are copied from sch311x_wdt.c
>
> Signed-off-by: Bruno Randolf <br1@einfach.org>
>
> ---
> Notes:
> - All GPIOs are now supported, driver data is runtime allocated
>   and I tried to address all comments as far as possible.
> - Still a platform device is registered, similar to gpio-f7188x.c
> ---
>  drivers/gpio/Kconfig        |   9 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-sch311x.c | 430 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 440 insertions(+)
>  create mode 100644 drivers/gpio/gpio-sch311x.c
>

[snip]

> +static int __init sch311x_gpio_init(void)
> +{
> +	int err, i, found = 0;
> +	unsigned short addr = 0;
> +
> +	for (i = 0; !found && i < ARRAY_SIZE(sch311x_ioports); i++)
> +		if (sch311x_detect(sch311x_ioports[i], &addr) == 0)
> +			found++;

'found' variable isn't necessary here. Just turn it into a label placed
below
'return -ENODEV' then 'goto found' directly.

> +	if (!found)

This 'if' wouldn't be necessary anymore.
You'd call return unconditionally at this point.

Br, David Cohen

> +		return -ENODEV;
> +
> +	err = platform_driver_register(&sch311x_gpio_driver);
> +	if (err)
> +		return err;
> +
> +	err = sch311x_gpio_pdev_add(addr);
> +	if (err)
> +		goto unreg_platform_driver;
> +
> +	return 0;
> +
> +unreg_platform_driver:
> +	platform_driver_unregister(&sch311x_gpio_driver);
> +	return err;
> +}
> +
> +static void __exit sch311x_gpio_exit(void)
> +{
> +	platform_device_unregister(sch311x_gpio_pdev);
> +	platform_driver_unregister(&sch311x_gpio_driver);
> +}
> +
> +module_init(sch311x_gpio_init);
> +module_exit(sch311x_gpio_exit);
> +
> +MODULE_AUTHOR("Bruno Randolf <br1@einfach.org>");
> +MODULE_DESCRIPTION("SMSC SCH311x GPIO Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:gpio-sch311x");

