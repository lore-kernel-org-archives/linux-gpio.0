Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C1B40DB51
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375190; cv=none; b=fr693L5xaW65vf4TUR897nCzMZa1XdC4JT9ajbUOxo62zav2PN2PPf1L5qWauOYSIkGghF10C6FPDAXHAvZiuXI4/y+dRQWTme0kmLSEILwaMgE4GgYIWV108FHvZHiiozK5dd2CJIn+NhKYz7A5Io3jYl0LJx/Iu/qfDPr26X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375190; c=relaxed/simple;
	bh=BUCr1hCoUskeeRd1t0HVarnyydWOErIB1Udlw4P/HQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU3HbAu5eG2dvOr+FY47KP/wOA7cOAC7lY1dfIAhrBPOfXYdgKRtoetc/1o7mVMopPj5D0i+29nFB4m4nML9JANc43wA6MladcmfI7tRB7oGeqsVaq6eUZ/iADiyaDLjAhhqgU0DNyLg97KNkmpAVChEObTdo88F2ogDcMQ3NtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbTP3wcY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbTP3wcY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344E71F000FF
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789375186;
	bh=BUCr1hCoUskeeRd1t0HVarnyydWOErIB1Udlw4P/HQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JbTP3wcYks75Mjgv5GfkFxY4k1AJjcMpSMFg3kCfhpyE4EzTcZO0ftMWrxxbbuu2m
	 u1r+DcPPXzlBvpiUg+eLw0fy+Rf7votcjMMjziDvtnF69VUC/6RysdYev0VC1luuFZ
	 GtUL3kVNRee8rwX11kVCcZjL9qh9pajKXwBhJ1JVPbjVJ1snNSzoAinZ8fiNgGeLtk
	 LOOhmVztA1B2bs1pwxysJXWFxiZHiqlhugWARM/qcw8DF8aERknttF5BNE3tW/1i0f
	 RT1RnJaR3Ww83frfhNV6V/iT9TO357gEWMfpvXDUClFilxgTadKdAG829A5nvwOE6t
	 kIiERIlbTSebw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so3489544e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 01:39:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBFNYDHjIRGK3Hu7AbU0KeRnN73bpyXtvGUqW9uKp29p3+22KSKD9D8vFuAdZaroZ5ExnpZCPFbG46@vger.kernel.org
X-Gm-Message-State: AFuF++meUYUPx/+MHjPvb1diio4+LtFIX2OlSQpVqWB95Fj4p6Gdd0qd
	Vvyt3RDieoqbD3rDbBSsGaTNQcXb0PZFJWUxfYT4qugMALfwzSVn6C8XL58JuG4gGl/BvU+tb+O
	PTpI2Ssy2jbgBf2WgurMxy6mOJVOoM1k=
X-Received: by 2002:a05:6512:128b:b0:5b6:4ae:d87 with SMTP id
 2adb3069b0e04-5b8ae66d39cmr415473e87.27.1789375184969; Mon, 14 Sep 2026
 01:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817162212.1890616-1-sanderson@brivo.com>
In-Reply-To: <20260817162212.1890616-1-sanderson@brivo.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:39:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLkWtC=ZOX13azEEk0haZHfk3ZRJE=i3hDRY_xcPddA_9w@mail.gmail.com>
X-Gm-Features: AcwNN1UCot4Htkr3dgs4fFXOL_85ODTx5oGWTY6F54hzJDKQ7exHT5L-odqwr7M
Message-ID: <CAD++jLkWtC=ZOX13azEEk0haZHfk3ZRJE=i3hDRY_xcPddA_9w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Fix typo in s4 group name
To: Sean Anderson <sanderson@brivo.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
	Qianggui Song <qianggui.song@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 6:22=E2=80=AFPM Sean Anderson <sanderson@brivo.com>=
 wrote:

> One of the i2c pin groups has some junk at the end. The name should be
> i2c2_scl_h1, and indeed that's the name used by i2c2_pins3 in
> meson-s4.dtsi.
>
> Fixes: 775214d389c25 ("pinctrl: meson: add pinctrl driver support for Mes=
on-S4 Soc")
> Signed-off-by: Sean Anderson <sanderson@brivo.com>

Patch applied for fixes, sorry for slow mail reading :/

Yours,
Linus Walleij
