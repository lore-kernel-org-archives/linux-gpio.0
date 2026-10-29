Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279200;
	b=e99TFurZ6HRx4e0+uN5yWiP0xgIWKUYyi2j/+aj0Ikh7VQXy9xuzBIPvxg3dQVcK7se8
	 eXAQ0i9QrTMVHsb/S5IJH4YJ9AUavSWdBiNsB32lmedchLuSXWlW6+eJoxgjFuRdBW78b
	 zWA165dqZppnVRiEq8LeWGvVfooJ7CN003d/eAWR73NmPXBP3tuZDxmwc8+4I+HYhMd8A
	 KUgic/K7MmSYG7sPmN9lVyiCiQij6CL/l7mBZ9yXAPIPh9r/gWeV9ms/f/E2hJiU8q9hX
	 3Adk+fkgWgy1DI85SpCK8gcoKOUHgp3w6+FG9qYa5oZDP7GzCTtXbZ+F306+gSpHeBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279200;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j9d8HMdPOBLx2izzwVSbxm7Ew442zRczjYj1drdD8eQ=;
	b=vXH2bUPXeost2Pg/5nh8OPN8UnnDbmVKoofSuPwgjG7vXPiPV6gyxh9lz40Xpk7yLcWK
	 w3XTLe3ukNrmsVFdmk+fEeCyyYP5mUSeNA+glkLGMqLL4d+f3ZMsn/zmnC0pwZ3Gj8LNA
	 oAINwb6teNN48r+7277Bm+hmUztJTEEa7lbNq9GcRwmAvwOLv3tjq1rzyK4F/kSG7eQjj
	 BShAwqolaorR1hqGrpvLzvrDItUIY40htgLBulJgcagoUxsH3bLqSBSlJODMhPhpbMBf5
	 34M1oovrTbb0dGMK7Pq0Pw64K6VsIn7FXhKkoMzKmgRih/SfNJ0mYqzEL60sUk9HOdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UW+EsRMb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A37606A31A
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UW+EsRMb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C0A1F031E0
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793279200;
	bh=j9d8HMdPOBLx2izzwVSbxm7Ew442zRczjYj1drdD8eQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UW+EsRMbpOtnUZJkL8ULWM5F+FbBi+YSir5WfgzdfSKmr6/u6RtLOLbhJwMK7BrCF
	 uY2O453fYdRT+aSNSC1mIrI7t0sHIXqG/76ihb2yGfkOO1bHRdBzTptMhiboZBw0H2
	 TdTfapOKcyNEECz2evB3TcNtspTWG7MkcAuvmYuFdzULWZi5w7uAZij8wg00ebVjh4
	 utinmmVi/ORqAcByLiH5BaeysrsnoQmEQAdBzOPyDsV05xYIYRiFuTAHRnyJfjR0i3
	 XNahjKRB1nbTWiLXxv4UGWhePRsI9XHc2M0xsaNSjxzFQDYBr65X30FrK2u6zXqqYm
	 X4noo7VDlEtUA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso2032764e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 06:06:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZPQWci3vfZLmfaNWodh+w+UMBbJxKtDj6reDkhPdWX/pCONknmUCzTWECI8cEGWgqNsOzrk2NB56M@vger.kernel.org
X-Gm-Message-State: AFq9FYLi+lYyGpz/+w8AxY4NsIm0SN8tSutY/wDDyNCnAlmvM3KqMEy4
	6NZAnX1N0puVLfH8hLJlAp+nzJUtXLbEJDj4sFwjz0l4b0XtupASenYnckiNG+dTqZS/rTr1z+i
	8dKfPsBwxfuwUn64SZInh0LKlT6EpFzE=
X-Received: by 2002:a05:6512:3c9a:b0:5be:50d5:1909 with SMTP id
 2adb3069b0e04-5bfcad58b3dmr2147748e87.27.1793279198981; Thu, 29 Oct 2026
 06:06:38 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com> <CAD++jLnDxTAz2=ge5RgvO02mp+BJyLBV0zR8xqsm8LSsSEcRYQ@mail.gmail.com>
 <as8+sqlBEuhfdtZ8@shlinux89> <CAD++jL=tKnT0qr5chD-fhxgTM-f9kcdFRsKVBbbqionBp9iTyw@mail.gmail.com>
 <atIqPOBaflct369Q@shlinux89>
In-Reply-To: <atIqPOBaflct369Q@shlinux89>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 14:06:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=nkoYnPfU_swDYrtrxNZtAy+yq8O5SnoLdtqrh_QoxTA@mail.gmail.com>
X-Gm-Features: AclHuK-fkIL7gTTQhakmRRraBxB0TPX72u2Kqo5bF_nURy3d6i6ZKcYJu7FOOm0
Message-ID: <CAD++jL=nkoYnPfU_swDYrtrxNZtAy+yq8O5SnoLdtqrh_QoxTA@mail.gmail.com>
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

Hi Peng,

On Fri, Oct 16, 2026 at 3:39=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> Hi Linus,
> On Fri, Oct 16, 2026 at 11:13:28AM +0200, Linus Walleij wrote:
> >On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Peng Fan <peng.fan@oss.nxp.com>=
 wrote:
> >> On Wed, Oct 14, 2026 at 01:10:48AM +0200, Linus Walleij wrote:
> >
> >> >Hi Peng,
> >> >
> >> >On Sun, Oct 11, 2026 at 1:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.=
nxp.com> wrote:
> >> >
> >> >>  static bool mxc_gpio_generic_config(struct mxc_gpio_port *port,
> >> >>                 unsigned int offset, unsigned long conf)
> >> >>  {
> >> >> -       struct device_node *np =3D port->dev->of_node;
> >> >> +       int ret;
> >> >> +
> >> >> +       if (!mxc_gpio_has_pad_wakeup(port))
> >> >> +               return false;
> >> >
> >> >Why is the entire call to mxc_gpio_generic_config()
> >> >bailing out here if the port does not have pad wakeup?
> >> >
> >> >> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> >> >> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> >> >> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> >> >> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> >> >> -                                               offset, conf) =3D=
=3D 0);
> >> >> +       ret =3D gpiochip_generic_config(&port->gen_gc.gc, offset, c=
onf);
> >> >> +       if (ret)
> >> >> +               return false;
> >> >
> >> >Then no generic config can happen.
> >> >
> >> >This looks weird, isn't it just some of the configs that
> >> >don't work?
> >>
> >> The early return is correct and matches the original behavior - only
> >> i.MX8 SoCs with SCU have pad wakeup hardware.
> >>
> >> gpiochip_generic_config() here calls into the pinctrl backend's
> >> pin_config_set(), which on i.MX8 programs the SCU firmware with the
> >> PAD wakeup source type.  Non-i.MX8 SoCs don't have an SCU pinctrl back=
end.
> >>
> >> The function name is misleading - its only caller is mxc_gpio_set_pad_=
wakeup().
> >
> >This is just a big hack and I want it removed.
> >
> >Implicit in this reasoning is: the only config we support on
> >the pinctrl back-end is wakeups so let's gate the entire function
> >call if we don't support wakeup.
> >
> >This is a *generic* back-end like the function says:
> >gpiochip_generic_config() so the GPIO driver can't make
> >assumptions about what the pinctrl backend can and
> >cannot do. In a new SoC using the same driver the
> >pinctrl back-end could be something different.
> >
> >So this is breaking modularization and encapsulation.
> >
> >It is better to let the pin controller return -ENOTSUPP
> >or whatever is appropriate instead of gating the
> >call like this,
>
> Sure. To get rid of the hack in gpio-mxc.c, we need update pinctrl imx dr=
iver
> and gpio-mxc driver both, which will create cross-dependency. So I need
> to take two steps:
>
> 1. Update pinctrl-imx.c to return -ENOTSUPP for non-i.MX8 SoC
> 2. get rid of the hack in gpio-mxc.c
>
> The current patch is mainly code style change. Could the above 2 steps ba=
sed
> on current patch/patchset? Then we no need to carry more changes in one
> patchset.

The current patch is NOT a cleaup because you add this:

+       if (!mxc_gpio_has_pad_wakeup(port))
+               return false;

If you want you can drop this and related parts and make a pure cleanup
patch, that is fine.

If you want the above semantic change, make change 1 above, fix the
pinctrl driver.

Yours,
Linus Walleij
