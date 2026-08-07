Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73F739B48D
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786128353; cv=none; b=KUZIlBagBiUXtZzpTIOouZ65qzhuGS5eK9QS4elFqZTXpFe8k0jH6ww1qeQTd/OBwABvtYaTM3BOGL8VdISsD/4EdxKGD2D1hSn1wsyV6GfPchSFm/I6sQ93Umid+rr6vqTQe++gQwC/tu/i76kD3VpPjpI61Ixi6BngPOJBg3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786128353; c=relaxed/simple;
	bh=tgk+9L3MqsjcE1km43dPJUdUWwxGWxLSI6wk2iJ28f0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvn4tbW8FPGlLFgXEnNPqWgpGph/VHHy9U/Ni6u4CS8wmEUIyc+bDjnvTH4oZN+iozj2R5dKKvSOZQs9/aa5e1Ygymc+5Yfk/OfiYv1VtY7Y0Uxyqm0euL04ztcPBxkIScHBVR+Hk0rsRICtTpZoB1LqE9wlamoTkhlCJvY5asA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaHqZsGU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaHqZsGU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6905C1F00A3A
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 18:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786128351;
	bh=iAAQGBdBoRkovVpJQHo5IAsY4ppMJrT4CJ2byK1QahQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eaHqZsGUnGMcADqx4BeggqvVTdls6zjBr4TBOnKeO1H6CHTJ1cDJ3PjB+SJwMuIAE
	 ipZ67WAh1NWPvOngGBK4VkeYlzR0H35V1iRzA1tMZuwpvBbnETduGrX3am5ZBRpa8B
	 hVS+WCc+Imo8qEdzTvXcQpE/hRKoEiqB+TbBRiGV07nVM5s/iJ43jaxJXwloSuYt1u
	 tHj+yKClCoGcO55p3Qbc9AQL1UZNn3TSJYySEDqxT4xtHwyQMNeADJynNjSDhL0qnu
	 F6iQTEblCKSPU+fWswpig6ImTO1Vi+BTmQvMy3NHSuLKiphz2Ur4oN3mTsSgXWBb++
	 5Sf8QpHUjeNJQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so3856838e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 11:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoXXGS2hzuGmfiYMuts+97+jFqqcaFaliaI5zKuYJiYzwL57sqc7YGJPeEFOyVqJGo2icWpc5hxM+q2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxpv4kIz8BExJ2oeaiwa5uOFhbpln5nx47OBROk0udfqhVbP0I
	JbRU/gR3kFwUOriUF2eOa48W35Qs3kJyPSmfsmGeBDOateWg8OUFCD6GB7mY50BHEHotURWCjQ2
	rXZYs9C5pejPQ6ebte1OPZkOSBRuc+WA=
X-Received: by 2002:a05:6512:2911:b0:5ae:bfd6:173b with SMTP id
 2adb3069b0e04-5b30b73dcecmr333543e87.20.1786128350255; Fri, 07 Aug 2026
 11:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 20:45:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=2vt6qJcXdnyuCSEWMTAdZA0-=yhKtsXX9Qqzm9scjEA@mail.gmail.com>
X-Gm-Features: AUfX_mwyyr_F-MwW0ZW6ZC4tI78PAU_OowRuALyPIokafW-F9bK_08tyDxfajbs
Message-ID: <CAD++jL=2vt6qJcXdnyuCSEWMTAdZA0-=yhKtsXX9Qqzm9scjEA@mail.gmail.com>
Subject: Re: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 12:06=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC
>  * adds support of an7563 SoC
>
> The driver split changes are based on Matheus Sampaio Queiroga work.

Patches applied!

I had to manually fixup one patch due to orthogonal changes,
check the result!

Any remaining nags; let's do patches on top of this.

Yours,
Linus Walleij
