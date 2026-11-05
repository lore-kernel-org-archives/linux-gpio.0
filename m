Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871115;
	b=cYB0Vf2F1ZRNNSz77k5RQLnCrODt7WW3okQeBbzGalYVyAFJNAr95hKxJr2KeW36n2Mq
	 PyRNI1/aak08BrzkyYIvAmCfFjrNofKYrctze9uXhpCw88wgMN+cSnVCTiMqc8TWdmK0k
	 Txi/yMHgOmMT3WYWP7LQkgDymIJb5+0/7+zA1nVr9Y/06kJjvEYPjacbvJEvo1u7QpBUd
	 XzkHwp8P/n6aLeOddhpnwYNxtPW30Piw9T6ZTc7UIZuT4vH2br+xYAt+3JJcjnhJC4Kqj
	 QdjPgWR2AxhtzNKXk5eW1zIJD9u4A+/yUM/82leSeN04UBx88bWZm5ucAJGd0ZtPcGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871115;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZkVqtLjUqt4q2Jyn6P0EMBzcZWkIY6LjRDfUPL4Bjno=;
	b=M92JXOnn0jNo55G8nDb6mZi1PwAdI//6YHWxdHGkOOnbR+Ur+s14xxi1hJ79HuaQfbil
	 Inj+0lf8dqAcaWc3xV7lfUA6mzJ/y+CLPQYfQzo6x18y5GTCUv0TTpKn8kF8jtlxHIXcU
	 7KEaoY43DA/C0ozmh5Qen9h4S4s1N63uLpWUlfn5ca3RW6pwV2HAAkpwIYUV3ZbbHGwd6
	 LktaaH8R6EDHXkpqp+eqa4MGroyI/73nGUdHyLfX6D9bms9lmt1Ivgj2oFmizsRqkYTh+
	 5BkbtBAx4b8xvkg9aafnKSlCopPGYVUDUI1QYP3MKPNYsX1rKc25UrYZxftqv6p8J9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcGF+ZvB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628D606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IcGF+ZvB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8C01F000C1
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793871115;
	bh=ZkVqtLjUqt4q2Jyn6P0EMBzcZWkIY6LjRDfUPL4Bjno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IcGF+ZvBwwIDv6RtPf1x87ef0btHX70l7XDMWkc/ro1KTUvF05h0ToPfcRT8jesUk
	 Fhr2cO8O7EIKgzsE3HBIOFYjUT5lwPLHfGHCu3ArLld9sTb8XbdT+txyHco1od0kRH
	 DLWSapdam7sTv8Tr1UtGO0+9ZsCsweL7iRqpQ+G9kKlaONpqZ0UgnKSu4Hq1nsnqd3
	 8Mrh6MGAZcA3Z2985TXdwkJ+KOiT7FujUYG+H1JhEKShwgXLR1eNmrtkBYP6KQJ5wS
	 MxoUbm2zigts17cd8T7srBFWrIfivBxyssHH9RLutMD+sDhv84Iv1RL4n43o4vkAdt
	 vScoMcwFN79pQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1552837e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:31:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBysBnzz7y5FpZs5X4wcqNF8RCbPtVHpuYOM15cZYE3pEOYFvbv63dt223US/CtZ5W4dMwYJyPBvsQLM@vger.kernel.org
X-Gm-Message-State: APuU4Z8kD6dXgEEetb8r3jPAYAdiuEVyQj4FosE5co0hgvRLPqCoK1k+
	RCW7x/nyVn8PwH2hLpvhABbBsSPNscdveWA63FbDaJ7NIGHaSUigZ9lhhX16H8A33rNlV9tEhoQ
	OzGdSPdW5pGXboPCr+IulbsztRmSVh/I=
X-Received: by 2002:a05:6512:3f14:b0:5be:64aa:af1 with SMTP id
 2adb3069b0e04-5bfd951d51cmr6307404e87.3.1793871113805; Thu, 05 Nov 2026
 01:31:53 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev> <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
In-Reply-To: <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:31:40 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
X-Gm-Features: AclHuK8im8p1ygqVyltdRT9NHRhFsG2j-za_UOILYFTJ-DqXIB886YYYR3EPHIs
Message-ID: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: joseph@telaak.dev
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

thanks for your patch!

On Wed, Nov 4, 2026 at 8:21=E2=80=AFAM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:


> +static u32 sf_gpio_rd(struct sf_gpio_priv *priv, unsigned long reg)
> +{
> +       return readl_relaxed(priv->base + reg);
> +}
> +
> +static void sf_gpio_wr(struct sf_gpio_priv *priv, unsigned long reg,
> +                      u32 val)
> +{
> +       writel_relaxed(val, priv->base + reg);
> +}

Completely pointless indirection, drop these functions, just use
readl/writel directly in the code.

Yours,
Linus Walleij
