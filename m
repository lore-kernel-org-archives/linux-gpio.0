Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89856379C43
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784972645; cv=none; b=njEBxaUGd/f+itjluvETHAHQ0R/l945fs0T4MOsVCodJ/NP+IDh0xTJ1RuymIctbZyDGp9wsiA/5hmtnblY8RVkXOABZ2gKdpSAbv6zsrBTpW3b9hZsGf4BdrAgKpoe0ZonwOiGgLNNinoV9D6VgiuxU4303qL7e6P6pJRrKBFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784972645; c=relaxed/simple;
	bh=Iqcze9T1Fzh5RXDKywLh6fzNobygDX1aCNoUFJhiqAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MK6LGhix38jcJhh2DuSJgj5I1YZNPRFcGh10e6pBlp1/8kNSj8tLvggZkTiaM+S776lPDabXjivfOi/5PdZHx96BMKUS7F9gBYP2TOsCzwMJPNVfghCopqSMSt1YG/PsUzxnfvJYeYfva45C1WInYvcYA3vByf7R3Dav10DFqrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWyN4RD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWyN4RD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4068B1F01559
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972644;
	bh=+sHLG58jMqxDvbOMKd1AgXZwgrkw+Z6jJpWALEhEDl8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oWyN4RD6GUDboGVxC/E5Q+yQ/MY51Uzx+fjHr4jaNAziLLzsQiQEOHChVRxULpQTe
	 4i1GDClV1ncnrzIm8zAVk8TzAWIdy27nOlvL+SKyXbcHdXjb5/pWJpv2MmSPM1pzSR
	 Lf7hNM6GMvX+VZp7GoQUcGfuJV7hBXRgx/bPFVdZopBpcsN66FUaFtOVI09f65dkxy
	 590cupVPQEkkZdg6cB+zT9nrfo7g+bR3DxwZ0Crzl8MdsQORplhpoRurQHffXpJAYA
	 18Qkra+Kd3BTp//vz8vElA5iYi3ZqRoAp+6KtBMFZs3l+VpeBKCGC6ViV/BckkEQPu
	 nhxmng/peIj0Q==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1011493e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrH19CvnacQf32TOr2CTN4+l1S/VlXkKeXg1vkqusxyYOIybHzOhZWtvVcUSbIYKBCQB59cO49dD8+9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5easuJWZNm1mx6MEHLOfCST0CxDIIU1JsxLrZjhxZ35UjvS1Y
	WG/g6GYW5GackBypJ8p+T2f/UXMq89hiocs1OurFjJq6hb8vbmowQuMP7D6Cqn2l8kSAxRltwyX
	yhyoEzApOcfUWGsVHPX1x6baO26qxGWo=
X-Received: by 2002:a05:6512:6c3:b0:5ae:d80f:c77c with SMTP id
 2adb3069b0e04-5b2c1b2ef16mr275541e87.30.1784972642983; Sat, 25 Jul 2026
 02:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709193927.108105-1-chenyou910331@gmail.com>
In-Reply-To: <20260709193927.108105-1-chenyou910331@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:43:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLm07h6-HSeZNj3gf9vnh7KpUMw_qwC9_td0LBnbiM_8Pg@mail.gmail.com>
X-Gm-Features: AUfX_myp3ksAlUiIcfmHpUh-uA1XaXUKqtDVaCvq7z8kF7LlzbztHb7BNOGJzyo
Message-ID: <CAD++jLm07h6-HSeZNj3gf9vnh7KpUMw_qwC9_td0LBnbiM_8Pg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 9:39=E2=80=AFPM Chen-Yu Yeh <chenyou910331@gmail.com=
> wrote:

> Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
> name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
> follow the GPIO hog naming convention, but the mt7622 pinctrl binding
> only allows child nodes matching '-pins(-[a-z]+)?$', causing a
> dtbs_check warning:
>
>   mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl)=
:
>   'asm-sel-hog' does not match any of the regexes:
>   '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
>
> Allow gpio-hog nodes in the pinctrl node, following the same pattern
> as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
> gpio-hogs").
>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>

Patch applied.

Yours,
Linus Walleij
