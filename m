Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614739;
	b=ON/XA5fI2FFh2kXnh93c11//rB/uLNxOfRfnCihIGt3sP2cgHFDChiwHw4RPUY/KNkOu
	 fsp1SR6ak3B29X2F7SD2JdCzP3i25+AhYnt2xFogo7m8D7kjRDP+zyg3WUTo74xji8ADp
	 CBa7T4CdZ/aoMnpn/yMTvBNes6MW1Pill4CaqZnSo5TQq/tcvnaGAFQW96p/UkOE2/COG
	 m66CjlkJY85wIIU8r5OOdxNjn2Kn0brXvr3E82D5NkeUPwejaKptQ/9R/4ihefd1DeucE
	 h9URSLcDTlH7OjOtHko5QT0wjajozgoS6kgeypHUyy/GtYbtNatniGYZKmTAU8Pecqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614739;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=d1OT518H4ki16FAaDWhpo7G6vnPaZ/w9V0TjOKp530E=;
	b=l+8xaWnq6BAw2Zx6UqVwmWEzbu/WK8Bs9W6ooMBwh4fABk4jtF6EEXa0xb+Hp2SNeQkQ
	 LdHjjWSZaiEglNOX/7OfqZ27YgLxmXnKj5V/mewx42KUPrx8VsFQmeZosOHhT4ala6b7u
	 tz4i+PZ/wSNbaAtxvxHBQ5fAsKmIFsBgIsfMCyH2LpLf2SJd/zCxdDGezmSExTQizrC1q
	 Um7D+8ALYMjgVmLj/AFSHjQfqIJ9arCNUtWjR6z5KqBtXmJf2lD5grLKXwpz0znD1wPR9
	 DxlWWf5xnT2hv+62I6UBJIAfObIyWDE6CQdOnML/NCoGn1JEcwUWkNPGe2Y9wksShlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPZ3SN0M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8CE606A321
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BPZ3SN0M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814FC1F000EC
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 13:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795614738;
	bh=d1OT518H4ki16FAaDWhpo7G6vnPaZ/w9V0TjOKp530E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BPZ3SN0Mc7yfYD+EH1mBtJFptnm0a2EM4MlUxsZ1vmepJ0UzHsPu3S7Qrlm5cJsyC
	 agcTerqVohBFSD1ywknuv+fFOLUEim9g4Gj5fefAjlOPLXiBmr9Qj3PNVYgnh3KxiK
	 EA7GTFovKjx8jLqDsoDO18OHiC40biTwroqgRoWbyInvJbvxC3HyMIQE/ZNE+vqofD
	 afS/XAvVL93bPUH7rUtImU3an32EIsvWAcsKAoarOwXbpbDvRSDtvI7yOYQiANuy/B
	 NBzwvVSKeK6PSO0qmZwRDsvZ5Gl0XNcKgaz7WbRzxgSRVFkcRyZjxbhC3HuiNp+SwH
	 HckkFb/HfC0uQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso3926733e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 05:52:18 -0800 (PST)
X-Gm-Message-State: APuU4Z8Qyfp3AjqCf80wrvfLauvU4bNk8+laUfr6hoAmhWO3DDHlD8xW
	kFPDSyzDZYk5ofWplNRRlOwYfP2BGYABRNC3ZLwUFb/CA3aW63AsbDWYR6NU7RmZbgTsMTXqVb+
	g2YCKE/v/Q5iNxFMQ0WI3IUsIvMgU+4g=
X-Received: by 2002:a05:6512:114d:b0:5bf:b93e:89f0 with SMTP id
 2adb3069b0e04-5c1bc85f0c4mr4585226e87.62.1795614737267; Wed, 25 Nov 2026
 05:52:17 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 14:52:05 +0100
X-Gmail-Original-Message-ID: <CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com>
X-Gm-Features: Aa3M54rgkY6kl63K6RGx-SAGV9m-zKLuuASbiq7hoLrao3O7E8ZmBvChRlc02Pw
Message-ID: <CAD++jL=xA7eZUeb30xOnCZ8uRy0UE7q8h=8AA4p-tmiBf3Sb9g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ lines
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: linux-gpio@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Pablo Mazzini <pmazzini@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:02=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:

> The A733 description sets irq_read_needs_mux. When a GPIO used as an
> interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
> input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
> interrupt function is 14, so after the first read the pin is left on
> function 6 and its interrupt no longer fires.
>
> On my board this breaks microSD card detection: the PF6
> card-detect line is read at probe, and after that neither removal nor
> insertion of the card is noticed.
>
> The A733 data register reports the pin level while the pin is muxed
> to the interrupt function, so the switch is not needed. The A523 and
> D1 descriptions do not set this flag either. Drop it.
>
> Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733"=
)
> Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

Patch applied for fixes, sorry for the delay.

Yours,
Linus Walleij
