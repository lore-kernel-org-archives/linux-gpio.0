From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: convince line to become input in irq helper
Date: Wed, 6 Jul 2016 14:38:51 +0200
Message-ID: <CACRpkdaVa_NXv5FokcTxKxXfekp=aaE3QM1pe3+49ErTwbJHVQ@mail.gmail.com>
References: <1466630758-26231-1-git-send-email-linus.walleij@linaro.org>
 <CAMuHMdXVEjyctU88-u=FJcY0AwLKvFxdizkPTTjt_X=xM_H6UQ@mail.gmail.com>
 <CACRpkdZpRSrt4u_h11ROavVFZDh6OYJ49gJ6eD0y4gGuOxzMYg@mail.gmail.com> <577CCA48.7090003@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33359 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754078AbcGFMix (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2016 08:38:53 -0400
Received: by mail-oi0-f52.google.com with SMTP id u201so268120949oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2016 05:38:53 -0700 (PDT)
In-Reply-To: <577CCA48.7090003@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On Wed, Jul 6, 2016 at 11:07 AM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> first of all for slow GPIO controllers (like pcf857x) it might be unsafe to call
> .direction_input() from .irq_request_resources() callback because it
> will be called in atomic context under raw_spin_lock_irqsave().
>
>
> __setup_irq
>    |- raw_spin_lock_irqsave()
>         |- irq_request_resources()
>         |- [ __irq_set_trigger() ]
>         |- [ irq_startup() ]
>         |- [ __enable_irq() ]
>    |- raw_spin_unlock_irqrestore()
>
> [and it can be unsafe for fast GPIO chips also ;( , for example if it's
> required to do some kind of PM management actions before accessing HW - most of
> drivers expect their GPIOchip callbacks to be called only after gpiochip.request() or
> .irq_startup().]
>
> In  my opinion this change breaks orthogonality of IRQchip vs GPIOchip interfaces
> because it adds and (what is more important) hides call of GPIOchip callback
> from inside IRQchip interface somewhere in  the depths of gpiolib framework.
> As result, GPIO drivers lose possibility to properly handle GPIO vs IRQ interface's
> differences like: locking, slow vs fast, hw specific settings, features of frameworks.
>
> I propose to revert it, sry,

Aw typical, you are right.

OK I'll take this patch and it's fixes out of the GPIO tree :(

Yours,
Linus Walleij
