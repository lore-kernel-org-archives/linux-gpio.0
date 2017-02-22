From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pl061: use all specified IRQs for chained handler
Date: Wed, 22 Feb 2017 13:47:54 +0100
Message-ID: <CACRpkdZpYzpMDWqJobSYH=JHgB74HbCQihOtexs+sVyo6SRJdA@mail.gmail.com>
References: <20170222123049.17588-1-alexander.sverdlin@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:35237 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752397AbdBVMr4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 07:47:56 -0500
Received: by mail-it0-f43.google.com with SMTP id 203so137231888ith.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 04:47:55 -0800 (PST)
In-Reply-To: <20170222123049.17588-1-alexander.sverdlin@nokia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Sverdlin <alexander.sverdlin@nokia.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, =?UTF-8?B?U8WCYXdvbWlyIFN0xJlwaWXFhA==?= <slawomir.stepien@nokia.com>

On Wed, Feb 22, 2017 at 1:30 PM, Alexander Sverdlin
<alexander.sverdlin@nokia.com> wrote:

> There are several implementations of PL061 which lack GPIOINTR signal in
> hardware and only have individual GPIOMIS[7:0] interrupts. It's possible
> to support these variants with minimal changes to the driver just
> requesting all these IRQs for the same chained handler. While the solutio=
n
> seems to be suboptimal, this is just a quirk for some particular IPs.
>
> Power Management (wakeup) is not expected to work with these IPs. Only th=
e
> basic GPIO functionality.
>
> One in-tree example is arch/arm/boot/dts/axm55xx.dtsi, pl061 instances ha=
ve
> 8 IRQs defined, but current driver supports only the first one, so only o=
ne
> pin would work as IRQ trigger.
>
> Reported-by: S=C5=82awomir St=C4=99pie=C5=84 <slawomir.stepien@nokia.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: S=C5=82awomir St=C4=99pie=C5=84 <slawomir.stepien@nokia.com>
> ---
> Changes since v1:
> - Added AMBA_NR_IRQS loop limit

Nice in a way, but is this really what we want to do?

This means that the platform has assigned individual IRQs to
all of the lines and no IRQ to the accumulated IRQ GPIOINTR
if I understand it correctly.

In that case these IRQs are 1-to-1 and should be modeled using
a hierarchical irqdomain, because the loop in pl061_irq_handler()
is unnecessary, we already know which IRQ line has been fired,
right?

I think we need to add a mechanism in the gpiolib core to handle
also hierarchical irqdomains and this is a good opportunity.

I would make a patch that:

- If the device has 1 IRQ line, assume it is GPIOINTR and work
  as before.

- If the component has 8 IRQ lines, create a hierarchical IRQdomain
  and chip using a gpiolib core helper.

- If not 1 or 8 lines, bail out with an error.

Yours,
Linus Walleij
