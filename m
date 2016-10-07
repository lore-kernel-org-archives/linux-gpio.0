From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] pinctrl: intel: Configure GPIO chip IRQ as wakeup interrupts
Date: Fri, 7 Oct 2016 22:40:42 +0300
Message-ID: <CAHp75VcjwCR1W9+9wactFeGS4wEkLdU+PxbzvHXbwKK9NiBTmg@mail.gmail.com>
References: <1474499002-76446-1-git-send-email-nilesh.bacchewar@intel.com>
 <CAHp75Veb7YwQNGugij_QGLi7rW6ohD52eRnX-aj4-nO=stxnjA@mail.gmail.com> <EDC3C55F9AA4D042AD86F2BFE2FD250C017A8102@FMSMSX102.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <EDC3C55F9AA4D042AD86F2BFE2FD250C017A8102@FMSMSX102.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Bacchewar, Nilesh" <nilesh.bacchewar@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 7, 2016 at 9:17 PM, Bacchewar, Nilesh
<nilesh.bacchewar@intel.com> wrote:
> Here, Its marking  GPIO controller IRQ line as wake capable not GPIO lines.

AFAIU this is called per (GPIO) pin which is IRQ enabled.

Imagine a case when you have more than one such pin.

1. Set IRQ wake for pin 1
2. Set IRQ wake for pin 2 (assume that is pin under the question)
3. Unset IRQ wake for pin 1 (for some reason)
4. Global pinctrl IRQ wake is unset. Resulting same issue as before.

What did I miss above?

>
> Regards,
> Nilesh
>
> -----Original Message-----
> From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> Sent: Friday, October 7, 2016 10:59 AM
> To: Bacchewar, Nilesh <nilesh.bacchewar@intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>; Krogerus, Heikki <heikki.krogerus@linux.intel.com>; Linus Walleij <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] pinctrl: intel: Configure GPIO chip IRQ as wakeup interrupts
>
> On Thu, Sep 22, 2016 at 2:03 AM, Nilesh Bacchewar <nilesh.bacchewar@intel.com> wrote:
>> On some Intel BXT platform, wake-up from suspend-to-idle on pressing
>> power-button is not working. Its noticed that gpio-keys driver marking
>> the second level IRQ/power-button as wake capable but Intel pintctrl
>> driver is missing to mark GPIO chip/controller IRQ which first level
>> IRQ as wake cable if its GPIO pin IRQ is wakeble. So, though the first
>> level IRQ gets generated on power-button press, since it is not marked
>> as wake capable resume/wake-up flow is not happening.
>> Intel pintctrl/GPIO driver need to mark GPIO chip/controller IRQ
>> (first level IRQ) as wake capable iff GPIO pin's IRQ (second level
>> IRQ) is marked as wake cable.
>
>>         if (on)
>> -               gpe_en |= BIT(gpp_offset);
>> +               enable_irq_wake(pctrl->irq);
>>         else
>> -               gpe_en &= ~BIT(gpp_offset);
>> -       writel(gpe_en, community->regs + GPI_GPE_EN + gpp * 4);
>> -
>> -       raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> +               disable_irq_wake(pctrl->irq);
>
> Shouldn't be refcounting here or I missed something?
> What I think of is 2+ GPIO lines marked as wake capable IRQ sources and one of them is disabled earlier by some reason.
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
