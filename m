Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBBFF9E8
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417368; cv=none; b=Ss4n6gDqWv1iWmlan89XPMUXlLEg5Ug8dr5GqYuzuttXKbz8uI/MdqQvLcMi44SWZmfWO/pLIyOtF2lDYeqPAydwPC+VA4tx144sDEKb+Zc8MZd8l+3A92ZI/Zx+oT1/I2N0S0c3Q6CEkhmHgG++J3gw3odD9vOstKFwo9TXG+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417368; c=relaxed/simple;
	bh=FxNS7yMeaMMGExS9oCTJFUcXG9yW3cZSU+vkw2ft85g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9C7mHbYeDpKxo87nhFngck/mNP/+Douffs57ePmPAmZPyOrrVv8hvdMOEe3TazGx7dgFftphvxe86+sN5MfOw6KHdoJN5tZarUBw7jRgDABp60HQ/pP9vqxiu0k2ZVwbKAE1qZ1j6031f6ZGew7zGiEQmYYh0oRVHaGJeGaMCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejOiCzrf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejOiCzrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8DEC2BCAF
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769417368;
	bh=FxNS7yMeaMMGExS9oCTJFUcXG9yW3cZSU+vkw2ft85g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ejOiCzrfB3ugjKY8fmB0dIhqllk0jbGF3e1woLrmRLZr7Z93QrepiNjuBBLhEeXwQ
	 nKf9UB/jab2wnRYqRJSL51ro/QIGTdj/g2EBPZhIMp0RQVa3lCxGeo6232+T4pi4Cb
	 /43+XEVFCbGH7j2aTJcdlP6B/9wsKooq2MLuhPDRWE2OP0P4RALiWHI98RXPEqHJUv
	 a0jUGmFEr4XLh5x4heuW9QV20KEq59fFCIT64GYlyQLniH3r4RQAlnkczZGu/N6s2J
	 nd5GLh6V31ZnrsUcfn5hXjuM8jzF2oqpuOOMigAUX5vhiLQns7hKZcSpRjGZh4L/Xo
	 rYGaQIYEa+X+g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dcdf60427so5012658e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 00:49:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWLPfM+Q7GOY0XpkcbZlpyo/OxOjDXSacBne3nkrPSaWDVxpYGaqyp0CwJkP51mrBdJTJZ3GifJr3Q/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz42YD4AXaxMEGIoQjs4HYEt5cNw9V5v9cNGVeMdy+qYt2WN6qd
	1ydDQwNJYKxRQphhkrl+j67hx07Aeef6yb7X0uJm2th52qtLLl7fvka2xhQX+MxpjTeq1wJh6bs
	/lMxO7Vc96OuqAzsreIZcAgf/VENWUQcM0Ar4tsaZXA==
X-Received: by 2002:a05:6512:10c1:b0:59d:d64e:b3d7 with SMTP id
 2adb3069b0e04-59df3a82273mr1300484e87.46.1769417367064; Mon, 26 Jan 2026
 00:49:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
 <cb13c3df-be09-4cf3-b679-4431862d7264@arm.com> <CAMRc=MfUawHpDgxj=fP2OF_-qg1O+P3oM_cSvGsbvAdLRB=+hw@mail.gmail.com>
 <3204984.tdWV9SEqCh@diego>
In-Reply-To: <3204984.tdWV9SEqCh@diego>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 26 Jan 2026 09:49:15 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdNkjp6gZJcdTMoFtvQo8kW4damvNFA3+MhVbXhFU7D9w@mail.gmail.com>
X-Gm-Features: AZwV_Qid_m7MIJWeeUTftl8ot9-gB4gBnX-3Xp4Ry9ijoNtlg41NuwGQDS78pYc
Message-ID: <CAMRc=MdNkjp6gZJcdTMoFtvQo8kW4damvNFA3+MhVbXhFU7D9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Robin Murphy <robin.murphy@arm.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 2:23=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Samstag, 24. Januar 2026, 22:07:12 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Bartosz Golaszewski:
> > On Sat, 24 Jan 2026 00:45:25 +0100, Robin Murphy <robin.murphy@arm.com>=
 said:
> > > On 2026-01-23 9:52 pm, Heiko St=C3=BCbner wrote:
>
> [ snip to get to the core question at the bottom ]
>
> > > diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pin=
ctrl-rockchip.c
> > > index e44ef262beec..2fc67aeafdb3 100644
> > > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > > @@ -3545,10 +3545,9 @@ static int rockchip_pmx_set(struct pinctrl_dev=
 *pctldev, unsigned selector,
> > >     return 0;
> > >   }
> > >
> > > -static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctld=
ev,
> > > -                                      struct pinctrl_gpio_range *ran=
ge,
> > > -                                      unsigned offset,
> > > -                                      bool input)
> > > +static int rockchip_pmx_gpio_request_enable(struct pinctrl_dev *pctl=
dev,
> > > +                                       struct pinctrl_gpio_range *ra=
nge,
> > > +                                       unsigned int offset)
> > >   {
> > >     struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev=
);
> > >     struct rockchip_pin_bank *bank;
> > > @@ -3562,7 +3561,7 @@ static const struct pinmux_ops rockchip_pmx_ops=
 =3D {
> > >     .get_function_name      =3D rockchip_pmx_get_func_name,
> > >     .get_function_groups    =3D rockchip_pmx_get_groups,
> > >     .set_mux                =3D rockchip_pmx_set,
> > > -   .gpio_set_direction     =3D rockchip_pmx_gpio_set_direction,
> > > +   .gpio_request_enable    =3D rockchip_pmx_gpio_request_enable,
> > >   };
> > >
> > >   /*
> > >
> >
> > I'm not sure what's going on here. You don't really need to call
> > pinctrl_gpio_direction_input/output()?
>
> No we actually don't.
>
> The current _set_direction function:
>
> static int rockchip_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
>                                            struct pinctrl_gpio_range *ran=
ge,
>                                            unsigned offset,
>                                            bool input)
> {
>         struct rockchip_pinctrl *info =3D pinctrl_dev_get_drvdata(pctldev=
);
>         struct rockchip_pin_bank *bank;
>
>         bank =3D pin_to_bank(info, offset);
>         return rockchip_set_mux(bank, offset - bank->pin_base, RK_FUNC_GP=
IO);
> }
>
> really only ever touches the pinmux and has nothing to do with setting
> the direction, which is solely the task of the gpio-controller/-driver.
>
> So moving that to the request callback would likely solve all our current
> problems?
>
> Heiko
>
>
>

If that fixes the issue, allows us to revert cansleep to false and
doesn't cause any problems - yes, for sure.

Do you want to send a patch?

Bartosz
