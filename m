From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: Add irq_enable callback for msm gpio
Date: Mon, 5 Feb 2018 15:41:20 -0800
Message-ID: <20180205234120.GG9465@builder>
References: <1516626208-5655-1-git-send-email-sramana@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1516626208-5655-1-git-send-email-sramana@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Srinivas Ramana <sramana@codeaurora.org>
Cc: linus.walleij@linaro.org, timur@codeaurora.org, sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Mon 22 Jan 05:03 PST 2018, Srinivas Ramana wrote:
> +static void msm_gpio_irq_enable(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +	const struct msm_pingroup *g;
> +	unsigned long flags;
> +	u32 val;
> +
> +	g = &pctrl->soc->groups[d->hwirq];
> +
> +	raw_spin_lock_irqsave(&pctrl->lock, flags);
> +
> +	/*
> +	 * clear the interrupt status bit before unmask to avoid
> +	 * any erroneous interrupts that would have got latched
> +	 * when the intterupt is not in use.
> +	 */
> +	val = readl(pctrl->regs + g->intr_status_reg);
> +	val &= ~BIT(g->intr_status_bit);
> +	writel(val, pctrl->regs + g->intr_status_reg);
> +
> +	val = readl(pctrl->regs + g->intr_cfg_reg);
> +	val |= BIT(g->intr_enable_bit);
> +	writel(val, pctrl->regs + g->intr_cfg_reg);
> +
> +	set_bit(d->hwirq, pctrl->enabled_irqs);
> +
> +	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +}


Hi Srinivas,

This makes sense, but I would prefer if you extract this code into a
common:

static void __msm_gpio_irq_unmask(struct msm_pinctrl *pctrl, bool status_clear)

which you call from the two callbacks.

Regards,
Bjorn
