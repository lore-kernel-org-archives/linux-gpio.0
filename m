From: "A.S. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH 2/5] pinctrl: imx: add soc specific mux_mode mask and
 shift property
Date: Mon, 15 May 2017 09:00:32 +0000
Message-ID: <AM3PR04MB306F70328E49CB7EE68E2C380E10@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-3-git-send-email-aisheng.dong@nxp.com>
 <20170515085236.GM8471@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr10071.outbound.protection.outlook.com ([40.107.1.71]:56672
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933560AbdEOJAl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 05:00:41 -0400
In-Reply-To: <20170515085236.GM8471@dragon>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Duan <fugang.duan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Monday, May 15, 2017 4:53 PM
> To: A.S. Dong
> Cc: linux-gpio@vger.kernel.org; Andy Duan; Jacky Bai;
> linus.walleij@linaro.org; stefan@agner.ch; kernel@pengutronix.de; linux-
> arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 2/5] pinctrl: imx: add soc specific mux_mode mask and
> shift property
>=20
> On Fri, May 12, 2017 at 08:38:02PM +0800, Dong Aisheng wrote:
> > MX7ULP MUX mode mask and shift bit is different from VF610.
> > Let's make it a platform specific property for the later easy of
> > adding MX7ULP support.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Bai Ping <ping.bai@nxp.com>
> > Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  drivers/pinctrl/freescale/pinctrl-imx.c   | 10 +++++-----
> >  drivers/pinctrl/freescale/pinctrl-imx.h   |  4 ++++
> >  drivers/pinctrl/freescale/pinctrl-vf610.c |  2 ++
> >  3 files changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> > b/drivers/pinctrl/freescale/pinctrl-imx.c
> > index db76e9d..8347197 100644
> > --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> > +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> > @@ -197,8 +197,8 @@ static int imx_pmx_set(struct pinctrl_dev *pctldev,
> unsigned selector,
> >  		if (info->flags & SHARE_MUX_CONF_REG) {
> >  			u32 reg;
> >  			reg =3D readl(ipctl->base + pin_reg->mux_reg);
> > -			reg &=3D ~(0x7 << 20);
> > -			reg |=3D (pin->mux_mode << 20);
> > +			reg &=3D ~info->mux_mask;
> > +			reg |=3D (pin->mux_mode << info->mux_shift);
> >  			writel(reg, ipctl->base + pin_reg->mux_reg);
> >  		} else {
> >  			writel(pin->mux_mode, ipctl->base + pin_reg->mux_reg);
> @@ -288,7
> > +288,7 @@ static int imx_pmx_gpio_request_enable(struct pinctrl_dev
> > *pctldev,
> >
> >  mux_pin:
> >  	reg =3D readl(ipctl->base + pin_reg->mux_reg);
> > -	reg &=3D ~(0x7 << 20);
> > +	reg &=3D ~info->mux_mask;
> >  	reg |=3D imx_pin->config;
> >  	writel(reg, ipctl->base + pin_reg->mux_reg);
> >
> > @@ -432,7 +432,7 @@ static int imx_pinconf_get(struct pinctrl_dev
> *pctldev,
> >  	*config =3D readl(ipctl->base + pin_reg->conf_reg);
> >
> >  	if (info->flags & SHARE_MUX_CONF_REG)
> > -		*config &=3D 0xffff;
> > +		*config &=3D ~info->mux_mask;
>=20
> It changes the way how code works.  We need a note in the commit log
> explaining why it's safe.
>=20

Well, that's Vybrid tricks that BIT[15-0] are all configs part.
So it hardcoded 0xffff there.

But it's not true in ULP, so use mux_mask instead to address
the difference.

Regards
Dong Aisheng

> Shawn
>=20
> >
> >  	return 0;
> >  }
> > @@ -459,7 +459,7 @@ static int imx_pinconf_set(struct pinctrl_dev
> *pctldev,
> >  		if (info->flags & SHARE_MUX_CONF_REG) {
> >  			u32 reg;
> >  			reg =3D readl(ipctl->base + pin_reg->conf_reg);
> > -			reg &=3D ~0xffff;
> > +			reg &=3D info->mux_mask;
> >  			reg |=3D configs[i];
> >  			writel(reg, ipctl->base + pin_reg->conf_reg);
> >  		} else {
> > diff --git a/drivers/pinctrl/freescale/pinctrl-imx.h
> > b/drivers/pinctrl/freescale/pinctrl-imx.h
> > index b5c8fe1..eb0ce95 100644
> > --- a/drivers/pinctrl/freescale/pinctrl-imx.h
> > +++ b/drivers/pinctrl/freescale/pinctrl-imx.h
> > @@ -64,6 +64,10 @@ struct imx_pinctrl_soc_info {
> >  	const char *gpr_compatible;
> >  	struct mutex mutex;
> >
> > +	/* MUX_MODE shift and mask in case SHARE_MUX_CONF_REG */
> > +	unsigned int mux_mask;
> > +	u8 mux_shift;
> > +
> >  	/* generic pinconf */
> >  	bool generic_pinconf;
> >  	const struct pinconf_generic_params *custom_params; diff --git
> > a/drivers/pinctrl/freescale/pinctrl-vf610.c
> > b/drivers/pinctrl/freescale/pinctrl-vf610.c
> > index 2b1e198..3bd8556 100644
> > --- a/drivers/pinctrl/freescale/pinctrl-vf610.c
> > +++ b/drivers/pinctrl/freescale/pinctrl-vf610.c
> > @@ -299,6 +299,8 @@ static struct imx_pinctrl_soc_info
> vf610_pinctrl_info =3D {
> >  	.pins =3D vf610_pinctrl_pads,
> >  	.npins =3D ARRAY_SIZE(vf610_pinctrl_pads),
> >  	.flags =3D SHARE_MUX_CONF_REG | ZERO_OFFSET_VALID,
> > +	.mux_mask =3D 0x700000,
> > +	.mux_shift =3D 20,
> >  };
> >
> >  static const struct of_device_id vf610_pinctrl_of_match[] =3D {
> > --
> > 2.7.4
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
