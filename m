From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RFC PATCH 2/4] pinctrl: rockchip: convert to raw spinlock
Date: Wed, 15 Mar 2017 17:41:21 +0100
Message-ID: <2549921.4Nq1JGygY8@phil>
References: <20170313183813.3582-1-john@metanate.com>
 <20170313183813.3582-3-john@metanate.com> <39203480.lbsBriduiK@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <39203480.lbsBriduiK@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Keeping <john@metanate.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Am Mittwoch, 15. M=E4rz 2017, 17:28:56 CET schrieb Heiko Stuebner:
> Am Montag, 13. M=E4rz 2017, 18:38:11 CET schrieb John Keeping:
> > This lock is used from rockchip_irq_set_type() which is part of the
> > irq_chip implementation and thus must use raw_spinlock_t as documented
> > in Documentation/gpio/driver.txt.
> > =

> > Signed-off-by: John Keeping <john@metanate.com>
> =

> Looks good
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

I have to take that back.
This leaves the spin_lock in the schmitt trigger unconverted and produces =

compile issues.

So it either needs to be converted or removed - I guess it should be remove=
d.

> =

> > ---
> > =

> >  drivers/pinctrl/pinctrl-rockchip.c | 30 +++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> > =

> > diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> > b/drivers/pinctrl/pinctrl-rockchip.c index 1defe83a5c4d..2f963aea64b2
> > 100644
> > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > @@ -163,7 +163,7 @@ struct rockchip_pin_bank {
> > =

> >  	struct irq_domain		*domain;
> >  	struct gpio_chip		gpio_chip;
> >  	struct pinctrl_gpio_range	grange;
> > =

> > -	spinlock_t			slock;
> > +	raw_spinlock_t			slock;
> > =

> >  	u32				toggle_edge_mode;
> >  =

> >  };
> > =

> > @@ -1292,14 +1292,14 @@ static int rockchip_set_pull(struct
> > rockchip_pin_bank *bank,
> > =

> >  	switch (ctrl->type) {
> > =

> >  	case RK2928:
> > -		spin_lock_irqsave(&bank->slock, flags);
> > +		raw_spin_lock_irqsave(&bank->slock, flags);
> > =

> >  		data =3D BIT(bit + 16);
> >  		if (pull =3D=3D PIN_CONFIG_BIAS_DISABLE)
> >  		=

> >  			data |=3D BIT(bit);
> >  		=

> >  		ret =3D regmap_write(regmap, reg, data);
> > =

> > -		spin_unlock_irqrestore(&bank->slock, flags);
> > +		raw_spin_unlock_irqrestore(&bank->slock, flags);
> > =

> >  		break;
> >  	=

> >  	case RK1108:
> > =

> >  	case RK3188:
> > @@ -1433,7 +1433,7 @@ static int _rockchip_pmx_gpio_set_direction(struct
> > gpio_chip *chip, return ret;
> > =

> >  	clk_enable(bank->clk);
> > =

> > -	spin_lock_irqsave(&bank->slock, flags);
> > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > =

> >  	data =3D readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
> >  	/* set bit to 1 for output, 0 for input */
> > =

> > @@ -1443,7 +1443,7 @@ static int _rockchip_pmx_gpio_set_direction(struct
> > gpio_chip *chip, data &=3D ~BIT(pin);
> > =

> >  	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
> > =

> > -	spin_unlock_irqrestore(&bank->slock, flags);
> > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > =

> >  	clk_disable(bank->clk);
> >  	=

> >  	return 0;
> > =

> > @@ -1874,7 +1874,7 @@ static void rockchip_gpio_set(struct gpio_chip *g=
c,
> > unsigned offset, int value) u32 data;
> > =

> >  	clk_enable(bank->clk);
> > =

> > -	spin_lock_irqsave(&bank->slock, flags);
> > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > =

> >  	data =3D readl(reg);
> >  	data &=3D ~BIT(offset);
> > =

> > @@ -1882,7 +1882,7 @@ static void rockchip_gpio_set(struct gpio_chip *g=
c,
> > unsigned offset, int value) data |=3D BIT(offset);
> > =

> >  	writel(data, reg);
> > =

> > -	spin_unlock_irqrestore(&bank->slock, flags);
> > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > =

> >  	clk_disable(bank->clk);
> >  =

> >  }
> > =

> > @@ -1994,7 +1994,7 @@ static void rockchip_irq_demux(struct irq_desc
> > *desc)
> > =

> >  			data =3D readl_relaxed(bank->reg_base + GPIO_EXT_PORT);
> >  			do {
> > =

> > -				spin_lock_irqsave(&bank->slock, flags);
> > +				raw_spin_lock_irqsave(&bank->slock, flags);
> > =

> >  				polarity =3D readl_relaxed(bank->reg_base +
> >  				=

> >  							 GPIO_INT_POLARITY);
> > =

> > @@ -2005,7 +2005,7 @@ static void rockchip_irq_demux(struct irq_desc
> > *desc)
> > =

> >  				writel(polarity,
> >  				=

> >  				       bank->reg_base + GPIO_INT_POLARITY);
> > =

> > -				spin_unlock_irqrestore(&bank->slock, flags);
> > +				raw_spin_unlock_irqrestore(&bank->slock, flags);
> > =

> >  				data_old =3D data;
> >  				data =3D readl_relaxed(bank->reg_base +
> > =

> > @@ -2036,20 +2036,20 @@ static int rockchip_irq_set_type(struct irq_data
> > *d, unsigned int type) return ret;
> > =

> >  	clk_enable(bank->clk);
> > =

> > -	spin_lock_irqsave(&bank->slock, flags);
> > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > =

> >  	data =3D readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
> >  	data &=3D ~mask;
> >  	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
> > =

> > -	spin_unlock_irqrestore(&bank->slock, flags);
> > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > =

> >  	if (type & IRQ_TYPE_EDGE_BOTH)
> >  	=

> >  		irq_set_handler_locked(d, handle_edge_irq);
> >  	=

> >  	else
> >  	=

> >  		irq_set_handler_locked(d, handle_level_irq);
> > =

> > -	spin_lock_irqsave(&bank->slock, flags);
> > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > =

> >  	irq_gc_lock(gc);
> >  	=

> >  	level =3D readl_relaxed(gc->reg_base + GPIO_INTTYPE_LEVEL);
> > =

> > @@ -2092,7 +2092,7 @@ static int rockchip_irq_set_type(struct irq_data =
*d,
> > unsigned int type) break;
> > =

> >  	default:
> >  		irq_gc_unlock(gc);
> > =

> > -		spin_unlock_irqrestore(&bank->slock, flags);
> > +		raw_spin_unlock_irqrestore(&bank->slock, flags);
> > =

> >  		clk_disable(bank->clk);
> >  		return -EINVAL;
> >  	=

> >  	}
> > =

> > @@ -2101,7 +2101,7 @@ static int rockchip_irq_set_type(struct irq_data =
*d,
> > unsigned int type) writel_relaxed(polarity, gc->reg_base +
> > GPIO_INT_POLARITY);
> > =

> >  	irq_gc_unlock(gc);
> > =

> > -	spin_unlock_irqrestore(&bank->slock, flags);
> > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > =

> >  	clk_disable(bank->clk);
> >  	=

> >  	return 0;
> > =

> > @@ -2383,7 +2383,7 @@ static struct rockchip_pin_ctrl
> > *rockchip_pinctrl_get_soc_data( for (i =3D 0; i < ctrl->nr_banks; ++i,
> > ++bank) {
> > =

> >  		int bank_pins =3D 0;
> > =

> > -		spin_lock_init(&bank->slock);
> > +		raw_spin_lock_init(&bank->slock);
> > =

> >  		bank->drvdata =3D d;
> >  		bank->pin_base =3D ctrl->nr_pins;
> >  		ctrl->nr_pins +=3D bank->nr_pins;
