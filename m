From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: rcar: Check for irq_set_irq_wake() failures
Date: Mon, 1 Jun 2015 14:58:34 +0200
Message-ID: <CACRpkdb6U5SqQQ2Z2oBi3Ru12V+xPtUuwP0RiAnA=W4HL1KU6w@mail.gmail.com>
References: <1432207297-16887-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1432207297-16887-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Courbot <gnurou@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Axel Haslam <ahaslam@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, May 21, 2015 at 1:21 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> If an interrupt controller doesn't support wake-up configuration,
> irq_set_irq_wake() returns an error code.  Then any subsequent call
> trying to deconfigure wake-up will cause an imbalance, and a warning
> will be printed:
>
>     WARNING: CPU: 1 PID: 1341 at kernel/irq/manage.c:540 irq_set_irq_wake+0x9c/0xf8()
>     Unbalanced IRQ 26 wake disable
>
> To fix this, refrain from any further parent interrupt controller
> (de)configuration if irq_set_irq_wake() failed.
>
> Alternative fixes would be:
>   - calling "gic_set_irqchip_flags(IRQCHIP_SKIP_SET_WAKE)" from the
>     platform code,
>   - setting "gic_chip.flags = IRQCHIP_SKIP_SET_WAKE" in the GIC driver
>     code,
> but these were withheld as the GIC hardware doesn't really support
> wake-up interrupts.
>
> Fixes: ab82fa7da4dce5c7 ("gpio: rcar: Prevent module clock disable when wake-up is enabled")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Reworded patch description,
>   - Moved alternatives into the patch description.

Patch applied.

Yours,
Linus Walleij
