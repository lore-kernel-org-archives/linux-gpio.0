From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] gpiolib: debugfs: identify gpios requested as irq only
Date: Mon, 1 Jun 2015 14:52:31 +0200
Message-ID: <CACRpkdZYCNENp2MhknoOhkfzHLN16LPexxhnoYGR7QH_=-zz2A@mail.gmail.com>
References: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
	<1432117823-1834-4-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:36008 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751319AbbFAMwc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 08:52:32 -0400
Received: by oihb142 with SMTP id b142so100172615oih.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 05:52:31 -0700 (PDT)
In-Reply-To: <1432117823-1834-4-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Wed, May 20, 2015 at 12:30 PM, Grygorii Strashko
<grygorii.strashko@linaro.org> wrote:

> Now many of GPIO drivers implement two interfaces gpiolib and irqchip
> which are essentially orthogonal. So, now GPIO line can be requested
> in three ways:
> 1) As pure GPIO (gpioX_request())
> 2) As pure GPIO IRQ, especially in DT boot case.
>   DT:
>         interrupt-parent = <&gpio6>;
>         interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
>   Code:
>         platform_get_irq() or of_irq_get()
>         request_irq()
> 3) combination of (1) and (2).
>
> And from GPIO debugfs it could be identified when GPIO is
> requested/used or used as IRQ, but there is no way to determine
> when GPIO is requested/used as IRQ only.
>
> Such information is useful for debugging, so update GPIO debugfs code
> to show marker '<irq-only>' for GPIO lines which are requested/used as
> GPIO IRQ only.
>
> After this patch sys/kernel/debug/gpio will produce following output:
>   ...
>  GPIOs 160-191, platform/4805d000.gpio, gpio:
>   gpio-171 ((null)              ) in  hi IRQ-209 <irq-only>
>
>  GPIOs 192-223, platform/48051000.gpio, gpio:
>   gpio-203 (vtt_fixed           ) out hi
>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>

Patch applied.

Yours,
Linus Walleij
