From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RFC PATCH 4/4] pinctrl: rockchip: avoid hardirq-unsafe functions
 in irq_chip
Date: Wed, 15 Mar 2017 18:04:37 +0100
Message-ID: <8279144.RSoYI8sFdD@phil>
References: <20170313183813.3582-1-john@metanate.com>
 <20170313183813.3582-5-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170313183813.3582-5-john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Am Montag, 13. M=E4rz 2017, 18:38:13 CET schrieb John Keeping:
> With real-time preemption, regmap functions cannot be used in the
> implementation of irq_chip since they use spinlocks which may sleep.
> =

> Move the setting of the mux for IRQs to an irq_bus_sync_unlock handler
> where we are allowed to sleep.
> =

> Signed-off-by: John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>

Looks good
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 44
> ++++++++++++++++++++++++++++++++++---- 1 file changed, 40 insertions(+), 4
> deletions(-)
> =

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index 52e70c4aef7c..80f7c23d12d4
> 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -143,6 +143,9 @@ struct rockchip_drv {
>   * @gpio_chip: gpiolib chip
>   * @grange: gpio range
>   * @slock: spinlock for the gpio bank
> + * @irq_lock: bus lock for irq chip
> + * @new_irqs: newly configured irqs which must be muxed as GPIOs in
> + *	irq_bus_sync_unlock()
>   */
>  struct rockchip_pin_bank {
>  	void __iomem			*reg_base;
> @@ -165,6 +168,8 @@ struct rockchip_pin_bank {
>  	struct pinctrl_gpio_range	grange;
>  	raw_spinlock_t			slock;
>  	u32				toggle_edge_mode;
> +	struct mutex			irq_lock;
> +	u32				new_irqs;
>  };
> =

>  #define PIN_BANK(id, pins, label)			\
> @@ -2045,11 +2050,12 @@ static int rockchip_irq_set_type(struct irq_data =
*d,
> unsigned int type) int ret;
> =

>  	/* make sure the pin is configured as gpio input */
> -	ret =3D rockchip_set_mux(bank, d->hwirq, RK_FUNC_GPIO);
> +	ret =3D rockchip_verify_mux(bank, d->hwirq, RK_FUNC_GPIO);
>  	if (ret < 0)
>  		return ret;
> =

> -	clk_enable(bank->clk);
> +	bank->new_irqs |=3D mask;
> +
>  	raw_spin_lock_irqsave(&bank->slock, flags);
> =

>  	data =3D readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
> @@ -2107,7 +2113,6 @@ static int rockchip_irq_set_type(struct irq_data *d,
> unsigned int type) default:
>  		irq_gc_unlock(gc);
>  		raw_spin_unlock_irqrestore(&bank->slock, flags);
> -		clk_disable(bank->clk);
>  		return -EINVAL;
>  	}
> =

> @@ -2116,7 +2121,6 @@ static int rockchip_irq_set_type(struct irq_data *d,
> unsigned int type)
> =

>  	irq_gc_unlock(gc);
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
> -	clk_disable(bank->clk);
> =

>  	return 0;
>  }
> @@ -2160,6 +2164,34 @@ static void rockchip_irq_gc_mask_set_bit(struct
> irq_data *d) clk_disable(bank->clk);
>  }
> =

> +static void rockchip_irq_bus_lock(struct irq_data *d)
> +{
> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
> +	struct rockchip_pin_bank *bank =3D gc->private;
> +
> +	clk_enable(bank->clk);
> +	mutex_lock(&bank->irq_lock);
> +}
> +
> +static void rockchip_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
> +	struct rockchip_pin_bank *bank =3D gc->private;
> +
> +	while (bank->new_irqs) {
> +		unsigned int irq =3D __ffs(bank->new_irqs);
> +		int ret;
> +
> +		ret =3D rockchip_set_mux(bank, irq, RK_FUNC_GPIO);
> +		WARN_ON(ret < 0);
> +
> +		bank->new_irqs &=3D ~BIT(irq);
> +	}
> +
> +	mutex_unlock(&bank->irq_lock);
> +	clk_disable(bank->clk);
> +}
> +
>  static int rockchip_interrupts_register(struct platform_device *pdev,
>  						struct rockchip_pinctrl *info)
>  {
> @@ -2225,6 +2257,9 @@ static int rockchip_interrupts_register(struct
> platform_device *pdev, gc->chip_types[0].chip.irq_suspend =3D
> rockchip_irq_suspend;
>  		gc->chip_types[0].chip.irq_resume =3D rockchip_irq_resume;
>  		gc->chip_types[0].chip.irq_set_type =3D rockchip_irq_set_type;
> +		gc->chip_types[0].chip.irq_bus_lock =3D rockchip_irq_bus_lock;
> +		gc->chip_types[0].chip.irq_bus_sync_unlock =3D
> +						rockchip_irq_bus_sync_unlock;
>  		gc->wake_enabled =3D IRQ_MSK(bank->nr_pins);
> =

>  		irq_set_chained_handler_and_data(bank->irq,
> @@ -2398,6 +2433,7 @@ static struct rockchip_pin_ctrl
> *rockchip_pinctrl_get_soc_data( int bank_pins =3D 0;
> =

>  		raw_spin_lock_init(&bank->slock);
> +		mutex_init(&bank->irq_lock);
>  		bank->drvdata =3D d;
>  		bank->pin_base =3D ctrl->nr_pins;
>  		ctrl->nr_pins +=3D bank->nr_pins;
