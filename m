Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D522238F236
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843618; cv=none; b=Jvm5pG9Hb7fT+hIyS4AkUrBMCdMIqNXGeoEGw4asMgzKZYkfatHQ0t3jkbyw+Rj6Jest8iQ5oL2Z/CsLNorPzWNSEu3IM02SWgz68v08rSYhyzWg9JDJzbP3MlmCn5VZaywiECLJW6/ggAvoJPl5Tc/bR5hRMHLLhEiElHusUHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843618; c=relaxed/simple;
	bh=T7prcY2nI/ZwoCE0MgrfR2M+67rC+t0RwNSoWBptYsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAB5fGOd7b3KIG632aAcrtr5TG4KtTx45/ouLF6Ih0jgBSnu2flwc00wywNkUWbTMvSGvERy28JoGJDg08tAIpm5dq7bdaqb/nyCSSMfihxIHiv/tovXc9QfDgRzWZZMkF4b2rnq5mEeQ6ziiYisq3GiicO7xHXnDf/5kO+r4Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3YhEKAT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3YhEKAT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF491F000FF
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843616;
	bh=6DEx8NL2ooEKhzlVDk0zk6LAx7fyVMejbO1Mf3hj/iQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J3YhEKAT+viZrBs7ZjOJIapl7yXiWnPWOEBUFV0zn7wSX1GS6HGvHwEFJnyVqi8Rr
	 H7EslrRpLSvgW4eRNBWWsoa5UTkSsCmtKhy2WVCmzV5QFVP4p6Z7LkKY2IFSgBo0uJ
	 eu2eMadk8k8wDrCheBA7hXqO9hTpMZtkCqTmLsm3wuf8Epp3nJxxsJEuTHeA2QZslM
	 TZd51kltmhuDF16b8DltHqb1XqcsSr+wsEso+BTWn1045Wzs4lMwqR1BLrO5pGa+Gi
	 GaI4UJE4u9AzmpQTtj99+Q5PQ34QfYIEgCuNagtmHwnAocYSWxJYtukmOS2ulL97rS
	 xbbjBPbBUlpaA==
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-48f0056ef38so5944450fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 01:33:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+K5Elujd0wct49a5YcQ2IK/39PYTUxN4FT2Oci+QgL/INVHUCj+pON91bPHdSnY1JweZcOIj5zwKw@vger.kernel.org
X-Gm-Message-State: AFuF++mb94r24cydCWeujA0WD/Fz2Up/mbdt3A63GCYM+OFyNhT1Kbsi
	nzVoYRcjHWmjI87QCPPMNzuyKE2tgFWCc8PAuvU5xLQJ2QSWCQlneQ/gqcMdpEyJSYl665YRyZn
	MY/wjgdd2viVt5MzAr6mHtEakABLtqbw=
X-Received: by 2002:a05:6871:ca29:b0:49e:f:1e42 with SMTP id
 586e51a60fabf-49e000fb6eemr635625fac.60.1790843616055; Thu, 01 Oct 2026
 01:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com> <20260926-loongsongpio-v1-3-71de7ebebb76@gmail.com>
In-Reply-To: <20260926-loongsongpio-v1-3-71de7ebebb76@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:33:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLmRWGXBo8UP6RKt+HHCTam0NxaN6F1DK4XAjoQpoNujjg@mail.gmail.com>
X-Gm-Features: AclHuK-AksBm5_EIl1nkC1STjz2Vgpdh5qHKlyiDESPtzHBFnQbK11OzJ6lXLiM
Message-ID: <CAD++jLmRWGXBo8UP6RKt+HHCTam0NxaN6F1DK4XAjoQpoNujjg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] gpio: loongson-64bit: Add shared interrupt support
To: shankerwangmiao@gmail.com
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miao,

thanks for your patch!

On Fri, Sep 25, 2026 at 6:28=E2=80=AFPM Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> wrote:

> +struct loongson_gpio_shared_per_parent_irq_data {
> +       unsigned int parent_index;
> +       unsigned int parent_irq;
> +       /*
> +        * The lock of the irq_desc of the parent irq also protects
> +        * exclusive/usedby below. It must be taken before
> +        * lgpio->shared_irq_data->lock.
> +        */
> +       struct irq_data *parent_irq_data;
> +       struct loongson_gpio_chip *lgpio;
> +
> +       /*
> +        * exclusive: exclusive usage, only one gpio pin can use this par=
ent irq.
> +        *   It will happen in two cases:
> +        *     - The parent irq is used by a gpio pin which is edge trigg=
ered, and
> +        *       thus cannot be used by other gpio pins which are mapped =
to the same
> +        *       parent irq.
> +        *     - The parent irq is used by a gpio pin which is level trig=
gered, and
> +        *       the gpio chip lacks the polarity control register, and t=
hus the
> +        *       interrupt polarity is controlled by the parent irq contr=
oller, and
> +        *       thus cannot be used by other gpio pins which are mapped =
to the
> +        *       same parent irq.
> +        *   When set, the request for other gpio pins which are mapped t=
o this
> +        *   parent irq will be rejected.
> +        */
> +       unsigned int exclusive : 1;

So use bool exclusive;

> +       /*
> +        * usedby: When exclusive is set, these bits indicate the gpio pi=
n which
> +        *   is using this parent irq. When exclusive is cleared, these b=
its
> +        *   indicate the number of gpio pins which are using this parent=
 irq.
> +        * When both exclusive and usedby are 0, it means that the parent=
 irq is not
> +        * used by any gpio pin.
> +        */
> +       unsigned int usedby : 31;

Is this a bitmap? Then use a bitmap abstraction.

> +static void loongson_gpio_shared_irq_unmask(struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct loongson_gpio_chip *lgpio =3D to_loongson_gpio_chip(chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +       unsigned int parent_irq_index =3D lgpio->chip_data->irq_mapping(l=
gpio, hwirq);
> +       struct loongson_gpio_shared_per_parent_irq_data *ppid =3D
> +               &lgpio->shared_irq_data->per_parent_irq_data[parent_irq_i=
ndex];
> +       struct irq_data *parent_irq_data =3D ppid->parent_irq_data;

Just look at this code.

Clearly this needs refactoring, we can't have function heads looking
like this.

> +
> +       if (!lgpio->shared_irq_data->irq_in_use[hwirq])
> +               return;
> +
> +       guard(raw_spinlock_irqsave)(&irq_data_to_desc(ppid->parent_irq_da=
ta)->lock);
> +
> +       if (ppid->exclusive)
> +               parent_irq_data->chip->irq_mask(parent_irq_data);
> +
> +       scoped_guard(raw_spinlock_irqsave, &lgpio->shared_irq_data->lock)
> +               loongson_gpio_write_register(lgpio, lgpio->chip_data->int=
en_offset,
> +                                            hwirq, 1);

This locking is ... really hard to follow, what is going on?
It looks like code written by an LLM.

> +static int loongson_gpio_shared_irq_set_type(struct irq_data *data, unsi=
gned int type)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct loongson_gpio_chip *lgpio =3D to_loongson_gpio_chip(chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +       unsigned int parent_irq_index =3D lgpio->chip_data->irq_mapping(l=
gpio, hwirq);
> +       struct loongson_gpio_shared_per_parent_irq_data *ppid =3D
> +               &lgpio->shared_irq_data->per_parent_irq_data[parent_irq_i=
ndex];
> +       unsigned int intpol_offset =3D lgpio->chip_data->intpol_offset;
> +       struct irq_data *parent_irq_data =3D ppid->parent_irq_data;
> +       struct irq_chip *parent_irq_chip =3D parent_irq_data->chip;
> +       int ret =3D 0;

Again, what is this? I can't read functions that look like this,
even less maintain them.

> +       /*
> +        * When the irq is not exclusively used and is currently shared b=
y
> +        * more than one gpio pin; or is currently used by single gpio pi=
n and
> +        * the gpio pin is not the one requesting to set the irq type, th=
en the
> +        * irq type can only be set to level triggered.
> +        */
> +       if (!ppid->exclusive &&
> +           (ppid->usedby > 1 ||
> +            (ppid->usedby =3D=3D 1 && !lgpio->shared_irq_data->irq_in_us=
e[hwirq]))) {
> +               if (type !=3D IRQ_TYPE_LEVEL_HIGH && type !=3D IRQ_TYPE_L=
EVEL_LOW)
> +                       return -EBUSY;
> +
> +               /*
> +                * When exclusive is not set and usedby at least one, the=
 gpio chip must
> +                * have intpol register to control the interrupt polarity=
. We will never
> +                * reach here if the gpio chip lacks intpol register, bec=
ause in that
> +                * case, exclusive will be set no matter what trigger typ=
e is requested.
> +                */
> +               BUG_ON(!intpol_offset);
> +               /*
> +                * Since only level triggered irqs are allowed to be shar=
ed, we can
> +                * safely set the intpol register without first disabling=
 the pin in
> +                * inten register.
> +                */
> +               scoped_guard(raw_spinlock_irqsave, &lgpio->shared_irq_dat=
a->lock)
> +                       loongson_gpio_write_register(lgpio, intpol_offset=
, hwirq,
> +                                                    type =3D=3D IRQ_TYPE=
_LEVEL_HIGH);
> +
> +               if (!lgpio->shared_irq_data->irq_in_use[hwirq])
> +                       ppid->usedby++;
> +
> +               irq_set_handler_locked(data, handle_level_irq);

I like the attention to detail here though!

> +static void loongson_gpio_shared_irq_shutdown(struct irq_data *data)
> +{
> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
> +       struct loongson_gpio_chip *lgpio =3D to_loongson_gpio_chip(chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
> +       unsigned int parent_irq_index =3D lgpio->chip_data->irq_mapping(l=
gpio, hwirq);
> +       struct loongson_gpio_shared_per_parent_irq_data *ppid =3D
> +               &lgpio->shared_irq_data->per_parent_irq_data[parent_irq_i=
ndex];

Here again some crazy function header.

I think some helpers need to be broken out so the code becomes more
readable, see what you can do with it to make it easier to follow.

Yours,
Linus Walleij
