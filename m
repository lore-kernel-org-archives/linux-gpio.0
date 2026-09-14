Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58544E648
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 12:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387264; cv=none; b=MevTvNe0BwM+uW7xbsBoMmb1uARtn0CHnHfSs5Mo9ejKTp/H3KlHeGYqPFxFBwsp9685kPHQ5Vaa/ua1ZWhFtDPx+zUVtdHnbJsYaS+RrdwoMaUq51PV4j/sOe2y5EPR/kxdp+O9W0Z/UqF0C5VZ+WpwS1Rn8Ypf/FDtbSsisQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387264; c=relaxed/simple;
	bh=D70l4VPHEgzTRxp8QD99cI0kN28iFyT1rcFBC7OwJpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cW8/BM8anlDMRjSaQvM0G/EvV+oAOX8ftjIpKNUMkNXbzM22vR/HCs2t8C0tExNAz5GvwuW5mfUTPDN3zNMRfJRwzTWJqpl+aQYFuvPK6Ie+ccE5Ll1S4sSzgptjOnCaIITQ7aLgdUNteDs+S3WTWClMRIIiLrb0aqq1aqnnYw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERpz8UJn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERpz8UJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E01C1F00898
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789387253;
	bh=D70l4VPHEgzTRxp8QD99cI0kN28iFyT1rcFBC7OwJpk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ERpz8UJnqS93FUiR4vRL+CRB1I/YoiV55I+8ZHuW1qXUbGj4SprS39VkEygVxtlwX
	 ZQxuO8HsU5dX0jAOUOoX6muxo1z9Yv6PBstLZuUO5BL6YbVQ9kOOhqfU4f9Z4wuX7K
	 9Hk/Qf5zK+WvqP5236Rzgnve21XcSqFgEQi0EKlHhlFBVrBUzV2ZJIqEKp5MEfLY2a
	 fFxMjZGXn3vnkKtRa1vuwTeZ9RVaTS2HVb9y8Lz6NWaf1/8cr43mG+cTb926rJzlt6
	 DpHYqbGIgTZsja+bVabtGGSPcfE7sHnIFxPdWQs/3qX+A28m8A1DCPyzr89TrQReSV
	 SH4TCKfIT+VIw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so2951192e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 05:00:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWDrzllFKiYFz+1GJWf5FzUDaHVqvMfAXzSmDrtt6NwxtvXUYTZG1ez8KtujRBBXQFXSQas9Kj2+rG@vger.kernel.org
X-Gm-Message-State: AFuF++nt6CMwT+x0ZX8JPwKV9vffqrt1bt0lXpbhz+2XlCpRO7JRLDYE
	K5wM/MSxgn+ezoR2OJbrrb9UcWY1JrYo8PbvBFQfDvFD7YeaJHMyfDCf9xAw/PueFc60O23QqfN
	aZMpxOlYF+dLQ+G8xQixXggoZRkOAQfU=
X-Received: by 2002:a05:6512:a92:b0:5b8:9a84:74fd with SMTP id
 2adb3069b0e04-5b8ae662fb1mr562659e87.4.1789387252070; Mon, 14 Sep 2026
 05:00:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903075940.2089367-1-mehmet.fide@gmail.com> <20260903075940.2089367-2-mehmet.fide@gmail.com>
In-Reply-To: <20260903075940.2089367-2-mehmet.fide@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 14:00:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmgKrmUnyCx8dq9yFuJxx68Tt-3XPz0WRzOO8F7805OA@mail.gmail.com>
X-Gm-Features: AcwNN1UHFrkssgocRyJk96IyI9ERzW3G9X2teZo00fKI-ZjldU-BuzFqADQ4hhw
Message-ID: <CAD++jLnmgKrmUnyCx8dq9yFuJxx68Tt-3XPz0WRzOO8F7805OA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE
 queries from the pad register
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:59=E2=80=AFAM Mehmet Fide <mehmet.fide@gmail.com> =
wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> The mmio pinconf get callback ignores which parameter was requested and
> returns the raw conf register, so a generic query through
> pinctrl_gpio_get_config() gets register bits back instead of the packed
> parameter it asked for.
>
> Decode the requested parameter and answer PIN_CONFIG_OUTPUT_ENABLE and
> PIN_CONFIG_INPUT_ENABLE on SoCs that declare where those bits live in
> the pad register; Vybrid has OBE at bit 1 and IBE at bit 0. The answer
> is 0 with the bit value as the argument, which is what the
> pinctrl_gpio_get_config() users (gpio-by-pinctrl, and gpio-mmio in the
> next patch) expect. Other parameters and the SCU based SoCs, whose
> firmware call returns the raw pad value as well, get -ENOTSUPP; a pin
> the device tree never configured gets -EINVAL, as the raw helper already
> does, so a caller can tell "no answer for this pin" from "this
> controller never answers".
>
> The only in-tree user of the raw register was the debugfs group dump,
> which called the callback with an uninitialized config; it now reads
> the register through its own helper, like the single pin dump already
> did.
>
> The set callback is not touched: the fsl,pins binding hands it the raw
> pad register value and that stays the only thing it accepts. Nothing
> in-tree sends generic parameters to it on these SoCs; making it
> understand them is a separate change.
>
> This gives gpio-mmio a way to read back the line direction on chips
> whose direction lives in the pin controller.
>
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

This looks like something I could apply separately from the rest,
can I just queue this patch in the pinctrl tree?

Yours,
Linus Walleij
