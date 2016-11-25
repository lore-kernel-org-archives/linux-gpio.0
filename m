From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/2] gpio: simplify adding threaded interrupts
Date: Fri, 25 Nov 2016 16:33:37 +0200
Message-ID: <20161125143337.GO1476@lahna.fi.intel.com>
References: <1479991133-24153-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:7345 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754265AbcKYOe5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Nov 2016 09:34:57 -0500
Content-Disposition: inline
In-Reply-To: <1479991133-24153-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Lars Poeschel <poeschel@lemonage.de>, Octavian Purdila <octavian.purdila@intel.com>, Daniel Baluta <daniel.baluta@intel.com>, Bin Gao <bin.gao@linux.intel.com>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Semen Protsenko <semen.protsenko@globallogic.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Patrice Chotard <patrice.chotard@st.com>

On Thu, Nov 24, 2016 at 01:38:53PM +0100, Linus Walleij wrote:
> This tries to simplify the use of CONFIG_GPIOLIB_IRQCHIP when
> using threaded interrupts: add a new call
> gpiochip_irqchip_add_nested() to indicate that we're dealing
> with a nested rather than a chained irqchip, then create a
> separate gpiochip_set_nested_irqchip() to mirror
> the gpiochip_set_chained_irqchip() call to connect the
> parent and child interrupts.
> 
> In the nested case gpiochip_set_nested_irqchip() does nothing
> more than call irq_set_parent() on each valid child interrupt,
> which has little semantic effect in the kernel, but this is
> probably still formally correct.
> 
> Update all drivers using nested interrupts to use
> gpiochip_irqchip_add_nested() so we can now see clearly
> which these users are.
> 
> The DLN2 driver can drop its specific hack with
> .irq_not_threaded as we now recognize whether a chip is
> threaded or not from its use of gpiochip_irqchip_add_nested()
> signature rather than from inspecting .can_sleep.
> 
> We rename the .irq_parent to .irq_chained_parent since this
> parent IRQ is only really kept around for the chained
> interrupt handlers.
> 
> Cc: Lars Poeschel <poeschel@lemonage.de>
> Cc: Octavian Purdila <octavian.purdila@intel.com>
> Cc: Daniel Baluta <daniel.baluta@intel.com>
> Cc: Bin Gao <bin.gao@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

I like this change because now you can immediately see from a driver
which kind of interrupt we are dealing with.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
