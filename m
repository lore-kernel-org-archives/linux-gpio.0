From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 3/3] mfd: lpc_ich: Add support for Intel Apollo Lake
 GPIO pinctrl in non-ACPI system
Date: Tue, 28 Jun 2016 10:15:27 +0100
Message-ID: <20160628091527.GO6720@dell>
References: <1467100608-11549-1-git-send-email-jui.nee.tan@intel.com>
 <1467100608-11549-4-git-send-email-jui.nee.tan@intel.com>
 <CAHp75VfG+3EPy3TZ=Co098zTXzmd5ekWbrhZ759CEKFMzyEiUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37807 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752272AbcF1JOh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2016 05:14:37 -0400
Received: by mail-wm0-f53.google.com with SMTP id a66so17802618wme.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2016 02:14:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAHp75VfG+3EPy3TZ=Co098zTXzmd5ekWbrhZ759CEKFMzyEiUw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Tan Jui Nee <jui.nee.tan@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, ptyser@xes-inc.com, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, jonathan.yong@intel.com, ong.hock.yu@intel.com, weifeng.voon@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Tue, 28 Jun 2016, Andy Shevchenko wrote:

> On Tue, Jun 28, 2016 at 10:56 AM, Tan Jui Nee <jui.nee.tan@intel.com>=
 wrote:
> > This driver uses the P2SB hide/unhide mechanism cooperatively
> > to pass the PCI BAR address to the gpio platform driver.
>=20
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -369,8 +369,9 @@ config MFD_INTEL_QUARK_I2C_GPIO
> >
> >  config LPC_ICH
> >         tristate "Intel ICH LPC"
> > -       depends on PCI
> > +       depends on X86 && PCI
>=20
> This might deserve to be a separate change. Lee, what is your opinion=
?

I have no strong opinion.  Keep it in if you like.

[...]

> > @@ -155,7 +155,7 @@ obj-$(CONFIG_PMIC_ADP5520)  +=3D adp5520.o
> >  obj-$(CONFIG_MFD_KEMPLD)       +=3D kempld-core.o
> >  obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO) +=3D intel_quark_i2c_gpio.o
> >  obj-$(CONFIG_LPC_SCH)          +=3D lpc_sch.o
>=20
> > -lpc_ich-objs           :=3D lpc_ich-core.o
> > +lpc_ich-objs           :=3D lpc_ich-core.o lpc_ich-apl.o
> >  obj-$(CONFIG_LPC_ICH)          +=3D lpc_ich.o
>=20
> I don't know if there is any requirement, but what I see in other Mak=
efiles is
>=20
> obj-$(CONFIG_DRV_OPTION) =3D drv_name.o
> drv_name-objs :=3D main.o aux1.o

Yes, this is nicer.

> Perhaps you may do the same.

> > +++ b/drivers/mfd/lpc_ich-apl.c
> > @@ -0,0 +1,126 @@
> > +/*
> > + * Purpose: Create a platform device to bind with Intel Apollo Lak=
e
> > + * Pinctrl GPIO platform driver
> > + * Copyright (C) 2016 Intel Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + */
> > +
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/lpc_ich.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +#include <asm/p2sb.h>
> > +
>=20
> > +#if defined(CONFIG_X86_INTEL_APL)

I'm not accepting this kind of #ifery in *.c files.

> And why you can't use
>=20
> ifeq ($(CONFIG_...,y))
> lpc_ich-objs +=3D ...
> endif
>=20
> in the Makefile?

[...]

> > +int lpc_ich_misc(struct pci_dev *dev)
> > +{
> > +       unsigned int apl_p2sb =3D PCI_DEVFN(PCI_IDSEL_P2SB, 0);
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       /*
> > +        * Apollo lake, has not 1, but 4 gpio controllers,
> > +        * handle it a bit differently.
> > +        */
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(apl_gpio_io_res)-1; i++) {
> > +               struct resource *res =3D &apl_gpio_io_res[i];
> > +
> > +               apl_gpio_devices[i].resources =3D res;
> > +
> > +               /* Fill MEM resource */
> > +               ret =3D p2sb_bar(dev, apl_p2sb, res++);
> > +               if (ret)
> > +                       goto warn_continue;
> > +
> > +               apl_pinctrl_pdata.name =3D kasprintf(GFP_KERNEL, "%=
u",
> > +                       i + 1);
> > +       }
> > +
> > +       if (apl_pinctrl_pdata.name)
> > +               ret =3D mfd_add_devices(&dev->dev, apl_gpio_devices=
->id,
> > +                       apl_gpio_devices, ARRAY_SIZE(apl_gpio_devic=
es),
> > +                               NULL, 0, NULL);
> > +       else
> > +               ret =3D -ENOMEM;
> > +
> > +warn_continue:
> > +       if (ret)
> > +               dev_warn(&dev->dev,
> > +                       "Failed to add Apollo Lake GPIO %s: %d\n",
> > +                               apl_pinctrl_pdata.name, ret);
> > +
> > +       kfree(apl_pinctrl_pdata.name);
> > +       return 0;
> > +}
> > +#endif
>=20
> Regarding to the above I don't see Lee's comments addressed. Can you
> remind whar is the result of that discussion?

I don't have time to do a full review now, but this does look nasty.

[...]

> > --- a/include/linux/mfd/lpc_ich.h
> > +++ b/include/linux/mfd/lpc_ich.h
> > @@ -43,4 +43,11 @@ struct lpc_ich_info {
> >         u8 use_gpio;
> >  };
>=20
> > +#if defined(CONFIG_X86_INTEL_APL)
> > +int lpc_ich_misc(struct pci_dev *dev);
> > +#else
> > +static inline int lpc_ich_misc(struct pci_dev *dev)
> > +{ return -ENODEV; }
>=20
> It could be one line, ...

I don't want it in here at all.

> > +#endif
>=20
> ...but the name of this function should not be so generic. What if
> tomorrow you will get one more module which needs one more function?
>=20
> Moreover this is a part of internal driver interface, I would move
> this part into special header under drivers/mfd.
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
