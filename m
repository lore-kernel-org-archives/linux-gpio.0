From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] gpiolib: Make it possible to exclude GPIOs from
 IRQ domain
Date: Fri, 23 Sep 2016 14:47:12 +0200
Message-ID: <CACRpkdZHdGPS0FsqT8Ljgq9+uLfR1p7UtD13+fR8BB0z6PH0TA@mail.gmail.com>
References: <20160920121523.170293-1-mika.westerberg@linux.intel.com> <20160920121523.170293-2-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35382 "EHLO
        mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758567AbcIWMrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 08:47:14 -0400
Received: by mail-oi0-f53.google.com with SMTP id w11so132800561oia.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 05:47:13 -0700 (PDT)
In-Reply-To: <20160920121523.170293-2-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Phidias Chiang <phidias.chiang@canonical.com>, Anisse Astier <anisse@astier.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Sep 20, 2016 at 2:15 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> When using GPIO irqchip helpers to setup irqchip for a gpiolib based
> driver, it is not possible to select which GPIOs to add to the IRQ domain.
> Instead it just adds all GPIOs which is not always desired. For example
> there might be GPIOs that for some reason cannot generated normal
> interrupts at all.
>
> To support this we add a flag irq_need_valid_mask to struct gpio_chip. When
> this flag is set the core allocates irq_valid_mask that holds one bit for
> each GPIO the chip has. By default all bits are set but drivers can
> manipulate this using set_bit() and clear_bit() accordingly.
>
> Then when gpiochip_irqchip_add() is called, this mask is checked and all
> GPIOs with bit is set are added to the IRQ domain created for the GPIO
> chip.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Yeps, exactly like this!

Patch applied.

Yours,
Linus Walleij
