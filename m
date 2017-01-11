From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: [PATCH] gpio: provide lockdep keys for nested/unnested irqchips
Date: Wed, 11 Jan 2017 15:39:51 +0100
Message-ID: <20170111143951.GA13120@archie.localdomain>
References: <20170111124313.4210-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:35902 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763641AbdAKOjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 09:39:55 -0500
Content-Disposition: inline
In-Reply-To: <20170111124313.4210-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>

Hi Linus,

On Wed, Jan 11, 2017 at 01:43:13PM +0100, Linus Walleij wrote:
> The helper function for adding a GPIO chip compiles in a lockdep
> key for debugging, the same key is needed for nested chips as
> well.
> 
> The macro construction is unreadable, replace this with two
> static inlines instead.
> 
> The _gpiochip_irqchip_add prefixed function is not helpful,
> rename it with gpiochip_irqchip_add_key() that tell us what the
> function is actually doing.
> 
> Fixes: d245b3f9bd36 ("gpio: simplify adding threaded interrupts")
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpiolib.c      | 18 ++++++------
>  include/linux/gpio/driver.h | 70 ++++++++++++++++++++++++++++++++-------------
>  2 files changed, 59 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 86bf3b84ada5..a07ae9e37930 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1723,7 +1723,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
>  }
>  
>  /**
> - * _gpiochip_irqchip_add() - adds an irqchip to a gpiochip
> + * gpiochip_irqchip_add_key() - adds an irqchip to a gpiochip
>   * @gpiochip: the gpiochip to add the irqchip to
>   * @irqchip: the irqchip to add to the gpiochip
>   * @first_irq: if not dynamically assigned, the base (first) IRQ to
> @@ -1749,13 +1749,13 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
>   * the pins on the gpiochip can generate a unique IRQ. Everything else
>   * need to be open coded.
>   */
> -int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
> -			  struct irq_chip *irqchip,
> -			  unsigned int first_irq,
> -			  irq_flow_handler_t handler,
> -			  unsigned int type,
> -			  bool nested,
> -			  struct lock_class_key *lock_key)
> +int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
> +			     struct irq_chip *irqchip,
> +			     unsigned int first_irq,
> +			     irq_flow_handler_t handler,
> +			     unsigned int type,
> +			     bool nested,
> +			     struct lock_class_key *lock_key)
>  {
>  	struct device_node *of_node;
>  	bool irq_base_set = false;
> @@ -1840,7 +1840,7 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(_gpiochip_irqchip_add);
> +EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
>  
>  #else /* CONFIG_GPIOLIB_IRQCHIP */
>  
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index c2748accea71..3dce976441f9 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -274,37 +274,67 @@ void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
>  		struct irq_chip *irqchip,
>  		int parent_irq);
>  
> -int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
> +int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
> +			     struct irq_chip *irqchip,
> +			     unsigned int first_irq,
> +			     irq_flow_handler_t handler,
> +			     unsigned int type,
> +			     bool nested,
> +			     struct lock_class_key *lock_key);
> +
> +#ifdef CONFIG_LOCKDEP
> +
> +/*
> + * Lockdep requires that each irqchip instance be created with a
> + * unique key so as to avoid unnecessary warnings. This upfront
> + * boilerplate static inlines provides such a key for each
> + * unique instance.
> + */
> +static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
> +				       struct irq_chip *irqchip,
> +				       unsigned int first_irq,
> +				       irq_flow_handler_t handler,
> +				       unsigned int type)
> +{
> +	static struct lock_class_key _key;
> +
> +	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
> +					handler, type, false, &_key);
> +}
> +
> +static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
>  			  struct irq_chip *irqchip,
>  			  unsigned int first_irq,
>  			  irq_flow_handler_t handler,
> -			  unsigned int type,
> -			  bool nested,
> -			  struct lock_class_key *lock_key);
> +			  unsigned int type)
> +{
> +
> +	static struct lock_class_key _key;
> +
> +	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
> +					handler, type, true, &key);

I think this should be &_key.

> +}
> +#else
> +static inline int gpiochip_irqchip_add(struct gpio_chip *gpiochip,
> +				       struct irq_chip *irqchip,
> +				       unsigned int first_irq,
> +				       irq_flow_handler_t handler,
> +				       unsigned int type)
> +{
> +	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
> +					handler, type, false, NULL);
> +}
>  
> -/* FIXME: I assume threaded IRQchips do not have the lockdep problem */
>  static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
>  			  struct irq_chip *irqchip,
>  			  unsigned int first_irq,
>  			  irq_flow_handler_t handler,
>  			  unsigned int type)
>  {
> -	return _gpiochip_irqchip_add(gpiochip, irqchip, first_irq,
> -				     handler, type, true, NULL);
> +	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
> +					handler, type, true, NULL);
>  }
> -
> -#ifdef CONFIG_LOCKDEP
> -#define gpiochip_irqchip_add(...)				\
> -(								\
> -	({							\
> -		static struct lock_class_key _key;		\
> -		_gpiochip_irqchip_add(__VA_ARGS__, false, &_key); \
> -	})							\
> -)
> -#else
> -#define gpiochip_irqchip_add(...)				\
> -	_gpiochip_irqchip_add(__VA_ARGS__, false, NULL)
> -#endif
> +#endif /* CONFIG_LOCKDEP */
>  
>  #endif /* CONFIG_GPIOLIB_IRQCHIP */
>  
> -- 
> 2.9.3

The build fails after applying the patch on top of current mainline due
to a typo of &key instead of &_key:

  CC      drivers/clk/clk-gpio.o
In file included from ./include/asm-generic/gpio.h:12:0,
                 from ./arch/arm/include/asm/gpio.h:9,
                 from ./include/linux/gpio.h:48,
                 from drivers/clk/clk-gpio.c:18:
./include/linux/gpio/driver.h: In function 'gpiochip_irqchip_add_nested':
./include/linux/gpio/driver.h:315:28: error: 'key' undeclared (first use in this function)
      handler, type, true, &key);
                            ^~~
./include/linux/gpio/driver.h:315:28: note: each undeclared identifier is reported only once for each function it appears in
./include/linux/gpio/driver.h:312:31: warning: unused variable '_key' [-Wunused-variable]
  static struct lock_class_key _key;
                               ^~~~
make[3]: *** [scripts/Makefile.build:294: drivers/clk/clk-gpio.o] Error 1
make[2]: *** [scripts/Makefile.build:551: drivers/clk] Error 2
make[1]: *** [Makefile:988: drivers] Error 2

Regards,
Clemens
