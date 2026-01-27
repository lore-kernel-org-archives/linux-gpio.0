Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074A72D879C
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505486; cv=none; b=oJJsO7J4jmUD59GNaDCLecZWRf8ka3LCzk3MrHXjB57igxRZoszBVP5z+uJ/Xxyw5d3iNnfut4sH5p7s0/czV1UMmugmmGaLwkXwKhZK7Nig7dvsIGL137akRbUQZbQWuaGOfVTwXptWTreDisBlWlaX0twHZheKb/xwUBlqI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505486; c=relaxed/simple;
	bh=yQ966Njn+FfjMMlR6gQsKtYlPJxHyIq42u5ygQh+r/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddpfkUPTbThD5K30j7byPwHn7ily+rlpv8Lc63plfYmYjy8k7YHbBBj2mh5CUZ6m3j1BaoGYFbbbZpgZT4G5Aluds+xzkyVEISPjkDMBdJX8LaANQ3GoQWe4Vxtm5bNmGrMwkFZhQYjHOuBVYP0bq2Nl6dm4PD2HKVfI2sSSIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdwzgVt2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YdwzgVt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C20FC116C6
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505485;
	bh=yQ966Njn+FfjMMlR6gQsKtYlPJxHyIq42u5ygQh+r/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YdwzgVt2AxlbYuTOspMFsTHS/4X8Mp0UFv72qD4KPLeL6kxPy8MuO5TavGiSsolp2
	 /j10zvQ2CF8KVEjoL5nLxHAX4lqc1n2dKBvI2PWqKjjhbydTERJlUw+LxZ3DyAk8bI
	 H3uHvi0xr0G6DYC2bBy6ENLy2dwZJf39/ioG6bylXKhrWmY80dmb2fAmM22G0hR7Nj
	 P8gn7e9gxTJM+iUHamfexFDglK9QB/0dj+UqGBN5d3zQpu2lxdtPXpkdAMHQn24a26
	 a9PX+TCcS6FvU+QSUtAibUYbxCNE0Z0zY+PqS5pFUR25xNwMI66pOEYPtuTduUS+5k
	 Kn77ddULPA8pA==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64970870c0dso2075432d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:18:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCW9YFdpmZiWLwJ7QVnZdGtlUvhDiF4Lx9VpxOlvcPBAu0+FwCrBEheBpayXaHOUa3vizftbPPtUpe@vger.kernel.org
X-Gm-Message-State: AOJu0YxylhTpsVZgKNe1aVzfaPrdsyGDr4y/FuvEUTRVWrKYAxu8QYsX
	DhgJsMdQIWg67b5U/lVl+eWlqPImiL8i0Vy7V/WOX+YTiv2HwJWRw6lQBLTFEtBSeV/li7eg7Au
	nNnp1RbtvI+muWeFd1sZPx6Unig/HyH0=
X-Received: by 2002:a05:690e:130c:b0:646:7a21:f03c with SMTP id
 956f58d0204a3-6498fc67a09mr562209d50.81.1769505484808; Tue, 27 Jan 2026
 01:18:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-10-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-10-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:17:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=oAyWmP=2LhqK4rdQSOb5WJvCTGRUxSdEnttX6i5s5+g@mail.gmail.com>
X-Gm-Features: AZwV_QgpziPUFNsf8KU23ZSvXoPFeeWSMMPX1f5j49l0bdt4rKMCsorpnxg7oYA
Message-ID: <CAD++jL=oAyWmP=2LhqK4rdQSOb5WJvCTGRUxSdEnttX6i5s5+g@mail.gmail.com>
Subject: Re: [PATCH v8 09/10] MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khristine,

On Tue, Jan 20, 2026 at 1:01=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1b020588597..37d80ff0ea4f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3183,8 +3183,10 @@ R:       Ghennadi Procopciuc <ghennadi.procopciuc@=
oss.nxp.com>
>  R:     NXP S32 Linux Team <s32@nxp.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
>  F:     Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>  F:     arch/arm64/boot/dts/freescale/s32g*.dts*
> +F:     drivers/mfd/nxp-siul2.c
>  F:     drivers/pinctrl/nxp/
>  F:     drivers/rtc/rtc-s32g.c

Isn't this a good time to also add yourself as maintainer for s32g?

Yours,
Linus Walleij
