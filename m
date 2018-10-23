From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH V2 4/8] gpio: vf610: add optional clock support
Date: Tue, 23 Oct 2018 14:41:37 +0200
Message-ID: <20181023124137.wivishetiasdytfr@pengutronix.de>
References: <1540295058-26090-1-git-send-email-aisheng.dong@nxp.com>
 <1540295058-26090-5-git-send-email-aisheng.dong@nxp.com>
 <20181023120401.GO30658@n2100.armlinux.org.uk>
 <AM0PR04MB42119A454DD2F53590BCE7FF80F50@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42119A454DD2F53590BCE7FF80F50@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: "dongas86@gmail.com" <dongas86@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Stefan Agner <stefan@agner.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 23, 2018 at 12:23:12PM +0000, A.s. Dong wrote:
> Hi Russell,
> =

> > -----Original Message-----
> > From: Russell King - ARM Linux [mailto:linux@armlinux.org.uk]
> > Sent: Tuesday, October 23, 2018 8:04 PM
> [...]
> > On Tue, Oct 23, 2018 at 11:49:17AM +0000, A.s. Dong wrote:
> > > +	clk_gpio =3D devm_clk_get(&pdev->dev, "gpio");
> > > +	clk_port =3D devm_clk_get(&pdev->dev, "port");
> > > +	if ((PTR_ERR(clk_gpio) =3D=3D -EPROBE_DEFER) ||
> > > +	    (PTR_ERR(clk_port) =3D=3D -EPROBE_DEFER)) {
> > =

> > 	if (clk_gpio =3D=3D ERR_PTR(-EPROBE_DEFER) ||
> > 	    clk_port =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> > =

> =

> Thanks for the suggestion. I will update it in next series.
> Before that, let's wait a moment to see if any more review comments.
> =

> BTW, as I see kernel currently is widely using PTR_ERR(ptr) to compare
> -EPROBE_DEFER, I'm not quite get the point why the new approach
> you suggested is better, is it less error-prone? Or something else?
> would you please help clarify a bit more?

See the discussion in https://lore.kernel.org/patchwork/patch/999602/.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
