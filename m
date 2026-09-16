Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D404A92F1
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551788; cv=none; b=iTF/gASRfe63yRe9Cxihl2AbzuELPgMUJIS/vTgRAqd51XabqDX6fWcjiH1qDbzGACI+pISl+pzG/eAuGTMjAtI7YhQn0ZfkrUiiiW17ZNI0lLTKAnV6zaDSf1IjfvFiE+uW6+rkHyY6icz2tSFv0Vie1Gd8IwZ87J9VDfznqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551788; c=relaxed/simple;
	bh=+d2rwBd9L/2P+3bTXWEw3A/quPbHyjs1eqqNq98RdUI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv3WnTZxhCOm6CA4ZdQBM3sHYFarpgHX0c3k0E/SIAEnP6iD0uV2NPsakpiAKSrrzM8fizg9P1uTtgV/Uh7jmtOs8WAUPABTIUbV4Nr+oofxO0fCY6HP6ftaNtbWIY1YeSB6VveRrcb7kpX2t15irDLD9qkZ/eXCmsNjkZcBmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDgL1nDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDgL1nDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835611F00898
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551778;
	bh=+d2rwBd9L/2P+3bTXWEw3A/quPbHyjs1eqqNq98RdUI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NDgL1nDztzT3b99qDW5rxvU+khu2/ScW2MGLR2B0FMNlxuvLxPEVhfA63msQPcy07
	 hr1xHJhU5D8glCJ3gGzPtaW3urm99W+SrNOWUbFGHCUtC4dYKxKNoYKmKdrqL2QtTG
	 j+WYpf6s+J1XrgD3Sqv9nUc8J93UIkI6XCtOLwRBAhA0hUhIOXbU9pyJLXl+UET+f8
	 r5XyT9jPnS+tUOHS9pQhdzfMZMr5+rLJozkgwiRBOc56ZH4CYi67w8Sf9Q3DErwVNL
	 vV85Y7enK90oDAe3HHi+WUiKoIbKLg0IFP3A+2Gzv07wmYMRowm2Fb3uHcm8L/Kh6x
	 I6mrvWWdj3ltQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso774860e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 02:42:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpRL/lCxadJ8Tb31jME80mKOyJpSavc35aehV7FbXryMGjIM5jS5m2wN5D4qm/a1tqGguh5yTTjVRA@vger.kernel.org
X-Gm-Message-State: AFuF++mmW+sCVKVuNj/vYQgUSS6GL6taJOJh6FPFEK1gZUkWAI0iKwR2
	Dof29pk6Z9EBnqRZ34IJncs7FiD14SihFGGi+iJM7Umt6hKdTXSUt42DbzQKgq8ZSu9QbRAEXkv
	4BmEjfJnQ/UCKonDb7+USaQLm+/MFX7xpvIfeaNVZSQ==
X-Received: by 2002:a05:6512:1595:b0:5b6:183b:d218 with SMTP id
 2adb3069b0e04-5b8b6673321mr483127e87.63.1789551777198; Wed, 16 Sep 2026
 02:42:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:42:55 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 05:42:55 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915080501.329424-3-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com> <20260915080501.329424-3-mehmet.fide@gmail.com>
Date: Wed, 16 Sep 2026 05:42:55 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md9k5a3U7byvxcxWVszpJVcx=eCFszHmGzxVB7N48LFYg@mail.gmail.com>
X-Gm-Features: AcwNN1VVR3zQcU79J0CrfIz7pAuC2sbh3U4dChm-X7VfMngINZ-ASjxADQI1Faw
Message-ID: <CAMRc=Md9k5a3U7byvxcxWVszpJVcx=eCFszHmGzxVB7N48LFYg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE
 queries from the pad register
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 10:04:59 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
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
> Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
