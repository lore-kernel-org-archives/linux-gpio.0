From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH 1/2] gpio: simplify adding threaded interrupts
Date: Wed, 30 Nov 2016 15:20:42 +0100
Message-ID: <1777087.OkzDx8qNW5@ws-stein>
References: <1479991133-24153-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:39119 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1757227AbcK3OUt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 30 Nov 2016 09:20:49 -0500
In-Reply-To: <1479991133-24153-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Lars Poeschel <poeschel@lemonage.de>, Octavian Purdila <octavian.purdila@intel.com>, Daniel Baluta <daniel.baluta@intel.com>, Bin Gao <bin.gao@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Semen Protsenko <semen.protsenko@globallogic.com>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Patrice Chotard <patrice.chotard@st.com>

Am Donnerstag, 24. November 2016, 13:38:53 schrieb Linus Walleij:
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

I've tested this on a board using both gpio-mcp23s08.c and gpio-pca953x.c and 
coulnd't detect any change/regression in dmesg. Is this to be expected?
If so
Tested-by: Alexander Stein <alexander.stein@systec-electronic.com>

Best regards,
Alexander

