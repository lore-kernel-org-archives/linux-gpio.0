Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E2598C15
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577768; cv=none; b=TzE4rKcWZrc9Ifl0JZ4a8P1Aiknvk00dmE2Cjb44Tz3xMEyu7MHW9ALbTor57ggv8e3Bs34WmPZh45B8BU8bDmIS4HLYePs5FWMRh4piGWXjQ0VjTriPyP/maQXnxwtHYm6U4ORY4MaSN5PgGSoRzsHcf3M/8jLmR+cCP2WHhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577768; c=relaxed/simple;
	bh=3Rl9kH69FoIDw7gGLNXjdv5fuBqhGXd9XmucXEFUoPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAb8RZKKHPxDeN6qrjncY7CJ5DrWDEWu4aqul/1vtHvNmRhGd+E1Chk8+BMQ5BlVCOfRXqcuv5m7KXJJdZX25WPtmhK0PsrRH2I1JKqpbJMZ7mNf9uBKRjYByWWN3sn+z1kM85F6W6jJv+USk6s8kreYqdoqXBqmqwzh5xB/d7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgG2fcgm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgG2fcgm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA861F00A02
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577738;
	bh=3Rl9kH69FoIDw7gGLNXjdv5fuBqhGXd9XmucXEFUoPA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jgG2fcgm04XQ1sjv96yZWoL9W/lNflacZnI7oSFM1D9ZHGfNQQoEWWSMuQG/IC2/T
	 2VuhpPXP8oBGkHZtPfmlzEoCglvXu8AYWKJ6X2RLLUZ5sChU4Uhy7YW6OUHmroACcr
	 AjGBRjESalVhyQaIXKoxQj/+xiefBFKY77Vyt8vXOTqRH2tTrsPkfVkbJWnysisBe4
	 ZLlwQY3EjrTvAb8MZuXdCJf47zm/QDAlH8wgNCWJRVgHxqLSx/j1A0MBJDPgaNwxBz
	 ZxK2KUNJH//fwQQp9knX4O8sha16fCgt/rNFFXZAkNG2+va1/xHBuVoEU+PGVQYV26
	 M6VHoCiEiQlEQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so1144248e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwr5D/mooxOV/052Vu1sBuB4z3Enie5M/0aJ24vs5Mkh3ONUtsMWABZDBw0x9SVeVr8NQgG6p+IYyKF@vger.kernel.org
X-Gm-Message-State: AFuF++nFb4dwWlGOn6dOkhPRFE1emiAAeOxMSS9wTby84lFzFSpHs8NC
	e/4ORtDLXTX0B4CrQKKPP/IzZRxjWsrPSELGBP9buEKNPVnoqBWrASACgrlxScg0mMh9p/bkGgN
	UBdfQz8Gmu9lrNcd+mXIfvF+Ucm9U9MM=
X-Received: by 2002:a05:6512:2c97:b0:5b4:ac27:6bb0 with SMTP id
 2adb3069b0e04-5b8b666abe2mr2187526e87.25.1789577736627; Wed, 16 Sep 2026
 09:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132153.1596191-1-arnd@kernel.org> <20260909132153.1596191-7-arnd@kernel.org>
In-Reply-To: <20260909132153.1596191-7-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:55:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=7tuZWkXqn0gj14JDbsxkT=cU_1aFOXMRc=PmE-3X-eg@mail.gmail.com>
X-Gm-Features: AcwNN1XvcQ2YIjfo5CFBtXX11PIudi6lRGCv7LMnZ1tHaTMlEuKLFH_DVwfW2u8
Message-ID: <CAD++jL=7tuZWkXqn0gj14JDbsxkT=cU_1aFOXMRc=PmE-3X-eg@mail.gmail.com>
Subject: Re: [PATCH 06/14] mfd: remove unused da903x driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 3:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver was used on a handful of ARM/PXA boards until those
> got removed a few years ago. Without devicetree support, there is
> no way to use them upstream.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
