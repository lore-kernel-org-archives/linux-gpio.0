From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 3/9] irq/irq_sim: provide irq_sim_fire_type()
Date: Tue, 29 Jan 2019 10:07:06 +0100
Message-ID: <20190129090706.33wcxb6d2c64yx7c@pengutronix.de>
References: <20190129084411.30495-1-brgl@bgdev.pl>
 <20190129084411.30495-4-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129084411.30495-4-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Hello Bartosz,

On Tue, Jan 29, 2019 at 09:44:05AM +0100, Bartosz Golaszewski wrote:
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
>  		set_bit(offset, sim->work_ctx.pending);
>  		irq_work_queue(&sim->work_ctx.work);
>  	}
>  }
> -EXPORT_SYMBOL_GPL(irq_sim_fire);
> +EXPORT_SYMBOL_GPL(irq_sim_fire_type);

This looks better than the previous variant. I wonder if it would be
still more sensible to have type only in the mockup driver. But I don't
have the complete picture here and it might be easier this way.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
