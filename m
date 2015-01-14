From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: basic-mmio-gpio: add DT support
Date: Wed, 14 Jan 2015 14:32:05 +0900
Message-ID: <CAAVeFuLoZPptaqnN8s6r_aN_rpBj+MpmT=5Xc2-iO3kGKZfctw@mail.gmail.com>
References: <5490B528.2020305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:47158 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750776AbbANFc0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jan 2015 00:32:26 -0500
Received: by mail-ig0-f176.google.com with SMTP id b16so5244180igk.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2015 21:32:25 -0800 (PST)
In-Reply-To: <5490B528.2020305@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Dec 17, 2014 at 7:41 AM, =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
> Add DT support while keeping legacy support.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
> diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.=
c

There is no documentation for these new bindings?

> index 16f6115..9792783 100644
> --- a/drivers/gpio/gpio-generic.c
> +++ b/drivers/gpio/gpio-generic.c
> @@ -61,6 +61,9 @@ o        `                     ~~~~\___/~~~~    ` c=
ontroller in FPGA is ,.`
>  #include <linux/platform_device.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/basic_mmio_gpio.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
>
>  static void bgpio_write8(void __iomem *reg, unsigned long data)
>  {
> @@ -488,8 +491,58 @@ static void __iomem *bgpio_map(struct platform_d=
evice *pdev,
>         return ret;
>  }
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id bgpio_dt_ids[] =3D {
> +       { .compatible =3D "basic-mmio-gpio" },
> +};
> +MODULE_DEVICE_TABLE(of, bgpio_dt_ids);
> +
> +static int bgpio_probe_dt(struct platform_device *pdev)
> +{
> +       u32 tmp;
> +       struct bgpio_pdata *pdata;
> +       struct device_node *np;
> +
> +       np =3D pdev->dev.of_node;
> +       if (!np)
> +               return 0;
> +
> +       pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL=
);
> +       if (!pdata)
> +               return -ENOMEM;
> +
> +       pdata->label =3D dev_name(&pdev->dev);
> +       pdata->base =3D -1;
> +       if (of_find_property(np, "byte-be", NULL)) {
> +               pdata->flags |=3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
> +       }
> +       if (of_find_property(np, "bit-be", NULL)) {
> +               pdata->flags |=3D BGPIOF_BIG_ENDIAN;
> +       }
> +       if (of_find_property(np, "regset-nr", NULL)) {
> +               pdata->flags |=3D BGPIOF_UNREADABLE_REG_SET;
> +       }
> +       if (of_find_property(np, "regdir-nr", NULL)) {
> +               pdata->flags |=3D BGPIOF_UNREADABLE_REG_DIR;
> +       }
> +       if (!of_property_read_u32(np, "num-gpios", &tmp)) {
> +               pdata->ngpio =3D tmp;
> +       }

I don't think this is acceptable. gpio-generic is designed to be used
as a framework for other drivers to build upon. These drivers should
have their own compatible strings, which should be enough to infer all
the properties you defined here.

Device Tree identifies hardware precisely (vendor and model), and this
new binding is just not that. You *could* however have a very simple
driver that associates compatible strings to static tables containing
the values of the properties you wanted to see passed through the DT,
and have one single driver that covers many mmio-based GPIO devices.
But I'm afraid "basic-mmio-gpio" is *way* to vague to describe
hardware.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
