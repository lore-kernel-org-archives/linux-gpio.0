Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B143A80B;
	Tue, 15 Sep 2026 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480104; cv=none; b=mZHXQjk+9qOqTU4UKn3OSavk+F6Z5mWomAvi18kwvTLGnJm1StWfwfFatMlKQUzXKRFJkIkOqgm17eKuLemtL37Fo7wG4OPPcsXnWZfHAR8MNSUYKoBp2H4njpDnVRwYRPVtm/itvEv1yBQdRYcfi7ditnH+gcq+7Gga8hOA5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480104; c=relaxed/simple;
	bh=K5IxCznysTCoC6HCoKj/1le70C8uo9aj/mlyw9VpPsA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zr43sl9o8vudPwWFgqXmZFxraMoATZHQxKuc/MGzrr2DoGeAlIZagerhwCoBDkQaj3lHYB+hJIvZx0Kb4gouoS2nmxRtc4KB89PUgmH7jZ+th2kS/uYdbuEkotIdviwXYE20B/V4L2wC8RtG6IXb9a3YIuiA41ocCYY1+Ry2ZxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lht.dlh.de
Received: from OMT-CWNXR4TFW5-LHT (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0FE7F13F8C0;
	Tue, 15 Sep 2026 15:48:09 +0200 (CEST)
Date: Tue, 15 Sep 2026 15:48:02 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alban Bedel
 <alban.bedel@lht.dlh.de>
Subject: Re: [PATCH 2/2] gpio: Support ON Semi CAT9532
Message-ID: <20260915154802.675b2408@OMT-CWNXR4TFW5-LHT>
In-Reply-To: <CAMRc=MeS9Afk+C249ZXKsjchbgMwt_nzvTyZgYDsZ9+R1hjsqQ@mail.gmail.com>
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
	<20260915092046.931449-3-alban.bedel@lht.dlh.de>
	<CAMRc=MfARu1c4Coks-Bn8W4eRueh1oDU47691+NR_o2weKy0BQ@mail.gmail.com>
	<CAMRc=MeS9Afk+C249ZXKsjchbgMwt_nzvTyZgYDsZ9+R1hjsqQ@mail.gmail.com>
Organization: Lufthansa Technik AG
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-apple-darwin25.4.0)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Sep 2026 11:57:51 +0200
Bartosz Golaszewski <brgl@kernel.org> wrote:

> On Tue, Sep 15, 2026 at 11:51=E2=80=AFAM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >
> > On Tue, 15 Sep 2026 11:20:46 +0200, Alban Bedel <alban.bedel@lht.dlh.de=
> said: =20
> > > Add support for the CAT9532 LED dimmer from On Semiconductor. Altought
> > > marketed as an LED dimmer it is a bit limited in this regard as it
> > > only has 2 PWM for 16 pins. As explained in the datasheet it can also
> > > be used as an open-drain GPIO controller, and that's how it is used on
> > > the hardware I have at hand. This chip doesn't really map to what the
> > > gpio-regmap driver expect so it is implemented as it own driver. This
> > > approch also allow to later add support for the LED dimmer if desired.
> > >
> > > Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> > > ---
> > >  drivers/gpio/Kconfig        |  10 +++
> > >  drivers/gpio/Makefile       |   1 +
> > >  drivers/gpio/gpio-cat9532.c | 173 ++++++++++++++++++++++++++++++++++=
++
> > >  3 files changed, 184 insertions(+)
> > >  create mode 100644 drivers/gpio/gpio-cat9532.c
> > >
> > > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > > index a48586bb8edba..05b7af675677b 100644
> > > --- a/drivers/gpio/Kconfig
> > > +++ b/drivers/gpio/Kconfig
> > > @@ -1180,6 +1180,16 @@ config GPIO_ADNP
> > >         enough to represent all pins, but the driver will assume a
> > >         register layout for 64 pins (8 registers).
> > >
> > > +config GPIO_CAT9532
> > > +     tristate "CAT9532 GPIO support"
> > > +     select REGMAP_I2C
> > > +     help
> > > +       GPIO driver for ON Semiconductor CAT9532 LED dimmer.
> > > +       Say yes here to enable the GPIO driver for the CAT9532 chip.
> > > +
> > > +       To compile this driver as a module, choose M here: the module=
 will
> > > +       be called gpio-cat9532.
> > > +
> > >  config GPIO_FXL6408
> > >       tristate "FXL6408 I2C GPIO expander"
> > >       select GPIO_REGMAP
> > > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > > index dc9e6d643b5bc..e94d2f57a1f93 100644
> > > --- a/drivers/gpio/Makefile
> > > +++ b/drivers/gpio/Makefile
> > > @@ -51,6 +51,7 @@ obj-$(CONFIG_GPIO_BRCMSTB)          +=3D gpio-brcms=
tb.o
> > >  obj-$(CONFIG_GPIO_BT8XX)             +=3D gpio-bt8xx.o
> > >  obj-$(CONFIG_GPIO_BY_PINCTRL)                +=3D gpio-by-pinctrl.o
> > >  obj-$(CONFIG_GPIO_CADENCE)           +=3D gpio-cadence.o
> > > +obj-$(CONFIG_GPIO_CAT9532)           +=3D gpio-cat9532.o
> > >  obj-$(CONFIG_GPIO_CGBC)                      +=3D gpio-cgbc.o
> > >  obj-$(CONFIG_GPIO_CLPS711X)          +=3D gpio-clps711x.o
> > >  obj-$(CONFIG_GPIO_SNPS_CREG)         +=3D gpio-creg-snps.o
> > > diff --git a/drivers/gpio/gpio-cat9532.c b/drivers/gpio/gpio-cat9532.c
> > > new file mode 100644
> > > index 0000000000000..973ff74a15b89
> > > --- /dev/null
> > > +++ b/drivers/gpio/gpio-cat9532.c
> > > @@ -0,0 +1,173 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +#include <linux/gpio/driver.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/spinlock.h>
> > > +
> > > +struct cat9532 {
> > > +     struct regmap *regmap;
> > > +     struct gpio_chip gpio;
> > > +
> > > +     spinlock_t lock;
> > > +     unsigned int direction;
> > > +};
> > > +
> > > +#define CAT9532_REG_INPUT0   0
> > > +#define CAT9532_REG_LS0              6
> > > +
> > > +/* Set output to Hi-Z, LED is OFF */
> > > +#define CAT9532_LED_OUT_HIZ  0
> > > +/* Set output low  */
> > > +#define CAT9532_LED_OUT_LOW  1
> > > +#define CAT9532_LED_OUT_MASK 3
> > > +
> > > +static const struct regmap_config cat9532_regmap_cfg =3D {
> > > +     .reg_bits =3D 8,
> > > +     .val_bits =3D 8,
> > > +     .max_register =3D 9,
> > > +     /*
> > > +      * Auto increment can be enabled by setting bit 4 in the
> > > +      * register address, but we don't really need bulk access.
> > > +      */
> > > +     .use_single_read =3D true,
> > > +     .use_single_write =3D true,
> > > +     .can_sleep =3D true,
> > > +}; =20
> >
> > This looks like it would perfectly fit the gpio-regmap helper and allow=
 for
> > code reuse. Maybe except for the locally tracked direction. How reliabl=
e is it?
> > What if the GPIOs were put into some specific state by the bootloader?
> >
> > Bart =20
>=20
> Ah, nevermind, you commented on not being able to use it. My question
> still stands, how reliable is direction tracking here? Does reading
> back the registers you write in direction setters not give you
> anything?

This is an exclusively open-drain chip, you can either driver the line
low or leave it in hi-z mode to be driven by an external circuit. There
is no direction register, the input register just report the current
line state. As such the direction is only something that exists in the
driver.

But as Sashiko pointed out this chip is a clone of the PCA9532 for
which there is already a driver. I will instead look into making this
driver usable in my use case.

Thanks, for the review.

Alban
