From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFT PATCH v2] gpiolib: allow gpio irqchip to map irqs dynamically
Date: Tue, 1 Aug 2017 09:52:30 +0200
Message-ID: <CACRpkdbFVV669PxGDXO9Xzf-jj0sEKyQTvhdLMA_of16wBp7PQ@mail.gmail.com>
References: <20170721164900.7070-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:36128 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751327AbdHAHwc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2017 03:52:32 -0400
Received: by mail-it0-f51.google.com with SMTP id 77so3841513itj.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Aug 2017 00:52:32 -0700 (PDT)
In-Reply-To: <20170721164900.7070-1-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>

On Fri, Jul 21, 2017 at 6:49 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> Now IRQ mappings are always created for all (allowed) GPIOs in gpiochip in
> gpiochip_irqchip_add_key() which goes against the idea of SPARSE_IRQ and,
> as result, leads to:
>  - increasing of memory consumption for IRQ descriptors most of which will
> never ever be used (espessially on platform with a high number of GPIOs).
> (sizeof(struct irq_desc) == 256 on my tested platforms)
>  - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
> GPIO IRQ functionality as IRQ crossbar/router which has only limited
> number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
> IRQs).
>
> Hence, remove static IRQ mapping code from gpiochip_irqchip_add_key() and
> instead replace irq_find_mapping() with irq_create_mapping() in
> gpiochip_to_irq(). Also add additional gpiochip_irqchip_irq_valid() calls
> in gpiochip_to_irq() and gpiochip_irq_map().
>
> After this change gpio2irq mapping will happen the following way when GPIO
> irqchip APIs are used by gpio driver:
>  - IRQ mappings will be created statically if driver passes first_irq>0
> vlaue in gpiochip_irqchip_add_key().
>  - IRQ mappings will be created dynamically from gpio_to_irq() or
> of_irq_get().
>
> Tested on am335x-evm and dra72-evm-revc.
> - dra72-evm-revc: number of created irq mappings decreased from 402 -> 135
>   Mem savings 267*256 = 68352 (66kB)
> - am335x-evm: number of created irq mappings decreased from 188 -> 63
>   Mem savings 125*256 = 32000 (31kB)
>
> [1] https://lkml.org/lkml/2017/6/15/428
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
> Changes in v2:
> - restored struct gpio_chip->irq_base to fix buld of gpio-mockup.c

Applied this rather than v1.

But maybe we should get rid of ->irq_base from gpio-mockup.c
and delete it, as the base is irqchip-internal.

Bartosz what do you say? Do we need this in the mockup?

Yours,
Linus Walleij
