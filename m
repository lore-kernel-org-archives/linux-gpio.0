Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94EF3DEAD6
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845160; cv=none; b=RvdBy4LtkOKnXJP+JGiD/Wl5YCvA8u24YvkiUtlv1sNUZqJQxYZmsK//3HYI2QnsWUf0/thh/jYYyOlQNHFrAQ7oiH6vBvQ58C2m3tCKCopERRM3VtdABXTodlaT5HQVLdtm+hK+FrdzEYvYkum/Euf7Rd02bhXdvKGyI/hVQhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845160; c=relaxed/simple;
	bh=DS7OLlNSCK3vQg+TDkp83MQ8PB2bb4TRuWhxWsFboCk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=W/gApKrK3dLJxOUoU2mtIAaR+tdl8JJSXzVg58e+Mu8N4afXRU7HtEbxcFYbTfNgLfrSpz5/bnYJxu2MZYcXHzD5YuD9zNMibSQ/0OUrMkwH+ZQxQ5QehY/r9I+vW5cfeHq1ilQuga5RRaHWX/y49KpabjtsdWsEBQVdg314FFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2s+dNdw; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2s+dNdw"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8523cc8262cso188199b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790845158; x=1791449958; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cUMI2RP09NUYenxs9TLo0y20PPiTrdi7Sx8OcZ7KL9Q=;
        b=V2s+dNdwmbnh8cNa1S3wYGo5hj4hU4mY6R0yXhuNWj1xOUrlmxMh2EJxYtfpvxHc9q
         G3h+8VAZm46YYMF7/WIUJkwLiS62XNsSU9ko5VVCon7TXQaUVejfzcG08jPbc/stQ8G2
         d/1cKcgYxC2SA5kWapIuABDvslnFTsoVQDNVGk8o/S8T7OwUW0Rlsrl2+stF81qC2eXI
         B3g4cGlDUIZ3Ho4aMYCbNW05Md1TyXOXWyDy9h+dZoat7yeqonnUXZS6jhZ0seWy/mmi
         oewz3w/VqUCUF5/DAhKkkYDAgwYLdyTIJjQWbsUYtelxx9jHqDgglj/mwirLifpaKZUu
         PT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845158; x=1791449958;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cUMI2RP09NUYenxs9TLo0y20PPiTrdi7Sx8OcZ7KL9Q=;
        b=Q/yta+/WbZXPGRkEjx9zsZ/ZUQVNMtZ5kj4O111MMpOiyg8DTVHEII6HUZksEC1Jsu
         g3xBkq9mxONVN3f0xXTllZ8mMi1LduPSDMX4a4HejHgBvzWaXjTf4wAk3EtsO0vtQf6J
         M/cqDi7WLuWM0rfKUS42IrTCvkeOVO6KL9oSG5XUvoimP/ZrxpCb8zCyndl2QMiY26qH
         IzAH9rJ2RnDXWKI+jmmOz4eJD32POYr15CWv543E+gPSU06oMdXIs01gegQ4J1a7n8gP
         5v3eNJ4w9giWSExBfNVbaG8eAcl9Cm1z9aFeNB1/T6ingYjGZ7nAqdmk+IpQ4Y2EcHBi
         SXew==
X-Forwarded-Encrypted: i=1; AKwUvBztSSdVQ/B7A8VoydGEbFjcajVimx/ZRcDMHGMipQcYXlYeBWbBDwWq5FKgD0jnS8UzI10boJ59pRoH@vger.kernel.org
X-Gm-Message-State: AFuF++kSCKfA0E/8F17UqDvM+e6ZFaM8cKqhl5JGXCHRFBceA5YPDNVQ
	HC31bY1TPviCrynkfgI6SSuZVEwLFFPVbRj2IwrJ4bXZp534as7TYPZ3eHxUNg==
X-Gm-Gg: AYBFou3DO8+DOeXnvTj7kb96VyXwqkQYvvAvVhQBs0pFEdrCDANc0/mARGk7EQ6Tklf
	KB/eFYaZLL4QXCGZcI28iWCXVtk+ohwUsCQ8bTnwlRtJnjHA/RFBj89SU53IkTomKMcDX4ocQmo
	BOoa3jBHitgO94lp2mkDPHZkFw/t+GVM1fnwVBFRB1URwfrpG4DCNKLzlUjZQD2VQ8lFBFR2Gai
	zbPrYMzGT+4K4MY1C97sqky4efAFqwPEJfRD5DGVDrQk5D56zLwmkp/JOQVwjcpcWWeG6eMBiZg
	n05qSnuVsma37uj5Rsax3yWKNaJr2WwrnhzjN5WRZRugLHPI7biuoqqpupW3JIn4o+Di1ijpqg8
	uhKh9rXVygSQE9E0GxhdmrxWYZ2TJLGXbNUU8u7M5RNKgy0nBi+ELB2bU1pQF5pdmMs/KrrwMhh
	fP12pQu66uELK/n1fZvqACYrjf+sNt1GvOUnf3J6d97FnCZR28L4zJ/8QmYuGOHVL3ey92vLxsW
	0rFcMEeO+kwPJ/4LRAHeAcqvKZFSg==
X-Received: by 2002:a05:6a00:4a06:b0:881:f876:1f38 with SMTP id d2e1a72fcca58-88749513901mr3262525b3a.1.1790845157798;
        Thu, 01 Oct 2026 01:59:17 -0700 (PDT)
Received: from [10.7.1.8] ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888197d337dsm736928b3a.51.2026.10.01.01.59.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:59:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH RFC 3/4] gpio: loongson-64bit: Add shared interrupt
 support
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAD++jLmRWGXBo8UP6RKt+HHCTam0NxaN6F1DK4XAjoQpoNujjg@mail.gmail.com>
Date: Thu, 1 Oct 2026 16:59:03 +0800
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6A08AB5-069E-4CC6-8CA0-DEF22F369208@gmail.com>
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
 <20260926-loongsongpio-v1-3-71de7ebebb76@gmail.com>
 <CAD++jLmRWGXBo8UP6RKt+HHCTam0NxaN6F1DK4XAjoQpoNujjg@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)

Hi Linus,

Thanks for your suggestions.

> 2026=E5=B9=B410=E6=9C=8801=E6=97=A5 16:33=EF=BC=8CLinus Walleij =
<linusw@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Miao,
>=20
> thanks for your patch!
>=20
> On Fri, Sep 25, 2026 at 6:28=E2=80=AFPM Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>=20
>> +struct loongson_gpio_shared_per_parent_irq_data {
>> +       unsigned int parent_index;
>> +       unsigned int parent_irq;
>> +       /*
>> +        * The lock of the irq_desc of the parent irq also protects
>> +        * exclusive/usedby below. It must be taken before
>> +        * lgpio->shared_irq_data->lock.
>> +        */
>> +       struct irq_data *parent_irq_data;
>> +       struct loongson_gpio_chip *lgpio;
>> +
>> +       /*
>> +        * exclusive: exclusive usage, only one gpio pin can use this =
parent irq.
>> +        *   It will happen in two cases:
>> +        *     - The parent irq is used by a gpio pin which is edge =
triggered, and
>> +        *       thus cannot be used by other gpio pins which are =
mapped to the same
>> +        *       parent irq.
>> +        *     - The parent irq is used by a gpio pin which is level =
triggered, and
>> +        *       the gpio chip lacks the polarity control register, =
and thus the
>> +        *       interrupt polarity is controlled by the parent irq =
controller, and
>> +        *       thus cannot be used by other gpio pins which are =
mapped to the
>> +        *       same parent irq.
>> +        *   When set, the request for other gpio pins which are =
mapped to this
>> +        *   parent irq will be rejected.
>> +        */
>> +       unsigned int exclusive : 1;
>=20
> So use bool exclusive;
>=20
>> +       /*
>> +        * usedby: When exclusive is set, these bits indicate the =
gpio pin which
>> +        *   is using this parent irq. When exclusive is cleared, =
these bits
>> +        *   indicate the number of gpio pins which are using this =
parent irq.
>> +        * When both exclusive and usedby are 0, it means that the =
parent irq is not
>> +        * used by any gpio pin.
>> +        */
>> +       unsigned int usedby : 31;
>=20
> Is this a bitmap? Then use a bitmap abstraction.

When exclusive is 1, it is a pure number while when exclusive is 0,=20
it is a bitmap.

>=20
>> +static void loongson_gpio_shared_irq_unmask(struct irq_data *data)
>> +{
>> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
>> +       struct loongson_gpio_chip *lgpio =3D =
to_loongson_gpio_chip(chip);
>> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
>> +       unsigned int parent_irq_index =3D =
lgpio->chip_data->irq_mapping(lgpio, hwirq);
>> +       struct loongson_gpio_shared_per_parent_irq_data *ppid =3D
>> +               =
&lgpio->shared_irq_data->per_parent_irq_data[parent_irq_index];
>> +       struct irq_data *parent_irq_data =3D ppid->parent_irq_data;
>=20
> Just look at this code.
>=20
> Clearly this needs refactoring, we can't have function heads looking
> like this.
>=20
>> +
>> +       if (!lgpio->shared_irq_data->irq_in_use[hwirq])
>> +               return;
>> +
>> +       =
guard(raw_spinlock_irqsave)(&irq_data_to_desc(ppid->parent_irq_data)->lock=
);
>> +
>> +       if (ppid->exclusive)
>> +               parent_irq_data->chip->irq_mask(parent_irq_data);
>> +
>> +       scoped_guard(raw_spinlock_irqsave, =
&lgpio->shared_irq_data->lock)
>> +               loongson_gpio_write_register(lgpio, =
lgpio->chip_data->inten_offset,
>> +                                            hwirq, 1);
>=20
> This locking is ... really hard to follow, what is going on?
> It looks like code written by an LLM.

No, it is written by my hand. lgpio->shared_irq_data->lock is used to =
protect
the irq related registers of the GPIO controller. It is necessary =
because writing
to a bit of a register may involve RMW, which is not atomic. As a =
result, every
call to loongson_gpio_{read,write}_register is protected by this lock.

>=20
>> +static int loongson_gpio_shared_irq_set_type(struct irq_data *data, =
unsigned int type)
>> +{
>> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
>> +       struct loongson_gpio_chip *lgpio =3D =
to_loongson_gpio_chip(chip);
>> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
>> +       unsigned int parent_irq_index =3D =
lgpio->chip_data->irq_mapping(lgpio, hwirq);
>> +       struct loongson_gpio_shared_per_parent_irq_data *ppid =3D
>> +               =
&lgpio->shared_irq_data->per_parent_irq_data[parent_irq_index];
>> +       unsigned int intpol_offset =3D =
lgpio->chip_data->intpol_offset;
>> +       struct irq_data *parent_irq_data =3D ppid->parent_irq_data;
>> +       struct irq_chip *parent_irq_chip =3D parent_irq_data->chip;
>> +       int ret =3D 0;
>=20
> Again, what is this? I can't read functions that look like this,
> even less maintain them.
>=20
>> +       /*
>> +        * When the irq is not exclusively used and is currently =
shared by
>> +        * more than one gpio pin; or is currently used by single =
gpio pin and
>> +        * the gpio pin is not the one requesting to set the irq =
type, then the
>> +        * irq type can only be set to level triggered.
>> +        */
>> +       if (!ppid->exclusive &&
>> +           (ppid->usedby > 1 ||
>> +            (ppid->usedby =3D=3D 1 && =
!lgpio->shared_irq_data->irq_in_use[hwirq]))) {
>> +               if (type !=3D IRQ_TYPE_LEVEL_HIGH && type !=3D =
IRQ_TYPE_LEVEL_LOW)
>> +                       return -EBUSY;
>> +
>> +               /*
>> +                * When exclusive is not set and usedby at least one, =
the gpio chip must
>> +                * have intpol register to control the interrupt =
polarity. We will never
>> +                * reach here if the gpio chip lacks intpol register, =
because in that
>> +                * case, exclusive will be set no matter what trigger =
type is requested.
>> +                */
>> +               BUG_ON(!intpol_offset);
>> +               /*
>> +                * Since only level triggered irqs are allowed to be =
shared, we can
>> +                * safely set the intpol register without first =
disabling the pin in
>> +                * inten register.
>> +                */
>> +               scoped_guard(raw_spinlock_irqsave, =
&lgpio->shared_irq_data->lock)
>> +                       loongson_gpio_write_register(lgpio, =
intpol_offset, hwirq,
>> +                                                    type =3D=3D =
IRQ_TYPE_LEVEL_HIGH);
>> +
>> +               if (!lgpio->shared_irq_data->irq_in_use[hwirq])
>> +                       ppid->usedby++;
>> +
>> +               irq_set_handler_locked(data, handle_level_irq);
>=20
> I like the attention to detail here though!
>=20
>> +static void loongson_gpio_shared_irq_shutdown(struct irq_data *data)
>> +{
>> +       struct gpio_chip *chip =3D irq_data_get_irq_chip_data(data);
>> +       struct loongson_gpio_chip *lgpio =3D =
to_loongson_gpio_chip(chip);
>> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(data);
>> +       unsigned int parent_irq_index =3D =
lgpio->chip_data->irq_mapping(lgpio, hwirq);
>> +       struct loongson_gpio_shared_per_parent_irq_data *ppid =3D
>> +               =
&lgpio->shared_irq_data->per_parent_irq_data[parent_irq_index];
>=20
> Here again some crazy function header.
>=20
> I think some helpers need to be broken out so the code becomes more
> readable, see what you can do with it to make it easier to follow.

I did notice that the header of these functions are duplicated and are a =
bit long.
However, multiple of the variables defined here will be used later. It =
is not
obtaining B from A, C from B, and D from C and only using D later, so =
that we can
introduce a helper to obtain D from A. The problem here is that C and D =
will both
be used later. What's your idea about the styling here?

Cheers,
Miao Wang

