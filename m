Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF2363086
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776931268; cv=none; b=fKZSXpV0fA37SY7pQ8QEwEvzrDggd6pOmuCEfnX+KPl4Tr7Oe0JkNC5gbD4fUq9XxHRmzkZrWIngm46fCCUtcimR8pax+nbCMEXc5l6x8xPdKEil5sxaqvmORMSrBoc+4QvNFGo2TUGhDxV1caDlGfLfWmnJcB+HyxTwzMpWOw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776931268; c=relaxed/simple;
	bh=bcX+vEqVNyKG67aCCVEuyskSO8KekgYQaPDOVwj9CrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyK8BnD/ZPgSCNhYw5LtEK7Qfy6f4g8mM4DdRMQxLvYZDEY+9TAtkOfzG4JyHBeOYjW1PdyeSjPXGjiTCddrYiNPlk3CXvgVl+/tcYWibqti7RghDwNAfuA32aZUvtFpaM5j7+dFVUMpoaIB7SPJ2IiVwcbkG/7h4wrK3nn7/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljsK6Ffc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljsK6Ffc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3242C2BCB5
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776931268;
	bh=bcX+vEqVNyKG67aCCVEuyskSO8KekgYQaPDOVwj9CrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ljsK6FfcDdlrdt+vLl/IeMtN7vvj4lATGpXHLhGC8cdTuZBAR4fg+WqiyUjExQM59
	 Fq+e5cdjzfRBxcb1zihTS+0ixdmgYrMq6PtTEpNUlVR7I/gdScdKGwjQlFysN88BoL
	 UAfKAU2fEFLZqKSzCnXOb7XcIM3oarAoDZyyo/DwUkG+5S9wqAklliLvWL3vnEtwS1
	 znt/oyHYQx9yNLC2MdYfkC39Hx3+qb6N5+Ix1KfnTR/xGZ1B7t4MpLUqbTDCnCo7Yi
	 JibNIoIBY8tnfkEIr5aaBP9yRFwCd+eQWwbertMYEFqVewqzGOmCZqEQOoLhlk5uBF
	 jBTIR4msP/c1g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e4989dacdso7006410e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 01:01:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ++78Lrb5cS9QV03OS6Ov3feHKb6nDymdMiX3ePyKk/A+g+ZrsBUN4k+NGVl9Fzcgpj2XvcFzI7VHiL@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFmXMI8GizTkKvqeToFrzzap6ZvRLg0dfzPy3gRuw326Z027s
	kcLwMr6pSRh2EGyFyj1J7ljswilmtcXKa1PSewdyJ9MnEgbwxRB81uTX71MPEJi6AKyKNopkWSX
	Gs68z3CRLl3+BjtSDaUW5HN+gsGg+/S8WAsGzdYGBtQ==
X-Received: by 2002:a05:6512:3c8f:b0:5a3:ff6b:cb63 with SMTP id
 2adb3069b0e04-5a4172f6af6mr10356633e87.44.1776931266554; Thu, 23 Apr 2026
 01:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com> <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com>
In-Reply-To: <CAD++jLmFudox4+zThr5bx4aAadrpdkYrNn84eORhbU_t6gxZvw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 23 Apr 2026 10:00:54 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfeKOKjtVSRUont7D1ROvob9z-2smp7_fQ0kKB9TOc4GQ@mail.gmail.com>
X-Gm-Features: AQROBzCVTFyd0qANf50gir3VQEBpgtZjDBYCOHqQD2H9kFn7P071dtc8YyjMXoU
Message-ID: <CAMRc=MfeKOKjtVSRUont7D1ROvob9z-2smp7_fQ0kKB9TOc4GQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] gpio: add PMIO support to gpio-mmio
To: Linus Walleij <linusw@kernel.org>
Cc: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>, wbg@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 6:44=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Apr 13, 2026 at 12:24=E2=80=AFPM Jose Javier Rodriguez Barbarin
> <dev-josejavier.rodriguez@duagon.com> wrote:
>
> > This series is an RFC for adding port-mapped I/O (PMIO) support to
> > gpio-mmio.
> >
> > This v2 comes with all suggestions done by Linux Walleij in the
> > initial review [1].
>
> That name! ;)
>
> > For keeping compatibility with gpio_generic_chip, a new _config struct
> > was added instead of extending gpio_generic_chip_config. Using such new
> > _config struct, called gpio_generic_chip_port_config, requires a new AP=
I
> > function gpio_generic_chip_port_init() to access to that new structure.
> >
> > Besides, structure gpio_chip_reg has been transformed to union. It refl=
ects
> > better that MMIO and PMIO chips will only use one of them, saving memor=
y
> > as well.
> >
> > I'm still sending this as RFC but I don't know if I should send this as=
 a
> > regular PATCH series.
>
> I think we will usually only merge infrastructure if there is also a
> consumer/user of it going in at the same time so these patches will
> need to be prepended to a driver patch.
>

Agreed. If the driver in question is not targetting drivers/gpio/, I
can provide an immutable branch with these patches.

Bart
