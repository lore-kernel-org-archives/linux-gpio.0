From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] pinctrl: rockchip: add irq_enable & irq_disable ops
Date: Wed, 15 Mar 2017 18:46:38 +0100
Message-ID: <2305921.lIYBC71m00@phil>
References: <1488434212-6567-1-git-send-email-jeffy.chen@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488434212-6567-1-git-send-email-jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, John Keeping <john-HooS5bfzL4hWk0Htik3J/w@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Am Donnerstag, 2. M=E4rz 2017, 13:56:52 CET schrieb Jeffy Chen:
> Currently we are trying to enable/disable the clk of irq's gpio bank when
> unmask/mask irq. But the kernel's "lazy disable approach" will skip maski=
ng
> irq when the irq chip doesn't support irq_disable ops.
> =

> So we may hit this case:
> 	irq_enable-> enable clk
> 	irq_disable-> noop
> 	irq_enable-> enable clk again
> 	irq_disable-> noop
> =

> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

While I'm not that versed in irqchip details, reading through some other =

irqchips makes this look correct handling, so also makes sense in the conte=
xt =

of the pinctrl irqs here

Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

> ---
> =

>  drivers/pinctrl/pinctrl-rockchip.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> b/drivers/pinctrl/pinctrl-rockchip.c index 7813599..a9a7dfa 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -2061,7 +2061,7 @@ static void rockchip_irq_resume(struct irq_data *d)
>  	clk_disable(bank->clk);
>  }
> =

> -static void rockchip_irq_gc_mask_clr_bit(struct irq_data *d)
> +static void rockchip_irq_enable(struct irq_data *d)
>  {
>  	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank =3D gc->private;
> @@ -2070,7 +2070,7 @@ static void rockchip_irq_gc_mask_clr_bit(struct
> irq_data *d) irq_gc_mask_clr_bit(d);
>  }
> =

> -static void rockchip_irq_gc_mask_set_bit(struct irq_data *d)
> +static void rockchip_irq_disable(struct irq_data *d)
>  {
>  	struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>  	struct rockchip_pin_bank *bank =3D gc->private;
> @@ -2137,9 +2137,10 @@ static int rockchip_interrupts_register(struct
> platform_device *pdev, gc->chip_types[0].regs.mask =3D GPIO_INTMASK;
>  		gc->chip_types[0].regs.ack =3D GPIO_PORTS_EOI;
>  		gc->chip_types[0].chip.irq_ack =3D irq_gc_ack_set_bit;
> -		gc->chip_types[0].chip.irq_mask =3D rockchip_irq_gc_mask_set_bit;
> -		gc->chip_types[0].chip.irq_unmask =3D
> -						  rockchip_irq_gc_mask_clr_bit;
> +		gc->chip_types[0].chip.irq_mask =3D irq_gc_mask_set_bit;
> +		gc->chip_types[0].chip.irq_unmask =3D irq_gc_mask_clr_bit;
> +		gc->chip_types[0].chip.irq_enable =3D rockchip_irq_enable;
> +		gc->chip_types[0].chip.irq_disable =3D rockchip_irq_disable;
>  		gc->chip_types[0].chip.irq_set_wake =3D irq_gc_set_wake;
>  		gc->chip_types[0].chip.irq_suspend =3D rockchip_irq_suspend;
>  		gc->chip_types[0].chip.irq_resume =3D rockchip_irq_resume;
