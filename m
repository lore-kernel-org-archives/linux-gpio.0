From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sirf: atlas7: fix of_irq_get() error check
Date: Thu, 3 Aug 2017 23:31:46 +0200
Message-ID: <CACRpkdbW2efOy+qH+JPHYnbaUHkf2eqcWGm66C9a1K+uj_QNdA@mail.gmail.com>
References: <20170730193855.099325987@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:37841 "EHLO
        mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751599AbdHCVbs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 17:31:48 -0400
Received: by mail-io0-f171.google.com with SMTP id c74so11769168iod.4
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2017 14:31:48 -0700 (PDT)
In-Reply-To: <20170730193855.099325987@cogentembedded.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Barry Song <baohua@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Sun, Jul 30, 2017 at 9:38 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:

> of_irq_get() may return  any negative error number as well as 0 on failure,
> while the driver only checks for -EPROBE_DEFER, blithely continuing with
> the call to gpiochip_set_chained_irqchip() -- that function expects the
> parent IRQ as *unsigned int*, so would probably do nothing  when a large
> IRQ number resulting from a conversion of a negative error number is passed
> to it, however passing 0 would probably work but the driver won't receive
> valid GPIO bank interrupts.
>
> Check for 'ret <= 0' instead and return -ENXIO from the driver's probe iff
> of_irq_get() returned 0.
>
> Fixes: f9367793293d ("pinctrl: sirf: add sirf atlas7 pinctrl and gpio support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Patch applied!

Yours,
Linus Walleij
