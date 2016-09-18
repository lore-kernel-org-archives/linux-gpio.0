From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpiolib: Add possibility to mask which GPIOs are
 added to IRQ domain
Date: Sun, 18 Sep 2016 13:16:52 +0200
Message-ID: <CACRpkdbo1MggZOdzv==C5ZhGnyjkDon6+H_jAQCALVqBUjzo0A@mail.gmail.com>
References: <CACRpkdZBbcL87Hq94sFYdDOWnC7S_JGtArTNMimAps663UQNgw@mail.gmail.com>
 <20160915155210.94413-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36863 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754009AbcIRLQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Sep 2016 07:16:53 -0400
Received: by mail-oi0-f51.google.com with SMTP id t83so30814863oie.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Sep 2016 04:16:53 -0700 (PDT)
In-Reply-To: <20160915155210.94413-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 15, 2016 at 5:52 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> When using GPIO irqchip helpers to setup irqchip for a gpiolib based
> driver, it is not possible to select which GPIOs to add to the IRQ domain.
> Instead it just adds all GPIOs which is not always desired. For example
> there might be GPIOs that for some reason just cannot be used as interrupts
> at all.
>
> To make this possible we add valid_mask to each gpio_chip and by default
> assume all GPIOs can be used as interrupts. Drivers can then tune this
> using clear_bit() or similar before they call gpiochip_irqchip_add().
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Awesome, nice infrastructure.
Will apply once tglx and Marc's comments are fixed.

Yours,
Linus Walleij
