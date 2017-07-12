From: "A.s. Dong" <aisheng.dong@nxp.com>
Subject: RE: [PATCH 2/2] gpio: gpio-vf610: add imx7ulp support
Date: Wed, 12 Jul 2017 14:12:20 +0000
Message-ID: <AM3PR04MB3066E8D18C14661F2107CBE80AF0@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1494829706-5661-1-git-send-email-aisheng.dong@nxp.com>
 <1494829706-5661-3-git-send-email-aisheng.dong@nxp.com>
 <690d43f0314da9d340065b551700d6b7@agner.ch>
 <AM3PR04MB3067C3AFBD7285A5CC24B6780DA0@AM3PR04MB306.eurprd04.prod.outlook.com>
 <e15b08d4857d5498b70a57f8022b5ba5@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve1eur01on0078.outbound.protection.outlook.com ([104.47.1.78]:44229
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751974AbdGLOMY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 10:12:24 -0400
In-Reply-To: <e15b08d4857d5498b70a57f8022b5ba5@agner.ch>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Andy Duan <fugang.duan@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Alexandre Courbot <gnurou@gmail.com>, Peter Chen <peter.chen@nxp.com>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>

Hi Stefan,

> -----Original Message-----
> From: Stefan Agner [mailto:stefan@agner.ch]
> Sent: Saturday, July 01, 2017 5:54 AM
> To: A.s. Dong
> Cc: linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linus.walleij@linaro.org; shawnguo@kernel.org; Jacky Bai; Andy Duan;
> kernel@pengutronix.de; Alexandre Courbot; Peter Chen; LW@KARO-
> electronics.de
> Subject: Re: [PATCH 2/2] gpio: gpio-vf610: add imx7ulp support
>=20
> On 2017-06-21 06:30, A.s. Dong wrote:
> > Hi Stefan,
> >
> >> -----Original Message-----
> >> From: Stefan Agner [mailto:stefan@agner.ch]
> >> Sent: Tuesday, May 16, 2017 1:59 AM
> >> To: A.S. Dong
> >> Cc: linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> >> linus.walleij@linaro.org; shawnguo@kernel.org; Jacky Bai; Andy Duan;
> >> kernel@pengutronix.de; Alexandre Courbot; Peter Chen
> >> Subject: Re: [PATCH 2/2] gpio: gpio-vf610: add imx7ulp support
> >>
> >> On 2017-05-14 23:28, Dong Aisheng wrote:
> >> > The Rapid General-Purpose Input and Output with 2 Ports (RGPIO2P)
> >> > on MX7ULP is similar to GPIO on Vibrid. But unlike Vibrid, the
> >> > RGPIO2P has an extra Port Data Direction Register (PDDR) used to
> >> > configure the individual port pins for input or output.
> >> >
> >> > We introduce a FSL_GPIO_HAVE_PDDR with fsl_gpio_soc_data data to
> >> > distinguish this differences. And we support getting the output
> >> > status by checking the GPIO direction in PDDR.
> >> >
> >> > Cc: Linus Walleij <linus.walleij@linaro.org>
> >> > Cc: Alexandre Courbot <gnurou@gmail.com>
> >> > Cc: Shawn Guo <shawnguo@kernel.org>
> >> > Cc: Stefan Agner <stefan@agner.ch>
> >> > Cc: Fugang Duan <fugang.duan@nxp.com>
> >> > Cc: Peter Chen <peter.chen@nxp.com>
> >> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> >> > ---
> >> >  drivers/gpio/gpio-vf610.c | 49
> >> > ++++++++++++++++++++++++++++++++++++++++++++---
> >> >  1 file changed, 46 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> >> > index 521fbe3..a439d27 100644
> >> > --- a/drivers/gpio/gpio-vf610.c
> >> > +++ b/drivers/gpio/gpio-vf610.c
> >> > @@ -30,10 +30,15 @@
> >> >
> >> >  #define VF610_GPIO_PER_PORT		32
> >> >
> >> > +struct fsl_gpio_soc_data {
> >> > +	u32 flags;
> >> > +};
> >> > +
> >> >  struct vf610_gpio_port {
> >> >  	struct gpio_chip gc;
> >> >  	void __iomem *base;
> >> >  	void __iomem *gpio_base;
> >> > +	const struct fsl_gpio_soc_data *sdata;
> >> >  	u8 irqc[VF610_GPIO_PER_PORT];
> >> >  	int irq;
> >> >  };
> >> > @@ -43,6 +48,7 @@ struct vf610_gpio_port {
> >> >  #define GPIO_PCOR		0x08
> >> >  #define GPIO_PTOR		0x0c
> >> >  #define GPIO_PDIR		0x10
> >> > +#define GPIO_PDDR		0x14
> >> >
> >> >  #define PORT_PCR(n)		((n) * 0x4)
> >> >  #define PORT_PCR_IRQC_OFFSET	16
> >> > @@ -59,10 +65,18 @@ struct vf610_gpio_port {
> >> >  #define PORT_INT_EITHER_EDGE	0xb
> >> >  #define PORT_INT_LOGIC_ONE	0xc
> >> >
> >> > +/* SoC has a Port Data Direction Register (PDDR) */
> >> > +#define FSL_GPIO_HAVE_PDDR	BIT(0)
> >> > +
> >> >  static struct irq_chip vf610_gpio_irq_chip;
> >> >
> >> > +static const struct fsl_gpio_soc_data imx_data =3D {
> >> > +	.flags =3D FSL_GPIO_HAVE_PDDR,
> >> > +};
> >> > +
> >> >  static const struct of_device_id vf610_gpio_dt_ids[] =3D {
> >> > -	{ .compatible =3D "fsl,vf610-gpio" },
> >> > +	{ .compatible =3D "fsl,vf610-gpio",	.data =3D NULL, },
> >> > +	{ .compatible =3D "fsl,imx7ulp-gpio",	.data =3D &imx_data, },
> >> >  	{ /* sentinel */ }
> >> >  };
> >> >
> >> > @@ -79,8 +93,18 @@ static inline u32 vf610_gpio_readl(void __iomem
> >> > *reg)  static int vf610_gpio_get(struct gpio_chip *gc, unsigned int
> >> > gpio)  {
> >> >  	struct vf610_gpio_port *port =3D gpiochip_get_data(gc);
> >> > -
> >> > -	return !!(vf610_gpio_readl(port->gpio_base + GPIO_PDIR) &
> BIT(gpio));
> >> > +	unsigned long mask =3D BIT(gpio);
> >> > +	void __iomem *addr;
> >> > +
> >> > +	if (port->sdata && port->sdata->flags & FSL_GPIO_HAVE_PDDR) {
> >> > +		mask &=3D vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
> >> > +		addr =3D mask ? port->gpio_base + GPIO_PDOR :
> >> > +			      port->gpio_base + GPIO_PDIR;
> >> > +		return !!(vf610_gpio_readl(addr) & BIT(gpio));
>=20
> I still feel it would be better to read back the actual value on the
> wire...
>=20
> But this would require to enable the input buffer in
> imx7ulp_pmx_gpio_set_direction.
>=20
> Lothar was with me in this discussion:
> https://patchwork.kernel.org/patch/9726163/
>=20
> Or is there really a technical limitation on i.MX7ULP?
>=20

No actually technical limitation, just different from Vybrid,
MX7ULP has a GPIO_PDDR register to distinguish the input and output,
We want to disable the input logic for output case to save power.

> We could also change it later, especially if the pinctrl changes already
> got merged anyway.
>=20
> From a Vybrid perspective:
> Acked-by: Stefan Agner <stefan@agner.ch>
>=20

Thanks.

Regards
Dong Aisheng
