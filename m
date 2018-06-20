From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] pinctrl: msm: Really mask level interrupts to prevent latching
Date: Wed, 20 Jun 2018 08:52:26 -0700
Message-ID: <CAD=FV=U1bqg60f00-X72HUQ1DyuPaTX1Utw8QsV6Ucyf_Qy49w@mail.gmail.com>
References: <20180618205255.246104-1-swboyd@chromium.org> <20180618205255.246104-2-swboyd@chromium.org>
 <20180620064509.GL15126@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620064509.GL15126@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

On Tue, Jun 19, 2018 at 11:45 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Mon 18 Jun 13:52 PDT 2018, Stephen Boyd wrote:
>
>> The interrupt controller hardware in this pin controller has two status
>> enable bits. The first "normal" status enable bit enables or disables
>> the summary interrupt line being raised when a gpio interrupt triggers
>> and the "raw" status enable bit allows or prevents the hardware from
>> latching an interrupt into the status register for a gpio interrupt.
>> Currently we just toggle the "normal" status enable bit in the mask and
>> unmask ops so that the summary irq interrupt going to the CPU's
>> interrupt controller doesn't trigger for the masked gpio interrupt.
>>
>> For a level triggered interrupt, the flow would be as follows: the pin
>> controller sees the interrupt, latches the status into the status
>> register, raises the summary irq to the CPU, summary irq handler runs
>> and calls handle_level_irq(), handle_level_irq() masks and acks the gpio
>> interrupt, the interrupt handler runs, and finally unmask the interrupt.
>> When the interrupt handler completes, we expect that the interrupt line
>> level will go back to the deasserted state so the genirq code can unmask
>> the interrupt without it triggering again.
>>
>> If we only mask the interrupt by clearing the "normal" status enable bit
>> then we'll ack the interrupt but it will continue to show up as pending
>> in the status register because the raw status bit is enabled, the
>> hardware hasn't deasserted the line, and thus the asserted state latches
>> into the status register again. When the hardware deasserts the
>> interrupt the pin controller still thinks there is a pending unserviced
>> level interrupt because it latched it earlier. This behavior causes
>> software to see an extra interrupt for level type interrupts each time
>> the interrupt is handled.
>>
>> Let's fix this by clearing the raw status enable bit for level type
>> interrupts so that the hardware stops latching the status of the
>> interrupt after we ack it. We don't do this for edge type interrupts
>> because it seems that toggling the raw status enable bit for edge type
>> interrupts causes spurious edge interrupts.
>>
>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Cc: Doug Anderson <dianders@chromium.org>
>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>  drivers/pinctrl/qcom/pinctrl-msm.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 0e22f52b2a19..3563c4394837 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -626,6 +626,19 @@ static void msm_gpio_irq_mask(struct irq_data *d)
>>       raw_spin_lock_irqsave(&pctrl->lock, flags);
>>
>>       val = readl(pctrl->regs + g->intr_cfg_reg);
>> +     /*
>> +      * Leaving the RAW_STATUS_EN bit enabled causes level interrupts that
>> +      * are still asserted to re-latch after we ack them. Clear the raw
>> +      * status enable bit too so the interrupt can't even latch into the
>> +      * hardware while it's masked, but only do this for level interrupts
>> +      * because edge interrupts have a problem with the raw status bit
>> +      * toggling and causing spurious interrupts.
>> +      */
>> +     if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
>> +             val &= ~BIT(g->intr_raw_status_bit);
>> +             writel(val, pctrl->regs + g->intr_cfg_reg);
>> +     }
>> +
>>       val &= ~BIT(g->intr_enable_bit);
>>       writel(val, pctrl->regs + g->intr_cfg_reg);
>>
>> @@ -647,6 +660,10 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
>>       raw_spin_lock_irqsave(&pctrl->lock, flags);
>>
>>       val = readl(pctrl->regs + g->intr_cfg_reg);
>> +     if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK) {
>> +             val |= BIT(g->intr_raw_status_bit);
>> +             writel(val, pctrl->regs + g->intr_cfg_reg);
>> +     }
>>       val |= BIT(g->intr_enable_bit);
>>       writel(val, pctrl->regs + g->intr_cfg_reg);
>
> I looked at the TLMM documentation, which states that the status bit
> should be cleared after handling the interrupt and this driver used to
> do this.
>
> But Timur managed to hit the race where we lost edge triggered
> interrupts with this behavior, so we changed it in the following commit:
>
> a6566710adaa ("pinctrl: qcom: Don't clear status bit on irq_unmask")
>
>
> But the reason that I had this in the driver originally is that msm-3.10
> does this (clear status bit in unmask), so perhaps the appropriate way
> to solve is to follow the documentation and the downstream driver and
> ack the interrupt in unmask - but do so only for level triggered
> interrupts?

LOL.  Stephen and I had an offline discussion about this and acking in
the unmask was my preferred solution too.  It matches what I did to
solve the same problem on a different controller back in 2013.  See
commit 5a68e7a748c0 ("pinctrl: exynos: ack level-triggered interrupts
before unmasking").  Stephen was of the opinion that it was cleaner to
fully disable the interrupt and that the "ack on unmask" was a bit of
a hack.  I figured that both worked OK and so I didn't insist.

Anyway, either is fine with me w/ a slight personal preference to
acking in unmask.

-Doug
