Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84A34CEE4F
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061494; cv=none; b=mVn5EYoFbP2jX2k2kkgsckgc6Ocd1we2gEyM970JA2nuPN/2L4QF+ZjLKXxRk52eUNapoSsDx6PAoO2uIvxpaej9sz0iZz694HVu++CvlAGA7tZWd+Dz20/E/LGRoV0ClVqjlBWAhXYtqNm244hcoK7L/cQ8JyjivGcg0tj4Oqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061494; c=relaxed/simple;
	bh=vfAOnWF9ma8enyqr4D1jm+4ryfaUF06KvZPYdakyP4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzVs1EkURrTwEdQJucnYuP1XS47MH/JdxTWYU7h0181MdJHxygNM6KmUKz3xYOKcvz6bT18Jzf2FZGA6d9gHrTxH2ikIv7VHHA0N5q+hN5j46eXO2MqBaIUKgHQMkJpTgw0KeForvjAjLi660twDf6dwkPjlfG7AA7L9Hv1zl3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdgKWF2E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdgKWF2E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612791F00893
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061482;
	bh=Kiu2zTEU4eOPd6KYh9rbDUJ7UJD3txxYyQibAU4/O4U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TdgKWF2EpS1w3ADvij2BopLpxhHXGdHIunEVbiZcvtASTMdf/9sUcUsOCpknA/t97
	 OUDjR9pY9+X6TC0C7nH/sd0n5JKYjOW0JKYTuP8kSz9UyZwWuiPuD1OnzwLncY14m+
	 z1V4mE8i6JRQJ8xGQB6k1qtTQZeDJ4qv7cs7bLXpyPTP0U9wqBJH/nZLelCYQq7Oe/
	 oVPXn1WdL76/wYtlx9Psk9Oc9CxpkcIhZFCd2IyFMqmD6QUbOpcXGzpKktQRoSmHOm
	 ce6l5zgc+wWVOzGg3rCucrtknj4lDC33ancgZfwJYKmtGTfPVghJMT7Jko+pc3V0Te
	 Uou8jemMlGVvg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b79so3649180e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 00:18:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByRNRgfrJB/b2FYdz860fcUqyscwyeTqvG/JSRQF9+HzjNn6H19b2zPwb9C3JGd7Bo7nO5xhGF/QO/V@vger.kernel.org
X-Gm-Message-State: AFuF++le1ftbx899c3kJb+d9iY4ArRAmjWYENlr9fjh4GLgTszcGA417
	xKC4MDigxsjJT3GQ7AhDdMFx1qwCs/iNYNGPtgaxq6e8NqPPXp8OfEf3C0+9ncledHaQnqVt4XT
	HQDFybAgS4CNW6B2Bg5UHIQQ5MwxjFFs=
X-Received: by 2002:ac2:51c3:0:b0:5b8:bc5e:b572 with SMTP id
 2adb3069b0e04-5b8c1845684mr4028396e87.42.1790061480637; Tue, 22 Sep 2026
 00:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-8-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-8-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:17:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLkSfPvuO=ZgqwYnbBBjxuu4ns1EDpHXQxKgWGqK9E130A@mail.gmail.com>
X-Gm-Features: AclHuK98tk4GqYStUdUYs2m51yzirRsfrNvcnULTogZGKv-tdFHo0QJgErcoW2U
Message-ID: <CAD++jLkSfPvuO=ZgqwYnbBBjxuu4ns1EDpHXQxKgWGqK9E130A@mail.gmail.com>
Subject: Re: [PATCH v8 08/18] gpiolib: regmap: add write_data_after_dir quirk
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
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Long,

this is starting to look good!

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Some controllers ignore data-register writes while a line is still an
> input. Optionally write the output value again after switching the
> direction, matching the existing PL061 behaviour.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
(...)

> +++ b/include/linux/gpio/regmap.h
> @@ -48,6 +48,13 @@ struct regmap;
>   *                     (Optional) Bitmap representing the fixed directio=
n of
>   *                     the GPIO lines. Useful when there are GPIO lines =
with a
>   *                     fixed direction mixed together in the same regist=
er.
> + * @write_data_after_dir:
> + *                     (Optional) Write the output value again after
> + *                     switching a line to output in ->direction_output(=
).
> + *                     Needed for hardware which ignores data register
> + *                     writes while the line is configured as an input.
> + *                     This is a legacy quirk (e.g. ARM PL061); new hard=
ware
> + *                     must not use it. Direction changes will glitch.
>   * @drvdata:           (Optional) Pointer to driver specific data which =
is
>   *                     not used by gpio-remap but is provided "as is" to=
 the
>   *                     driver callback(s).
> @@ -94,6 +101,7 @@ struct gpio_regmap_config {
>         unsigned int reg_dir_out_base;
>         int reg_stride;
>         int ngpio_per_reg;
> +       bool write_data_after_dir;
>         struct irq_domain *irq_domain;
>         unsigned long *fixed_direction_mask;
>         unsigned long *fixed_direction_output;

1. You have put the kerneldoc in a completely different place in the order
of thing than where you put the flag in the struct.

2. Put a comment above the behaviour flags because there will
invariably be more of them! Something like:
/* Regmap GPIO behaviour flags */

3. Put a newline before & after the flags so they end up in a separate
section of the struct, so people know where to add them.

I would put them:

        struct device *parent;
        struct regmap *regmap;
        struct fwnode_handle *fwnode;

        const char *label;
        int ngpio;
        const char *const *names;

HERE

        unsigned int reg_dat_base;
        unsigned int reg_set_base;

Yours,
Linus Walleij
