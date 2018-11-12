From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] greybus: gpio: switch GPIO portions to use GPIOLIB_IRQCHIP
Date: Mon, 12 Nov 2018 16:15:09 +0100
Message-ID: <20181112151509.GH13311@localhost>
References: <20181109074735.GA5998@nishad>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20181109074735.GA5998@nishad>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Nishad Kamdar <nishadkamdar@gmail.com>
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-gpio@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 09, 2018 at 01:17:41PM +0530, Nishad Kamdar wrote:
> Convert the GPIO driver to use the GPIO irqchip library
> GPIOLIB_IRQCHIP instead of reimplementing the same.

Thanks for picking this up. Linus W took a stab at it a couple of years
ago, but it was never completed. You may want to take a look at that
thread:

	https://lkml.kernel.org/r/1476054589-28422-1-git-send-email-linus.walleij@linaro.org

> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> ---
>  drivers/staging/greybus/Kconfig |   1 +
>  drivers/staging/greybus/gpio.c  | 123 ++++++--------------------------
>  2 files changed, 21 insertions(+), 103 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
> index ab096bcef98c..b571e4e8060b 100644
> --- a/drivers/staging/greybus/Kconfig
> +++ b/drivers/staging/greybus/Kconfig
> @@ -148,6 +148,7 @@ if GREYBUS_BRIDGED_PHY
>  config GREYBUS_GPIO
>  	tristate "Greybus GPIO Bridged PHY driver"
>  	depends on GPIOLIB
> +	select GPIOLIB_IRQCHIP
>  	---help---
>  	  Select this option if you have a device that follows the
>  	  Greybus GPIO Bridged PHY Class specification.
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index b1d4698019a1..32c228bad33a 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -9,9 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> -#include <linux/gpio.h>
> -#include <linux/irq.h>

I think you should keep irq.h even if the gpio header currently provides
it.

> -#include <linux/irqdomain.h>

Similarly for this one, if you still rely on it.

> +#include <linux/gpio/driver.h>
>  #include <linux/mutex.h>
>  
>  #include "greybus.h"
> @@ -40,8 +38,6 @@ struct gb_gpio_controller {
>  	struct gpio_chip	chip;
>  	struct irq_chip		irqc;
>  	struct irq_chip		*irqchip;

This should not be needed any more either.

> -	struct irq_domain	*irqdomain;
> -	unsigned int		irq_base;
>  	irq_flow_handler_t	irq_handler;
>  	unsigned int		irq_default_type;

Neither should these two.

>  	struct mutex		irq_lock;
> @@ -365,6 +361,7 @@ static int gb_gpio_request_handler(struct gb_operation *op)
>  {
>  	struct gb_connection *connection = op->connection;
>  	struct gb_gpio_controller *ggc = gb_connection_get_data(connection);
> +	struct gpio_chip *gc = &ggc->chip;

Please name the pointer 'chip' as in the rest of the driver to avoid
confusion with 'ggc'. But looks like you don't need it at all.

>  	struct device *dev = &ggc->gbphy_dev->dev;
>  	struct gb_message *request;
>  	struct gb_gpio_irq_event_request *event;
> @@ -391,7 +388,7 @@ static int gb_gpio_request_handler(struct gb_operation *op)
>  		return -EINVAL;
>  	}
>  
> -	irq = irq_find_mapping(ggc->irqdomain, event->which);
> +	irq = irq_find_mapping(gc->irq.domain, event->which);
>  	if (!irq) {
>  		dev_err(dev, "failed to find IRQ\n");
>  		return -EINVAL;
> @@ -506,68 +503,6 @@ static int gb_gpio_controller_setup(struct gb_gpio_controller *ggc)
>  	return ret;
>  }

> -/**
> - * gb_gpio_irqchip_remove() - removes an irqchip added to a gb_gpio_controller
> - * @ggc: the gb_gpio_controller to remove the irqchip from
> - *
> - * This is called only from gb_gpio_remove()
> - */
> -static void gb_gpio_irqchip_remove(struct gb_gpio_controller *ggc)
> -{
> -	unsigned int offset;
> -
> -	/* Remove all IRQ mappings and delete the domain */
> -	if (ggc->irqdomain) {
> -		for (offset = 0; offset < (ggc->line_max + 1); offset++)
> -			irq_dispose_mapping(irq_find_mapping(ggc->irqdomain,
> -							     offset));
> -		irq_domain_remove(ggc->irqdomain);
> -	}
> -
> -	if (ggc->irqchip)
> -		ggc->irqchip = NULL;
> -}
> -
>  /**
>   * gb_gpio_irqchip_add() - adds an irqchip to a gpio chip
>   * @chip: the gpio chip to add the irqchip to
> @@ -595,8 +530,7 @@ static int gb_gpio_irqchip_add(struct gpio_chip *chip,
>  			 unsigned int type)
>  {
>  	struct gb_gpio_controller *ggc;
> -	unsigned int offset;
> -	unsigned int irq_base;
> +	unsigned int err;
>  
>  	if (!chip || !irqchip)
>  		return -EINVAL;
> @@ -606,35 +540,21 @@ static int gb_gpio_irqchip_add(struct gpio_chip *chip,
>  	ggc->irqchip = irqchip;
>  	ggc->irq_handler = handler;
>  	ggc->irq_default_type = type;
> -	ggc->irqdomain = irq_domain_add_simple(NULL,
> -					ggc->line_max + 1, first_irq,
> -					&gb_gpio_domain_ops, chip);
> -	if (!ggc->irqdomain) {
> -		ggc->irqchip = NULL;
> -		return -EINVAL;
> -	}
>  
> -	/*
> -	 * Prepare the mapping since the irqchip shall be orthogonal to
> -	 * any gpio calls. If the first_irq was zero, this is
> -	 * necessary to allocate descriptors for all IRQs.
> -	 */
> -	for (offset = 0; offset < (ggc->line_max + 1); offset++) {
> -		irq_base = irq_create_mapping(ggc->irqdomain, offset);
> -		if (offset == 0)
> -			ggc->irq_base = irq_base;
> +	err = gpiochip_irqchip_add(chip,
> +				   irqchip,
> +				   first_irq,
> +				   ggc->irq_handler,
> +				   type

Don't break the line here.

> +				   );
> +	if (err) {
> +		ggc->irqchip = NULL;
> +		return err;
>  	}
>  
>  	return 0;
>  }

Drop this function as well and call gpiochip_irqchip_add() from probe().

> -static int gb_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
> -{
> -	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
> -
> -	return irq_find_mapping(ggc->irqdomain, offset);
> -}
> -
>  static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
>  			 const struct gbphy_device_id *id)
>  {
> @@ -693,7 +613,6 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
>  	gpio->get = gb_gpio_get;
>  	gpio->set = gb_gpio_set;
>  	gpio->set_config = gb_gpio_set_config;
> -	gpio->to_irq = gb_gpio_to_irq;
>  	gpio->base = -1;		/* Allocate base dynamically */
>  	gpio->ngpio = ggc->line_max + 1;
>  	gpio->can_sleep = true;
> @@ -702,24 +621,23 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
>  	if (ret)
>  		goto exit_line_free;
>  
> -	ret = gb_gpio_irqchip_add(gpio, irqc, 0,
> -				   handle_level_irq, IRQ_TYPE_NONE);
> +	ret = gpiochip_add(gpio);
>  	if (ret) {
> -		dev_err(&gbphy_dev->dev, "failed to add irq chip: %d\n", ret);
> +		dev_err(&gbphy_dev->dev, "failed to add gpio chip: %d\n", ret);
>  		goto exit_line_free;
>  	}
>  
> -	ret = gpiochip_add(gpio);
> +	ret = gb_gpio_irqchip_add(gpio, irqc, 0,
> +				  handle_level_irq, IRQ_TYPE_NONE);

As you may have noted, we had the registration order reversed here to
handle a (theoretical) race, which may or may not only have been an
issue for the old 3.10 vendor kernel this was developed against. I've
forgotten the details, but see:

	88f6ba61f25b ("greybus: gpio: create irqdomain before registering gpio controller")

It's possibly an issue also for mainline, but this is indeed the
registration order all other drivers use (even if they tend not to be
hotpluggable).

>  	if (ret) {
> -		dev_err(&gbphy_dev->dev, "failed to add gpio chip: %d\n", ret);
> -		goto exit_gpio_irqchip_remove;
> +		dev_err(&gbphy_dev->dev, "failed to add irq chip: %d\n", ret);
> +		gpiochip_remove(gpio);

Please use an error label for this.

> +		goto exit_line_free;
>  	}
>  
>  	gbphy_runtime_put_autosuspend(gbphy_dev);
>  	return 0;
>  
> -exit_gpio_irqchip_remove:
> -	gb_gpio_irqchip_remove(ggc);
>  exit_line_free:
>  	kfree(ggc->lines);
>  exit_connection_disable:

Thanks,
Johan
