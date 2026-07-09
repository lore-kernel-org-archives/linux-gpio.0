Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DFC3C4572
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584490; cv=none; b=BSfTlG7Mf1qYLI4E2vOSIbHb/1v6rBTpYv/Wra+BjFuNhm6C+2kHGfDUu3XlyOuGUeA2eWxMr+ji/v3kHYX9cLj0TcGRjjcXxv1xW+Qv88Nr/qgCwgEZy3bcdtsmdtZjVo2Vw7bnyKFICv9Hw1zTOt1eqJ4mhtmZUOfKZVe4Nx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584490; c=relaxed/simple;
	bh=5k+yUkL2u9R8PYEHwZTlNzjBWR/vuezkFKvt3cCnPe4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHIl/yDf+v4UCDzGGK/ji+LSpV2GNk4/NQGSFz+2rGXLeIAVX/KH25Unq4bpiLsU0p0xAdHkXVF0HERZGSxJ22Cv9nwU0jCag6WrUgCt/mZCED6O1L9sG9VVEeE69ShdHjZr3tEVWNhdWrjiqAay6DfjaW5YyqPxEOrJEozGvd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ux62Zy5f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ux62Zy5f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20C41F00A3E
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783584489;
	bh=4YNTOKpiXEn8yxR56QF39aLhjNwhkZZtgvmM50CfwGQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Ux62Zy5f9mvccgk/XeKAQysW4Ghu1BDizBeNG7OJlCYVe8MqdBRvqaHyYQjRNgkeV
	 pzmOw+tprxK4VY5azHo62r3ipqQIo+vyLps1hxBCzenEwpMTe3PqguNMgbvfRiVd+D
	 Ehx360+YsygHxHDXgbN5O+yXv7xtaefydrbDa/TH5JFgrBkSxi/TD0KPdZmKPnhn65
	 TCzJy11jZ4M6unuXei08x6y/wVV2A1CAUeJ8BE5xuxUefMiIVj9xUHH4EwPw9gHtQa
	 SrS7hXSyjK6kkjsC8N/aMjC0Pv6oHC9Kpa/767G1HTF7+UV2G+oKwdxltDJdk4Okzb
	 yVo7L1MeEoNlg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39b2d353713so14483451fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 01:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoNPpdG+/rfQck18HXqyp3JmeUF7EUTfQiuzDDIUC4S/7vOa+8a/HvGqHxiySUBmwMGGQe5IEgRYx08@vger.kernel.org
X-Gm-Message-State: AOJu0Yys+Du3Lj8FQ8egOcRIpmb2Q5VWyYkeRxLy6+ef4KsNl/xjHdwd
	NK4vsMmlABtZ4rUziBiJc2TZRsK/AMQ4xuS02duma10HNOR8qOGL79NoidgltayzpkB4DkChapV
	7ltQk8llGvPMv43Ik8lvF3z1URYHF1aqheqaxFnriLA==
X-Received: by 2002:a05:651c:2124:b0:39a:e29b:d63f with SMTP id
 38308e7fff4ca-39c799c06edmr12895941fa.32.1783584487674; Thu, 09 Jul 2026
 01:08:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:08:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 01:08:06 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAKxU2N_FN_O1g82NVUO=0HFudnAxNGybOc55BnNhO=iyzrC5_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707232742.1235008-1-rosenp@gmail.com> <CAMRc=MdKfO=v99DohN=64xc2PT6mxL3VNhnx7vRp+iNuKROYQQ@mail.gmail.com>
 <CAKxU2N_FN_O1g82NVUO=0HFudnAxNGybOc55BnNhO=iyzrC5_A@mail.gmail.com>
Date: Thu, 9 Jul 2026 01:08:06 -0700
X-Gmail-Original-Message-ID: <CAMRc=McHUTujtnn8w_qMzjQStfjhLoVhOVOtr93jcn4j0Ln=7Q@mail.gmail.com>
X-Gm-Features: AVVi8CdSCEUVXdx7ZZW1Ws_425_NRQxWUPsGWjvwY6Z4gty23Ns3AEvcvPIz42o
Message-ID: <CAMRc=McHUTujtnn8w_qMzjQStfjhLoVhOVOtr93jcn4j0Ln=7Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: validate ngpios before use
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jason Cooper <jason@lakedaemon.net>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 21:18:25 +0200, Rosen Penev <rosenp@gmail.com> said:
> On Wed, Jul 8, 2026 at 5:06=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>>
>> On Wed, 8 Jul 2026 01:27:42 +0200, Rosen Penev <rosenp@gmail.com> said:
>> > If ngpios is read as 0 from device tree, it is passed via
>> > irq_alloc_domain_generic_chips() as irqs_per_chip, which leads to a
>> > division by zero in DIV_ROUND_UP(d->revmap_size, irqs_per_chip).
>> > Reject ngpios =3D=3D 0 early.
>> >
>> > Fixes: fefe7b0923459 ("gpio: introduce gpio-mvebu driver for Marvell S=
oCs")
>> > Assisted-by: opencode:big-pickle
>> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> > ---
>> >  drivers/gpio/gpio-mvebu.c | 5 +++++
>> >  1 file changed, 5 insertions(+)
>> >
>> > diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
>> > index 39c1a13e1b65..c7cbfbfb4800 100644
>> > --- a/drivers/gpio/gpio-mvebu.c
>> > +++ b/drivers/gpio/gpio-mvebu.c
>> > @@ -1175,6 +1175,11 @@ static int mvebu_gpio_probe(struct platform_dev=
ice *pdev)
>> >               return -ENODEV;
>> >       }
>> >
>> > +     if (!ngpios) {
>> > +             dev_err(&pdev->dev, "ngpios must be greater than 0\n");
> Sashiko suggests upper limit bound as well.
>>
>> return dev_err_probe()?
> surrounding code doesn't use it. dev_err_probe is mostly useful with
> variable error codes anyway.

It doesn't use it becuase it didn't exist when this driver was written. If
you're touching it, you may as well use the more recent interface which sav=
es
you a couple lines.

Bart

>>
>> > +             return -EINVAL;
>> > +     }
>> > +
>> >       id =3D of_alias_get_id(pdev->dev.of_node, "gpio");
>> >       if (id < 0) {
>> >               dev_err(&pdev->dev, "Couldn't get OF id\n");
>> > --
>> > 2.55.0
>> >
>> >
>
