From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH v7] gpio: add Intel WhiskeyCove PMIC GPIO driver
Date: Mon, 12 Sep 2016 18:37:07 -0400
Message-ID: <CAP=VYLrS3=YDjaeTsnRA1DOZG14yc9VNeAzcyG9o5AKCH9Fhfw@mail.gmail.com>
References: <20160725215938.GC211765@worksta>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:34390 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752078AbcILWhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2016 18:37:39 -0400
In-Reply-To: <20160725215938.GC211765@worksta>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bin Gao <bin.gao@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>

On Mon, Jul 25, 2016 at 5:59 PM, Bin Gao <bin.gao@linux.intel.com> wrote:
> This patch introduces a separate GPIO driver for Intel WhiskeyCove PMIC.
> This driver is based on gpio-crystalcove.c.
>
> Signed-off-by: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>

This looks like an invalid address, and ....

> Signed-off-by: Bin Gao <bin.gao@intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---

[....]

> +module_platform_driver(wcove_gpio_driver);
> +
> +MODULE_AUTHOR("Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>");

...the same here.  In fact it sure looks like two names.  Anyway I just got a
bounce when I tried to use it...

Paul.
--

> +MODULE_AUTHOR("Bin Gao <bin.gao@intel.com>");
> +MODULE_DESCRIPTION("Intel Whiskey Cove GPIO Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:bxt_wcove_gpio");
> --
> 1.9.1
>
