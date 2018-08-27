From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/3] pinctrl: msm: Really mask level interrupts to
 prevent latching
Date: Sun, 26 Aug 2018 20:05:26 -0700
Message-ID: <20180827030526.GH3048@tuxbook-pro>
References: <20180816200648.90458-1-swboyd@chromium.org>
 <20180816200648.90458-2-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180816200648.90458-2-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Thu 16 Aug 13:06 PDT 2018, Stephen Boyd wrote:

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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 2155a30c282b..5d72ffad32c2 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -634,6 +634,29 @@ static void msm_gpio_irq_mask(struct irq_data *d)
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  
>  	val = readl(pctrl->regs + g->intr_cfg_reg);
> +	/*
> +	 * There are two bits that control interrupt forwarding to the CPU. The
> +	 * RAW_STATUS_EN bit causes the level or edge sensed on the line to be
> +	 * latched into the interrupt status register when the hardware detects
> +	 * an irq that it's configured for (either edge for edge type or level
> +	 * for level type irq). The 'non-raw' status enable bit causes the
> +	 * hardware to assert the summary interrupt to the CPU if the latched
> +	 * status bit is set. There's a bug though, the edge detection logic
> +	 * seems to have a problem where toggling the RAW_STATUS_EN bit may
> +	 * cause the status bit to latch spuriously when there isn't any edge
> +	 * so we can't touch that bit for edge type irqs and we have to keep
> +	 * the bit set anyway so that edges are latched while the line is masked.
> +	 *
> +	 * To make matters more complicated, leaving the RAW_STATUS_EN bit
> +	 * enabled all the time causes level interrupts to re-latch into the
> +	 * status register because the level is still present on the line after
> +	 * we ack it. We clear the raw status enable bit during mask here and
> +	 * set the bit on unmask so the interrupt can't latch into the hardware
> +	 * while it's masked.
> +	 */
> +	if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK)
> +		val &= ~BIT(g->intr_raw_status_bit);
> +
>  	val &= ~BIT(g->intr_enable_bit);
>  	writel(val, pctrl->regs + g->intr_cfg_reg);
>  
> @@ -655,6 +678,7 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  
>  	val = readl(pctrl->regs + g->intr_cfg_reg);
> +	val |= BIT(g->intr_raw_status_bit);
>  	val |= BIT(g->intr_enable_bit);
>  	writel(val, pctrl->regs + g->intr_cfg_reg);
>  
> -- 
> Sent by a computer through tubes
> 
