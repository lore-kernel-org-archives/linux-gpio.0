From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] irq/irq_sim: provide irq_sim_fire_edge()
Date: Tue, 20 Nov 2018 18:17:42 +0100
Message-ID: <20181120171742.gkwb4s4qbcqvnefj@pengutronix.de>
References: <20181120134032.31645-1-brgl@bgdev.pl>
 <20181120134032.31645-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120134032.31645-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 20, 2018 at 02:40:31PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The irq_sim irqchip doesn't allow to configure the sensitivity so every
> call to irq_sim_fire() fires a dummy interrupt. This used to not matter
> for gpio-mockup (one of the irq_sim users) until commit fa38869b0161
> ("gpiolib: Don't support irq sharing for userspace") which made it
> impossible for gpio-mockup to ignore certain events (e.g. only receive
> notifications about rising edge events).
> 
> Introduce a specialized variant of irq_sim_fire() which takes another
> argument called edge. allowing to specify the trigger type for the
> dummy interrupt.

I wonder if it's worth the effort to fix irq_sim. If you take a look in
my gpio-simulator patch, it is trivial to get it right without external
help with an amount of code that is usual for a driver that handles
irqs.

> @@ -161,12 +171,28 @@ EXPORT_SYMBOL_GPL(devm_irq_sim_init);
>   */
>  void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
>  {
> -	if (sim->irqs[offset].enabled) {
> +	/* Don't care about the edge. */
> +	irq_sim_fire_edge(sim, offset, IRQ_TYPE_EDGE_BOTH);

Conceptually irq_sim_fire_edge should be defined above irq_sim_fire.

> +EXPORT_SYMBOL_GPL(irq_sim_fire);
> +
> +/**
> + * irq_sim_fire_edge - Enqueue an interrupt, specify the edge.
> + *
> + * @sim:        The interrupt simulator object.
> + * @offset:     Offset of the simulated interrupt which should be fired.
> + * edge:        Edge of the interrupt (IRQ_TYPE_EDGE_RISING/FALLING).
> + */
> +void irq_sim_fire_edge(struct irq_sim *sim, unsigned int offset, int edge)
> +{
> +	struct irq_sim_irq_ctx *irq = &sim->irqs[offset];
> +
> +	if (irq->enabled && (irq->edge & edge)) {
>  		set_bit(offset, sim->work_ctx.pending);
>  		irq_work_queue(&sim->work_ctx.work);
>  	}
>  }
> -EXPORT_SYMBOL_GPL(irq_sim_fire);
> +EXPORT_SYMBOL_GPL(irq_sim_fire_edge);

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
