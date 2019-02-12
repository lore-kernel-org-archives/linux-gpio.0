From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 3/9] irq/irq_sim: provide irq_sim_fire_type()
Date: Tue, 12 Feb 2019 09:10:15 +0000
Message-ID: <656763ec-41b9-cdee-22bd-1f32d74473a0@arm.com>
References: <20190129084411.30495-1-brgl@bgdev.pl>
 <20190129084411.30495-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129084411.30495-4-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On 29/01/2019 08:44, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Provide a more specialized variant of irq_sim_fire() that allows to
> specify the type of the fired interrupt. The type is stored in the
> dummy irq context struct via the set_type callback.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/irq_sim.h |  9 ++++++++-
>  kernel/irq/irq_sim.c    | 26 ++++++++++++++++++++++----
>  2 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/irq_sim.h b/include/linux/irq_sim.h
> index b96c2f752320..647a6c8ffb31 100644
> --- a/include/linux/irq_sim.h
> +++ b/include/linux/irq_sim.h
> @@ -23,6 +23,7 @@ struct irq_sim_work_ctx {
>  
>  struct irq_sim_irq_ctx {
>  	bool			enabled;
> +	unsigned int		type;
>  };
>  
>  struct irq_sim {
> @@ -37,7 +38,13 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs);
>  int devm_irq_sim_init(struct device *dev, struct irq_sim *sim,
>  		      unsigned int num_irqs);
>  void irq_sim_fini(struct irq_sim *sim);
> -void irq_sim_fire(struct irq_sim *sim, unsigned int offset);
> +void irq_sim_fire_type(struct irq_sim *sim,
> +		       unsigned int offset, unsigned int type);
>  int irq_sim_irqnum(struct irq_sim *sim, unsigned int offset);
>  
> +static inline void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
> +{
> +	irq_sim_fire_type(sim, offset, IRQ_TYPE_DEFAULT);
> +}
> +
>  #endif /* _LINUX_IRQ_SIM_H */
> diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
> index 2bcdbab1bc5a..e3160b5e59b8 100644
> --- a/kernel/irq/irq_sim.c
> +++ b/kernel/irq/irq_sim.c
> @@ -25,6 +25,15 @@ static void irq_sim_irqunmask(struct irq_data *data)
>  	irq_ctx->enabled = true;
>  }
>  
> +static int irq_sim_set_type(struct irq_data *data, unsigned int type)
> +{
> +	struct irq_sim_irq_ctx *irq_ctx = irq_data_get_irq_chip_data(data);
> +
> +	irq_ctx->type = type;
> +
> +	return 0;
> +}
> +
>  static void irq_sim_handle_irq(struct irq_work *work)
>  {
>  	struct irq_sim_work_ctx *work_ctx;
> @@ -107,6 +116,7 @@ int irq_sim_init(struct irq_sim *sim, unsigned int num_irqs)
>  	sim->chip.name = "irq_sim";
>  	sim->chip.irq_mask = irq_sim_irqmask;
>  	sim->chip.irq_unmask = irq_sim_irqunmask;
> +	sim->chip.irq_set_type = irq_sim_set_type;
>  
>  	sim->work_ctx.pending = bitmap_zalloc(num_irqs, GFP_KERNEL);
>  	if (!sim->work_ctx.pending) {
> @@ -192,21 +202,29 @@ irq_sim_get_ctx(struct irq_sim *sim, unsigned int offset)
>  }
>  
>  /**
> - * irq_sim_fire - Enqueue an interrupt.
> + * irq_sim_fire_type - Enqueue an interrupt.
>   *
>   * @sim:        The interrupt simulator object.
>   * @offset:     Offset of the simulated interrupt which should be fired.
> + * @type:	Type of the fired interrupt. Must be one of the following:
> + *		IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING,
> + *		IRQ_TYPE_EDGE_BOTH, IRQ_TYPE_LEVEL_HIGH,
> + *		IRQ_TYPE_LEVEL_LOW, IRQ_TYPE_DEFAULT
>   */
> -void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
> +void irq_sim_fire_type(struct irq_sim *sim,
> +		       unsigned int offset, unsigned int type)
>  {
>  	struct irq_sim_irq_ctx *ctx = irq_sim_get_ctx(sim, offset);
>  
> -	if (ctx->enabled) {
> +	/* Only care about relevant flags. */
> +	type &= IRQ_TYPE_SENSE_MASK;
> +
> +	if (ctx->enabled && (ctx->type & type)) {

I wonder how realistic this is, given that you do not track the release
of a level. In short, mo matter what the type is, you treat everything
as edge.

What is the point of this?

>  		set_bit(offset, sim->work_ctx.pending);
>  		irq_work_queue(&sim->work_ctx.work);
>  	}
>  }
> -EXPORT_SYMBOL_GPL(irq_sim_fire);
> +EXPORT_SYMBOL_GPL(irq_sim_fire_type);
>  
>  /**
>   * irq_sim_irqnum - Get the allocated number of a dummy interrupt.
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
