From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH] gpio: dwapb: Rework support for 1 interrupt per port A
 GPIO
Date: Wed, 23 May 2018 09:18:11 +0000
Message-ID: <TY1PR01MB17699E71F8E1460867F1A6FAF56B0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1527065564-9127-1-git-send-email-phil.edworthy@renesas.com>
 <20180523091220.jfguqui75rup5qpl@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180523091220.jfguqui75rup5qpl@verge.net.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Michel Pollet <michel.pollet@bp.renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Simon,

On 23 May 2018 10:12 Simon Horman wrote:
> On Wed, May 23, 2018 at 09:52:44AM +0100, Phil Edworthy wrote:
> > Treat DT and ACPI the same as much as possible. Note that we can't use
> > platform_get_irq() to get the DT interrupts as they are in the port
> > sub-node and hence do not have an associated platform device.
> >
> > This also fixes a problem introduced with error checking when calling
> > platform_get_irq().
>=20
> What is the problem? In general I think fixes should be in separate patch=
es.
The ACPI code would ignore errors returned by platform_get_irq(), instead
treating the error as an interrupt number.

Andy Shevchenko provided some late feedback to the v5 patch, but v5 was=20
already applied by Linus W. This patch just has the incremental changes tha=
t
were made in v6 of the patch.

BR
Phil

> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > ---
> >  drivers/gpio/gpio-dwapb.c | 53
> > ++++++++++++++++++++---------------------------
> >  1 file changed, 22 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> > index 7dcd06b..15b4154 100644
> > --- a/drivers/gpio/gpio-dwapb.c
> > +++ b/drivers/gpio/gpio-dwapb.c
> > @@ -444,7 +444,7 @@ static void dwapb_configure_irqs(struct
> dwapb_gpio *gpio,
> >  		int i;
> >
> >  		for (i =3D 0; i < pp->ngpio; i++) {
> > -			if (pp->irq[i])
> > +			if (pp->irq[i] >=3D 0)
> >  				irq_set_chained_handler_and_data(pp-
> >irq[i],
> >  						dwapb_irq_handler, gpio);
> >  		}
> > @@ -562,7 +562,7 @@ dwapb_gpio_get_pdata(struct device *dev)
> >  	struct dwapb_platform_data *pdata;
> >  	struct dwapb_port_property *pp;
> >  	int nports;
> > -	int i;
> > +	int i, j;
> >
> >  	nports =3D device_get_child_node_count(dev);
> >  	if (nports =3D=3D 0)
> > @@ -580,6 +580,8 @@ dwapb_gpio_get_pdata(struct device *dev)
> >
> >  	i =3D 0;
> >  	device_for_each_child_node(dev, fwnode)  {
> > +		struct device_node *np =3D NULL;
> > +
> >  		pp =3D &pdata->properties[i++];
> >  		pp->fwnode =3D fwnode;
> >
> > @@ -599,46 +601,35 @@ dwapb_gpio_get_pdata(struct device *dev)
> >  			pp->ngpio =3D 32;
> >  		}
> >
> > +		pp->irq_shared	=3D false;
> > +		pp->gpio_base	=3D -1;
> > +
> >  		/*
> >  		 * Only port A can provide interrupts in all configurations of
> >  		 * the IP.
> >  		 */
> > -		if (dev->of_node && pp->idx =3D=3D 0 &&
> > -			fwnode_property_read_bool(fwnode,
> > -						  "interrupt-controller")) {
> > -			struct device_node *np =3D to_of_node(fwnode);
> > -			unsigned int j;
> > -
> > -			/*
> > -			 * The IP has configuration options to allow a single
> > -			 * combined interrupt or one per gpio. If one per
> gpio,
> > -			 * some might not be used.
> > -			 */
> > -			for (j =3D 0; j < pp->ngpio; j++) {
> > -				int irq =3D of_irq_get(np, j);
> > -				if (irq < 0)
> > -					continue;
> > -
> > -				pp->irq[j] =3D irq;
> > -				pp->has_irq =3D true;
> > -			}
> > +		if (pp->idx !=3D 0)
> > +			continue;
> >
> > -			if (!pp->has_irq)
> > -				dev_warn(dev, "no irq for port%d\n", pp-
> >idx);
> > +		if (dev->of_node && fwnode_property_read_bool(fwnode,
> > +						  "interrupt-controller")) {
> > +			np =3D to_of_node(fwnode);
> >  		}
> >
> > -		if (has_acpi_companion(dev) && pp->idx =3D=3D 0) {
> > -			unsigned int j;
> > +		for (j =3D 0; j < pp->ngpio; j++) {
> > +			pp->irq[j] =3D -ENXIO;
> >
> > -			for (j =3D 0; j < pp->ngpio; j++) {
> > +			if (np)
> > +				pp->irq[j] =3D of_irq_get(np, j);
> > +			else if (has_acpi_companion(dev))
> >  				pp->irq[j] =3D
> platform_get_irq(to_platform_device(dev), j);
> > -				if (pp->irq[j])
> > -					pp->has_irq =3D true;
> > -			}
> > +
> > +			if (pp->irq[j] >=3D 0)
> > +				pp->has_irq =3D true;
> >  		}
> >
> > -		pp->irq_shared	=3D false;
> > -		pp->gpio_base	=3D -1;
> > +		if (!pp->has_irq)
> > +			dev_warn(dev, "no irq for port%d\n", pp->idx);
> >  	}
> >
> >  	return pdata;
> > --
> > 2.7.4
> >
