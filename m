From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH V2 4/8] gpio: vf610: add optional clock support
Date: Tue, 23 Oct 2018 13:39:54 +0000
Message-ID: <AM0PR04MB4211BBD3A3D883320F8D06EB80F50@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
 <1540295058-26090-5-git-send-email-aisheng.dong@nxp.com>
 <20181023120401.GO30658@n2100.armlinux.org.uk>
 <AM0PR04MB42119A454DD2F53590BCE7FF80F50@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <20181023124137.wivishetiasdytfr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181023124137.wivishetiasdytfr@pengutronix.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "dongas86@gmail.com" <dongas86@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

> -----Original Message-----
> From: Uwe Kleine-K=F6nig [mailto:u.kleine-koenig@pengutronix.de]
> Sent: Tuesday, October 23, 2018 8:42 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: Russell King - ARM Linux <linux@armlinux.org.uk>; dongas86@gmail.com;
> Linus Walleij <linus.walleij@linaro.org>; Stefan Agner <stefan@agner.ch>;
> linux-gpio@vger.kernel.org; robh+dt@kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; shawnguo@kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH V2 4/8] gpio: vf610: add optional clock support
> =

> On Tue, Oct 23, 2018 at 12:23:12PM +0000, A.s. Dong wrote:
> > Hi Russell,
> >
> > > -----Original Message-----
> > > From: Russell King - ARM Linux [mailto:linux@armlinux.org.uk]
> > > Sent: Tuesday, October 23, 2018 8:04 PM
> > [...]
> > > On Tue, Oct 23, 2018 at 11:49:17AM +0000, A.s. Dong wrote:
> > > > +	clk_gpio =3D devm_clk_get(&pdev->dev, "gpio");
> > > > +	clk_port =3D devm_clk_get(&pdev->dev, "port");
> > > > +	if ((PTR_ERR(clk_gpio) =3D=3D -EPROBE_DEFER) ||
> > > > +	    (PTR_ERR(clk_port) =3D=3D -EPROBE_DEFER)) {
> > >
> > > 	if (clk_gpio =3D=3D ERR_PTR(-EPROBE_DEFER) ||
> > > 	    clk_port =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> > >
> >
> > Thanks for the suggestion. I will update it in next series.
> > Before that, let's wait a moment to see if any more review comments.
> >
> > BTW, as I see kernel currently is widely using PTR_ERR(ptr) to compare
> > -EPROBE_DEFER, I'm not quite get the point why the new approach you
> > suggested is better, is it less error-prone? Or something else?
> > would you please help clarify a bit more?
> =

> See the discussion in
> https://lore.kernel.org/patchwork/patch/999602/ =

>

Thanks for sharing the info.
It does help.

Regards
Dong Aisheng
 =

> Best regards
> Uwe
> =

> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig
> |
> Industrial Linux Solutions                 |
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.
> pengutronix.de%2F&amp;data=3D02%7C01%7Caisheng.dong%40nxp.com%7C06
> 5f26466899474bf61a08d638e4e308%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C636758953039817883&amp;sdata=3DhSgiadfyiFoK4AVTF2BR
> guOU5H8C77%2BY2bdjViC4Sfw%3D&amp;reserved=3D0  |
