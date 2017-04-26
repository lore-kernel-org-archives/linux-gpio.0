From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: gpio-wcove: fix GPIO IRQ status mask
Date: Wed, 26 Apr 2017 16:26:17 +0200
Message-ID: <CACRpkda-GxRLJ=RHhDLRiu_ub=mpibQ7UPXg0=p-7jwJKpK5kg@mail.gmail.com>
References: <CAHp75VefVpwf-Ooom9Am3Gfmc8zR31fqWxTzYXest_+YTOk2yg@mail.gmail.com>
 <3257d22879148692da6887f89843389bd37ee877.1493060870.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:38483 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1948988AbdDZO0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2017 10:26:19 -0400
Received: by mail-it0-f41.google.com with SMTP id f187so3632861ite.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Apr 2017 07:26:19 -0700 (PDT)
In-Reply-To: <3257d22879148692da6887f89843389bd37ee877.1493060870.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Bin Gao <bin.gao@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, sathyaosid@gmail.com

On Mon, Apr 24, 2017 at 9:15 PM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:

> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> According to Whiskey Cove PMIC spec, bit 7 of GPIOIRQ0_REG belongs to
> battery IO. So we should skip this bit when checking for GPIO IRQ pending
> status. Otherwise, wcove_gpio_irq_handler() might go into the infinite
> loop until IRQ "pending" status becomes 0. This patch fixes this issue.
>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Looks fine to me, tentatively applied.

Bin, Mika, Andy, OK?

Yours,
Linus Walleij
