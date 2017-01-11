From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: Re: [PATCH v2] gpio: provide lockdep keys for nested/unnested
 irqchips
Date: Wed, 11 Jan 2017 17:00:20 +0100
Message-ID: <20170111160020.GA25233@archie.localdomain>
References: <20170111154311.11260-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:12517 "EHLO
        mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932246AbdAKQAZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 11:00:25 -0500
Content-Disposition: inline
In-Reply-To: <20170111154311.11260-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Roger Quadros <rogerq@ti.com>

On Wed, Jan 11, 2017 at 04:43:11PM +0100, Linus Walleij wrote:
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
> Cc: Clemens Gruber <clemens.gruber@pqgruber.com>
> Cc: Roger Quadros <rogerq@ti.com>
> Reported-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> Reported-by: Roger Quadros <rogerq@ti.com>
> Reported-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Write code that actually compiles on LOCKDEP too, now I've
>   had it with confusing _underscores.
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
> index c2748accea71..e973faba69dc 100644
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
> +	static struct lock_class_key key;
> +
> +	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
> +					handler, type, false, &key);
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
> +	static struct lock_class_key key;
> +
> +	return gpiochip_irqchip_add_key(gpiochip, irqchip, first_irq,
> +					handler, type, true, &key);
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
> 

Fixes the issue, thank you!

Tested-by: Clemens Gruber <clemens.gruber@pqgruber.com>

Regards,
Clemens
