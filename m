From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 07/19] gpio: bcm-kona: make use of raw_spinlock variants
Date: Fri, 10 Mar 2017 09:28:08 -0800
Message-ID: <78b657c5-0f6a-6481-a0cf-e241c0632c7f@broadcom.com>
References: <cover.1489015238.git.julia@ni.com>
 <77d635877e765a6b4b0935debfe5836e554572c0.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:34333 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755406AbdCJR2N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Mar 2017 12:28:13 -0500
Received: by mail-qk0-f176.google.com with SMTP id p64so178138650qke.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Mar 2017 09:28:12 -0800 (PST)
In-Reply-To: <77d635877e765a6b4b0935debfe5836e554572c0.1489015238.git.julia@ni.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Julia Cartwright <julia@ni.com>, Ray Jui <rjui@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-gpio@vger.kernel.org

Hi Julia/Linus,

On 3/9/2017 8:21 AM, Julia Cartwright wrote:
> The bcm-kona gpio driver currently implements an irq_chip for handling
> interrupts; due to how irq_chip handling is done, it's necessary for the
> irq_chip methods to be invoked from hardirq context, even on a a
> real-time kernel.  Because the spinlock_t type becomes a "sleeping"
> spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
> 
> A quick audit of the operations under the lock reveal that they do only
> minimal, bounded work, and are therefore safe to do under a raw spinlock.

This is new to me. But it seems like, for the vast majority cases, user
can still continue to use spin_lock as it is without needing to worry
about the underlying difference between standard or RT kernels. But in
certain cases, e.g., irq_chips, extra care needs to be done, i.e.,
switching to use raw spin lock to make sure that it is not blocking in
the case of RT.

Is such API use change well accepted by the open source community already?

Thanks,

Ray

> 
> Signed-off-by: Julia Cartwright <julia@ni.com>
> ---
>  drivers/gpio/gpio-bcm-kona.c | 48 ++++++++++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
> index 41d0ac142580..dfcf56ee3c61 100644
> --- a/drivers/gpio/gpio-bcm-kona.c
> +++ b/drivers/gpio/gpio-bcm-kona.c
> @@ -67,7 +67,7 @@
>  struct bcm_kona_gpio {
>  	void __iomem *reg_base;
>  	int num_bank;
> -	spinlock_t lock;
> +	raw_spinlock_t lock;
>  	struct gpio_chip gpio_chip;
>  	struct irq_domain *irq_domain;
>  	struct bcm_kona_gpio_bank *banks;
> @@ -95,13 +95,13 @@ static void bcm_kona_gpio_lock_gpio(struct bcm_kona_gpio *kona_gpio,
>  	unsigned long flags;
>  	int bank_id = GPIO_BANK(gpio);
>  
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
>  	val |= BIT(gpio);
>  	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  }
>  
>  static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
> @@ -111,13 +111,13 @@ static void bcm_kona_gpio_unlock_gpio(struct bcm_kona_gpio *kona_gpio,
>  	unsigned long flags;
>  	int bank_id = GPIO_BANK(gpio);
>  
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(kona_gpio->reg_base + GPIO_PWD_STATUS(bank_id));
>  	val &= ~BIT(gpio);
>  	bcm_kona_gpio_write_lock_regs(kona_gpio->reg_base, bank_id, val);
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  }
>  
>  static int bcm_kona_gpio_get_dir(struct gpio_chip *chip, unsigned gpio)
> @@ -141,7 +141,7 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
>  
>  	kona_gpio = gpiochip_get_data(chip);
>  	reg_base = kona_gpio->reg_base;
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	/* this function only applies to output pin */
>  	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIOF_DIR_IN)
> @@ -154,7 +154,7 @@ static void bcm_kona_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
>  	writel(val, reg_base + reg_offset);
>  
>  out:
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  }
>  
>  static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
> @@ -168,7 +168,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
>  
>  	kona_gpio = gpiochip_get_data(chip);
>  	reg_base = kona_gpio->reg_base;
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	if (bcm_kona_gpio_get_dir(chip, gpio) == GPIOF_DIR_IN)
>  		reg_offset = GPIO_IN_STATUS(bank_id);
> @@ -178,7 +178,7 @@ static int bcm_kona_gpio_get(struct gpio_chip *chip, unsigned gpio)
>  	/* read the GPIO bank status */
>  	val = readl(reg_base + reg_offset);
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  
>  	/* return the specified bit status */
>  	return !!(val & BIT(bit));
> @@ -208,14 +208,14 @@ static int bcm_kona_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
>  
>  	kona_gpio = gpiochip_get_data(chip);
>  	reg_base = kona_gpio->reg_base;
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(reg_base + GPIO_CONTROL(gpio));
>  	val &= ~GPIO_GPCTR0_IOTR_MASK;
>  	val |= GPIO_GPCTR0_IOTR_CMD_INPUT;
>  	writel(val, reg_base + GPIO_CONTROL(gpio));
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  
>  	return 0;
>  }
> @@ -232,7 +232,7 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
>  
>  	kona_gpio = gpiochip_get_data(chip);
>  	reg_base = kona_gpio->reg_base;
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(reg_base + GPIO_CONTROL(gpio));
>  	val &= ~GPIO_GPCTR0_IOTR_MASK;
> @@ -244,7 +244,7 @@ static int bcm_kona_gpio_direction_output(struct gpio_chip *chip,
>  	val |= BIT(bit);
>  	writel(val, reg_base + reg_offset);
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  
>  	return 0;
>  }
> @@ -288,7 +288,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
>  	}
>  
>  	/* spin lock for read-modify-write of the GPIO register */
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(reg_base + GPIO_CONTROL(gpio));
>  	val &= ~GPIO_GPCTR0_DBR_MASK;
> @@ -303,7 +303,7 @@ static int bcm_kona_gpio_set_debounce(struct gpio_chip *chip, unsigned gpio,
>  
>  	writel(val, reg_base + GPIO_CONTROL(gpio));
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  
>  	return 0;
>  }
> @@ -347,13 +347,13 @@ static void bcm_kona_gpio_irq_ack(struct irq_data *d)
>  
>  	kona_gpio = irq_data_get_irq_chip_data(d);
>  	reg_base = kona_gpio->reg_base;
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(reg_base + GPIO_INT_STATUS(bank_id));
>  	val |= BIT(bit);
>  	writel(val, reg_base + GPIO_INT_STATUS(bank_id));
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  }
>  
>  static void bcm_kona_gpio_irq_mask(struct irq_data *d)
> @@ -368,13 +368,13 @@ static void bcm_kona_gpio_irq_mask(struct irq_data *d)
>  
>  	kona_gpio = irq_data_get_irq_chip_data(d);
>  	reg_base = kona_gpio->reg_base;
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(reg_base + GPIO_INT_MASK(bank_id));
>  	val |= BIT(bit);
>  	writel(val, reg_base + GPIO_INT_MASK(bank_id));
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  }
>  
>  static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
> @@ -389,13 +389,13 @@ static void bcm_kona_gpio_irq_unmask(struct irq_data *d)
>  
>  	kona_gpio = irq_data_get_irq_chip_data(d);
>  	reg_base = kona_gpio->reg_base;
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(reg_base + GPIO_INT_MSKCLR(bank_id));
>  	val |= BIT(bit);
>  	writel(val, reg_base + GPIO_INT_MSKCLR(bank_id));
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  }
>  
>  static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> @@ -431,14 +431,14 @@ static int bcm_kona_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		return -EINVAL;
>  	}
>  
> -	spin_lock_irqsave(&kona_gpio->lock, flags);
> +	raw_spin_lock_irqsave(&kona_gpio->lock, flags);
>  
>  	val = readl(reg_base + GPIO_CONTROL(gpio));
>  	val &= ~GPIO_GPCTR0_ITR_MASK;
>  	val |= lvl_type << GPIO_GPCTR0_ITR_SHIFT;
>  	writel(val, reg_base + GPIO_CONTROL(gpio));
>  
> -	spin_unlock_irqrestore(&kona_gpio->lock, flags);
> +	raw_spin_unlock_irqrestore(&kona_gpio->lock, flags);
>  
>  	return 0;
>  }
> @@ -655,7 +655,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
>  						 bank);
>  	}
>  
> -	spin_lock_init(&kona_gpio->lock);
> +	raw_spin_lock_init(&kona_gpio->lock);
>  
>  	return 0;
>  
> 
