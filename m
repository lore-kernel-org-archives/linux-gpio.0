Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7964247F3A0
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466288; cv=none; b=S9LMGtTFdXZvpWNAbg66L9OYMpGgIJDEjmpyykadm2Fl2aX5vMeTChiz8iYc2/JR5jlhNAoklRbrWtKtT5tIkhXlkfcq/J2+85rYAtgwh8CBBGwwOTDPRXa0ZgvFLUQxN8/cgfIgs/vXnhBy6yw07gzugtdq5LzenWsRsTSOVhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466288; c=relaxed/simple;
	bh=Trb2SHXmeQz6WNLbypoh9yODUxidliRbA6km03ET91k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6lFT01IrzKgoUiKoTkQQGCp2lq2zGY7VsUezhV5Bbo3ZpJVl3Fr2+7lnjsss/kPJcOn5YVnJ8dy90VjBAOJcrFoSoH0CPa0KuI/snTDkovN03PYkzOS857RcAQ4HPuwQ1uSBwPk4/Cq7qXcsZmqjRQKNbsnh555VkrJpCWM6DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oumBPpti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oumBPpti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DC81F00893
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789466285;
	bh=ZCWZE6nYnnZ/ZXDZt2kLzP5VUjl1Q/mjEy5qyS28Nqc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oumBPptigm3xi/2/VSp1AURpUYUYJ/VwAGr488tBAEXZpX0RlwCNAXJnTHUALlx72
	 X0qVsU3n7Gqbp4Qmb6RUaA1H3TlmupUihRCmtH1ZXfMtr8KLr2o6DftI09bQyiA+fz
	 14tsfxH3kbS/7sgF3HYP35Osq+aWsDzanxWQjW7rdXZ0kveHqhyLOr80c4buv4w2JN
	 mRnH5079ZLXePkrjfbG4cv8ZYgibhKKDpYOYYHgqr4raqJdiibWfDG2Uizxes8qeUK
	 qNTmfLjPvJw+4d5sNXtet21ZAktzxrOUSj2XcKQvBAPv4VO7uB1V2g8DzUwMGJM/Fp
	 N8A4OYs4iEMAQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso4471950e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 02:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzrQimOaiypL1LtdOaG4I/L6sLHUmu2n8gslx99PditPqXpJsRdWU+qYDepns2wk9G7Y8SA6UbvSo1k@vger.kernel.org
X-Gm-Message-State: AFuF++mbYQx8yu8Tq00anv9+yzqNfdDWwed66iAkAjuhxyCPHAtsaNuq
	Ay851b4vuhmcdJc1/EG7QhFIHqKFzbA6k0I4Qs/7wXYm9eeWM7+wSlmRIz9gAuREAIB8eGjy8/e
	6nm7MItFM8mwzq7NEbX6nxUICNuDLWSmDjEz5Lp2/hw==
X-Received: by 2002:a05:6512:2287:b0:5b8:b37f:164 with SMTP id
 2adb3069b0e04-5b8b37f0300mr491722e87.48.1789466283784; Tue, 15 Sep 2026
 02:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
 <20260915092046.931449-3-alban.bedel@lht.dlh.de> <CAMRc=MfARu1c4Coks-Bn8W4eRueh1oDU47691+NR_o2weKy0BQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfARu1c4Coks-Bn8W4eRueh1oDU47691+NR_o2weKy0BQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 15 Sep 2026 11:57:51 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeS9Afk+C249ZXKsjchbgMwt_nzvTyZgYDsZ9+R1hjsqQ@mail.gmail.com>
X-Gm-Features: AcwNN1UYHJdnR2BKfs8WcM_KjDKlaLv-CNF0gRvZB_uEMMYIBE8TVTdoc3eAUQA
Message-ID: <CAMRc=MeS9Afk+C249ZXKsjchbgMwt_nzvTyZgYDsZ9+R1hjsqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Support ON Semi CAT9532
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:51=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Tue, 15 Sep 2026 11:20:46 +0200, Alban Bedel <alban.bedel@lht.dlh.de> =
said:
> > Add support for the CAT9532 LED dimmer from On Semiconductor. Altought
> > marketed as an LED dimmer it is a bit limited in this regard as it
> > only has 2 PWM for 16 pins. As explained in the datasheet it can also
> > be used as an open-drain GPIO controller, and that's how it is used on
> > the hardware I have at hand. This chip doesn't really map to what the
> > gpio-regmap driver expect so it is implemented as it own driver. This
> > approch also allow to later add support for the LED dimmer if desired.
> >
> > Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> > ---
> >  drivers/gpio/Kconfig        |  10 +++
> >  drivers/gpio/Makefile       |   1 +
> >  drivers/gpio/gpio-cat9532.c | 173 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 184 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-cat9532.c
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index a48586bb8edba..05b7af675677b 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1180,6 +1180,16 @@ config GPIO_ADNP
> >         enough to represent all pins, but the driver will assume a
> >         register layout for 64 pins (8 registers).
> >
> > +config GPIO_CAT9532
> > +     tristate "CAT9532 GPIO support"
> > +     select REGMAP_I2C
> > +     help
> > +       GPIO driver for ON Semiconductor CAT9532 LED dimmer.
> > +       Say yes here to enable the GPIO driver for the CAT9532 chip.
> > +
> > +       To compile this driver as a module, choose M here: the module w=
ill
> > +       be called gpio-cat9532.
> > +
> >  config GPIO_FXL6408
> >       tristate "FXL6408 I2C GPIO expander"
> >       select GPIO_REGMAP
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index dc9e6d643b5bc..e94d2f57a1f93 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -51,6 +51,7 @@ obj-$(CONFIG_GPIO_BRCMSTB)          +=3D gpio-brcmstb=
.o
> >  obj-$(CONFIG_GPIO_BT8XX)             +=3D gpio-bt8xx.o
> >  obj-$(CONFIG_GPIO_BY_PINCTRL)                +=3D gpio-by-pinctrl.o
> >  obj-$(CONFIG_GPIO_CADENCE)           +=3D gpio-cadence.o
> > +obj-$(CONFIG_GPIO_CAT9532)           +=3D gpio-cat9532.o
> >  obj-$(CONFIG_GPIO_CGBC)                      +=3D gpio-cgbc.o
> >  obj-$(CONFIG_GPIO_CLPS711X)          +=3D gpio-clps711x.o
> >  obj-$(CONFIG_GPIO_SNPS_CREG)         +=3D gpio-creg-snps.o
> > diff --git a/drivers/gpio/gpio-cat9532.c b/drivers/gpio/gpio-cat9532.c
> > new file mode 100644
> > index 0000000000000..973ff74a15b89
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-cat9532.c
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +#include <linux/gpio/driver.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +#include <linux/spinlock.h>
> > +
> > +struct cat9532 {
> > +     struct regmap *regmap;
> > +     struct gpio_chip gpio;
> > +
> > +     spinlock_t lock;
> > +     unsigned int direction;
> > +};
> > +
> > +#define CAT9532_REG_INPUT0   0
> > +#define CAT9532_REG_LS0              6
> > +
> > +/* Set output to Hi-Z, LED is OFF */
> > +#define CAT9532_LED_OUT_HIZ  0
> > +/* Set output low  */
> > +#define CAT9532_LED_OUT_LOW  1
> > +#define CAT9532_LED_OUT_MASK 3
> > +
> > +static const struct regmap_config cat9532_regmap_cfg =3D {
> > +     .reg_bits =3D 8,
> > +     .val_bits =3D 8,
> > +     .max_register =3D 9,
> > +     /*
> > +      * Auto increment can be enabled by setting bit 4 in the
> > +      * register address, but we don't really need bulk access.
> > +      */
> > +     .use_single_read =3D true,
> > +     .use_single_write =3D true,
> > +     .can_sleep =3D true,
> > +};
>
> This looks like it would perfectly fit the gpio-regmap helper and allow f=
or
> code reuse. Maybe except for the locally tracked direction. How reliable =
is it?
> What if the GPIOs were put into some specific state by the bootloader?
>
> Bart

Ah, nevermind, you commented on not being able to use it. My question
still stands, how reliable is direction tracking here? Does reading
back the registers you write in direction setters not give you
anything?

Bart
