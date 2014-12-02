From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 3/3] gpio: add support for Cypress CYUSBS234 USB-GPIO
 adapter
Date: Tue, 2 Dec 2014 09:28:56 +0000
Message-ID: <20141202092856.GD12068@x1>
References: <1417192911-16719-1-git-send-email-muth@cypress.com>
 <CACRpkdYbbheP5KTuj7f+2cJXrOjjkRZjR0-bth1DF3kCig6n5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:62135 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072AbaLBJ3D (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Dec 2014 04:29:03 -0500
Received: by mail-qg0-f45.google.com with SMTP id f51so8922860qge.18
        for <linux-gpio@vger.kernel.org>; Tue, 02 Dec 2014 01:29:02 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CACRpkdYbbheP5KTuj7f+2cJXrOjjkRZjR0-bth1DF3kCig6n5A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Muthu Mani <muth@cypress.com>, Samuel Ortiz <sameo@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, Alexandre Courbot <gnurou@gmail.com>, Johan Hovold <johan@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rajaram Regupathy <rera@cypress.com>

On Mon, 01 Dec 2014, Linus Walleij wrote:

> On Fri, Nov 28, 2014 at 5:41 PM, Muthu Mani <muth@cypress.com> wrote:
>=20
> > Adds support for USB-GPIO interface of Cypress Semiconductor
> > CYUSBS234 USB-Serial Bridge controller.
> >
> > The GPIO get/set can be done through vendor command on control endp=
oint
> > for the configured gpios.
> >
> > Details about the device can be found at:
> > http://www.cypress.com/?rID=3D84126
> >
> > Signed-off-by: Muthu Mani <muth@cypress.com>
> > Signed-off-by: Rajaram Regupathy <rera@cypress.com>
> > ---
> > Changes since v3:
>=20
> (..)
> > +config GPIO_CYUSBS23X
> > +       tristate "CYUSBS23x GPIO support"
> > +       depends on MFD_CYUSBS23X && USB
>=20
> Doesn't MFD_CYUSV23X already depend on USB?

Yup.

> > +#include <linux/kernel.h>
> > +#include <linux/errno.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <linux/usb.h>
> > +#include <linux/gpio.h>
> > +
> > +#include <linux/mfd/cyusbs23x.h>
>=20
> Why this arbitrary newlines? Add this
>=20
> #include <linus/bitops.h>

Narcissist. =3D;-)

[...]

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
