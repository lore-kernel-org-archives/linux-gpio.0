Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C57447D444
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466405; cv=none; b=OvuA2HzY3VJiE/nQzxI4ZcCndXZMIcNl5aAw8MQYotxqG88FHfiERKk2UDjH8lHzdSSfcoUrCuxNzToMjcpNvLVA3lsXoJ9X4x4p7Ov2++lfhAFZGCKSZQ4Z4/G3+sp6sJf9gkqy7pqucFf1heEYH/OBWcaHKTqJ4sH/5BOi/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466405; c=relaxed/simple;
	bh=Lw4HWLxXAbkOxKF0yYYDd4vzq4ymNwy31AhCN1Hq1Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJgl2Qfs5WDifJAAACSwHDCkUFeq+/HipIllSeYNpoWtQ58LoSeXNEs2/wBiaUpkdO8zRW4MWyRFKqB/NHqy1RCRlhA8JCQwBv13mGdyflz9Ynr48HxoL2uxH5NkDcO+RMBSuP+R5aPaWTEN0s90zkteZ0gmIKDlbGtzF3xiOw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkKMAjZ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkKMAjZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7191F000FF
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789466403;
	bh=KUWhQOKpsVTzJc+LOgdU897R5lhBLPaZmUG1+ydEkq8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GkKMAjZ4JyoeLDX/lNoz4JFfbaDdnu+WvrqPZ79EbUTTWuAv/5HS5L7euTd03ijYW
	 b/F7uJY/B4ZpZIYmFIe8NKpq0AaEv704aFJKdIy7Dk3FMlKTaPR9Bj+iP9wE2Cle3s
	 5B7uCJK0/QSjQQq37aCSNKf5MnaQwBzEKxYb0H2rUQwe3hHSyClWI1BiLiJuXmAPLM
	 CEdf//nedjCEC1aNmddsJ2sKiyVqohnpjah8O+LfQY9I8yl9YKM3klMfhWdUx0xwHu
	 /UV9NsDQuJKELN9IbjLcybDZyClQpjHyAUVpRnCQTUXGgI5Fz6j6PbFEyVg7AXXVlk
	 rcyZH/OWC1L0w==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1651cso2550303e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 03:00:03 -0700 (PDT)
X-Gm-Message-State: AFuF++m7lBjabKtTVrMyOq8A0QtGRNtj/zEd56zjaNDtCrOhaLngJPKY
	fvted+ehL/pgaqjOX3LQdH4RbHQiXmRlaNxvR6drGM8OfgNN2/TEfGGgpzRgETnDafXqIl2LiEp
	q5fvLM3+rTj2xOomkg+9U4Ukjx7Xjr4g=
X-Received: by 2002:a05:6512:10cb:b0:5b7:674f:caba with SMTP id
 2adb3069b0e04-5b8ae684479mr1733011e87.13.1789466402548; Tue, 15 Sep 2026
 03:00:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de> <20260915092046.931449-3-alban.bedel@lht.dlh.de>
In-Reply-To: <20260915092046.931449-3-alban.bedel@lht.dlh.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 15 Sep 2026 11:59:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ybSUyzX2YmaQnnuPz0EHJCucmc_dOSiGft-=ZzRkViQ@mail.gmail.com>
X-Gm-Features: AcwNN1W45AomASaWe_arqgDjsGJM8N_Ec_sdw3mERG3MRAQyLKGPHcbSSql0Hxw
Message-ID: <CAD++jL=ybSUyzX2YmaQnnuPz0EHJCucmc_dOSiGft-=ZzRkViQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Support ON Semi CAT9532
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alban,

thanks for your patch!

overall if it should be possible to use the same component as a LED dimmer
then some DT property flag such as onn,gpio-mode; or so is needed to make
sure only the GPIO mode driver is probed?

I'm not sure about how to flag this in DT, check with the binding maintaine=
rs.

On Tue, Sep 15, 2026 at 11:21=E2=80=AFAM Alban Bedel <alban.bedel@lht.dlh.d=
e> wrote:

> Add support for the CAT9532 LED dimmer from On Semiconductor. Altought
> marketed as an LED dimmer it is a bit limited in this regard as it
> only has 2 PWM for 16 pins. As explained in the datasheet it can also
> be used as an open-drain GPIO controller, and that's how it is used on
> the hardware I have at hand. This chip doesn't really map to what the
> gpio-regmap driver expect so it is implemented as it own driver. This
> approch also allow to later add support for the LED dimmer if desired.
>
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
(...)

> +static int cat9532_gpio_direction_input(struct gpio_chip *chip,
> +                                       unsigned int offset)
> +{
> +       struct cat9532 *cat9532 =3D container_of(chip, struct cat9532, gp=
io);
> +       unsigned int reg =3D CAT9532_REG_LS0 + (offset >> 2);
> +       unsigned int shift =3D (offset & 3) << 1;
> +       int err;
> +
> +       err =3D regmap_update_bits(cat9532->regmap, reg,
> +                                CAT9532_LED_OUT_MASK << shift,
> +                                CAT9532_LED_OUT_HIZ << shift);
> +       if (err < 0)
> +               return err;
> +
> +       scoped_guard(spinlock, &cat9532->lock)
> +               cat9532->direction &=3D ~BIT(offset);
> +
> +       return 0;
> +}
> +
> +static int cat9532_gpio_get(struct gpio_chip *chip,
> +                           unsigned int offset)
> +{
> +       struct cat9532 *cat9532 =3D container_of(chip, struct cat9532, gp=
io);
> +       unsigned int reg =3D CAT9532_REG_INPUT0 + (offset >> 3);
> +       unsigned int mask =3D BIT(offset & 7);
> +       unsigned int val;
> +       int err;
> +
> +       err =3D regmap_read(cat9532->regmap, reg, &val);
> +       if (err < 0)
> +               return err;
> +
> +       return !!(val & mask);
> +}
> +
> +static int cat9532_gpio_set(struct gpio_chip *chip,
> +                           unsigned int offset, int value)
> +{
> +       struct cat9532 *cat9532 =3D container_of(chip, struct cat9532, gp=
io);
> +       unsigned int reg =3D CAT9532_REG_LS0 + (offset >> 2);
> +       unsigned int shift =3D (offset & 3) << 1;
> +       unsigned int val;
> +
> +       val =3D value ? CAT9532_LED_OUT_HIZ : CAT9532_LED_OUT_LOW;
> +       return regmap_update_bits(cat9532->regmap, reg,
> +                                 CAT9532_LED_OUT_MASK << shift,
> +                                 val << shift);
> +}

So clearly all GPIO lines are open drain, requiring an external
pull-up resistor.

I would handle things this way:

1. Implement .set_config for this gpio_chip.
2. In the .set_config() callback, reject anything except PIN_CONFIG_OPEN_DR=
AIN
   pinconf_to_config_param(config) !=3D PIN_CONFIG_OPEN_DRAIN return -EINVA=
L;
3. If setting open drain succeeds, mark the line offset as configured
in a bitmap
4. Do not accept any get/set calls until the line has been configured as
  open drain.

This forces users to always properly configure the line as open drain befor=
e
usage.

Maybe it is possible to also add restrictions in the YAML DT bindings
to enforce consumers to set open drain, I'm not sure. But we can at least
enforce it at runtime.

> +       chip =3D &cat9532->gpio;
> +       chip->label =3D "cat9532";
> +       chip->parent =3D &client->dev;
> +       chip->owner =3D THIS_MODULE;
> +       chip->can_sleep =3D true;
> +       chip->base =3D -1;
> +       chip->ngpio =3D 16;

This is right, no using ngpio :)

Yours,
Linus Walleij
