Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9332DCBEC
	for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750143; cv=none; b=i7rZ15JVMXTnboBOP3b1S4S94prQ42DNXES2lxS5RX17gZwaQx/30w9lN7PsqRs+h7gmqHChHrTaYDkLT0llE1Hl+S8lrovi5QCSVAS68x8FyPgMmyOWH/ONarzJkU6gL12Ryq8l1pA0Nu47kaIYLSZ7A57mHomkaa8ZnYR1qe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750143; c=relaxed/simple;
	bh=HWTZ9bvPwdYwge/Hjf9waEWkT6bDPCEj4gdjt6lCfr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N78lieN/Q5BWrCgYQTJN/ynaisPelZJ52+nYkDBHrOGdhiZOwwcZPYS8aVW0bVAfYIWKXkzmMP7h+jNVBQx3DrwyVoSHpCOCaQX1udnhOeeO2xY5OyC0dmGQP637pG0B8lULOwufKC8kviVEfqp/yFD//hz2BIajZT0yJyDOqXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUgAkScV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUgAkScV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535071F0089B
	for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 20:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750142;
	bh=HWTZ9bvPwdYwge/Hjf9waEWkT6bDPCEj4gdjt6lCfr0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XUgAkScV0iStNQLlurQipy2y/Qrp4G+6JTOuygeyuQQBIkMAI7kdANa10lcrCYO3g
	 e0Jex1uyGGtYr9D1g14BqX3GTqOaGjiRp5mhuTXdcBAVIiuEln9KXmfIwOYMa4v6cW
	 5GWt+ovB/nLX5qUhf4PYqkv9SFc+pfIAWgi5C3pkGcLIzRghaT8Jv4a1ACpJskD8wF
	 eUbYG14gl+ERmZ7tGSR1UpMm3K77Sl/6l9+zIbcNTUp11mmns9Z8vBDHVKJlTXJtLd
	 /kF1GKR82wj3YMNRIRbAt8VYfg3/Efy3sY11ycqPoUjAyCQZqOpK9wGPo029lUKGwq
	 MdNz/Ppm4BnXQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a75f960be4so10123751fa.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 13:22:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxAKntaP+TzQauhr7c5hFrSn79qGjyNvLu6d3mqPieIrlT+mnnKUIXv4qjc5R4Rj/3rOH0RaPEthq0t@vger.kernel.org
X-Gm-Message-State: AFq9FYJxM7gVM/gO7jl+wZY9NXjItM5CgtKHEPR2YnU9VwxwRh4HdDtP
	OT/22dBTcKmjlQZhtItyHV48p1uCiMmqHFIRUMr9oHxdflQ0tX+Xd/t7goVLXJRSRybSf4AjnrK
	LLxjVwKInXjdZez/6GqNndjtV2TMgpu8=
X-Received: by 2002:a05:651c:510:b0:3a7:8372:61b7 with SMTP id
 38308e7fff4ca-3a9c56e47e1mr17356451fa.25.1791750141071; Sun, 11 Oct 2026
 13:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815094451.31792-1-adilov@disroot.org> <aro4qbhcd3X6wTvP@black.igk.intel.com>
 <CAD++jLk8gCAy+SbGffttCQ7dM9x6gzVRBwRppCByzwYdm_5kGw@mail.gmail.com> <e1c0f3ff0c47fc7a2258bbb67f588f57@disroot.org>
In-Reply-To: <e1c0f3ff0c47fc7a2258bbb67f588f57@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Oct 2026 22:22:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLmVeCawRt+7ndiRXhjkPBPdhPTEfFUtd5pYtH1vG_77Zg@mail.gmail.com>
X-Gm-Features: AclHuK_THDuU9J7npmtxHWGarItkiE4EjGzb5DoJK4Ky32lTjPybl5mmmrrInoI
Message-ID: <CAD++jLmVeCawRt+7ndiRXhjkPBPdhPTEfFUtd5pYtH1vG_77Zg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: make the driver work with SWAP_IO_SPACE
To: Rustam Adilov <adilov@disroot.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:18=E2=80=AFPM Rustam Adilov <adilov@disroot.org> =
wrote:
> On 2026-10-01 20:14, Linus Walleij wrote:

> > On Mon, Sep 28, 2026 at 11:51=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> >> On Sat, Aug 15, 2026 at 02:44:49PM +0500, Rustam Adilov wrote:
> >> > This patch series changes gpio-realtek-otto to be functional around
> >> > SWAP_IO_SPACE config.
> > (...)
> >> Convert the driver to use regmap MMIO and most of the code in this ser=
ies won't
> >> be needed. Also it will give some benefits (like register caching and =
debugfs
> >> monitoring).
> >
> > Andy is right.
> >
> > Make an attempt on top of the merged patches to convert this to regmap =
MMIO
> > and see what happens, and if that works consider regmap GPIO as
> > well.
> >
> > Everyone will be happier, because less code.
>
> As far as i remember, i thought of using regmap earlier but got stuck bec=
ause
> the regmap has to not swap in realtek_gpio_update_line_imr() but potentia=
lly
> swap in other places by bank_read/write.
> Maybe i am missing something but i just couldn't figure it out.

Regmap can do any kind of cherry-picked exceptions in the callbacks,
so I think it can deal with that, you just need a more custom than average
regmap set-up.

Yours,
Linus Walleij
