From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [PATCH v9 1/2] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Thu, 12 May 2016 14:07:24 +0200
Message-ID: <4114007.EkZL1biBx8@debian64>
References: <cover.1462911225.git.chunkeey@googlemail.com> <2c0675cd6f67bd487105c46c38c72d49d84d4df8.1462911225.git.chunkeey@googlemail.com> <0a1ab2b6-b4c5-44d7-abb4-ce1e9da7e477@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36768 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806AbcELMHa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 12 May 2016 08:07:30 -0400
In-Reply-To: <0a1ab2b6-b4c5-44d7-abb4-ce1e9da7e477@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>

On Thursday, May 12, 2016 07:26:32 PM Alexandre Courbot wrote:
> On Wednesday, May 11, 2016 6:34:34 PM JST, Christian Lamparter wrote:
> > From: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> >
> > This patch adds support for defining memory-mapped GPIOs which
> > are compatible with the existing gpio-mmio interface. The generic
> > library provides support for many memory-mapped GPIO controllers
> > that are found in various on-board FPGA and ASIC solutions that
> > are used to control board's switches, LEDs, chip-selects,
> > Ethernet/USB PHY power, etc.
> >
> > For setting GPIO's there are three configurations:
>=20
> s/GPIO's/GPIOs
OK

> > 	1. single input/output register resource (named "dat"),
> > 	2. set/clear pair (named "set" and "clr"),
> > 	3. single output register resource and single input resource
> > 	   ("set" and dat").
> >
> > The configuration is detected by which resources are present.
> > For the single output register, this drives a 1 by setting a bit
> > and a zero by clearing a bit.  For the set clr pair, this drives
> > a 1 by setting a bit in the set register and clears it by setting
> > a bit in the clear register. The configuration is detected by
> > which resources are present.
>=20
> The last sentence of this paragraph repeats for first one.
Ok

> >
> > For setting the GPIO direction, there are three configurations:
> > 	a. simple bidirectional GPIOs that requires no configuration.
> > 	b. an output direction register (named "dirout")
> > 	   where a 1 bit indicates the GPIO is an output.
> > 	c. an input direction register (named "dirin")
> > 	   where a 1 bit indicates the GPIO is an input.
> >
> > The first user for this binding is "wd,mbl-gpio".
> >
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> > ---
> >  static void bgpio_write8(void __iomem *reg, unsigned long data)
> >  {
> > @@ -569,6 +571,58 @@ static void __iomem *bgpio_map(struct=20
> > platform_device *pdev,
> >  	return devm_ioremap_resource(&pdev->dev, r);
> >  }
> > =20
> > +#ifdef CONFIG_OF
> > +static int bgpio_basic_mmio_parse_dt(struct platform_device *pdev,
> > +				     struct bgpio_pdata *pdata,
> > +				     unsigned long *flags)
> > +{
> > +	struct device *dev =3D &pdev->dev;
> > +
> > +	pdata->base =3D -1;
> > +
> > +	if (of_property_read_bool(dev->of_node, "no-output"))
> > +		*flags |=3D BGPIOF_NO_OUTPUT;
>=20
> I don't think it is a good idea to add "generic" properties. Whether =
a=20
> controller is capable of output or not should be determined by its=20
> compatible string only, and not a vague property.

Well, meet the gpios on the MBL. If you want to figure out how WD wired
up these two GPIOs (one is input, the other output), I can sent you a
built-yourself MBL kit. It just needs a 3,5" drive and a 12V 2A power
plug with a standard 5.5mm plug.

> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id bgpio_of_match[] =3D {
> > +	{ .compatible =3D "wd,mbl-gpio", .data =3D bgpio_basic_mmio_parse=
_dt },
>=20
> Mmm cannot you determine whether your controller is capable of output=
 or=20
> not just from the compatible property here? If so, the=20
> bgpio_basic_mmio_parse_dt seems to be unneeded. If not, then this is=20
> dependent on the wd,mbl-gpio binding and should be renamed accordingl=
y.
Sadly I don't know of any method. The device has two GPIOs one at 0x4e0=
000000.
The other one is at 0x4e0100000. The address tells me that there are tw=
o=20
external chips connected to the EBC (memory bank - RAM, ROM and DMA chi=
ps
go here according to IBM's documentations). Which is not the place you
would expect peripherals.=20

> > @@ -646,6 +709,7 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
> >  static struct platform_driver bgpio_driver =3D {
> >  	.driver =3D {
> >  		.name =3D "basic-mmio-gpio",
> > +		.of_match_table =3D of_match_ptr(bgpio_of_match),
> >  	},
> >  	.id_table =3D bgpio_id_table,
> >  	.probe =3D bgpio_pdev_probe,
>=20
> It seems to me that this patch does two things:
>=20
> 1) Add code to support device tree lookup
> 2) Add support for "wd,mbl-gpio".
>=20
> If true, these two things should be in their own patches. You should =
also=20
> have another patch that adds the DT bindings for "wd,mbl-gpio", so I =
would=20
> do things in that order:

The DT bindings have been merged. That's why I dropped it from the reba=
se.

> 1/3: DT support for basic-mmio-gpio
Sadly, adding the "basic-mmio-gpio" binding is not possible without a A=
CK from
the device tree maintainers. They have voiced their concerns. I think t=
his was
your post of the discussion on it:
<http://www.spinics.net/lists/devicetree/msg124613.html>

That's why the series was updated around v5 and v6 to use the "wd,mbl-g=
pio"
binding.

So yes, I wanted to go this route in the beginning as well. But no go.
If we find more devices we could have a "basic-mmio-gpio" class. But
for now, we have to start somewhere.

> 2/3: DT bindings for "wd,mbl-gpio" (and have them validated by the DT=
=20
> people - e.g. do you really need a "reg" property or is it here just =
to fit=20
> with what bgpio_pdev_probe expects? More about this on 2/2)
> 3/3: Support for "wd,mbl-gpio" in basic-mmio-gpio
Yes, that would have been nice. And I agree it was the way to do it. Bu=
t
without the wd,mbl-gpio mapping I would add the bgpio_parse_dt function
without any caller. (As I can't add the compatible =3D "basic-mmio-gpio=
", ...)

Regards,
Christian
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
