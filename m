From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] pinctrl: intel: Clear interrupt status in unmask callback
Date: Tue, 23 Apr 2019 12:57:31 +0800
Message-ID: <EA207DE8-E89A-427B-B910-A36170A76031@canonical.com>
References: <20190422044539.16085-1-kai.heng.feng@canonical.com>
 <Ld5HCy5--3-1@tutanota.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Ld5HCy5--3-1@tutanota.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hotwater438@tutanota.com
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linus.walleij@linaro.org, Hdegoede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi,

at 02:22, <hotwater438@tutanota.com> <hotwater438@tutanota.com> wrote:

> Hi.
> I've just applied this patch, and touchpad woorks smoothly, but suspend  
> issue is still present.
> After suspend, i2c_hid module bursts i2c_hid i2c-ELAN1200:00:  
> i2c_hid_get_input: incomplete report (16/65535) messages (more than 50  
> reports/sec).
> In dmesg I can see a frequency of reporting every 0.0007 - 0.001 dmesg  
> time units.

What’s the default suspend mode on the platform?
This is a common issue for system that defaults to Suspend-to-idle, but S3  
is in use.
The root cause is that the power of the touchpad doesn’t get cut off during  
S3 by platform firmware.

Do you also see this issue if S2I is in use?

Kai-Heng

>
> Though I can sucessfully restart module and after restarting it works as  
> good as it was.
>
> So suspend issue is still present.
>
> Regards,
> Vladislav.
>
>
> Apr 22, 2019, 7:45 AM by kai.heng.feng@canonical.com:
> Commit a939bb57cd47 ("pinctrl: intel: implement gpio_irq_enable") was
> added because clearing interrupt status bit is required to avoid
> unexpected behavior.
>
> Turns out the unmask callback also needs the fix, which can solve weird
> IRQ triggering issues on I2C touchpad ELAN1200.
>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> drivers/pinctrl/intel/pinctrl-intel.c | 35 ++++-----------------------
> 1 file changed, 5 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c  
> b/drivers/pinctrl/intel/pinctrl-intel.c
> index 3b1818184207..53878604537e 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -913,35 +913,6 @@ static void intel_gpio_irq_ack(struct irq_data *d)
> }
> }
>
> -static void intel_gpio_irq_enable(struct irq_data *d)
> -{
> -	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> -	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
> -	const struct intel_community *community;
> -	const struct intel_padgroup *padgrp;
> -	int pin;
> -
> -	pin = intel_gpio_to_pin(pctrl, irqd_to_hwirq(d), &community, &padgrp);
> -	if (pin >= 0) {
> -	unsigned int gpp, gpp_offset, is_offset;
> -	unsigned long flags;
> -	u32 value;
> -
> -	gpp = padgrp->reg_num;
> -	gpp_offset = padgroup_offset(padgrp, pin);
> -	is_offset = community->is_offset + gpp * 4;
> -
> -	raw_spin_lock_irqsave(&pctrl->lock, flags);
> -	/* Clear interrupt status first to avoid unexpected interrupt */
> -	writel(BIT(gpp_offset), community->regs + is_offset);
> -
> -	value = readl(community->regs + community->ie_offset + gpp * 4);
> -	value |= BIT(gpp_offset);
> -	writel(value, community->regs + community->ie_offset + gpp * 4);
> -	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> -	}
> -}
> -
> static void intel_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
> {
> struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> @@ -963,6 +934,11 @@ static void intel_gpio_irq_mask_unmask(struct  
> irq_data *d, bool mask)
> reg = community->regs + community->ie_offset + gpp * 4;
>
> raw_spin_lock_irqsave(&pctrl->lock, flags);
> +
> +	/* Clear interrupt status first to avoid unexpected interrupt */
> +	if (!mask)
> +	writel(BIT(gpp_offset), community->regs + community->is_offset +  
> gpp * 4);
> +
> value = readl(reg);
> if (mask)
> value &= ~BIT(gpp_offset);
> @@ -1106,7 +1082,6 @@ static irqreturn_t intel_gpio_irq(int irq, void  
> *data)
>
> static struct irq_chip intel_gpio_irqchip = {
> .name = "intel-gpio",
> -	.irq_enable = intel_gpio_irq_enable,
> .irq_ack = intel_gpio_irq_ack,
> .irq_mask = intel_gpio_irq_mask,
> .irq_unmask = intel_gpio_irq_unmask,
> -- 
> 2.17.1
