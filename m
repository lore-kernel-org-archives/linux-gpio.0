From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: msm: Really mask level interrupts to
 prevent latching
Date: Fri, 22 Jun 2018 10:56:08 -0700
Message-ID: <20180622175608.GB3402@tuxbook-pro>
References: <20180618205255.246104-1-swboyd@chromium.org>
 <20180618205255.246104-2-swboyd@chromium.org>
 <20180620064509.GL15126@tuxbook-pro>
 <152959405220.16708.279861218299564639@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <152959405220.16708.279861218299564639@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

On Thu 21 Jun 08:14 PDT 2018, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2018-06-19 23:45:09)
> > On Mon 18 Jun 13:52 PDT 2018, Stephen Boyd wrote:
> > > @@ -647,6 +660,10 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
> > >       raw_spin_lock_irqsave(&pctrl->lock, flags);
> > >  
> > >       val = readl(pctrl->regs + g->intr_cfg_reg);
> > > +     if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
> > > +             val |= BIT(g->intr_raw_status_bit);
> > > +             writel(val, pctrl->regs + g->intr_cfg_reg);
> > > +     }
> > >       val |= BIT(g->intr_enable_bit);
> > >       writel(val, pctrl->regs + g->intr_cfg_reg);
> > 
> > I looked at the TLMM documentation, which states that the status bit
> > should be cleared after handling the interrupt and this driver used to
> > do this.
> 
> Nice!
> 
> > 
> > But Timur managed to hit the race where we lost edge triggered
> > interrupts with this behavior, so we changed it in the following commit:
> > 
> > a6566710adaa ("pinctrl: qcom: Don't clear status bit on irq_unmask")
> > 
> > 
> > But the reason that I had this in the driver originally is that msm-3.10
> > does this (clear status bit in unmask), so perhaps the appropriate way
> > to solve is to follow the documentation and the downstream driver and
> > ack the interrupt in unmask - but do so only for level triggered
> > interrupts?
> > 
> 
> Clearing the status bit (basically acking the gpio irq) can be done in
> unmask for level triggered interrupts. That works and as you say it's
> even documented.
> 
> I didn't implement that because it felt better to prevent the status
> from latching in the hardware while the interrupt is masked. My
> understanding of irq mask semantics is that the interrupt shouldn't be
> "pending" during the time between mask and unmask and clearing the raw
> status allows us to do that properly without messing with the status bit
> on the unmask path. It also means that the ack operation really does ack
> the irq status bit and cause it to go away. I suppose there is one case
> where I'm wrong though, and that is when the irq is unmasked on irq
> startup where we don't want to see a spurious latched level interrupt
> that occurred before we booted.
> 

I took another pass through the irq code and I agree, while the late ack
does solve the problem it's more intuitive if we can prevent the
latching.

> That problem may be possible with bad bootloaders that are leaving some
> status bit latched in there, but also we would want to fix that for edge
> type interrupts too, so we would need to clear the status bit regardless
> of the level on irq startup and hope an edge isn't lost on startup.
> 

I would prefer that we handle that case explicitly.


There are some concerns from msm-3.10 regarding writing the intr-raw bit
at the same time as the other bits, but I think that relates to the fact
that the downstream driver used to configure and enabled raw-state in
the same write. So please respin v2 as you planned.

Regards,
Bjorn
