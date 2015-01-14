From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Subject: Re: basic-mmio-gpio: add DT support
Date: Wed, 14 Jan 2015 12:20:48 +0100
Message-ID: <54B65110.8030509@gmail.com>
References: <5490B528.2020305@gmail.com> <CAAVeFuLoZPptaqnN8s6r_aN_rpBj+MpmT=5Xc2-iO3kGKZfctw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:64485 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788AbbANLU7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 06:20:59 -0500
Received: by mail-wg0-f48.google.com with SMTP id l2so8264679wgh.7
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2015 03:20:58 -0800 (PST)
In-Reply-To: <CAAVeFuLoZPptaqnN8s6r_aN_rpBj+MpmT=5Xc2-iO3kGKZfctw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

El 14/01/2015 a las 6:32, Alexandre Courbot escribi=C3=B3:
> On Wed, Dec 17, 2014 at 7:41 AM, =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>> Add DT support while keeping legacy support.
>>
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic=
=2Ec
>=20
> There is no documentation for these new bindings?

Actually, I was waiting for this patch (by kamlakant.patel@linaro.org) =
to be accepted before: "[PATCH v1 5/5] gpio: document basic mmio gpio l=
ibrary".
Anyway, I will add documentation on the next version of this patch.

>=20
>> index 16f6115..9792783 100644
>> --- a/drivers/gpio/gpio-generic.c
>> +++ b/drivers/gpio/gpio-generic.c
>> @@ -61,6 +61,9 @@ o        `                     ~~~~\___/~~~~    ` =
controller in FPGA is ,.`
>>  #include <linux/platform_device.h>
>>  #include <linux/mod_devicetable.h>
>>  #include <linux/basic_mmio_gpio.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_gpio.h>
>>
>>  static void bgpio_write8(void __iomem *reg, unsigned long data)
>>  {
>> @@ -488,8 +491,58 @@ static void __iomem *bgpio_map(struct platform_=
device *pdev,
>>         return ret;
>>  }
>>
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id bgpio_dt_ids[] =3D {
>> +       { .compatible =3D "basic-mmio-gpio" },
>> +};
>> +MODULE_DEVICE_TABLE(of, bgpio_dt_ids);
>> +
>> +static int bgpio_probe_dt(struct platform_device *pdev)
>> +{
>> +       u32 tmp;
>> +       struct bgpio_pdata *pdata;
>> +       struct device_node *np;
>> +
>> +       np =3D pdev->dev.of_node;
>> +       if (!np)
>> +               return 0;
>> +
>> +       pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNE=
L);
>> +       if (!pdata)
>> +               return -ENOMEM;
>> +
>> +       pdata->label =3D dev_name(&pdev->dev);
>> +       pdata->base =3D -1;
>> +       if (of_find_property(np, "byte-be", NULL)) {
>> +               pdata->flags |=3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
>> +       }
>> +       if (of_find_property(np, "bit-be", NULL)) {
>> +               pdata->flags |=3D BGPIOF_BIG_ENDIAN;
>> +       }
>> +       if (of_find_property(np, "regset-nr", NULL)) {
>> +               pdata->flags |=3D BGPIOF_UNREADABLE_REG_SET;
>> +       }
>> +       if (of_find_property(np, "regdir-nr", NULL)) {
>> +               pdata->flags |=3D BGPIOF_UNREADABLE_REG_DIR;
>> +       }
>> +       if (!of_property_read_u32(np, "num-gpios", &tmp)) {
>> +               pdata->ngpio =3D tmp;
>> +       }
>=20
> I don't think this is acceptable. gpio-generic is designed to be used
> as a framework for other drivers to build upon. These drivers should
> have their own compatible strings, which should be enough to infer al=
l
> the properties you defined here.
>=20

gpio-generic is not only designed as a framework for other drivers, it =
can also be used directly by registering the driver through platform de=
vice (basic-mmio-gpio/basic-mmio-gpio-be).
My intention is to make it DT compatible as a generic driver, which can=
 be used for different hardware, by selecting different DT properties a=
s configuration.

> Device Tree identifies hardware precisely (vendor and model), and thi=
s
> new binding is just not that. You *could* however have a very simple
> driver that associates compatible strings to static tables containing
> the values of the properties you wanted to see passed through the DT,
> and have one single driver that covers many mmio-based GPIO devices.
> But I'm afraid "basic-mmio-gpio" is *way* to vague to describe
> hardware.
>=20

I don't think making a new driver mapping different compatible strings =
to static tables containing the values of the properties passed through=
 DT is a sane way of doing it, since it will require multiple combinati=
ons to cover all the possibilites.

My plan is to be able to do something like this (btw, I actually tested=
 this patch on BCM63xx and works perfectly):
gpio-controller@10000084 {
	compatible =3D "basic-mmio-gpio", "brcm,brcm6368";
	reg =3D <0x10000084 0x4>, <0x1000008c 0x4>;
	reg-names =3D "dirout", "dat";

	num-gpios =3D <32>;
	byte-be;

	gpio-controller;
	#gpio-cells =3D <2>;
};
And for other hardware you could do:
gpio-controller@10000180 {
	compatible =3D "basic-mmio-gpio", "foo,bar";
	reg =3D <0x10000180 0x4>, <0x10000184 0x4>, <0x10000188 0x4>;
	reg-names =3D "dirin", "dirout", "dat";

	num-gpios =3D <20>;
	bit-be;
	byte-be;
	regdir-nr;

	gpio-controller;
	#gpio-cells =3D <2>;
};
This way you wouldn't need to add a wrapper for each specific hardware =
using basic-mmio-gpio, and you would save time by using the generic dri=
ver.

Regards,
=C3=81lvaro.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
