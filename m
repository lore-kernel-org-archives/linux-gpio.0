From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: Set pin direction properly
Date: Mon, 09 Jan 2017 16:45:39 +0200
Message-ID: <1483973139.26691.35.camel@linux.intel.com>
References: <20170102120722.178343-1-andriy.shevchenko@linux.intel.com>
         <b1cd077c-734a-ba80-3eb7-927be8da8e38@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:37375 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1761537AbdAIOpn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Jan 2017 09:45:43 -0500
In-Reply-To: <b1cd077c-734a-ba80-3eb7-927be8da8e38@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, 2017-01-09 at 16:29 +0200, Jarkko Nikula wrote:
> On 01/02/2017 02:07 PM, Andy Shevchenko wrote:
> > There are two bits in the PADCFG0 register to configure direction,
> > one per
> > TX/RX buffers.
> > 
> > For now we wrongly assume that the GPIO is always requested before
> > it is being
> > used, which is not true when the GPIO is used through irqchip. In
> > this case the
> > GPIO is never requested and we never enable RX buffer for it.
> > 
> > Fix this by setting both bits accordingly.
> > 
> > Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > 


> > @@ -392,18 +407,11 @@ static int intel_gpio_set_direction(struct
> > pinctrl_dev *pctldev,
> 
> I'm testing this on top of v4.10.0-rc3 and I don't see changes in 
> PADCFG0 after this patch. I guess reason is that the code doesn't go 
> through above functions for the pin that is used through irqchip but 
> through intel_gpio_irq_type().
> 
> Am I missing some another patch or should your patch add 
> __intel_gpio_set_direction() also there?

The problem you reported about apparently discovers two places to be
fixed. This is part 1. Part 2 will be send with GPIO ACPI clean up / bug
fix series later.

The rest of patches is available on my public tree:
https://bitbucket.org/andy-shev/linux/branch/topic%2Fuart%2frpm

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
