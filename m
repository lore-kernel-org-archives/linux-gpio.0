Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D17457E69
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142022; cv=none; b=lovpbt8ROJbrV0EYqAhVlRRnj8AP5DqNFvdtT73x8iq5yOWateT2Ss4sQyM+KOTYNYYmrUJbh67t5WXoXJ7YhflfaVa+uWFoEOYQmvtVd1I0QVbFvVP/3BxMk2Zz/wxP5pLfdwGgtWQZoQT/o1Vd0SDsmDLQtn92vzrzOXp6Ui0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142022; c=relaxed/simple;
	bh=n3KdobETTVuz7fcHeH4lrKwLcMcsgWk3U6bQYdigMGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lW1CzM/fuGA50BKWw8Jx1I88oJWNoik2FHbeaDfTD8KHiYwwTRlsagkZBsfBokzCmU+2FZrTWFGOAmRY0dSFnJou/yBFjiOBPx2yBXHb3SZ9nBu079sosek4oojhQ7le/LUUQVWt61HQ02qyYm9skwNg3RuugwofPcj1YaX41vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ylc4MP6s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ylc4MP6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850321F000C9
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792142021;
	bh=5i6MhlYke8rnqKO/tS98g5fBrnPRxzSkJ1XspPZU0EE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ylc4MP6shCeSJV4WrGsrfrjjA/Fz8tO0A+VDlxgExXH9rrTOXeyGrHARmllzf3Zr8
	 T2H+Bkd5SvDMAreRqiewzPCByEFzDEo4EEdDfAWEmGey38Owg9KqeUXmUbpgbSad66
	 OzT2ZyWl/NuZVjnKm8EHBlUtD8/+ygkrIKh0soevDAva5qxApnwYfgG3kNkdX1VJzy
	 Vo4VU/Z7rKdETYzdpEAJio8clCXfAID1Vu92GR2vKVV6Cp3FeR+Bjvsh3nhwLxxTjr
	 hI9qRrtEZuxR6/QrneYK4bWvw+NFhXP3yWeWgwwjsQxvac2bJQDfF69YgEyoHZevIc
	 IU0nC4ulTDzVA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso2450748e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 02:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByg/g6HmrG1qHTy0jUqeOSdIQgIMsggYvAXwCNWR4lVb7Ly0BmywqOv5a6jBqt+ms8T8GptkQz1Hypq@vger.kernel.org
X-Gm-Message-State: AFq9FYKrc3hUyG9Zsiorx8yUKUm6C6LNmLcI5s5chbQH0LXu9/NKx49b
	Cl2KOXeEE1ZJHlRTnQn9vDu6kVH/AcA+hHFPZckl0lTIMjoxg6hYsyON1Z3YzdhGNhA+DrG2Wih
	zmhe/ImbHbI+IjitYgpO84Uzy5GFRoX0=
X-Received: by 2002:a05:6512:2251:b0:5be:323a:358f with SMTP id
 2adb3069b0e04-5be323a362bmr3949389e87.24.1792142020304; Fri, 16 Oct 2026
 02:13:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com> <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
 <as8+sqlBEuhfdtZ8@shlinux89>
In-Reply-To: <as8+sqlBEuhfdtZ8@shlinux89>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 11:13:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com>
X-Gm-Features: AclHuK-rmknBFrbVZQXIDXh4F4e2O13GZgGSgm2vgJ2GpZVzPlYS8PS1UAie0Ck
Message-ID: <CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com> wr=
ote:
> On Wed, Oct 14, 2026 at 01:10:48AM +0200, Linus Walleij wrote:

> >Hi Peng,
> >
> >On Sun, Oct 11, 2026 at 1:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> >
> >>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
> >>                 unsigned int offset, unsigned long conf)
> >>  {
> >> -       struct device_node *np =3D port->dev->of_node;
> >> +       int ret;
> >> +
> >> +       if (!mxc_gpio_has_pad_wakeup(port))
> >> +               return false;
> >
> >Why is the entire call to mxc_gpio_generic_config()
> >bailing out here if the port does not have pad wakeup?
> >
> >> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> >> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> >> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> >> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> >> -                                               offset, conf) =3D=3D 0=
);
> >> +       ret =3D gpiochip_generic_config(&port->gen_gc.gc, offset, conf=
);
> >> +       if (ret)
> >> +               return false;
> >
> >Then no generic config can happen.
> >
> >This looks weird, isn't it just some of the configs that
> >don't work?
>
> The early return is correct and matches the original behavior - only
> i.MX8 SoCs with SCU have pad wakeup hardware.
>
> gpiochip_generic_config() here calls into the pinctrl backend's
> pin_config_set(), which on i.MX8 programs the SCU firmware with the
> PAD wakeup source type.  Non-i.MX8 SoCs don't have an SCU pinctrl backend=
.
>
> The function name is misleading - its only caller is mxc_gpio_set_pad_wak=
eup().

This is just a big hack and I want it removed.

Implicit in this reasoning is: the only config we support on
the pinctrl back-end is wakeups so let's gate the entire function
call if we don't support wakeup.

This is a *generic* back-end like the function says:
gpiochip_generic_config() so the GPIO driver can't make
assumptions about what the pinctrl backend can and
cannot do. In a new SoC using the same driver the
pinctrl back-end could be something different.

So this is breaking modularization and encapsulation.

It is better to let the pin controller return -ENOTSUPP
or whatever is appropriate instead of gating the
call like this,

Yours,
Linus Walleij
