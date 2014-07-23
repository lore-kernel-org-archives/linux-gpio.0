From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: zynq: Fix IRQ handlers
Date: Wed, 23 Jul 2014 16:36:31 +0200
Message-ID: <CACRpkdb7FPXr_ktYvHgXFCCuA06=UM7y1-x3+deU0WNDFsgKnw@mail.gmail.com>
References: <1405677133-8706-1-git-send-email-lars@metafoo.de>
	<1405677133-8706-3-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:62012 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753110AbaGWOgc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jul 2014 10:36:32 -0400
Received: by mail-oi0-f52.google.com with SMTP id h136so930231oig.11
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2014 07:36:32 -0700 (PDT)
In-Reply-To: <1405677133-8706-3-git-send-email-lars@metafoo.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>, Harini Katakam <harinik@xilinx.com>, Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 18, 2014 at 11:52 AM, Lars-Peter Clausen <lars@metafoo.de> wrote:

> The Zynq GPIO interrupt handling code as two main issues:
> 1) It does not support IRQF_ONESHOT interrupt since it uses handle_simple_irq()
> for the interrupt handler. handle_simple_irq() does not do masking and unmasking
> of the IRQ that is required for this chip to be able to support IRQF_ONESHOT
> IRQs, causing the CPU to lock up in a interrupt storm if such a interrupt is
> requested.
> 2) Interrupts are acked after the primary interrupt handlers for all asserted
> interrupts in a bank have been called. For edge triggered interrupt this is to
> late and may cause a interrupt to be missed. For level triggered oneshot
> interrupts this is to early and causes the interrupt handler to run twice per
> interrupt.
>
> This patch addresses the issue by updating the driver to use the correct IRQ
> chip handler functions that are appropriate for this kind of IRQ controller.

This looks very thought-through. I will give Harini and Soren some days
more to react before applying (unless patch 1/3 is required to apply this).

I can fix up Varka's comment when applying, no need to resend for that
feedback only.

Yours,
Linus Walleij
