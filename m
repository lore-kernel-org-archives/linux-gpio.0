Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269173A451F
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722927; cv=none; b=DI1Yiv77O7vtpgpzH/B4O9FomspsuFC2NgH2N1ITZ5EwFSwwwn344WI8H248M8VAMI7tr5ihnDh+DLwnfYum7XRhgnRaFywQi+sjjCQ5SpiH0WbDWxGQbfEbO98rN1tgVg78NZua5MgZNpg/cv7cX3kIvMUkE9texajdKBdgJGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722927; c=relaxed/simple;
	bh=0KYJvFH155AMxZQTmQyTkXPgrx3vHh8CD5wG6p6wGdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0QQuai6uZdYpyxLgcfdmlR6+OAQEGSYFLCRXBNEm9fTWgq0pbCFXBnsHk5SB2e5U39Frrtyg8HzsUPh0FEM+jt02vLbRvLFSGZgeTR4zRBBjuZWpqn0AoA4z0imHMjpYmf5n35fkhckYhbOYoTTJlwNvAjKBACCF5GSUW8mD8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nokxxrYd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nokxxrYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8ED6C4CEF7
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722926;
	bh=0KYJvFH155AMxZQTmQyTkXPgrx3vHh8CD5wG6p6wGdE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nokxxrYdiZ9OFZv5GL3bXSsO4OXvlCH4lTb2gNMINcIGpvQ3HCnruTmjSh5Sr3kMs
	 82PCbT+K9+HiKyxGsm9H/m47i4OqsSbfA33lXjKX/X5180iLI75agOMd7CxT88EapB
	 5bnn5bPLj9r9eT89TmfgXc2EhDDhue1d1BvV14YbL2cKfXY1vEJeshMnqZDkCuVUUj
	 tjY7GYpG9pmcg5ghNBwNB29cpwM+VINsNnl71SDw2JrhfVzhjL3nCJBT1eFxjUulS5
	 COGZvAmOu17FDpPLDURDXCptSlt5Irw8jETOPmUFUb6qSRMIbXgX0UlRQZW8FG9v+0
	 5iy+/tZ9WfgHQ==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79ed2fc6ac7so4611547b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdw8ZEGyFfM3S//F27IE04if5fQWitASXODVvAOxneapyZyWz7bLLqvpX7EP2jCOGEzELu+riyDogW@vger.kernel.org
X-Gm-Message-State: AOJu0YwmqcA5uMjonw6c30R6HxJQ42DJVo60XXJpUQY8yGFSqMvG18Sj
	Rn7fQIySGjYQOqEAmhQPiBlf6VI6lslBbA0/46yEGN7r20X5G4XvOwbxSgSq9End+XroKDSItwB
	A4B9iSTwo0jeZ4hmE8WqH/WD37yd7dAA=
X-Received: by 2002:a05:690c:e654:b0:79f:7972:f88c with SMTP id
 00721157ae682-7a4d64480eemr151606097b3.11.1775722926162; Thu, 09 Apr 2026
 01:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com> <20260407184805.807328-4-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260407184805.807328-4-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:21:53 +0200
X-Gmail-Original-Message-ID: <CAD++jL=eysJpHK1pr6EuDgZMWdKjFtHmtZ0Xq5dJ8z1sjjAfEA@mail.gmail.com>
X-Gm-Features: AQROBzBZA5LIyLYtsgQATGhRckzrth4eZhq0_ffITAPJ5-7ojAyR-Ph1_TmHIfs
Message-ID: <CAD++jL=eysJpHK1pr6EuDgZMWdKjFtHmtZ0Xq5dJ8z1sjjAfEA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] gpio: generic: add io_port to struct gpio_generic_chip
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 8:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> @@ -645,6 +645,7 @@ int gpio_generic_chip_init(struct gpio_generic_chip *=
chip,
>         gc->base =3D -1;
>         gc->request =3D gpio_mmio_request;
>         chip->be_bits =3D !!(flags & GPIO_GENERIC_BIG_ENDIAN);
> +       chip->io_port =3D !!(flags & GPIO_GENERIC_PORT_MAPPED);

Actually, if you follow my idead to use a special config for port-based
chips, struct gpio_generic_port_chip_config, that means that you will
need to refactor-split this:

int gpio_generic_chip_init(struct gpio_generic_chip *chip,
                           const struct gpio_generic_chip_config *cfg)

Something like this:

static int gpio_generic_chip_init_common(struct gpio_generic_chip *chip,
    unsigned long flags, struct device *dev)

int gpio_generic_chip_init(struct gpio_generic_chip *chip,
                           const struct gpio_generic_chip_config *cfg)

int gpio_generic_port_chip_init(struct gpio_generic_chip *chip,
                           const struct gpio_generic_port_chip_config *cfg)

(Those prototypes half-guessed by looking at the code...)

So that each variant calls the common code for the generic part and
the MMIO-only respective port-only portions are kept inside
the specialized init functions, with gpio_generic_port_chip_init()
ifdef:ed out for !PORT_IO.

In that case, chip->io_port can just uncoditionally be assigned
true from gpio_generic_port_chip_init() and you don't even need
the special flag for port mapped IO.

Yours,
Linus Walleij
