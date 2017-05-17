From: "A.S. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH 2/2] pinctrl: pinctrl-imx: do not assume mux 0 is gpio
Date: Wed, 17 May 2017 07:18:11 +0000
Message-ID: <AM3PR04MB3061FB0760F94F2F816055A80E70@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1494830906-6442-1-git-send-email-aisheng.dong@nxp.com>
 <1494830906-6442-3-git-send-email-aisheng.dong@nxp.com>
 <6d47abc0527ae6f2214a9b37dfbeb154@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-eopbgr30071.outbound.protection.outlook.com ([40.107.3.71]:63776
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753243AbdEQHSO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 May 2017 03:18:14 -0400
In-Reply-To: <6d47abc0527ae6f2214a9b37dfbeb154@agner.ch>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>

> -----Original Message-----
> From: Stefan Agner [mailto:stefan@agner.ch]
> Sent: Tuesday, May 16, 2017 1:27 AM
> To: A.S. Dong
> Cc: linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linus.walleij@linaro.org; shawnguo@kernel.org; Jacky Bai; Andy Duan;
> kernel@pengutronix.de; Alexandre Courbot
> Subject: Re: [PATCH 2/2] pinctrl: pinctrl-imx: do not assume mux 0 is gpi=
o
>=20
> On 2017-05-14 23:48, Dong Aisheng wrote:
> > Do not assume MUX 0 is GPIO function in core driver as a different SoC
> > may have different value. e.g. MX7ULP Mux 1 is GPIO.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Alexandre Courbot <gnurou@gmail.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Fugang Duan <fugang.duan@nxp.com>
> > Cc: Bai Ping <ping.bai@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  drivers/pinctrl/freescale/pinctrl-imx.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c
> > b/drivers/pinctrl/freescale/pinctrl-imx.c
> > index 0d6aaca..ed8ea32 100644
> > --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> > +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
> > @@ -281,7 +281,7 @@ static int imx_pmx_gpio_request_enable(struct
> > pinctrl_dev *pctldev,
> >  			continue;
> >  		for (pin =3D 0; pin < grp->num_pins; pin++) {
> >  			imx_pin =3D &((struct imx_pin *)(grp->data))[pin];
> > -			if (imx_pin->pin =3D=3D offset && !imx_pin->mux_mode)
> > +			if (imx_pin->pin =3D=3D offset)
> >  				goto mux_pin;
>=20
> The reason I added that check was to make sure we pick a mux option which
> is GPIO... With this change, any pinmux might be picked...
>=20

First of all, this seems to be wrong to me that GPIO mux mode is SoC
Dependant and should not be put in pinctrl-imx core driver.

Secondly, I think we may be over worried and it's not quite necessary
As we did not do the sanity check for both raw config and mux data read
>From Device tree, why only do it for GPIO?

We may trust the data in device tree.

> >  		}
> >  	}
> > @@ -292,6 +292,7 @@ static int imx_pmx_gpio_request_enable(struct
> > pinctrl_dev *pctldev,
> >  	reg =3D readl(ipctl->base + pin_reg->mux_reg);
> >  	reg &=3D ~info->mux_mask;
> >  	reg |=3D imx_pin->config;
> > +	reg |=3D imx_pin->mux_mode << info->mux_shift;
>=20
> ... and muxed...
>=20
> Not sure if we want that.
>=20
> I had to control GPIO output/input through pinctrl since Vybrid does not
> allow to control that from the GPIO block.
>=20
> However, according to your GPIO patchset, the i.MX 7ULP has a new registe=
r
> GPIO_PDDR to control output from the GPIO block. Is controlling the outpu=
t
> driver from IOMUXC still required?=20

Yes, it's still required.

> If not, I really would just not use all
> that "find pinctrl config" hackery... e.g. add a new flag,
> USE_IOMUXC_FOR_GPIO_OUTPUT, and set that only for Vybrid.
>=20
> This would also align much better with the other i.MX devices, where
> pinmuxing and GPIO is completely orthogonal.
>=20

Actually this patch came only because to make the exist code
not break MX7ULP.

Actually I'm wondering why we need implement=20
imx_pmx_gpio_request_enable function?

Per my understanding, IMX binding already set GPIO mux by
Parsing MUX mode from device tree, so why need gpio_request_enable
which looks like is duplicated.

Can you help explain it?

Regards
Dong Aisheng

> --
> Stefan
>=20
> >  	writel(reg, ipctl->base + pin_reg->mux_reg);
> >
> >  	return 0;
