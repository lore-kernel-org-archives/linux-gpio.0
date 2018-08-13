From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/3] pinctrl: msm: Really mask level interrupts to
 prevent latching
Date: Mon, 13 Aug 2018 16:53:42 -0700
Message-ID: <CAD=FV=V8ujNN-jxOm6a_OthyQFGucbv0-1Du3BjScVPKPz-Tsw@mail.gmail.com>
References: <20180725222900.33231-1-swboyd@chromium.org> <20180725222900.33231-2-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725222900.33231-2-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

On Wed, Jul 25, 2018 at 3:28 PM, Stephen Boyd <swboyd@chromium.org> wrote:
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
>
> Changes from v1:
>  - Squashed raw_status_bit write into same write on unmask (Doug
>    Andersson)
>
>  drivers/pinctrl/qcom/pinctrl-msm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 2155a30c282b..3970dc599092 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -634,6 +634,19 @@ static void msm_gpio_irq_mask(struct irq_data *d)
>         raw_spin_lock_irqsave(&pctrl->lock, flags);
>
>         val = readl(pctrl->regs + g->intr_cfg_reg);
> +       /*
> +        * Leaving the RAW_STATUS_EN bit enabled causes level interrupts that
> +        * are still asserted to re-latch after we ack them. Clear the raw
> +        * status enable bit too so the interrupt can't even latch into the
> +        * hardware while it's masked, but only do this for level interrupts
> +        * because edge interrupts have a problem with the raw status bit
> +        * toggling and causing spurious interrupts.

This whole "spurious interrupts" explanation still seems dodgy.  Have
you experienced it yourself, or is this looking through some previous
commits?  As per my comments in v1, I'd still rather the comment state
the reason as: it's important to _not_ lose edge interrupts when
masked.


> +        */
> +       if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
> +               val &= ~BIT(g->intr_raw_status_bit);
> +               writel(val, pctrl->regs + g->intr_cfg_reg);
> +       }

In v1 you claimed you were going to combine this with the next write
(you said you'd combine things in both mask and unmask).  ...is there
a reason why you didn't?  As per my comments in v1 I believe it's
safer from a correctness point of view to combine them.


-Doug
