From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: about the need to manage irq mapping dynamically.
Date: Thu, 29 Jun 2017 16:16:51 +0200
Message-ID: <CACRpkdar9YwnMgLb1y1sP1Vbg-1MgPAOcRPcfNCtmpKuf+g+kQ@mail.gmail.com>
References: <1497543642.3086.35.camel@baylibre.com> <CACRpkdZWw_-joPT4CJ-RAJ31s4BxuE6vusjg5YnZWaHtkRg5+w@mail.gmail.com>
 <1497954416.7387.1.camel@baylibre.com> <CACRpkdZu74aAsu8hggxsfffQPMk0nqihCSfuMaMbf+-4EFSYYA@mail.gmail.com>
 <1497979438.7387.10.camel@baylibre.com> <CACRpkdZ2cqUgMwOFG+9JVyAOxYTfHYa3+yrUzUozLpYD87KdOQ@mail.gmail.com>
 <1498141515.7387.16.camel@baylibre.com> <0e12f9bd-4e0b-c602-5627-5dbda5371dee@ti.com>
 <1498587929.25567.12.camel@baylibre.com> <657221fa-c6b3-e914-1a81-9a48972ee6d5@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f54.google.com ([209.85.214.54]:37270 "EHLO
        mail-it0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753054AbdF2OQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2017 10:16:53 -0400
Received: by mail-it0-f54.google.com with SMTP id m84so7879417ita.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2017 07:16:53 -0700 (PDT)
In-Reply-To: <657221fa-c6b3-e914-1a81-9a48972ee6d5@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>, Linux Kernel <linux-kernel@vger.kernel.org>

On Tue, Jun 27, 2017 at 10:43 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> And my opinion is still the same here - It should be perfectly valid to create
> mappings from gpio_to_irq() to handle properly orthogonality of gpiochip and
> gpio-irqchip functionality and satisfy SPARSE_IRQ goal (allocate Linux virq and
> irq descriptors on demand).

You are right.

I would rather say: GPIO drivers that have a 1-to-1 mapping between GPIO
lines and IRQs should not do it, they should map up them all at probe().

Drivers that actually have fewer IRQs than GPIO lines should be able to
create the mappings in gpio_to_irq().

Yours,
Linus Walleij
