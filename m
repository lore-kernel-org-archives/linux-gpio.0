From: Gang Liu <gang.liu@nxp.com>
Subject: Re: [RFT][PATCH v2 2/3] gpio: mpc8xxx: Remove *read_reg and
 *write_reg from struct mpc8xxx_gpio_chip
Date: Wed, 2 Mar 2016 07:31:13 +0000
Message-ID: <DB4PR04MB266609FC9A638347004B07F82BC0@DB4PR04MB266.eurprd04.prod.outlook.com>
References: <1456125772.27297.0.camel@ingics.com>
 <1456125841.27297.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-am1on0056.outbound.protection.outlook.com ([157.56.112.56]:24544
	"EHLO emea01-am1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750797AbcCBHqg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Mar 2016 02:46:36 -0500
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 2/22/2016 3:24 PM, Axel Lin wrote:
> *read_reg and *write_reg can be removed because at all the places to call
> them, we can just use gc->read_reg/gc->write_reg instead.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/gpio/gpio-mpc8xxx.c | 48 ++++++++++++++++++++-------------------------
>  1 file changed, 21 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
> index d2472c5..bc042ad6 100644
> --- a/drivers/gpio/gpio-mpc8xxx.c
> +++ b/drivers/gpio/gpio-mpc8xxx.c
> @@ -37,9 +37,6 @@ struct mpc8xxx_gpio_chip {
>  	void __iomem *regs;
>  	raw_spinlock_t lock;
>  
> -	unsigned long (*read_reg)(void __iomem *reg);
> -	void (*write_reg)(void __iomem *reg, unsigned long data);
> -
>  	int (*direction_output)(struct gpio_chip *chip,
>  				unsigned offset, int value);
>  
> @@ -58,8 +55,8 @@ static int mpc8572_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>  	struct mpc8xxx_gpio_chip *mpc8xxx_gc = gpiochip_get_data(gc);
>  	u32 out_mask, out_shadow;
>  
> -	out_mask = mpc8xxx_gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
> -	val = mpc8xxx_gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) & ~out_mask;
> +	out_mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_DIR);
> +	val = gc->read_reg(mpc8xxx_gc->regs + GPIO_DAT) & ~out_mask;
>  	out_shadow = gc->bgpio_data & out_mask;
>  
>  	return !!((val | out_shadow) & gc->pin2mask(gc, gpio));
> @@ -101,10 +98,11 @@ static void mpc8xxx_gpio_irq_cascade(struct irq_desc *desc)
>  {
>  	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_desc_get_handler_data(desc);
>  	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct gpio_chip *gc = &mpc8xxx_gc->gc;
>  	unsigned int mask;
>  
> -	mask = mpc8xxx_gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
> -		& mpc8xxx_gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
> +	mask = gc->read_reg(mpc8xxx_gc->regs + GPIO_IER)
> +		& gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR);
>  	if (mask)
>  		generic_handle_irq(irq_linear_revmap(mpc8xxx_gc->irq,
>  						     32 - ffs(mask)));
> @@ -120,8 +118,8 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
>  
>  	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
>  
> -	mpc8xxx_gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
> -		mpc8xxx_gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
> +	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
> +		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
>  		| gc->pin2mask(gc, irqd_to_hwirq(d)));
>  
>  	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
> @@ -135,8 +133,8 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
>  
>  	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
>  
> -	mpc8xxx_gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
> -		mpc8xxx_gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
> +	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
> +		gc->read_reg(mpc8xxx_gc->regs + GPIO_IMR)
>  		& ~(gc->pin2mask(gc, irqd_to_hwirq(d))));
>  
>  	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
> @@ -147,8 +145,8 @@ static void mpc8xxx_irq_ack(struct irq_data *d)
>  	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
>  	struct gpio_chip *gc = &mpc8xxx_gc->gc;
>  
> -	mpc8xxx_gc->write_reg(mpc8xxx_gc->regs + GPIO_IER,
> -		gc->pin2mask(gc, irqd_to_hwirq(d)));
> +	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER,
> +		      gc->pin2mask(gc, irqd_to_hwirq(d)));
>  }
>  
>  static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
> @@ -160,16 +158,16 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
>  	switch (flow_type) {
>  	case IRQ_TYPE_EDGE_FALLING:
>  		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
> -		mpc8xxx_gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
> -			mpc8xxx_gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
> +		gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
> +			gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
>  			| gc->pin2mask(gc, irqd_to_hwirq(d)));
>  		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
>  		break;
>  
>  	case IRQ_TYPE_EDGE_BOTH:
>  		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
> -		mpc8xxx_gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
> -			mpc8xxx_gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
> +		gc->write_reg(mpc8xxx_gc->regs + GPIO_ICR,
> +			gc->read_reg(mpc8xxx_gc->regs + GPIO_ICR)
>  			& ~(gc->pin2mask(gc, irqd_to_hwirq(d))));
>  		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
>  		break;
> @@ -184,6 +182,7 @@ static int mpc8xxx_irq_set_type(struct irq_data *d, unsigned int flow_type)
>  static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
>  {
>  	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
> +	struct gpio_chip *gc = &mpc8xxx_gc->gc;
>  	unsigned long gpio = irqd_to_hwirq(d);
>  	void __iomem *reg;
>  	unsigned int shift;
> @@ -201,8 +200,7 @@ static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
>  	case IRQ_TYPE_EDGE_FALLING:
>  	case IRQ_TYPE_LEVEL_LOW:
>  		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
> -		mpc8xxx_gc->write_reg(reg,
> -			(mpc8xxx_gc->read_reg(reg) & ~(3 << shift))
> +		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift))
>  			| (2 << shift));
>  		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
>  		break;
> @@ -210,16 +208,14 @@ static int mpc512x_irq_set_type(struct irq_data *d, unsigned int flow_type)
>  	case IRQ_TYPE_EDGE_RISING:
>  	case IRQ_TYPE_LEVEL_HIGH:
>  		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
> -		mpc8xxx_gc->write_reg(reg,
> -			(mpc8xxx_gc->read_reg(reg) & ~(3 << shift))
> +		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift))
>  			| (1 << shift));
>  		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
>  		break;
>  
>  	case IRQ_TYPE_EDGE_BOTH:
>  		raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
> -		mpc8xxx_gc->write_reg(reg,
> -			(mpc8xxx_gc->read_reg(reg) & ~(3 << shift)));
> +		gc->write_reg(reg, (gc->read_reg(reg) & ~(3 << shift)));
>  		raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
>  		break;
>  
> @@ -332,8 +328,6 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>  		dev_dbg(&pdev->dev, "GPIO registers are BIG endian\n");
>  	}
>  
> -	mpc8xxx_gc->read_reg = gc->read_reg;
> -	mpc8xxx_gc->write_reg = gc->write_reg;
>  	mpc8xxx_gc->direction_output = gc->direction_output;
>  
>  	if (!devtype)
> @@ -366,8 +360,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
>  		return 0;
>  
>  	/* ack and mask all irqs */
> -	mpc8xxx_gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
> -	mpc8xxx_gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
> +	gc->write_reg(mpc8xxx_gc->regs + GPIO_IER, 0xffffffff);
> +	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR, 0);
>  
>  	irq_set_chained_handler_and_data(mpc8xxx_gc->irqn,
>  					 mpc8xxx_gpio_irq_cascade, mpc8xxx_gc);
It's OK for me.

Liu Gang
