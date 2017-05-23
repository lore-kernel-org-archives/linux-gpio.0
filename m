From: "A.S. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH 1/2] pinctrl: pinctrl-imx: add IBE and OBE SoC property
Date: Tue, 23 May 2017 12:06:14 +0000
Message-ID: <DBXPR04MB3205CEE820B4E130ACCE79280F90@DBXPR04MB320.eurprd04.prod.outlook.com>
References: <1494830906-6442-1-git-send-email-aisheng.dong@nxp.com>
 <1494830906-6442-2-git-send-email-aisheng.dong@nxp.com>
 <6560bc05ac21060efb5d39d81a662a7a@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-db5eur01on0050.outbound.protection.outlook.com ([104.47.2.50]:10816
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1763824AbdEWMGS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 May 2017 08:06:18 -0400
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "A.S. Dong" <aisheng.dong@nxp.com>, Stefan Agner <stefan@agner.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>

Hi Stefan,

> -----Original Message-----
> From: A.S. Dong
> Sent: Wednesday, May 17, 2017 2:14 PM
> To: 'Stefan Agner'
> Cc: linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linus.walleij@linaro.org; shawnguo@kernel.org; Jacky Bai; Andy Duan;
> kernel@pengutronix.de; Alexandre Courbot
> Subject: RE: [PATCH 1/2] pinctrl: pinctrl-imx: add IBE and OBE SoC
> property
>=20
> > -----Original Message-----
> > From: Stefan Agner [mailto:stefan@agner.ch]
> > Sent: Tuesday, May 16, 2017 1:11 AM
> > To: A.S. Dong
> > Cc: linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linus.walleij@linaro.org; shawnguo@kernel.org; Jacky Bai; Andy Duan;
> > kernel@pengutronix.de; Alexandre Courbot
> > Subject: Re: [PATCH 1/2] pinctrl: pinctrl-imx: add IBE and OBE SoC
> > property
> >
> > On 2017-05-14 23:48, Dong Aisheng wrote:
> > > iMX ULP has different IOB/OBE shift from Vibrid, so let's make
> >
> > s/Vibrid/Vybrid
> >
> > > it a SoC property.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Alexandre Courbot <gnurou@gmail.com>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Stefan Agner <stefan@agner.ch>
> > > Cc: Fugang Duan <fugang.duan@nxp.com>
> > > Cc: Bai Ping <ping.bai@nxp.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > ---
> > >  drivers/pinctrl/freescale/pinctrl-imx.c     | 8 ++++----
> > >  drivers/pinctrl/freescale/pinctrl-imx.h     | 2 ++
> > >  drivers/pinctrl/freescale/pinctrl-imx7ulp.c | 2 ++
> > >  drivers/pinctrl/freescale/pinctrl-vf610.c   | 2 ++
> > >  4 files changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> > > b/drivers/pinctrl/freescale/pinctrl-imx.c
> > > index 57e1f7a..0d6aaca 100644
> > > --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> > > +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> > > @@ -331,8 +331,8 @@ static int imx_pmx_gpio_set_direction(struct
> > > pinctrl_dev *pctldev,
> > >  	u32 reg;
> > >
> > >  	/*
> > > -	 * Only Vybrid has the input/output buffer enable flags (IBE/OBE)
> > > -	 * They are part of the shared mux/conf register.
> > > +	 * Only Vybrid and iMX ULP has the input/output buffer enable flags
> > > +	 * (IBE/OBE) They are part of the shared mux/conf register.
> > >  	 */
> > >  	if (!(info->flags & SHARE_MUX_CONF_REG))
> > >  		return 0;
> > > @@ -344,9 +344,9 @@ static int imx_pmx_gpio_set_direction(struct
> > > pinctrl_dev *pctldev,
> > >  	/* IBE always enabled allows us to read the value "on the wire" */
> > >  	reg =3D readl(ipctl->base + pin_reg->mux_reg);
> > >  	if (input)
> > > -		reg &=3D ~0x2;
> > > +		reg =3D (reg & ~info->obe_bit) | info->ibe_bit;
> > >  	else
> > > -		reg |=3D 0x2;
> > > +		reg =3D (reg & ~info->ibe_bit) | info->obe_bit;
> >
> > Why disabling IBE bit now? As the comment above states, it is really
> > handy to leave the input buffer enabled so we can read back the true
> > value on the wire...
> >
>=20
> Does Vybrid reply on this bit to read the status of output from Port Data
> Input Register (GPIOx_PDIR)?
>=20
> Then, it is a bit strange that read status from input register when the
> GPIO is Actually configured as output.
>=20
> Probably it works on Vybrid, but I don't know if it's valid for MX7ULP.
>=20
> For MX7ULP, we will read input or output register accordingly by checking
> GPIO direction register (PDDR) and we will not enable Input buffer if the
> GPIO is configured as output, this also save a bit power.
>=20
> I know Vybrid has no PDDR, probably that's why you enable IBE by default
> always.
>=20

We need make a decision on how to address the difference between Vybrid
And IMX7ULP.

If Vybrid wants to keep input buffer enabled, we probably could invent
A IMX_PINCONF_HAVE_PDDR just like GPIO driver and only disable IBE for IMX?

Do you think it's ok?


Regards
Dong Aisheng


> Regards
> Dong Aisheng
>=20
> > --
> > Stefan
> >
> > >  	writel(reg, ipctl->base + pin_reg->mux_reg);
> > >
> > >  	return 0;
> > > diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h
> > > b/drivers/pinctrl/freescale/pinctrl-imx.h
> > > index eb0ce95..9ded65d 100644
> > > --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> > > +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> > > @@ -67,6 +67,8 @@ struct imx_pinctrl_soc_info {
> > >  	/* MUX_MODE shift and mask in case SHARE_MUX_CONF_REG */
> > >  	unsigned int mux_mask;
> > >  	u8 mux_shift;
> > > +	u32 ibe_bit;
> > > +	u32 obe_bit;
> > >
> > >  	/* generic pinconf */
> > >  	bool generic_pinconf;
> > > diff --git a/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
> > > b/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
> > > index dead416..f724a01 100644
> > > --- a/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
> > > +++ b/drivers/pinctrl/freescale/pinctrl-imx7ulp.c
> > > @@ -324,6 +324,8 @@ static struct imx_pinctrl_soc_info
> > imx7ulp_pinctrl_info =3D {
> > >  	.flags =3D ZERO_OFFSET_VALID | SHARE_MUX_CONF_REG,
> > >  	.mux_mask =3D 0xf00,
> > >  	.mux_shift =3D 8,
> > > +	.ibe_bit =3D BIT(16),
> > > +	.obe_bit =3D BIT(17),
> > >  	.generic_pinconf =3D true,
> > >  	.custom_params =3D imx7ulp_cfg_params,
> > >  	.num_custom_params =3D ARRAY_SIZE(imx7ulp_cfg_params), diff --git
> > > a/drivers/pinctrl/freescale/pinctrl-vf610.c
> > > b/drivers/pinctrl/freescale/pinctrl-vf610.c
> > > index 3bd8556..c0823f9 100644
> > > --- a/drivers/pinctrl/freescale/pinctrl-vf610.c
> > > +++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
> > > @@ -301,6 +301,8 @@ static struct imx_pinctrl_soc_info
> > vf610_pinctrl_info =3D {
> > >  	.flags =3D SHARE_MUX_CONF_REG | ZERO_OFFSET_VALID,
> > >  	.mux_mask =3D 0x700000,
> > >  	.mux_shift =3D 20,
> > > +	.ibe_bit =3D BIT(0),
> > > +	.obe_bit =3D BIT(1),
> > >  };
> > >
> > >  static const struct of_device_id vf610_pinctrl_of_match[] =3D {
