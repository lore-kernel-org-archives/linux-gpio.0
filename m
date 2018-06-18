From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] pinctrl: msm: Really mask level interrupts to prevent latching
Date: Mon, 18 Jun 2018 15:43:06 -0700
Message-ID: <CAD=FV=WvsY_=Ko2QXvzmHOuy4O5Rh6+sRWZZOuSXyGC829ANag@mail.gmail.com>
References: <20180618205255.246104-1-swboyd@chromium.org> <20180618205255.246104-2-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618205255.246104-2-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Mon, Jun 18, 2018 at 1:52 PM, Stephen Boyd <swboyd@chromium.org> wrote:
> The interrupt controller hardware in this pin controller has two status
> enable bits. The first "normal" status enable bit enables or disables
> the summary interrupt line being raised when a gpio interrupt triggers
> and the "raw" status enable bit allows or prevents the hardware from
> latching an interrupt into the status register for a gpio interrupt.
> Currently we just toggle the "normal" status enable bit in the mask and
> unmask ops so that the summary irq interrupt going to the CPU's
> interrupt controller doesn't trigger for the masked gpio interrupt.
>
> For a level triggered interrupt, the flow would be as follows: the pin
> controller sees the interrupt, latches the status into the status
> register, raises the summary irq to the CPU, summary irq handler runs
> and calls handle_level_irq(), handle_level_irq() masks and acks the gpio
> interrupt, the interrupt handler runs, and finally unmask the interrupt.
> When the interrupt handler completes, we expect that the interrupt line
> level will go back to the deasserted state so the genirq code can unmask
> the interrupt without it triggering again.
>
> If we only mask the interrupt by clearing the "normal" status enable bit
> then we'll ack the interrupt but it will continue to show up as pending
> in the status register because the raw status bit is enabled, the
> hardware hasn't deasserted the line, and thus the asserted state latches
> into the status register again. When the hardware deasserts the
> interrupt the pin controller still thinks there is a pending unserviced
> level interrupt because it latched it earlier. This behavior causes
> software to see an extra interrupt for level type interrupts each time
> the interrupt is handled.
>
> Let's fix this by clearing the raw status enable bit for level type
> interrupts so that the hardware stops latching the status of the
> interrupt after we ack it. We don't do this for edge type interrupts
> because it seems that toggling the raw status enable bit for edge type
> interrupts causes spurious edge interrupts.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 0e22f52b2a19..3563c4394837 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -626,6 +626,19 @@ static void msm_gpio_irq_mask(struct irq_data *d)
>         raw_spin_lock_irqsave(&pctrl->lock, flags);
>
>         val = readl(pctrl->regs + g->intr_cfg_reg);
> +       /*
> +        * Leaving the RAW_STATUS_EN bit enabled causes level interrupts that
> +        * are still asserted to re-latch after we ack them. Clear the raw

As I understand it acking a level-triggered interrupt is not totally
sensible anyway. IMO the fundamental "brokenness" of the MSM pin
controller is that it's latching level-triggered interrupts in the
first place when it shouldn't be. Instead of latching level triggered
interrupts (and requiring an Ack), the controller should simply stop
asserting its interrupt when the level goes away (if you want, you can
think of this in your mind as the controller auto-acking its own
interrupt when the level goes away).

The reason things aren't more broken than they are is that the Linux
interrupt core still Acks level-triggered interrupts (it just does it
at the beginning instead of the end).  IMO this is not fundamentally
something that the Linux interrupt core needs to do, but it does it
anyway (maybe there are a bunch of interrupt controllers that still
need this even though it's strange?)

Of course, maybe someone can tell me that I'm wrong and everyone else
expects that level-triggered interrupts are fundamentally supposed to
be Acked but that they are only supposed to re-latch if they
transition away from their current level and then back again?


> +        * status enable bit too so the interrupt can't even latch into the
> +        * hardware while it's masked, but only do this for level interrupts
> +        * because edge interrupts have a problem with the raw status bit
> +        * toggling and causing spurious interrupts.

Even if there was no spurious interrupt it would be wrong to use
RAW_STATUS_EN for edge-triggered interrupts.  For edge-triggered
interrupts it's important to continue to latch assertions even when
masked.



> +        */
> +       if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
> +               val &= ~BIT(g->intr_raw_status_bit);
> +               writel(val, pctrl->regs + g->intr_cfg_reg);

Do you know if it's important to do a 2nd write here, or could this be
combined with the next writel()?

> +       }
> +
>         val &= ~BIT(g->intr_enable_bit);
>         writel(val, pctrl->regs + g->intr_cfg_reg);
>
> @@ -647,6 +660,10 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
>         raw_spin_lock_irqsave(&pctrl->lock, flags);
>
>         val = readl(pctrl->regs + g->intr_cfg_reg);
> +       if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
> +               val |= BIT(g->intr_raw_status_bit);
> +               writel(val, pctrl->regs + g->intr_cfg_reg);

Same question about whether this could be combined with the next
writel().  ...although I could imagine that the answer might be
different for mask and unmask.

...if it can be combined, you can totally get rid of the "if" test and
always "OR" in the bit, right?


Despite the above comments, I'm in favor of this patch.  I'd be
curious about whether we can remove the two writel() calls, but I'd
only suggest the comments be changed if someone else agrees with me
about the fundamental nature of level-triggered interrupts with
regards to Acking.  :-P

-Doug
