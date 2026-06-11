Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7133F6C4C
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781181376; cv=none; b=g1KL1XbuDRsXIl/emzyOMga4Zw1XBy2I2TMhK5kUSwlGimJqkWF0DTulJOGC6JugRcGbjkyDipz99MXaGIuntT64SDxzHw4WHsYMu9A89DTlFwOwepBdlfWAEFA0A2FRX08wmaIc4qXRunLqTMoDM+IEVOOSqQYJRCjCwCSLVmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781181376; c=relaxed/simple;
	bh=8jA5tE5GObY9th2yxnDSqEtZEeO14+brrdEJoDq+kTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RN04WMvTrCSBN78o+gMbQtnoSUclyakF0kyLPnlC/AhUVljncbfNYoqvuyQMDlR/RCaDEFhjkRID+xD+H+xSOLrXOoz1PWedGNTsREaEt4Us3ZeOiwvKcsC0U4v/QFitH75son+gCPKjOfCQ565SXtJnCacgNQW3oH9VhD5IIxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtQuyL/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtQuyL/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6463F1F00893
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781181371;
	bh=8jA5tE5GObY9th2yxnDSqEtZEeO14+brrdEJoDq+kTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BtQuyL/T+DgmSxbopOE1ikbM/wWGHnZD+RDeV5bsdR3MXTqTfRQ4Ghe8e7zUAu/Gu
	 skvRvRH/GMy90YnlJSvVwuSLQa6wYFQC36urbXjNenZFlf/mRsMgEQtTvgbVfeJeOH
	 uQuxWKlij4pmjbFjAI/hrbrJyehgB2EuyOtD2c/k5pLFzd1Bt6wxY/yQOzxLvHNXIy
	 SbE34r8iYtOu2rNpK6lwUcbPDS5qLu0jTqF7eRj5eQhBUsi/36tpNRd7q5vTWiIYWK
	 Matp0OUTjw3jCdv9+LK3OoGccq9od4P2FxegSm7VSVSqMjONOYOPoeIEEYESEiNAjZ
	 3/RK+EaYTEKKw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so7651273e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:36:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9KI3FLB6krIiHs5rHm7eFGwimtELHaaHy1+4nhTP76lvdzp8MiIUEa9IK+9E6l9N/f17RlUbU4OIi6@vger.kernel.org
X-Gm-Message-State: AOJu0YzPGleptbzAsGFukPL1wOwqsLrChRlx2C9Z5ehYeLCu2RCUQZyC
	YxN8eHWr4WRo/Ij9jXx9UJwrSa8rFHBLShIlenF0dVHNlc34yhfw3EKP+uWPgjIeTn4ClHc3mW3
	CsMIx1mFoPLsRyNgwi+ynWkpEaXivsk0=
X-Received: by 2002:a05:6512:1282:b0:5ad:abf:1d36 with SMTP id
 2adb3069b0e04-5ad27fb6be6mr805889e87.27.1781181369702; Thu, 11 Jun 2026
 05:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:35:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmHEsAQhz0_A4mHPme7sMRjcoXqvRhGUHo6zCF53mWDQ@mail.gmail.com>
X-Gm-Features: AVVi8Cfk5zjtlQGfzXSRHsrRy2dcg85kGX6xo32PNPp4FsSewMqe7c0byeEdCG0
Message-ID: <CAD++jLnmHEsAQhz0_A4mHPme7sMRjcoXqvRhGUHo6zCF53mWDQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] gpio: siul2-s32g2: add initial GPIO driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 3:21=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> This patch series adds support for basic GPIO
> operations using gpio-regmap.

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

This is definitely merge material, I would disregard Sashiko nitpicking at =
this
point and just merge it. Any additional fixes can be handled in-tree.

Yours,
Linus Walleij
