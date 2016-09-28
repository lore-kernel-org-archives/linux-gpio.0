From: Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [PATCH] gpio: stmpe: use BIT() macro
Date: Wed, 28 Sep 2016 09:22:19 +0200
Message-ID: <17383f6d-69ad-2506-50e0-2d76a41f0f39@st.com>
References: <1475018000-5152-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22891 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750785AbcI1HWZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Sep 2016 03:22:25 -0400
In-Reply-To: <1475018000-5152-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

Hi Linus

On 09/28/2016 01:13 AM, Linus Walleij wrote:
> Avoid custom (1 << bits) shifting by consequently using the
> BIT() macro from <linux/bitops.h>.
> 
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-stmpe.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index 432b2ee173c7..e7d422a6b90b 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -43,7 +43,7 @@ static int stmpe_gpio_get(struct gpio_chip *chip, unsigned offset)
>  	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
>  	struct stmpe *stmpe = stmpe_gpio->stmpe;
>  	u8 reg = stmpe->regs[STMPE_IDX_GPMR_LSB + (offset / 8)];
> -	u8 mask = 1 << (offset % 8);
> +	u8 mask = BIT(offset % 8);
>  	int ret;
>  
>  	ret = stmpe_reg_read(stmpe, reg);
> @@ -59,7 +59,7 @@ static void stmpe_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
>  	struct stmpe *stmpe = stmpe_gpio->stmpe;
>  	int which = val ? STMPE_IDX_GPSR_LSB : STMPE_IDX_GPCR_LSB;
>  	u8 reg = stmpe->regs[which + (offset / 8)];
> -	u8 mask = 1 << (offset % 8);
> +	u8 mask = BIT(offset % 8);
>  
>  	/*
>  	 * Some variants have single register for gpio set/clear functionality.
> @@ -77,7 +77,7 @@ static int stmpe_gpio_get_direction(struct gpio_chip *chip,
>  	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
>  	struct stmpe *stmpe = stmpe_gpio->stmpe;
>  	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB] - (offset / 8);
> -	u8 mask = 1 << (offset % 8);
> +	u8 mask = BIT(offset % 8);
>  	int ret;
>  
>  	ret = stmpe_reg_read(stmpe, reg);
> @@ -93,7 +93,7 @@ static int stmpe_gpio_direction_output(struct gpio_chip *chip,
>  	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
>  	struct stmpe *stmpe = stmpe_gpio->stmpe;
>  	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB + (offset / 8)];
> -	u8 mask = 1 << (offset % 8);
> +	u8 mask = BIT(offset % 8);
>  
>  	stmpe_gpio_set(chip, offset, val);
>  
> @@ -106,7 +106,7 @@ static int stmpe_gpio_direction_input(struct gpio_chip *chip,
>  	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
>  	struct stmpe *stmpe = stmpe_gpio->stmpe;
>  	u8 reg = stmpe->regs[STMPE_IDX_GPDR_LSB + (offset / 8)];
> -	u8 mask = 1 << (offset % 8);
> +	u8 mask = BIT(offset % 8);
>  
>  	return stmpe_set_bits(stmpe, reg, mask, 0);
>  }
> @@ -116,10 +116,10 @@ static int stmpe_gpio_request(struct gpio_chip *chip, unsigned offset)
>  	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(chip);
>  	struct stmpe *stmpe = stmpe_gpio->stmpe;
>  
> -	if (stmpe_gpio->norequest_mask & (1 << offset))
> +	if (stmpe_gpio->norequest_mask & BIT(offset))
>  		return -EINVAL;
>  
> -	return stmpe_set_altfunc(stmpe, 1 << offset, STMPE_BLOCK_GPIO);
> +	return stmpe_set_altfunc(stmpe, BIT(offset), STMPE_BLOCK_GPIO);
>  }
>  
>  static const struct gpio_chip template_chip = {
> @@ -140,7 +140,7 @@ static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
>  	int offset = d->hwirq;
>  	int regoffset = offset / 8;
> -	int mask = 1 << (offset % 8);
> +	int mask = BIT(offset % 8);
>  
>  	if (type & IRQ_TYPE_LEVEL_LOW || type & IRQ_TYPE_LEVEL_HIGH)
>  		return -EINVAL;
> @@ -218,7 +218,7 @@ static void stmpe_gpio_irq_mask(struct irq_data *d)
>  	struct stmpe_gpio *stmpe_gpio = gpiochip_get_data(gc);
>  	int offset = d->hwirq;
>  	int regoffset = offset / 8;
> -	int mask = 1 << (offset % 8);
> +	int mask = BIT(offset % 8);
>  
>  	stmpe_gpio->regs[REG_IE][regoffset] &= ~mask;
>  }
> @@ -230,7 +230,7 @@ static void stmpe_gpio_irq_unmask(struct irq_data *d)
>  	struct stmpe *stmpe = stmpe_gpio->stmpe;
>  	int offset = d->hwirq;
>  	int regoffset = offset / 8;
> -	int mask = 1 << (offset % 8);
> +	int mask = BIT(offset % 8);
>  
>  	stmpe_gpio->regs[REG_IE][regoffset] |= mask;
>  
> @@ -254,7 +254,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
>  	bool val = !!stmpe_gpio_get(gc, offset);
>  	u8 bank = offset / 8;
>  	u8 dir_reg = stmpe->regs[STMPE_IDX_GPDR_LSB + bank];
> -	u8 mask = 1 << (offset % 8);
> +	u8 mask = BIT(offset % 8);
>  	int ret;
>  	u8 dir;
>  
> @@ -401,7 +401,7 @@ static irqreturn_t stmpe_gpio_irq(int irq, void *dev)
>  							 line);
>  
>  			handle_nested_irq(child_irq);
> -			stat &= ~(1 << bit);
> +			stat &= ~BIT(bit);
>  		}
>  
>  		/*
> 

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
