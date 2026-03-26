Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611630216D
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533291; cv=none; b=EyWQSWhIFr9aVes6vzxcLoniHLya2gcNLlS/bo7VumPntqdRyCaA5W1FXI8hi6sso4CSk7inzj/r1Igvjm0nzSLYvH5SLMOCnaPLIB29NyLhztfe9Y95fQu+XPc/fMqCN2g61W/rTD1QtSA2PlXlDcy1SmA8r9PsET0x+zsJJAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533291; c=relaxed/simple;
	bh=fXGs19NsXEECc/WRjysd6IHGu58ST8EfrQSfa0r89BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+8CgqyC4c+eHKMBdv9ySISyvFtOMm3NKBlmVKaYnDen7jvM2Uq0YV7Xa7zCSn0H5sDUjbhjtBMgB/s9NVLReqqq8PCVtXixpm0AxpPfE3PWnzoVQ5wIp7vtkV4OBeEL08rP62MQDisYDWGuubEP3LO0kLUnfeSgw2TvJ9J+Eb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GD4HTdcA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GD4HTdcA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 088E4C2BCB1
	for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774533291;
	bh=fXGs19NsXEECc/WRjysd6IHGu58ST8EfrQSfa0r89BE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GD4HTdcAPNEvx4UFryBaPRKjsoPzWorP1w1Oy7bYY0VCOIhpTtUemMWjVutUHII5S
	 o/7KNB9+WX5rDHYdTB+BMxM9IEAKJaf10qxKikv2WyiYuTfCe+x4Do486wePQi4l1i
	 H00wmsP5eetU3AJHXmqpjIGhi/wC094/3nPnRyksNbABnL4FPjgq5BmnNfEZxOqhKe
	 gA1bBDcqC6HnPZtgDp0KOk2uMeP7n/NpL4Vd+eB7Pj53jxDbtmHcoRFhfYb80laDUa
	 0CxfdKSGzwZY2Ito76rK7vj5idFK8YHsjRt8G04T0UPfWDGELqI5NgtULaB9v0LMyN
	 qKBvpSGjJiL3A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38c26612508so7687341fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Mar 2026 06:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU78kXwbbGAyZt6FNsLlMEHxDgcSg2r7DjiBZAgSGh1bl1uFttOP/YQDHxE7FXPmDTMc9cXDqCwi95P@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMOvllwy0iuE1bWeDk9EHmVH0nYV3TsAj1OybEMxN3fqsMgz1
	0St+FAepSubmJvXLatlq/a7+a8eaQvB71hHz6zKgHZVh+pM2dbaDzldBzFoU6jXR6V0jtsgLzCo
	QiUCdoZUNNFKT5r4grOs6NxuH2HD0HErX962/vBBGiw==
X-Received: by 2002:a05:651c:e0a:b0:38c:6979:f76d with SMTP id
 38308e7fff4ca-38c6979fd5dmr3438721fa.17.1774533289615; Thu, 26 Mar 2026
 06:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325-gpio-hogs-multiple-v1-1-7e3a7347f0d6@oss.qualcomm.com> <CAMuHMdVpQ_HmqXqB=MwJJYbNKgNvrb0ZdbNbiiz=CXK1qECBEQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVpQ_HmqXqB=MwJJYbNKgNvrb0ZdbNbiiz=CXK1qECBEQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Mar 2026 14:54:35 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfHDVLE51WF9UdBbJOQ0mktO3tQYZ4=zXa6WPWV0bMq6Q@mail.gmail.com>
X-Gm-Features: AQROBzC5m80_R-Bk5fk-q5rFjHQdTTDfMNWZx8NFfUlVLeYAQedrFeEd4N9-krQ
Message-ID: <CAMRc=MfHDVLE51WF9UdBbJOQ0mktO3tQYZ4=zXa6WPWV0bMq6Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix hogs with multiple lines
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 7:42=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Wed, 25 Mar 2026 at 11:18, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > After moving GPIO hog handling into GPIOLIB core, we accidentally stopp=
ed
> > supporting devicetree hog definitions with multiple lines like so:
> >
> >         hog {
> >                 gpio-hog;
> >                 gpios =3D <3 0>, <4 GPIO_ACTIVE_LOW>;
> >                 output-high;
> >                 line-name =3D "foo";
> >         };
> >
> > Restore this functionality to fix reported regressions.
> >
> > Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Closes: https://lore.kernel.org/all/CAMuHMdX6RuZXAozrF5m625ZepJTVVr4pcy=
KczSk12MedWvoejw@mail.gmail.com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Thanks, that fixes the issue I saw on Marzen
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -938,12 +938,12 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct=
 fwnode_handle *fwnode)
> >         struct fwnode_handle *gc_node =3D dev_fwnode(&gc->gpiodev->dev)=
;
> >         struct fwnode_reference_args gpiospec;
> >         enum gpiod_flags dflags;
> > +       const char *name =3D NULL;
> >         struct gpio_desc *desc;
> >         unsigned long lflags;
> > -       const char *name;
> > +       size_t num_hogs;
> >         int ret, argc;
> > -       u32 gpios[3]; /* We support up to three-cell bindings. */
> > -       u32 cells;
> > +       u32 cells =3D 0;
>
> Shouldn't the default be 2?
>

For DT I suppose there's no real "default" but it does make sense to
set it to 2 for the generic fwnode path.

> >
> >         lflags =3D GPIO_LOOKUP_FLAGS_DEFAULT;
> >         dflags =3D GPIOD_ASIS;
> > @@ -952,43 +952,21 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct=
 fwnode_handle *fwnode)
> >         argc =3D fwnode_property_count_u32(fwnode, "gpios");
> >         if (argc < 0)
> >                 return argc;
> > -       if (argc > 3)
> > +
> > +       ret =3D fwnode_property_read_u32(gc_node, "#gpio-cells", &cells=
);
>
> Should this call be protected by is_of_node(), like in the old code?
>

Not necessarily. We may end up using it with software nodes for
instance. I'd keep it global.

> > +       if ((ret && is_of_node(fwnode)) || (!ret && (argc % cells)))
> >                 return -EINVAL;
> >
> > +       num_hogs =3D ret ? 1 : (argc / cells);
>
> While you avoid modulo and division by zero due to the check for ret,
> using a default would let you always validate argc against cells,
> and remove the need for special casing num_hogs.
>
> > +
> > +       u32 *gpios __free(kfree) =3D kcalloc(argc, sizeof(u32), GFP_KER=
NEL);
>
> kzalloc_objs()?
>

True.

Bart
