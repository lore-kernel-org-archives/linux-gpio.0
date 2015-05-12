From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rcar: Check for irq_set_irq_wake() failures
Date: Tue, 12 May 2015 12:36:12 +0200
Message-ID: <CACRpkdZ4DOXvF+jaL1Cmyqu6i_d+d70yY-7ejbXp-JHst7ApVQ@mail.gmail.com>
References: <1430748592-6394-1-git-send-email-geert+renesas@glider.be>
	<CACRpkdaDEr7Lw8u5tAC-som5W-WM4-Wfqena4Ftd4KFdEA2-Yg@mail.gmail.com>
	<CAMuHMdX2zaRhZh20e-TMkMeES6Ftaez1vcdcnAimVczW6L7gsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX2zaRhZh20e-TMkMeES6Ftaez1vcdcnAimVczW6L7gsQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Valentine <valentine.barshak@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Axel Haslam <ahaslam@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 12, 2015 at 10:07 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, May 12, 2015 at 9:55 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

>> This should be moved to the commit message I think.
>
> So that's why I put it below the "---".

So it was below the --- and that is why I ask you to move this
useful information above the --- and into the commit message.

>>> -       irq_set_irq_wake(p->irq_parent, on);
>>> +       int error;
>>> +
>>> +       if (p->irq_parent) {
>>> +               error = irq_set_irq_wake(p->irq_parent, on);
>>> +               if (error) {
>>> +                       dev_dbg(&p->pdev->dev,
>>> +                               "irq %u doesn't support irq_set_wake\n",
>>> +                               p->irq_parent);
>>> +                       p->irq_parent = 0;
>>> +               }
>>> +       }
>>
>> Does the SH maintainers really like this... Warning
>> appear once and is squelched.
>>
>> Isn't it better to make sure it doesn't happen or something.
>>
>> It looks hacky. Any other suggestions?
>
> The first call to irq_set_irq_wake() (on = true) doesn't print a warning.
> It returns an error code, to indicate that the operation is not supported.
>
> Calling irq_set_irq_wake() again (on = false, during resume) would print
> a warning, as it wouldn't match internal state ("Unbalanced IRQ 26 wake
> disable"). That one is gone now.

Yeah :/

There are a few different patches floating for irq_set_wake() things
and some seem to be causing regressions, I just want some
broader discussion on how we solve this across all platforms.

Maybe the GPIOLIB_IRQCHIP should handle the set_wake()
similarly for all chips?

>> Also, please convert this driver to use GPIOLIB_IRQCHIP
>> like everyone else.
>
> What old branch are you looking at, that it doesn't have commit
> c7f3c5d3ac2d6831 ("gpio: rcar: Switch to use gpiolib irqchip helpers")
> yet ;-)?

Argh sorry. (And that was an awesome patch.)

Yours,
Linus Walleij
