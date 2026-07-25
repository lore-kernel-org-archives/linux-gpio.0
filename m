Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98FC21CC44
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784989263; cv=none; b=mO7mgbtDXp0LSxe2Dml0HHV/D28rEVuvhnfkZpde2JtPuqxoSzCNrHUAPAneOUqHdOtZhlmlxZc7aT/4NltBaJWXiNoU9Q8i/tvai5wvN2HRWyyuyTscrlnpK5DCJwzqLli/CJrm9WeB+7VDlAN0KmSzJgcLth258icFOkKcRD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784989263; c=relaxed/simple;
	bh=ZJMMLW4CIKOt8hObECVhV+W33ebpE5udSZTaVK2TUrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTSzxfJf+HVvpmnsVtf43bkBd4EXaOSma8LDeMtJVCGsu3cweFq6GZmfaN1CHDeTkyQtO7B9ytMsoG3n0echqAs5fsCWw9h+aLeLT50s7NiwT2mQT2VTOlgRPGvdXJd8TSWcrGG5z2fMGDiohPV+Eng1fcNBCAquyyFDA55fjzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1R2zUla; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1R2zUla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DDA81F0155C
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784989261;
	bh=XY8MC71SnzeX56HU4E9bqCj1+66dX2IXIeiHX0g85Lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=m1R2zUlafNmL9NPWkTzThL/jw5aEs6NCB113IDMdgD9JvxrTXU52vCPZXwSWr///p
	 RfiS3PjJJrBVGztkjbl5u5NE/kfka7OMJuJ9EDWSy383ptHei8oW4u1Ghd22/7WWYi
	 OOZ8kc9ek7UMAVN8Cp+/yuptA/gScAMEtECaQJSOfUG7PCmn5qZMhbjcT25VdwYS1U
	 uzbHExfBkFGbEqNcbmf9+LwOOYooPLny8rvvbvczBIfA/gYeZ4FqTungS24LZHFw+v
	 sapW0UBszCgr//jz4rx6t+jJNL4Zwkh9qJRgJIP0LAsWGMAgikEhVs7AADWJGkUGZO
	 ojAM3GWxWaTtw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39ca300db70so11819301fa.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 07:21:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhehYwqr7MjJvoYtVnTXqTWOq4tvDvnYhrBRukJGm2msJJHY+zYpz5niweSAKG84FcTnON4r08VoCO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc28dYa1mV4aQWa3UrVWkaRWPLr69NiR+uOLs4z4myQ1ENH7T3
	q1kJFr4tbSJT7DsubvecSEUbhTEVNGuc4YYiJ/GAJOZP0LIbvccpOtjCqcygqbs0Ai6ADRqcT+d
	Co723Fpar2R5WxFRjYMjpCNLQ2sN4/I0=
X-Received: by 2002:a05:6512:1390:b0:5b1:5ee0:6662 with SMTP id
 2adb3069b0e04-5b2c1b6973fmr389925e87.51.1784989260287; Sat, 25 Jul 2026
 07:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
 <CAD++jL=Qd8ADR_kX2Q7msM4Dd0xFayPGM4ZzB3uv2ufvkuybtQ@mail.gmail.com> <ZQ4PR01MB120228AD03507B4836EFE19DF2CE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ4PR01MB120228AD03507B4836EFE19DF2CE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 16:20:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com>
X-Gm-Features: AUfX_mx8pVfrmx8WsONlAC7SoRWaJsjzkzgK-nLnNjT-L4xyZdV9VUod-aCvGBI
Message-ID: <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 12:25=E2=80=AFPM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:
> > On Wed, Jun 3, 2026 at 7:54=E2=80=AFAM Changhuang Liang
> > <changhuang.liang@starfivetech.com> wrote:

> > > +static unsigned int jhb100_gpio_to_pin(struct gpio_chip *gc, unsigne=
d
> > > +int gpio) {
> > > +       struct jhb100_gpio_bank *bank =3D jhb100_gc_to_bank(gc);
> > > +
> > > +       return bank->id * JHB100_NR_GPIOS_PER_BANK + gpio; }
> >
> > This usually tells me that GPIO_GENERIC can be used but maybe this has =
been
> > discussed before...
>
> Here, the main purpose is to convert GPIOs into pins for configuring cert=
ain pinctrl
> settings. I haven't found the part where GPIO_GENERIC can assist with thi=
s.
> Can you point it out for me? Thank you very much.

Normally GPIO chips use the .config() callback when you want to
set pin config for a certain pin in a pinctrl backend.

See Documentation/driver-api/gpio/driver.rst:

"The .set_config() callback uses the same enumerators and configuration
semantics as the generic pin control drivers. This is not a coincidence: it=
 is
possible to assign the .set_config() to the function gpiochip_generic_confi=
g()
which will result in pinctrl_gpio_set_config() being called and eventually
ending up in the pin control back-end "behind" the GPIO controller, usually
closer to the actual pins. This way the pin controller can manage the below
listed GPIO configurations.

If a pin controller back-end is used, the GPIO controller or hardware
description needs to provide "GPIO ranges" mapping the GPIO line offsets to=
 pin
numbers on the pin controller so they can properly cross-reference each oth=
er."

Maybe this is what you're looking for?

If you define gpio-ranges in your device tree, the GPIO and pin control
core deals with the cross-referencing for you.

> > > +       sfp->num_banks =3D DIV_ROUND_UP(sfp->ngpios,
> > > + JHB100_NR_GPIOS_PER_BANK);
> > > +
> > > +       for (unsigned int i =3D 0; i < sfp->num_banks; i++) {
> > > +               if (sfp->ngpios > (i + 1) *
> > JHB100_NR_GPIOS_PER_BANK)
> > > +                       sfp->banks[i].gc.ngpio =3D (i + 1) *
> > JHB100_NR_GPIOS_PER_BANK;
> > > +               else
> > > +                       sfp->banks[i].gc.ngpio =3D sfp->ngpios - i *
> > > + JHB100_NR_GPIOS_PER_BANK;
> >
> > This looks completely bananas, shouldn't this be simply:
> >
> > sfp->banks[i].gc.ngpio =3D JHB100_NR_GPIOS_PER_BANK;
>
> The JHB100 GPIO domain is not fully aligned to 32. For example, in the pe=
r0 domain,
> there are 60 GPIOs, so I split it into:
> bank0: 32 GPIOs
> bank1: 28 GPIOs.

At least add that, what you just wrote, as a comment right above this loop.

There is something with this math I think can be made simpler
with bitwise artithmetic. Think about it.

> > > +               sfp->banks[i].gc.request =3D pinctrl_gpio_request;
> >
> > Use
> > gpiochip_generic_request
> >
> > > +               sfp->banks[i].gc.free =3D pinctrl_gpio_free;
> >
> > Use
> > gpiochip_generic_free
> >
> > These calls will do what you want, and also check that the right gpio r=
anges
> > are available.
> >
> > Make sure you add GPIO ranges (the mapping between pin control pins and
> > corresponding GPIO offsets) for this to work properly.
> >
> > I'm pretty sure you can have a generic pin config backend as well.
> >
> > sfp->banks[i].gc.set_config =3D gpiochip_generic_config;

This is pertaining to what I said above about using the gpio
ranges and .config etc.

> > This will make config calls to the gpiochip call into the pinctrl backe=
nd =3D what
> > you want.

I still think this is what you want.

Yours,
Linus Walleij
