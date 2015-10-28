From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: Implement irq_(request|release)_resources
Date: Wed, 28 Oct 2015 16:20:42 +0100
Message-ID: <CACRpkdZpEh=Z89M3SPxNzstUYqB8BpzL_PMgRiPQN2C+WFq5KA@mail.gmail.com>
References: <1445607381-7794-1-git-send-email-soren.brinkmann@xilinx.com>
	<CACRpkda4QKEJvwkwGLS7OLTP8Nxu5W05tzbcFXA_FPnBsFtKhw@mail.gmail.com>
	<562FA3EE.5040408@ti.com>
	<CACRpkdYjNWiEdM8kthMXhGXBPYE74hy_xa7bBB6XQrAOaBnehA@mail.gmail.com>
	<562FBA60.70002@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33434 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752487AbbJ1PUo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2015 11:20:44 -0400
Received: by lbbec13 with SMTP id ec13so8365901lbb.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2015 08:20:42 -0700 (PDT)
In-Reply-To: <562FBA60.70002@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Soren Brinkmann <soren.brinkmann@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, John Linn <linnj@xilinx.com>

On Tue, Oct 27, 2015 at 6:54 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> [Me]
>> Do you mean that these functions contain calls to non-atomic
>> functions?
>>
>
> Oh. No, I have to be more specific :(
> if GPIOx driver defines custom .irq_(request|release)_resources() callbacks
> they will *overwrite* standard GPIOirqchip callbacks.
> (commit: 8b67a1f "gpio: don't override irq_*_resources() callbacks")
>
> As result, such GPIOx driver should *re-implement* the same functionality in
> its .irq_(request|release)_resources() callbacks as implemented in
> gpiochip_irq_reqres()/gpiochip_irq_relres().

Yes that goes for all drivers not using gpiochip_add_irqchip().
Not everyone uses that ... and for those supplying their own
implementations of these functions.

Yours,
Linus Walleij
