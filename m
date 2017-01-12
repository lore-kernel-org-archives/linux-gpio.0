From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] pinctrl: baytrail: Do not add all GPIOs to IRQ domain
Date: Thu, 12 Jan 2017 08:12:47 +0100
Message-ID: <CACRpkdaoLOC54RmxVhEG+WLdQEw7X4M=9nEmkeg81kvf+k0D5w@mail.gmail.com>
References: <20170111134900.31026-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:33525 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750723AbdALHMt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Jan 2017 02:12:49 -0500
Received: by mail-qt0-f177.google.com with SMTP id v23so10223610qtb.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 23:12:48 -0800 (PST)
In-Reply-To: <20170111134900.31026-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Robert R . Howell" <rhowell@uwyo.edu>

On Wed, Jan 11, 2017 at 2:49 PM, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> When DIRECT_IRQ_EN is set, the pin is routed directly to the IO-APIC bypassing
> the GPIO driver completely. However, the mask register is still used to
> determine if the pin is supposed to generate IRQ or not.
>
> So with commit 3ae02c14d964 the IRQ core masks all IRQs (because of
> handle_bad_irq()) the pin connected to the touchscreen gets masked as well and
> hence no interrupts.
>
> To make this all work as expected we do not add those GPIOs to the IRQ domain
> that can actually propagate interrupts.
>
> Fixes: 3ae02c14d964 ("pinctrl: intel: set default handler to be handle_bad_irq()")
> Reported-by: Robert R. Howell <rhowell@uwyo.edu>
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> In v3:

Patch applied for fixes.

Yours,
Linus Walleij
