From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/3] irq/irq_sim: add a devres variant of
 irq_sim_init()
Date: Sat, 12 Aug 2017 12:47:34 +0100
Message-ID: <20170812124513.0e6d91f9@archlinux>
References: <20170801145028.7558-1-brgl@bgdev.pl>
 <20170801145028.7558-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170801145028.7558-3-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue,  1 Aug 2017 16:50:27 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Add a resource managed version of irq_sim_init(). This can be
> conveniently used in device drivers.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Looks pretty standard to me.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/driver-model/devres.txt |  1 +
>  include/linux/irq_sim.h               |  4 ++++
>  kernel/irq_sim.c                      | 43 +++++++++++++++++++++++++++++++++++
>  3 files changed, 48 insertions(+)
> 
> diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
> index 30e04f7a690d..69f08c0f23a8 100644
> --- a/Documentation/driver-model/devres.txt
> +++ b/Documentation/driver-model/devres.txt
> @@ -312,6 +312,7 @@ IRQ
>    devm_irq_alloc_descs_from()
>    devm_irq_alloc_generic_chip()
>    devm_irq_setup_generic_chip()
> +  devm_irq_sim_init()
>  
>  LED
>    devm_led_classdev_register()
> diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
> index 0c1abf0e3244..94c4bfc9b7a9 100644
> --- a/include/linux/irq_sim.h
> +++ b/include/linux/irq_sim.h
> @@ -9,6 +9,7 @@
>  #define _LINUX_IRQ_SIM_H
>  
>  #include <linux/irq_work.h>
> +#include <linux/device.h>
>  
>  struct irq_sim_work_ctx {
>  	struct irq_work work;
> @@ -30,6 +31,9 @@ struct irq_sim {
>  int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs);
>  void irq_sim_fini(struct irq_sim *sim);
>  
> +int devm_irq_sim_init(struct device *dev,
> +		      struct irq_sim *sim, unsigned int num_irqs);
> +
>  void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
>  
>  int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
> diff --git a/kernel/irq_sim.c b/kernel/irq_sim.c
> index 4387e2bee97c..92686c0c7790 100644
> --- a/kernel/irq_sim.c
> +++ b/kernel/irq_sim.c
> @@ -90,6 +90,49 @@ void irq_sim_fini(struct irq_sim *sim)
>  }
>  EXPORT_SYMBOL_GPL(irq_sim_fini);
>  
> +struct irq_sim_devres {
> +	struct irq_sim *sim;
> +};
> +
> +static void devm_irq_sim_release(struct device *dev, void *res)
> +{
> +	struct irq_sim_devres *this = res;
> +
> +	irq_sim_fini(this->sim);
> +}
> +
> +/**
> + * irq_sim_init - Initialize the interrupt simulator for a managed device.
> + *
> + * @dev:        Device to initialize the simulator object for.
> + * @sim:        The interrupt simulator object to initialize.
> + * @num_irqs:   Number of interrupts to allocate
> + *
> + * Returns 0 on success and a negative error number on failure.
> + */
> +int devm_irq_sim_init(struct device *dev,
> +		      struct irq_sim *sim, unsigned int num_irqs)
> +{
> +	struct irq_sim_devres *dr;
> +	int rv;
> +
> +	dr = devres_alloc(devm_irq_sim_release, sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return -ENOMEM;
> +
> +	rv = irq_sim_init(sim, num_irqs);
> +	if (rv) {
> +		devres_free(dr);
> +		return rv;
> +	}
> +
> +	dr->sim = sim;
> +	devres_add(dev, dr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(devm_irq_sim_init);
> +
>  /**
>   * irq_sim_fire - Enqueue an interrupt.
>   *
