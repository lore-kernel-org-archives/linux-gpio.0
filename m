From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Subject: Re: [PATCH 3/6] gpio: add a userspace chardev ABI for GPIOs
Date: Wed, 27 Jan 2016 18:05:04 +0800
Message-ID: <CAFy1USR62NooHEjHw0nJmsuHRuq0QDhKentjf40gDOqC+HPrdg@mail.gmail.com>
References: <1445502750-22672-1-git-send-email-linus.walleij@linaro.org>
	<1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:37151 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753622AbcA0KFF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 05:05:05 -0500
Received: by mail-ig0-f177.google.com with SMTP id h5so8542752igh.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 02:05:05 -0800 (PST)
In-Reply-To: <1445502750-22672-4-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>

Hi, Linus

On 10/22/2015 04:32 PM, Linus Walleij wrote:
> A new chardev that is to be used for userspace GPIO access is
[...]
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> new file mode 100644
> index 000000000000..3188a87bdaa0
> --- /dev/null
> +++ b/include/uapi/linux/gpio.h
> @@ -0,0 +1,28 @@
> +/*
> + * <linux/gpio.h> - userspace ABI for the GPIO character devices
> + *
> + * Copyright (C) 2015 Linus Walleij
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + */
> +#ifndef _UAPI_GPIO_H_
> +#define _UAPI_GPIO_H_
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +/**
> + * struct gpiochip_info - Information about a certain GPIO chip
> + * @name: the name of this GPIO chip
> + * @lines: number of GPIO lines on this chip
> + */
> +struct gpiochip_info {
> + char name[32];
> + __u32 lines;
> +};
> +
> +#define GPIO_GET_CHIPINFO_IOCTL _IOR('o', 0x01, struct gpiochip_info)

I am trying to use this interface to do my gpio mockup test. I need to list
all the gpiochips attach to one gpio driver(aka gpio-mockup, there may
be more than one gpio drivers in the system). And then test some of the
pin of each gpio_chip.

>From the api(ioctl GPIO_GET_CHIPINFO_IOCTL: gpiochip_info), it seems
that I could list all the gpiochips or list only one gpiochip. But
I could not list gpiochip belongs to one gpio driver.

Do I understand correctly?
Will we add a new api to do it?

Regards

Bamvor

> +
> +#endif /* _UAPI_GPIO_H_ */
>
