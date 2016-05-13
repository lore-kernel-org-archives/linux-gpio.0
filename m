From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v9 1/2] gpio: mmio: add DT support for memory-mapped GPIOs
Date: Fri, 13 May 2016 19:59:11 +0900
Message-ID: <CAAVeFu+kJk10FE0S9NMvbv1pXL=4sRHtLrRM_ApG-53MuxWVng@mail.gmail.com>
References: <cover.1462911225.git.chunkeey@googlemail.com> <2c0675cd6f67bd487105c46c38c72d49d84d4df8.1462911225.git.chunkeey@googlemail.com>
 <0a1ab2b6-b4c5-44d7-abb4-ce1e9da7e477@gmail.com> <4114007.EkZL1biBx8@debian64>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33838 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994AbcEMK7c convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2016 06:59:32 -0400
In-Reply-To: <4114007.EkZL1biBx8@debian64>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= <noltari@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Joachim Eastwood <manabian@gmail.com>

On Thu, May 12, 2016 at 9:07 PM, Christian Lamparter
<chunkeey@googlemail.com> wrote:
> On Thursday, May 12, 2016 07:26:32 PM Alexandre Courbot wrote:
>> On Wednesday, May 11, 2016 6:34:34 PM JST, Christian Lamparter wrote=
:
>> > From: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> >
>> > This patch adds support for defining memory-mapped GPIOs which
>> > are compatible with the existing gpio-mmio interface. The generic
>> > library provides support for many memory-mapped GPIO controllers
>> > that are found in various on-board FPGA and ASIC solutions that
>> > are used to control board's switches, LEDs, chip-selects,
>> > Ethernet/USB PHY power, etc.
>> >
>> > For setting GPIO's there are three configurations:
>>
>> s/GPIO's/GPIOs
> OK
>
>> >     1. single input/output register resource (named "dat"),
>> >     2. set/clear pair (named "set" and "clr"),
>> >     3. single output register resource and single input resource
>> >        ("set" and dat").
>> >
>> > The configuration is detected by which resources are present.
>> > For the single output register, this drives a 1 by setting a bit
>> > and a zero by clearing a bit.  For the set clr pair, this drives
>> > a 1 by setting a bit in the set register and clears it by setting
>> > a bit in the clear register. The configuration is detected by
>> > which resources are present.
>>
>> The last sentence of this paragraph repeats for first one.
> Ok
>
>> >
>> > For setting the GPIO direction, there are three configurations:
>> >     a. simple bidirectional GPIOs that requires no configuration.
>> >     b. an output direction register (named "dirout")
>> >        where a 1 bit indicates the GPIO is an output.
>> >     c. an input direction register (named "dirin")
>> >        where a 1 bit indicates the GPIO is an input.
>> >
>> > The first user for this binding is "wd,mbl-gpio".
>> >
>> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> > Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com=
>
>> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
>> > ---
>> >  static void bgpio_write8(void __iomem *reg, unsigned long data)
>> >  {
>> > @@ -569,6 +571,58 @@ static void __iomem *bgpio_map(struct
>> > platform_device *pdev,
>> >     return devm_ioremap_resource(&pdev->dev, r);
>> >  }
>> >
>> > +#ifdef CONFIG_OF
>> > +static int bgpio_basic_mmio_parse_dt(struct platform_device *pdev=
,
>> > +                                struct bgpio_pdata *pdata,
>> > +                                unsigned long *flags)
>> > +{
>> > +   struct device *dev =3D &pdev->dev;
>> > +
>> > +   pdata->base =3D -1;
>> > +
>> > +   if (of_property_read_bool(dev->of_node, "no-output"))
>> > +           *flags |=3D BGPIOF_NO_OUTPUT;
>>
>> I don't think it is a good idea to add "generic" properties. Whether=
 a
>> controller is capable of output or not should be determined by its
>> compatible string only, and not a vague property.
>
> Well, meet the gpios on the MBL. If you want to figure out how WD wir=
ed
> up these two GPIOs (one is input, the other output), I can sent you a
> built-yourself MBL kit. It just needs a 3,5" drive and a 12V 2A power
> plug with a standard 5.5mm plug.
>
>> > +
>> > +   return 0;
>> > +}
>> > +
>> > +static const struct of_device_id bgpio_of_match[] =3D {
>> > +   { .compatible =3D "wd,mbl-gpio", .data =3D bgpio_basic_mmio_pa=
rse_dt },
>>
>> Mmm cannot you determine whether your controller is capable of outpu=
t or
>> not just from the compatible property here? If so, the
>> bgpio_basic_mmio_parse_dt seems to be unneeded. If not, then this is
>> dependent on the wd,mbl-gpio binding and should be renamed according=
ly.
> Sadly I don't know of any method. The device has two GPIOs one at 0x4=
e0000000.
> The other one is at 0x4e0100000. The address tells me that there are =
two
> external chips connected to the EBC (memory bank - RAM, ROM and DMA c=
hips
> go here according to IBM's documentations). Which is not the place yo=
u
> would expect peripherals.

Ok, if you have no way of figuring that out then this is legit.

>
>> > @@ -646,6 +709,7 @@ MODULE_DEVICE_TABLE(platform, bgpio_id_table);
>> >  static struct platform_driver bgpio_driver =3D {
>> >     .driver =3D {
>> >             .name =3D "basic-mmio-gpio",
>> > +           .of_match_table =3D of_match_ptr(bgpio_of_match),
>> >     },
>> >     .id_table =3D bgpio_id_table,
>> >     .probe =3D bgpio_pdev_probe,
>>
>> It seems to me that this patch does two things:
>>
>> 1) Add code to support device tree lookup
>> 2) Add support for "wd,mbl-gpio".
>>
>> If true, these two things should be in their own patches. You should=
 also
>> have another patch that adds the DT bindings for "wd,mbl-gpio", so I=
 would
>> do things in that order:
>
> The DT bindings have been merged. That's why I dropped it from the re=
base.
>
>> 1/3: DT support for basic-mmio-gpio
> Sadly, adding the "basic-mmio-gpio" binding is not possible without a=
 ACK from
> the device tree maintainers. They have voiced their concerns. I think=
 this was
> your post of the discussion on it:
> <http://www.spinics.net/lists/devicetree/msg124613.html>
>
> That's why the series was updated around v5 and v6 to use the "wd,mbl=
-gpio"
> binding.
>
> So yes, I wanted to go this route in the beginning as well. But no go=
=2E
> If we find more devices we could have a "basic-mmio-gpio" class. But
> for now, we have to start somewhere.

Ah, I was not suggesting that you add a "basic-mmio-gpio" compatible
property, but that the first patch of the series should add the
infrastructure code required for "wd,mbl-gpio" and the drivers you are
moving to use it in 2/2. That way you separate the addition of support
code to the actual device support.

>> 2/3: DT bindings for "wd,mbl-gpio" (and have them validated by the D=
T
>> people - e.g. do you really need a "reg" property or is it here just=
 to fit
>> with what bgpio_pdev_probe expects? More about this on 2/2)
>> 3/3: Support for "wd,mbl-gpio" in basic-mmio-gpio
> Yes, that would have been nice. And I agree it was the way to do it. =
But
> without the wd,mbl-gpio mapping I would add the bgpio_parse_dt functi=
on
> without any caller. (As I can't add the compatible =3D "basic-mmio-gp=
io", ...)

bgpio_parse_dt() is called from bgpio_pdev_probe(), so whether you
have the mapping or not should not matter, does it?

It's just that there is no reason to add support for WD-MBL in this
patch, and convert other drivers in the next - both are equal users of
the infrastructure code you are adding.

Note that my comments on the next patch suggest deeper changes to this
one - you may want to read them as well (I will ignore v9.1 for now).
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
