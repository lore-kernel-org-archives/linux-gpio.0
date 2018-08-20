From: Christian Ruppert <christian.ruppert@alitech.com>
Subject: Re: [PATCH 2/2] gpio: tb10x: Use GENERIC_GPIO
Date: Mon, 20 Aug 2018 16:50:08 +0200
Message-ID: <149f3de3-f17c-dcb2-4087-67d095d08b62@alitech.com>
References: <20180806151233.2408-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180806151233.2408-1-linus.walleij@linaro.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Acked-by: Christian Ruppert <christian.ruppert@alitech.com>

On 06.08.2018 17:12, Linus Walleij wrote:
> Instead of open coding logic for reading and writing GPIO lines,
> use the generic GPIO library. Also switch to using the spinlock
> from the generic GPIO to protect the registers.
> 
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Christian Ruppert <christian.ruppert@alitech.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/Kconfig      |  1 +
>  drivers/gpio/gpio-tb10x.c | 96 ++++++++++++---------------------------
>  2 files changed, 31 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 7429b30e61b0..d351548d0257 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -480,6 +480,7 @@ config GPIO_SYSCON
>  
>  config GPIO_TB10X
>  	bool
> +	select GPIO_GENERIC
>  	select GENERIC_IRQ_CHIP
>  	select OF_GPIO
>  
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index 422b0ac5a9de..d5e5d19f4c0a 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -45,14 +45,12 @@
>  
>  
>  /**
> - * @spinlock: used for atomic read/modify/write of registers
>   * @base: register base address
>   * @domain: IRQ domain of GPIO generated interrupts managed by this controller
>   * @irq: Interrupt line of parent interrupt controller
>   * @gc: gpio_chip structure associated to this GPIO controller
>   */
>  struct tb10x_gpio {
> -	spinlock_t spinlock;
>  	void __iomem *base;
>  	struct irq_domain *domain;
>  	int irq;
> @@ -76,60 +74,14 @@ static inline void tb10x_set_bits(struct tb10x_gpio *gpio, unsigned int offs,
>  	u32 r;
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&gpio->spinlock, flags);
> +	spin_lock_irqsave(&gpio->gc.bgpio_lock, flags);
>  
>  	r = tb10x_reg_read(gpio, offs);
>  	r = (r & ~mask) | (val & mask);
>  
>  	tb10x_reg_write(gpio, offs, r);
>  
> -	spin_unlock_irqrestore(&gpio->spinlock, flags);
> -}
> -
> -static int tb10x_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
> -{
> -	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
> -	int mask = BIT(offset);
> -	int val = TB10X_GPIO_DIR_IN << offset;
> -
> -	tb10x_set_bits(tb10x_gpio, OFFSET_TO_REG_DDR, mask, val);
> -
> -	return 0;
> -}
> -
> -static int tb10x_gpio_get(struct gpio_chip *chip, unsigned offset)
> -{
> -	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
> -	int val;
> -
> -	val = tb10x_reg_read(tb10x_gpio, OFFSET_TO_REG_DATA);
> -
> -	if (val & BIT(offset))
> -		return 1;
> -	else
> -		return 0;
> -}
> -
> -static void tb10x_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> -{
> -	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
> -	int mask = BIT(offset);
> -	int val = value << offset;
> -
> -	tb10x_set_bits(tb10x_gpio, OFFSET_TO_REG_DATA, mask, val);
> -}
> -
> -static int tb10x_gpio_direction_out(struct gpio_chip *chip,
> -					unsigned offset, int value)
> -{
> -	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
> -	int mask = BIT(offset);
> -	int val = TB10X_GPIO_DIR_OUT << offset;
> -
> -	tb10x_gpio_set(chip, offset, value);
> -	tb10x_set_bits(tb10x_gpio, OFFSET_TO_REG_DDR, mask, val);
> -
> -	return 0;
> +	spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
>  }
>  
>  static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> @@ -184,8 +136,6 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
>  	if (tb10x_gpio == NULL)
>  		return -ENOMEM;
>  
> -	spin_lock_init(&tb10x_gpio->spinlock);
> -
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	tb10x_gpio->base = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(tb10x_gpio->base))
> @@ -196,20 +146,34 @@ static int tb10x_gpio_probe(struct platform_device *pdev)
>  	if (!tb10x_gpio->gc.label)
>  		return -ENOMEM;
>  
> -	tb10x_gpio->gc.parent		= &pdev->dev;
> -	tb10x_gpio->gc.owner		= THIS_MODULE;
> -	tb10x_gpio->gc.direction_input	= tb10x_gpio_direction_in;
> -	tb10x_gpio->gc.get		= tb10x_gpio_get;
> -	tb10x_gpio->gc.direction_output	= tb10x_gpio_direction_out;
> -	tb10x_gpio->gc.set		= tb10x_gpio_set;
> -	tb10x_gpio->gc.request		= gpiochip_generic_request;
> -	tb10x_gpio->gc.free		= gpiochip_generic_free;
> -	tb10x_gpio->gc.base		= -1;
> -	tb10x_gpio->gc.ngpio		= ngpio;
> -	tb10x_gpio->gc.can_sleep	= false;
> -
> -
> -	ret = devm_gpiochip_add_data(&pdev->dev, &tb10x_gpio->gc, tb10x_gpio);
> +	/*
> +	 * Initialize generic GPIO with one single register for reading and setting
> +	 * the lines, no special set or clear registers and a data direction register
> +	 * wher 1 means "output".
> +	 */
> +	ret = bgpio_init(&tb10x_gpio->gc, dev, 4,
> +			 tb10x_gpio->base + OFFSET_TO_REG_DATA,
> +			 NULL,
> +			 NULL,
> +			 tb10x_gpio->base + OFFSET_TO_REG_DDR,
> +			 NULL,
> +			 0);
> +	if (ret) {
> +		dev_err(dev, "unable to init generic GPIO\n");
> +		return ret;
> +	}
> +	tb10x_gpio->gc.base = -1;
> +	tb10x_gpio->gc.parent = dev;
> +	tb10x_gpio->gc.owner = THIS_MODULE;
> +	/*
> +	 * ngpio is set by bgpio_init() but we override it, this .request()
> +	 * callback also overrides the one set up by generic GPIO.
> +	 */
> +	tb10x_gpio->gc.ngpio = ngpio;
> +	tb10x_gpio->gc.request = gpiochip_generic_request;
> +	tb10x_gpio->gc.free = gpiochip_generic_free;
> +
> +	ret = devm_gpiochip_add_data(dev, &tb10x_gpio->gc, tb10x_gpio);
>  	if (ret < 0) {
>  		dev_err(dev, "Could not add gpiochip.\n");
>  		return ret;
> 
