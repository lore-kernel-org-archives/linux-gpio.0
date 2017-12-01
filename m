From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Mask all interrupts on
 Intel_Strago based systems
Date: Fri, 01 Dec 2017 14:35:32 +0200
Message-ID: <1512131732.25007.534.camel@linux.intel.com>
References: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:35730 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752124AbdLAMkF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 1 Dec 2017 07:40:05 -0500
In-Reply-To: <20171201102504.38709-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-gpio@vger.kernel.org

On Fri, 2017-12-01 at 13:25 +0300, Mika Westerberg wrote:
> Guenter Roeck reported an interrupt storm on a prototype system which
> is
> based on Cyan Chromebook. The root cause turned out to be a
> incorrectly
> configured pin that triggers spurious interrupts. This will be fixed
> in
> coreboot but currently we need to prevent the interrupt storm from
> happening by masking all interrupts (but not GPEs) on those systems.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945

Shouldn't be this URL to the bug mentioned in the comments below?

> +	/*
> +	 * The same set of machines in chv_no_valid_mask[] have
> incorrectly
> +	 * configured GPIOs that generate spurious interrupts so we
> use
> +	 * this same list to apply another quirk for them.
> +	 *
> +	 * See also https://bugzilla.kernel.org/show_bug.cgi?id=19795
> 3.
> +	 */

> +		chv_writel(~(BIT(pctrl->community->nirqs) - 1),
> +			   pctrl->regs + CHV_INTMASK);

It might be considered to use

GENMASK(32, pctrl->community->nirqs)

instead of

~(BIT(pctrl->community->nirqs) - 1)

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
