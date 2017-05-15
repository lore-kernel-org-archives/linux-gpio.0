From: "A.S. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH 1/5] pinctrl: imx: add generic pin config core support
Date: Mon, 15 May 2017 12:07:45 +0000
Message-ID: <AM3PR04MB3066F7B15D7E2A3DAD5395480E10@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1494592686-30967-1-git-send-email-aisheng.dong@nxp.com>
 <1494592686-30967-2-git-send-email-aisheng.dong@nxp.com>
 <20170515083500.GL8471@dragon>
 <AM3PR04MB3067B92ED9E3D62153536F880E10@AM3PR04MB306.eurprd04.prod.outlook.com>
 <20170515105615.GN8471@dragon>
 <AM3PR04MB3069DA0AEF0F56AB2F7808080E10@AM3PR04MB306.eurprd04.prod.outlook.com>
 <20170515115643.GQ8471@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve1eur01on0062.outbound.protection.outlook.com ([104.47.1.62]:5600
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751365AbdEOMHs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 May 2017 08:07:48 -0400
In-Reply-To: <20170515115643.GQ8471@dragon>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andy Duan <fugang.duan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "stefan@agner.ch" <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Monday, May 15, 2017 7:57 PM
> To: A.S. Dong
> Cc: Andy Duan; Jacky Bai; linus.walleij@linaro.org; stefan@agner.ch;
> linux-gpio@vger.kernel.org; kernel@pengutronix.de; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH 1/5] pinctrl: imx: add generic pin config core suppor=
t
>=20
> On Mon, May 15, 2017 at 11:16:57AM +0000, A.S. Dong wrote:
> > > -----Original Message-----
> > > From: Shawn Guo [mailto:shawnguo@kernel.org]
> > > Sent: Monday, May 15, 2017 6:56 PM
> > > To: A.S. Dong
> > > Cc: Andy Duan; Jacky Bai; linus.walleij@linaro.org; stefan@agner.ch;
> > > linux-gpio@vger.kernel.org; kernel@pengutronix.de; linux-arm-
> > > kernel@lists.infradead.org
> > > Subject: Re: [PATCH 1/5] pinctrl: imx: add generic pin config core
> > > support
> > >
> > > On Mon, May 15, 2017 at 08:56:18AM +0000, A.S. Dong wrote:
> > > > > > @@ -489,17 +547,29 @@ static int
> > > > > > imx_pinctrl_parse_groups(struct
> > > > > device_node *np,
> > > > > >  		pin_size =3D SHARE_FSL_PIN_SIZE;
> > > > > >  	else
> > > > > >  		pin_size =3D FSL_PIN_SIZE;
> > > > > > +
> > > > > > +	if (info->generic_pinconf)
> > > > > > +		pin_size -=3D 4;
> > > > > > +
> > > > > >  	/* Initialise group */
> > > > > >  	grp->name =3D np->name;
> > > > > >
> > > > > >  	/*
> > > > > > -	 * the binding format is fsl,pins =3D <PIN_FUNC_ID CONFIG ...=
>,
> > > > > > +	 * the binding format is pins =3D <PIN_FUNC_ID CONFIG ...>,
> > > > >
> > > > > This is not correct for generic pinconf bindings.  CONIFIG
> > > > > shouldn't be there.
> > > > >
> > > >
> > > > Yes, that's for legacy stuff.
> > >
> > > If that's for legacy bindings, you shouldn't change 'fsl,pins' to
> > > 'pins', right?
> > >
> >
> > I mean the binding format.
> > For the legacy format, either the name of 'fsl,pins' or 'pins' is ok.
> >
> > But in order to increase the standard 'pins' priority, I change
> > 'fsl,pins' to 'pins' to make it more explicitly.
> >
> > I do can leave "fsl,pins' not changed, but I think the new one may be
> > better, right?
>=20
> Please leave "fsl,pins' unchanged, and let's use 'fsl,pins' for legacy
> bindings and 'pins' for new one.
>=20

Okay, make sense, got it.

Regards
Dong Aisheng

> Shawn
