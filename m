Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F6737B021
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790062262; cv=none; b=aJyhTpuYbPDPQxWXPF3OVvh92a4BIK0lK6tsKTdP/cOa1ByTeOIw0S5uBPDBEvpxztn1pBVawbJBg/AOunI28nr088GzYWprVTW3DJoFa5aLzBv5ILvRcGHEJk10sfKuyMJvua5W9IztQjFZfiJoKVyercbb/N5/7BguFiVeA58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790062262; c=relaxed/simple;
	bh=oDqW6T/eleBg+IVifKo8eY/xxzZd9a5JDL8hnibllLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zms/rRNJb1G+Ld0zOWwB5HirSuWPiZShury/aBSrypaHclh3V+zc98neAypNfnME/p6ROruGYith9xapth2FFnMF0JcJeqUngkO5mE47ylkvpZICJwLBaCTDZtUkw1WKiU1t68H7neNYbzSWsg0R6G4nsmFY2QmOWBkRLYfUv5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g40mb1a2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g40mb1a2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA9E1F000FF
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790062261;
	bh=oDqW6T/eleBg+IVifKo8eY/xxzZd9a5JDL8hnibllLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=g40mb1a26ZyzUuelCX1OT15116nPGtMHhS3st5kgkA5BYA13xkFrwXZ8ZMIjNKgzP
	 f+8z25rLZezINkew+GWFVkmeLqBqHbo9W4pqzeNB64rGkOa5Nr/kL3ee66cm+trXg/
	 BjF8gbfJ649PEU0cfdu1HNRsl5nQyLTE4GnTI0AZkxvrHm6GbrLzmy7M1HwD4MzmP8
	 Ep/8BbY8GVbh9r7NwvcU6i3mAvTdiaVWzkrgRSbq4j4KbdMxSTvy9w7hnC8ptZkL6n
	 mWQWh3nd1Xped7TnIzYwQUaWXqmOzQH5MwOkjXcQDBMu643kxwjrWJsWVvmU66AOrq
	 oAEdpl6lTCKEg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so1456580e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 00:31:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBziZrgZWrgixD5BGgi/5JK+AtmxoZp4j/CKI9kRXAbY59y1BronBJUz3/lvVuUbYtHnOhnIH4RsU/hT@vger.kernel.org
X-Gm-Message-State: AFuF++lp1vim3opPPZu+pMlNoNEEjrPLQwm9PI0ExvNn0KnbUWmaBLAs
	KWtVlD9ikPRo3MBZL7GlsNXM5UCtUK9Bm2Ul3pfbtRiHppe0M1oc0IvdiCeqySDcPd1rlWVvFLb
	IS3dMq8aLhiWZkncMgiUXbx2IGXp7qWQ=
X-Received: by 2002:a05:6512:220f:b0:5aa:62df:cd0f with SMTP id
 2adb3069b0e04-5b8d28f3a47mr591510e87.2.1790062259696; Tue, 22 Sep 2026
 00:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:30:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com>
X-Gm-Features: AclHuK8hX4pHeDwobDyuxDvOk77GoFqK-3FPyH55F8XUpLTG8sIcoklXJFAKFds
Message-ID: <CAD++jLkCNkcf-gn0FgvLZZTibLUvbKaH6L+=nRqkNZr2iKFqsQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] Ambarella CV75 SoC minimal bring-up
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Long,

On Tue, Sep 15, 2026 at 1:15=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> This series adds minimal Ambarella CV75 support for early bring-up with
> a serial console: DT bindings, RCT clocks, pinctrl, PL061 GPIO via
> gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> MAINTAINERS.
>
> This is a single unified series. Please apply via the SoC
> tree; subsystem maintainers are Cc'd for their pieces.
>
> GPIO data path uses gpio-regmap with two layouts (ARM PrimeCell and
> Ambarella). IRQ stays a custom PL061 irqchip: a linear domain is
> created after gpio_regmap_register(), attached with
> gpiochip_irqchip_add_domain() via gpio_regmap_get_chip(), and the
> chained handler uses gpio_chip as chip data. gpio-regmap girq and
> regmap-irq are not used.

You patchset is big and complex yet you do quick respins.

This indicates you might be using an LLM.

It is required by kernel procedures to disclose this
with:

Assisted-by: LLM

added to each patch, if this is the case.

Yours,
Linus Walleij
