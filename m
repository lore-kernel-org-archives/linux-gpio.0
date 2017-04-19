From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: gpio-wcove: fix GPIO irq status mask
Date: Wed, 19 Apr 2017 23:41:37 +0300
Message-ID: <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
References: <d2f4d86de7bb816663e1db3a1385ae917aa699ca.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:33925 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1764621AbdDSUlj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Apr 2017 16:41:39 -0400
In-Reply-To: <d2f4d86de7bb816663e1db3a1385ae917aa699ca.1492190203.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

On Fri, Apr 14, 2017 at 8:29 PM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> According to Whiskey cove PMIC spec, bit 7 of GPIOIRQ0_REG belongs to

cove -> Cove

> battery IO. So we should skip this bit when checking for GPIO irq pending

irq -> IRQ

> status. Otherwise, wcove_gpio_irq_handler() might go into the infinite
> loop until irq "pending" status becomes 0. This patch fixes this issue.

Ditto.

> +#define GPIO_IRQ0_MASK         0x7f
> +#define GPIO_IRQ1_MASK         0x3f

GENMASK()

> -               pending = p[0] | (p[1] << 8);
> +               pending = (p[0] & GPIO_IRQ0_MASK) |
> +                       ((p[1] & GPIO_IRQ1_MASK) << 7);

I would leave this on one line despite 80 characters limit (actually
how long is it?).

-- 
With Best Regards,
Andy Shevchenko
