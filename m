Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5390468C2C
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369818; cv=none; b=d7Nv3LDAjNDnjtmsydxs8Oi9lU2o+RTWbucW9zxzoC9zAidzWlAnkrsC3JB9Nlda/h3lVqbnIhLFiVtMw1W19oWR1Yt5khStvBJCiDGk0guHNnE7kFChpR8j9p7JgTC0Pb10mWqOp6lcN/ACwZgkjve7m9+zEBWjT0L+qqHD8kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369818; c=relaxed/simple;
	bh=tZU3znEXh/uLIUG/2fb75uXkzqbS+S44wZ9CridvcCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUyniCgdeC4gOuQ+MMtubOgVHm5IhmqLWB4rawg8YCcegij2kz+QfPTCd+PZNEgALF5lS2Rgku7J3dnlU8MaVfo5tBFd0mpctcNkwhVCLss1RLASzN94pYfYR/A49PNvWIFiXrKr3eXcTC/YqEwPYJWWOK5dC3MHdaTl5eGM1iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CphSWWDn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CphSWWDn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E651F0089C
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369792;
	bh=tZU3znEXh/uLIUG/2fb75uXkzqbS+S44wZ9CridvcCc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CphSWWDnNBQIhr3M3z/LttDsZdUFcltjorC3JEUTtDfO6LOwOzNRmbeUhzcFjbJf4
	 xyAoSnALV5NWzV4Hw2/I/O5ogmBau2dKrIs31W3ryj90CkRTNBx8kLPsg+bX4uEsZ6
	 jAtZlsIZ4pkU3p7DVFENQOR44myUbzOsWlIUWzno6jHuuztkyLWemDj6PsFFuPJaxm
	 dAMsBHr6hSwEPkVoCqEUjvuo3TVhSLaCrnY+0DZnsJKEO6bmzq4ieQcZU+N3FU9Z/b
	 lit+Z0KGtjQQSfmk7oWJFMFwY0uRJU5vwWUjOfIIyQbUgLX/zm13hpa8Z/a9IL4xEf
	 y8yRjzkyB7Z9Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcd17f3a93so356535e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 03:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy38rB8/I37IDOSqPcstlUtKaspqvQbDOAT4myJzjk6wUQa24oDyfyk6Atq8JEnXas/2+1drEZG1iXm@vger.kernel.org
X-Gm-Message-State: AFq9FYK6lnM9crIqw39PENfLyrwpblhgd8hu+yfeF0Py1xw72RjihX7N
	d5kUfzYMaDWItlhy5n2cLSrwKk1i6j2E2LWHlF7ItDxPEDkAJec3IFNvBpjVxXUnhnaeyjwDGMB
	fiPZqQdUz9wfjkPn72/OcQhyclHn4Bhc=
X-Received: by 2002:a05:6512:1384:b0:5ba:4472:75d4 with SMTP id
 2adb3069b0e04-5bcd06c1b27mr555897e87.10.1791369790920; Wed, 07 Oct 2026
 03:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <lqyUiTS5jK5vqN8dT8ByLl8sBPTW6eSDG_13v8UAkVIUCnnxLv4UBrlHTm0c7f4brqOd5ur4sDdgld0Ol4usnXOHgJscjqwJl2BrzPpJk5Y=@proton.me>
 <20261004225724.0b821e9c@ryzen.lan>
In-Reply-To: <20261004225724.0b821e9c@ryzen.lan>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:42:58 +0200
X-Gmail-Original-Message-ID: <CAD++jL=v9iiAndsPEmCn2QfrWJEEvGCwQQzMwY6QT6xR7Uh=MQ@mail.gmail.com>
X-Gm-Features: AclHuK-YxAeDefZ88KcDng2EEUMdgtWxZiqOozdJ8Jk_iHK1xMkQpwOglF-Fr6k
Message-ID: <CAD++jL=v9iiAndsPEmCn2QfrWJEEvGCwQQzMwY6QT6xR7Uh=MQ@mail.gmail.com>
Subject: Re: pinctrl: sunxi: a733: irq_banks too small for port K
To: Andre Przywara <andre.przywara@arm.com>
Cc: Norman Herms <dockseed@proton.me>, Pablo Mazzini <pmazzini@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 11:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
> Norman Herms <dockseed@proton.me> wrote:
>
> Hi Norman,
>
> > Andre, Linus,
> >
> > Observation on "pinctrl: sunxi: add support for the Allwinner A733"
> > (Andre's series [2], now in linusw/devel for 7.4):
> > the A733 pinctrl description sets .irq_banks =3D 10, but PA does not
> > exist there, and prepare_function_table() in pinctrl-sunxi-dt.c counts
> > IRQ banks from PA, so PB is 1 and PK is 10. This is the same
> > numbering problem as in Pablo's thread [1].
> >
>
> So I blame AI, but that below is a lot of words for a simple problem:
> the number of IRQ banks should be 11, not 10. If we go with the dummy
> IRQ. There are no official DTs for the A733 yet, so we need to decide
> there, and I guess that depends on the outcome of the A523 problem.
> I will send a fix after -rc1, with one of the solutions - unless you
> beat me to it.

Sounds good to me, and yeah the AI just loves to talk, to the
point of making you not see the forest for all the trees. :/

Yours,
Linus Walleij
