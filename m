Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828D2FF17A
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554262; cv=none; b=GbZH7uzGxX4chO23ZymBVOSm7MT4abW60vjpH2Sd6gIVnDnWXznwnnjPvTxghZ8yLFxMw3KE5dRpVIa7fJNybGsOWC0GSaU9gqvQ8y3yZhj9ackstDQRfkq21mOdMIcY1OzWFrSZNGOXdBsJUT06ffLuwa2Ydu5qwiONze14YjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554262; c=relaxed/simple;
	bh=mr9jAkbt562hkdDwS9wZSVCV9AaSPHiaJZQ3FGh3ZcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIkogW84mVX8Lcnl56S5R+mejHuMlABYP/vncZ70aXaHRARf3uGJvqCHTD/EFU3Mij7bJc3PH1ceBP5LkHYZq4CglV2CowRLe9/K86Pa8GmUUhB3egjVBvcN5WA9pwaB1cB0qYdSqNUppQ7sSCD+24fZrX/DJVxksQlwqgWeVqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sC7T/JWT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sC7T/JWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807DDC2BCB5
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775554262;
	bh=mr9jAkbt562hkdDwS9wZSVCV9AaSPHiaJZQ3FGh3ZcE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sC7T/JWTrKO07elcXlmDRpuJ178IRj+JiO5z33ypzAR0uEOdWNR7RdBh15xSKbq4F
	 McSyNV2TeMw8W33z1z3Ld/Kobgo5s22XgAyiFOaUUYoJw8UoCmX1HmblqvnnPPryL8
	 sbGk2UckkSfHrmnAYRRZ3S7Af1UNu0Do63safJbySbPz/IninBqyPI5+HnfuuqkRyY
	 0KBoY+NuM/giCRFcdsVluIl2nHWvyspQADJp90gN/ShoTAAVPSyOcUtGksQfaxJPPk
	 j/uKLkL/mgbSuQX9CM83WEYraJw2f9yGGQvw8/beFW8D7nSaKyVyRZSMT5UfZBFETG
	 ZEhkDkCPno8gg==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-793fdbb8d3aso49193307b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 02:31:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9GGSUYVLbYOvTAfF7zeQ1aC1tRq1POzxUGp6T0oAXgLAr5Tv/GWnKDdNdhHgRQw2vp++yYNcBxjdF@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5NddKMhKt7Cg3Ea7URNAIwjs/r+HEQqpJvWgWn2o7PwR++F7
	N9HS5vnSoJjiR8aR647ozJymPd4scLZfxNtdHrMRyK2Ezr+pzWJqIVQx4vXg5V0qiHO3thFm3cM
	pLXmlT6HaYQNeE6ZEiZBu7pPwakCkjAg=
X-Received: by 2002:a05:690c:289:b0:798:1637:fee0 with SMTP id
 00721157ae682-7a4d6256372mr162255627b3.52.1775554261678; Tue, 07 Apr 2026
 02:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330161914.1071118-1-flavra@baylibre.com> <CAD++jLkdoD=0RjpAMLWTMRtUX1+3tB6exOu5=nC3ERBYdrUiUw@mail.gmail.com>
 <e66a4241ad77859921a4562dec17ab932cfd79b0.camel@baylibre.com>
In-Reply-To: <e66a4241ad77859921a4562dec17ab932cfd79b0.camel@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 11:30:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLmqz8PfJsfmS4N=K_OcwHmXz7cg066GMqPR+a7ACjb=eQ@mail.gmail.com>
X-Gm-Features: AQROBzBDP08Z94mWCoPw3anLj9ZFeEzsMTbs9NWfz75_yTNoZZujqLQbH34yIg0
Message-ID: <CAD++jLmqz8PfJsfmS4N=K_OcwHmXz7cg066GMqPR+a7ACjb=eQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Disable all pin interrupts during probe
To: Francesco Lavra <flavra@baylibre.com>
Cc: Maksim Kiselev <bigunclemax@gmail.com>, Sander Vanheule <sander@svanheule.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Dmitry Mastykin <mastichi@gmail.com>, 
	Evgenii Shatokhin <e.shatokhin@yadro.com>, Arturas Moskvinas <arturas.moskvinas@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Andreas Kaessens <akaessens@gmail.com>, Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
	Thomas Preston <thomas.preston@codethink.co.uk>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 9:50=E2=80=AFAM Francesco Lavra <flavra@baylibre.com=
> wrote:
> On Tue, 2026-04-07 at 08:58 +0200, Linus Walleij wrote:
> > On Mon, Mar 30, 2026 at 6:19=E2=80=AFPM Francesco Lavra <flavra@baylibr=
e.com>
> > wrote:
> >
>
> ....
>
> > > This issue has always been present, but has been latent until commit
> > > "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW at prob=
e
> > > and
> > > switch cache type"), which correctly removed reg_defaults from the
> > > regmap
> > > and as a side effect changed the behavior of the interrupt handler so
> > > that
> > > the real value of the MCP_GPINTEN register is now being read from the
> > > chip
> > > instead of using a bogus 0 default value; a non-zero value for this
> > > register can trigger the invocation of a nested handler which may not
> > > exist
> > > (yet).
> > > Fix this issue by disabling all pin interrupts during initialization.
> > >
> > > Fixes: "f9f4fda15e72" ("pinctrl: mcp23s08: init reg_defaults from HW =
at
> > > probe and switch cache type")
>
> I realized I put stray double quotes around the commit hash.

I fixed it up, no problems!

Yours,
Linus Walleij
