From: John Keeping <john@metanate.com>
Subject: Re: [RFC PATCH 2/4] pinctrl: rockchip: convert to raw spinlock
Date: Wed, 15 Mar 2017 16:59:00 +0000
Message-ID: <20170315165900.63f32371.john@metanate.com>
References: <20170313183813.3582-1-john@metanate.com>
        <20170313183813.3582-3-john@metanate.com>
        <39203480.lbsBriduiK@phil>
        <2549921.4Nq1JGygY8@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from dougal.metanate.com ([90.155.101.14]:35301 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752919AbdCOQ7D (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Mar 2017 12:59:03 -0400
In-Reply-To: <2549921.4Nq1JGygY8@phil>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org

On Wed, 15 Mar 2017 17:41:21 +0100, Heiko Stuebner wrote:

> Am Mittwoch, 15. M=C3=A4rz 2017, 17:28:56 CET schrieb Heiko Stuebner:
> > Am Montag, 13. M=C3=A4rz 2017, 18:38:11 CET schrieb John Keeping: =20
> > > This lock is used from rockchip_irq_set_type() which is part of the
> > > irq_chip implementation and thus must use raw_spinlock_t as documented
> > > in Documentation/gpio/driver.txt.
> > >=20
> > > Signed-off-by: John Keeping <john@metanate.com> =20
> >=20
> > Looks good
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de> =20
>=20
> I have to take that back.
> This leaves the spin_lock in the schmitt trigger unconverted and produces=
=20
> compile issues.
>=20
> So it either needs to be converted or removed - I guess it should be remo=
ved.

Yes, it looks like it should be removed - the patches adding that hadn't
been applied when I sent this out!

I'll rebase and add the schmitt trigger change to patch 1 in a day or
two, after giving a bit more time for reviews.

> > > ---
> > >=20
> > >  drivers/pinctrl/pinctrl-rockchip.c | 30 +++++++++++++++-------------=
--
> > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> > > b/drivers/pinctrl/pinctrl-rockchip.c index 1defe83a5c4d..2f963aea64b2
> > > 100644
> > > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > > @@ -163,7 +163,7 @@ struct rockchip_pin_bank {
> > >=20
> > >  	struct irq_domain		*domain;
> > >  	struct gpio_chip		gpio_chip;
> > >  	struct pinctrl_gpio_range	grange;
> > >=20
> > > -	spinlock_t			slock;
> > > +	raw_spinlock_t			slock;
> > >=20
> > >  	u32				toggle_edge_mode;
> > > =20
> > >  };
> > >=20
> > > @@ -1292,14 +1292,14 @@ static int rockchip_set_pull(struct
> > > rockchip_pin_bank *bank,
> > >=20
> > >  	switch (ctrl->type) {
> > >=20
> > >  	case RK2928:
> > > -		spin_lock_irqsave(&bank->slock, flags);
> > > +		raw_spin_lock_irqsave(&bank->slock, flags);
> > >=20
> > >  		data =3D BIT(bit + 16);
> > >  		if (pull =3D=3D PIN_CONFIG_BIAS_DISABLE)
> > >  	=09
> > >  			data |=3D BIT(bit);
> > >  	=09
> > >  		ret =3D regmap_write(regmap, reg, data);
> > >=20
> > > -		spin_unlock_irqrestore(&bank->slock, flags);
> > > +		raw_spin_unlock_irqrestore(&bank->slock, flags);
> > >=20
> > >  		break;
> > >  =09
> > >  	case RK1108:
> > >=20
> > >  	case RK3188:
> > > @@ -1433,7 +1433,7 @@ static int _rockchip_pmx_gpio_set_direction(str=
uct
> > > gpio_chip *chip, return ret;
> > >=20
> > >  	clk_enable(bank->clk);
> > >=20
> > > -	spin_lock_irqsave(&bank->slock, flags);
> > > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > >=20
> > >  	data =3D readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
> > >  	/* set bit to 1 for output, 0 for input */
> > >=20
> > > @@ -1443,7 +1443,7 @@ static int _rockchip_pmx_gpio_set_direction(str=
uct
> > > gpio_chip *chip, data &=3D ~BIT(pin);
> > >=20
> > >  	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
> > >=20
> > > -	spin_unlock_irqrestore(&bank->slock, flags);
> > > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > >=20
> > >  	clk_disable(bank->clk);
> > >  =09
> > >  	return 0;
> > >=20
> > > @@ -1874,7 +1874,7 @@ static void rockchip_gpio_set(struct gpio_chip =
*gc,
> > > unsigned offset, int value) u32 data;
> > >=20
> > >  	clk_enable(bank->clk);
> > >=20
> > > -	spin_lock_irqsave(&bank->slock, flags);
> > > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > >=20
> > >  	data =3D readl(reg);
> > >  	data &=3D ~BIT(offset);
> > >=20
> > > @@ -1882,7 +1882,7 @@ static void rockchip_gpio_set(struct gpio_chip =
*gc,
> > > unsigned offset, int value) data |=3D BIT(offset);
> > >=20
> > >  	writel(data, reg);
> > >=20
> > > -	spin_unlock_irqrestore(&bank->slock, flags);
> > > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > >=20
> > >  	clk_disable(bank->clk);
> > > =20
> > >  }
> > >=20
> > > @@ -1994,7 +1994,7 @@ static void rockchip_irq_demux(struct irq_desc
> > > *desc)
> > >=20
> > >  			data =3D readl_relaxed(bank->reg_base + GPIO_EXT_PORT);
> > >  			do {
> > >=20
> > > -				spin_lock_irqsave(&bank->slock, flags);
> > > +				raw_spin_lock_irqsave(&bank->slock, flags);
> > >=20
> > >  				polarity =3D readl_relaxed(bank->reg_base +
> > >  			=09
> > >  							 GPIO_INT_POLARITY);
> > >=20
> > > @@ -2005,7 +2005,7 @@ static void rockchip_irq_demux(struct irq_desc
> > > *desc)
> > >=20
> > >  				writel(polarity,
> > >  			=09
> > >  				       bank->reg_base + GPIO_INT_POLARITY);
> > >=20
> > > -				spin_unlock_irqrestore(&bank->slock, flags);
> > > +				raw_spin_unlock_irqrestore(&bank->slock, flags);
> > >=20
> > >  				data_old =3D data;
> > >  				data =3D readl_relaxed(bank->reg_base +
> > >=20
> > > @@ -2036,20 +2036,20 @@ static int rockchip_irq_set_type(struct irq_d=
ata
> > > *d, unsigned int type) return ret;
> > >=20
> > >  	clk_enable(bank->clk);
> > >=20
> > > -	spin_lock_irqsave(&bank->slock, flags);
> > > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > >=20
> > >  	data =3D readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
> > >  	data &=3D ~mask;
> > >  	writel_relaxed(data, bank->reg_base + GPIO_SWPORT_DDR);
> > >=20
> > > -	spin_unlock_irqrestore(&bank->slock, flags);
> > > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > >=20
> > >  	if (type & IRQ_TYPE_EDGE_BOTH)
> > >  =09
> > >  		irq_set_handler_locked(d, handle_edge_irq);
> > >  =09
> > >  	else
> > >  =09
> > >  		irq_set_handler_locked(d, handle_level_irq);
> > >=20
> > > -	spin_lock_irqsave(&bank->slock, flags);
> > > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > >=20
> > >  	irq_gc_lock(gc);
> > >  =09
> > >  	level =3D readl_relaxed(gc->reg_base + GPIO_INTTYPE_LEVEL);
> > >=20
> > > @@ -2092,7 +2092,7 @@ static int rockchip_irq_set_type(struct irq_dat=
a *d,
> > > unsigned int type) break;
> > >=20
> > >  	default:
> > >  		irq_gc_unlock(gc);
> > >=20
> > > -		spin_unlock_irqrestore(&bank->slock, flags);
> > > +		raw_spin_unlock_irqrestore(&bank->slock, flags);
> > >=20
> > >  		clk_disable(bank->clk);
> > >  		return -EINVAL;
> > >  =09
> > >  	}
> > >=20
> > > @@ -2101,7 +2101,7 @@ static int rockchip_irq_set_type(struct irq_dat=
a *d,
> > > unsigned int type) writel_relaxed(polarity, gc->reg_base +
> > > GPIO_INT_POLARITY);
> > >=20
> > >  	irq_gc_unlock(gc);
> > >=20
> > > -	spin_unlock_irqrestore(&bank->slock, flags);
> > > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > >=20
> > >  	clk_disable(bank->clk);
> > >  =09
> > >  	return 0;
> > >=20
> > > @@ -2383,7 +2383,7 @@ static struct rockchip_pin_ctrl
> > > *rockchip_pinctrl_get_soc_data( for (i =3D 0; i < ctrl->nr_banks; ++i,
> > > ++bank) {
> > >=20
> > >  		int bank_pins =3D 0;
> > >=20
> > > -		spin_lock_init(&bank->slock);
> > > +		raw_spin_lock_init(&bank->slock);
> > >=20
> > >  		bank->drvdata =3D d;
> > >  		bank->pin_base =3D ctrl->nr_pins;
> > >  		ctrl->nr_pins +=3D bank->nr_pins; =20
