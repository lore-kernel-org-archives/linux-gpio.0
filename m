From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/1] pinctrl: baytrail: Do not add all GPIOs to IRQ
 domain
Date: Wed, 11 Jan 2017 16:02:10 +0200
Message-ID: <20170111140210.GR2330@lahna.fi.intel.com>
References: <20170111134900.31026-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:37324 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757114AbdAKOGj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Jan 2017 09:06:39 -0500
Content-Disposition: inline
In-Reply-To: <20170111134900.31026-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, "Robert R . Howell" <rhowell@uwyo.edu>

On Wed, Jan 11, 2017 at 03:49:00PM +0200, Andy Shevchenko wrote:
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

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
