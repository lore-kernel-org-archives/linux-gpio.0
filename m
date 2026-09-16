Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD61749E5E6
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549680; cv=none; b=UpfJc63izbSFvI7uHjwZb9bFfP42setvH0Jndrj0JRIudFyabv49OPtWbIlcYAHXVvkOSJUApgOsLU4jW0zLOb1wKt7smv2Q0JMawcxV9RQ9rf0v07Kwq0sEGvIJlWGsw7C/OmVx18ukQnaQ0W4K2ZytFFO/wDqtu2Gh8LL7Fzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549680; c=relaxed/simple;
	bh=JWlMOHTunQ5V7bTWQpjVh3kldHg6mb1ZUaGEGrKbMlc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XO+xzxY5QsLAxAvRslVRiZAPrz9GU7fZlN6nJw+VmGC0B+1OhZQ+VLtUXJy/8XHgYHB0VhVJPeOJEgu3tagV2aoyLChe+Hu826Tc8G/HTpAKbqVls3p48m/fZLViWLFNWM7LN6e5qPOERAlUFCoZbaAVphFgrtJ+rngCvwzHxDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eapsWaNl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eapsWaNl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7B91F0089C
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789549664;
	bh=zEHYdQEbvjbwD4/MRDHQx2QTQ32Iv10NiHvode72Po0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=eapsWaNl9DJXIByfMpgQWwZ1+tIpOb5qOHp7zwaaNaLn6U2OGbtmz+4BCVzHRe65B
	 /PG0p67M/P64WyXhQgLr8zicNznL6gS74Ef4+Yad4gdMcvf7vDX1ucaO4m/upZYEDo
	 xRlFfekHuXRrQxuUOFMyhvCZyGu9453lXxt5zAXPFDRSk0YNWYzOQ2CrbVDeGWKBRZ
	 Ly0p8Qqigw7dTyc6udtZq/wTkdbvQN/cojhJ+7R2jV8mGNrrcEe1LwHkPxSQP+Br3S
	 qsnWIsFo01Br0ZnzzPLJdqjOqHJde4ZZw3dkeakRcD7zN6XDpi0enZOwJf40CGTW6q
	 cwb7wTVin8BdA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a47f740839so5483661fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 02:07:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy7/zP+ulA3dBUGVbP+tawfCidTG3RU6eF5Boq+7vGEvD3/V3kKEdDNFQ8vAQ5w997p6JsnlxJykOqW@vger.kernel.org
X-Gm-Message-State: AFuF++nT2AKfgwAxkSuGFBg7IavVm7TSs0fIC2PHdycrphNty1FaMTD6
	9Y5pO5+s6faSR9+UiXs3MlgrasRmqzwykkf4DNGTdd+zUK5gWUktGlP9rR7P0G//+CaMUfAgOmm
	iTVydsH8q810AHaqYNuQBKHW3c7SDEzFf9MLhAiPZyw==
X-Received: by 2002:a2e:a883:0:b0:3a3:749e:319c with SMTP id
 38308e7fff4ca-3a5dca30f32mr3727391fa.16.1789549663093; Wed, 16 Sep 2026
 02:07:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:07:41 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:07:41 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915154802.675b2408@OMT-CWNXR4TFW5-LHT>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
 <20260915092046.931449-3-alban.bedel@lht.dlh.de> <CAMRc=MfARu1c4Coks-Bn8W4eRueh1oDU47691+NR_o2weKy0BQ@mail.gmail.com>
 <CAMRc=MeS9Afk+C249ZXKsjchbgMwt_nzvTyZgYDsZ9+R1hjsqQ@mail.gmail.com> <20260915154802.675b2408@OMT-CWNXR4TFW5-LHT>
Date: Wed, 16 Sep 2026 05:07:41 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeKs_fhpQB5dM4d-Tb-yinMyrSO0bSTHw1Pg-Whp5tyoQ@mail.gmail.com>
X-Gm-Features: AcwNN1X8_ajP3vDzW2yqCD8SK5Gwwi_liAX17d5SyYU3QQd38moYMNfoo3HjC2A
Message-ID: <CAMRc=MeKs_fhpQB5dM4d-Tb-yinMyrSO0bSTHw1Pg-Whp5tyoQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Support ON Semi CAT9532
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Sep 2026 15:48:02 +0200, Alban Bedel <alban.bedel@lht.dlh.de> sa=
id:
> On Tue, 15 Sep 2026 11:57:51 +0200
> Bartosz Golaszewski <brgl@kernel.org> wrote:
>
>> On Tue, Sep 15, 2026 at 11:51=E2=80=AFAM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
>> >
>> > On Tue, 15 Sep 2026 11:20:46 +0200, Alban Bedel <alban.bedel@lht.dlh.d=
e> said:
>> > > Add support for the CAT9532 LED dimmer from On Semiconductor. Altoug=
ht
>> > > marketed as an LED dimmer it is a bit limited in this regard as it
>> > > only has 2 PWM for 16 pins. As explained in the datasheet it can als=
o
>> > > be used as an open-drain GPIO controller, and that's how it is used =
on
>> > > the hardware I have at hand. This chip doesn't really map to what th=
e
>> > > gpio-regmap driver expect so it is implemented as it own driver. Thi=
s
>> > > approch also allow to later add support for the LED dimmer if desire=
d.
>> > >
>> > > Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
>> > > ---
>> > >  drivers/gpio/Kconfig        |  10 +++
>> > >  drivers/gpio/Makefile       |   1 +
>> > >  drivers/gpio/gpio-cat9532.c | 173 +++++++++++++++++++++++++++++++++=
+++
>> > >  3 files changed, 184 insertions(+)
>> > >  create mode 100644 drivers/gpio/gpio-cat9532.c
>> > >
>> > > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> > > index a48586bb8edba..05b7af675677b 100644
>> > > --- a/drivers/gpio/Kconfig
>> > > +++ b/drivers/gpio/Kconfig
>> > > @@ -1180,6 +1180,16 @@ config GPIO_ADNP
>> > >         enough to represent all pins, but the driver will assume a
>> > >         register layout for 64 pins (8 registers).
>> > >
>> > > +config GPIO_CAT9532
>> > > +     tristate "CAT9532 GPIO support"
>> > > +     select REGMAP_I2C
>> > > +     help
>> > > +       GPIO driver for ON Semiconductor CAT9532 LED dimmer.
>> > > +       Say yes here to enable the GPIO driver for the CAT9532 chip.
>> > > +
>> > > +       To compile this driver as a module, choose M here: the modul=
e will
>> > > +       be called gpio-cat9532.
>> > > +
>> > >  config GPIO_FXL6408
>> > >       tristate "FXL6408 I2C GPIO expander"
>> > >       select GPIO_REGMAP
>> > > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
>> > > index dc9e6d643b5bc..e94d2f57a1f93 100644
>> > > --- a/drivers/gpio/Makefile
>> > > +++ b/drivers/gpio/Makefile
>> > > @@ -51,6 +51,7 @@ obj-$(CONFIG_GPIO_BRCMSTB)          +=3D gpio-brcm=
stb.o
>> > >  obj-$(CONFIG_GPIO_BT8XX)             +=3D gpio-bt8xx.o
>> > >  obj-$(CONFIG_GPIO_BY_PINCTRL)                +=3D gpio-by-pinctrl.o
>> > >  obj-$(CONFIG_GPIO_CADENCE)           +=3D gpio-cadence.o
>> > > +obj-$(CONFIG_GPIO_CAT9532)           +=3D gpio-cat9532.o
>> > >  obj-$(CONFIG_GPIO_CGBC)                      +=3D gpio-cgbc.o
>> > >  obj-$(CONFIG_GPIO_CLPS711X)          +=3D gpio-clps711x.o
>> > >  obj-$(CONFIG_GPIO_SNPS_CREG)         +=3D gpio-creg-snps.o
>> > > diff --git a/drivers/gpio/gpio-cat9532.c b/drivers/gpio/gpio-cat9532=
.c
>> > > new file mode 100644
>> > > index 0000000000000..973ff74a15b89
>> > > --- /dev/null
>> > > +++ b/drivers/gpio/gpio-cat9532.c
>> > > @@ -0,0 +1,173 @@
>> > > +// SPDX-License-Identifier: GPL-2.0-or-later
>> > > +#include <linux/gpio/driver.h>
>> > > +#include <linux/i2c.h>
>> > > +#include <linux/module.h>
>> > > +#include <linux/regmap.h>
>> > > +#include <linux/spinlock.h>
>> > > +
>> > > +struct cat9532 {
>> > > +     struct regmap *regmap;
>> > > +     struct gpio_chip gpio;
>> > > +
>> > > +     spinlock_t lock;
>> > > +     unsigned int direction;
>> > > +};
>> > > +
>> > > +#define CAT9532_REG_INPUT0   0
>> > > +#define CAT9532_REG_LS0              6
>> > > +
>> > > +/* Set output to Hi-Z, LED is OFF */
>> > > +#define CAT9532_LED_OUT_HIZ  0
>> > > +/* Set output low  */
>> > > +#define CAT9532_LED_OUT_LOW  1
>> > > +#define CAT9532_LED_OUT_MASK 3
>> > > +
>> > > +static const struct regmap_config cat9532_regmap_cfg =3D {
>> > > +     .reg_bits =3D 8,
>> > > +     .val_bits =3D 8,
>> > > +     .max_register =3D 9,
>> > > +     /*
>> > > +      * Auto increment can be enabled by setting bit 4 in the
>> > > +      * register address, but we don't really need bulk access.
>> > > +      */
>> > > +     .use_single_read =3D true,
>> > > +     .use_single_write =3D true,
>> > > +     .can_sleep =3D true,
>> > > +};
>> >
>> > This looks like it would perfectly fit the gpio-regmap helper and allo=
w for
>> > code reuse. Maybe except for the locally tracked direction. How reliab=
le is it?
>> > What if the GPIOs were put into some specific state by the bootloader?
>> >
>> > Bart
>>
>> Ah, nevermind, you commented on not being able to use it. My question
>> still stands, how reliable is direction tracking here? Does reading
>> back the registers you write in direction setters not give you
>> anything?
>
> This is an exclusively open-drain chip, you can either driver the line
> low or leave it in hi-z mode to be driven by an external circuit. There
> is no direction register, the input register just report the current
> line state. As such the direction is only something that exists in the
> driver.
>

Yes, I skimmed over it quickly at the airport, should have paid more attent=
ion
to what I'm looking at.

Thanks,
Bartosz
