From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] pinctrl: intel: Configure GPIO chip IRQ as wakeup interrupts
Date: Fri, 7 Oct 2016 20:59:07 +0300
Message-ID: <CAHp75Veb7YwQNGugij_QGLi7rW6ohD52eRnX-aj4-nO=stxnjA@mail.gmail.com>
References: <1474499002-76446-1-git-send-email-nilesh.bacchewar@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33179 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753624AbcJGR7J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2016 13:59:09 -0400
In-Reply-To: <1474499002-76446-1-git-send-email-nilesh.bacchewar@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nilesh Bacchewar <nilesh.bacchewar@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 22, 2016 at 2:03 AM, Nilesh Bacchewar
<nilesh.bacchewar@intel.com> wrote:
> On some Intel BXT platform, wake-up from suspend-to-idle on pressing
> power-button is not working. Its noticed that gpio-keys driver marking the
> second level IRQ/power-button as wake capable but Intel pintctrl
> driver is missing to mark GPIO chip/controller IRQ which first level IRQ
> as wake cable if its GPIO pin IRQ is wakeble. So, though the first level
> IRQ gets generated on power-button press, since it is not marked as
> wake capable resume/wake-up flow is not happening.
> Intel pintctrl/GPIO driver need to mark GPIO chip/controller IRQ (first
> level IRQ) as wake capable iff GPIO pin's IRQ (second level IRQ) is marked
> as wake cable.

>         if (on)
> -               gpe_en |= BIT(gpp_offset);
> +               enable_irq_wake(pctrl->irq);
>         else
> -               gpe_en &= ~BIT(gpp_offset);
> -       writel(gpe_en, community->regs + GPI_GPE_EN + gpp * 4);
> -
> -       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +               disable_irq_wake(pctrl->irq);

Shouldn't be refcounting here or I missed something?
What I think of is 2+ GPIO lines marked as wake capable IRQ sources
and one of them is disabled earlier by some reason.

-- 
With Best Regards,
Andy Shevchenko
