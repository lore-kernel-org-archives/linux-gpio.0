Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932249;
	b=zXBc2MbkZAXF9sIYjForo2CbBAwq9H3FOFuyXJN8jox3GVY/ZROWG596CdgPO9Rc2re5
	 H1NJC/dMpFzO+mpBYLfkxcrbBKfBAma72E+W+IXqGLB1QDUlE72kzjvyelmN/1VJnFnPZ
	 c0LD0paPKbll3EH+HJ8RO0hF+TX04dvTWCzJo0+WudIx0813EYQAjns3iQa0tPKupRJTf
	 BQgOGzHegXd7nL7SxYtTUeY2CZ7zRK09P4PAp+Flt8QrxXYAoNwXs5jrc9IdXr3zWbWnz
	 3oYG9Y2Nf+zF4PgPIseUAopVZ6KTb5NUN9Bwgw0XeFHV9pTwUSuEyJSxFBvIiAVyMTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=;
	b=D9Pcyri4araIqcbuiDC2XIal1DOIDeFHrf5ET+zdvwyZrJgdUy+qxEFJ/cpQf36QPok7
	 s8kBkb0f4Xmq6yQusdA2qVMuDwYvfMVjn3ow988VXCSapa4kyV/I/HbDhBqWhJKyRfpOI
	 m+5q2NdraU+vrZcz1zLEVC4YACXhfRYGa5QS742x9yt2IyTemzaqaqs9pE9ZZF3t15Ldp
	 eFTz/T4f5ykshBwfhE9QO0vB05ul31QjwKEubDaZArK32ge/MZms0fP5DxvZA0XjASLI5
	 3KtIQiKW8raY6o91jYz3mGCsXpWcnV4L2cRF9iONWU5PgCWwSP7dXL8xzvrxT+p+SKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRv5z8YL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090C606A335
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 16:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4090C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRv5z8YL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so286205e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932247; x=1795537047; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=;
        b=YRv5z8YLbbrtZy+LAnNNRr77AJWNhC/HoGsZBhMUc3UjigZJ4n3p23F79l+33PzxNZ
         nJYBI6WVubKDGxbEpz8KIhV+/hYNFMojnOpbPlLaf86OJ3Z28qCXjoI2Wp0ODGNG5Flf
         xApx7qoCcn6+Bt9oUjrdI78rH/JRqYtOYDLrNJc9XwSKlLcx7GdDCTo+OseLvoqYT3y/
         JDCY/u2hDwQP2P4HOvnZrfroDEgQoiOmdIYH5jUhnBsXUp/wv1FYB8rMjO1AXzwbkv9l
         r4IvKVA/rWFYf7bJPULOr9LaAVoj4auHQCpQHevRnzLaQ0Fglr6uu2NCSCpCootUd5xx
         EMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932247; x=1795537047;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtUGM4qs3NyrmXicigtcW+0ZUHZL+8lLEGt7ogClzmk=;
        b=rF4nTSnpBotlvDW7NDoL0X/31DQMr2urfwyp/MT/6oE/qOeVkLTQuuonyjwWYwDc01
         1CQU1SmoUdIp0DfR1VLxsZbVsTuoJBehSdQoOc+NN7O4jU0GhHxQdGecnj2anj9OBRRf
         bikSHFUzljb/ti+1orxNNzmqSnfZwf7WOupogN5i3SUOvzHsuZHb7pDCCL2NIbe7cQLg
         UIhhGAkd+oubFr1CmXjRTK1R3rE4NN7W8mGQiSxHM353DQGi1s+bClpnxkmHKbwRSR3+
         WuH05FqIRRqq/Wclx9N565ocGjNSV68c6kxOZ6BXTquEjRixaNenFIV0FojCFpSmf4dG
         X0+A==
X-Forwarded-Encrypted: i=1; AL+hErHy+UBsslGoXZ27Efmx0//lA1THRsqvRu0wYVaRqkqO4zDp0iVtr/+aOY7MzrTmkDjf7+3vfFyCOeU8@vger.kernel.org
X-Gm-Message-State: APuU4Z9qcShhVbo5+FZ3ueos3Vmg4sK/px0AcQ3o2vlvwjomnMnKM3lX
	Pfk0kvAsI9/hFJJFqknl9O3+ktWDFds4ea7oIKOi5ldAFDrll8hFS8uk
X-Gm-Gg: AYBFou0jNENAtdmvHKfXM78CqHCx6bizFO2jfUt4WCMOJ91swdvLlYLK1qHEFXqGsas
	2TTFwQ8eKimGIumwWDJuwxEkRzeqcH4RnMxHKZ57DC+U+lamAT/G8BN3FH4gvW97+/DsQh8f7sI
	424cEUkugcJN9o+B/wS3ZwUI2ufQpfA5wXFbLPx92tjxMih8RfSZv38birw0EipEUfUtyeW6dzO
	iFG8lqjN2XcPtdxhgOe6+gJ6gwB8ATIxCXzoYUcF11w4OQLzkyoosYLSg6rhdx9lu3pygFbIzAZ
	ueWftlCDsEFmld0Mg7pp0jHEX1jaq9/EGCmKKyUKCUn/WNQByQFMwHi2HQLniB3E+uJrplAG8vU
	uXxgTs5KM7073rZsn44WZWFes/FVllcCsme4HkAAgjU2l8CfAEssz4cSpNvAzCuDffCtlldd854
	4WxrbFM7V3ocGJe9Ra8SOy8xjCZ3U2xC3SUcK+rdaSUaIS6qGTSQiHG7x+pZUEiOSUZn7wVfD8R
	g1YNWDkwwUrVc/D8w4BKsvUsd6nVr5lYRHw8yNgHXKPUfHn5cFjBr6SJbvIgUIBwRvvU5qvxdiu
	UrQIyIDbGndn28CASXrAD4KB253pj704lcYzzxqcvJIDHTaJJJKZs6Nv4pYpHFNQlhvP6Agst7N
	jY7vRddb25xCheTW6Ke1BJD+EWpLHD9wlmbKLYVDpzMjRu4euUsdqyQokKUN7nbe/QGsr2+khGQ
	MV7aHY9wfptRSbmYxmH8EtVn0UDwlTRZC+yuQ2tAzzKtlFvv3pNgumadOzjP/AixVfdrl5/CnQt
	Ij8ugodEU+6tfZRc9I8A87cQzJ0pJKjQwZBge94XcpcwnWmcj/qTpVcmtTb
X-Received: by 2002:a05:600c:b50:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb5c5c8255mr198447365e9.5.1794932247376;
        Tue, 17 Nov 2026 08:17:27 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78344ddbsm82097905e9.0.2026.11.17.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:17:26 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linusw@kernel.org>, linux-sunxi@lists.linux.dev
Cc: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yang Siyuan <hsyysy@163.com>
Subject:
 Re: [PATCH v3 RESEND] pinctrl: sunxi: request the per-bank supply optionally
Date: Tue, 17 Nov 2026 17:17:25 +0100
Message-ID: <uNcaWoiORlCb9uOBOQgmvw@gmail.com>
In-Reply-To: <20261117091944.12082-1-hsyysy@163.com>
References: <20261117091944.12082-1-hsyysy@163.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 17. november 2026 ob 10:19:44 Srednjeevropski standardni =C4=8Da=
s je Yang Siyuan napisal(a):
> The per-bank "vcc-pX" supplies are optional in the device tree: the
> binding documents them, but notes that many boards do not describe them.
> sunxi_pmx_request() uses regulator_get() anyway, so the regulator core
> falls back to a dummy regulator and warns for every bank that has no
> supply:
>=20
>   sun50i-h616-r-pinctrl 7022000.pinctrl: supply vcc-pl not found, using
>   dummy regulator
>=20
> The H616 R_PIO is such a controller, and its PL0/PL1 pins drive the
> R_I2C bus, so every H616 board hits the warning during boot.
>=20
> Use of_regulator_get_optional() instead.  A bank supply that is described
> in the device tree is still acquired and enabled, as it powers the
> physical VCC-Px rail, but one that is absent is skipped without a
> warning.
>=20
> The OF-only lookup matters here: regulator_get_optional() also falls back
> to a global regulator-name lookup.  If a regulator with the same name as
> an absent bank supply is registered later, a subsequent pin request in
> that bank could acquire it and start the per-bank refcount at one, after
> earlier pins in the bank had already been requested without a regulator.
> Freeing any of those pins would then disable the supply while other pins
> in the bank are still active.  Restricting the lookup to the pinctrl node
> makes an absent supply permanent; record that state so later pin requests
> do not retry the lookup.  The refcount therefore stays balanced.
>=20
> Signed-off-by: Yang Siyuan <hsyysy@163.com>
> ---
>=20
> Changes in v3:
> - Use of_regulator_get_optional() instead of regulator_get_optional().
>   The latter still performs a global regulator-name lookup, which can
>   bind an unrelated regulator that appears after some pins were already
>   requested and unbalance the per-bank refcount.
> - Remember that a bank has no supply so later pin requests skip the
>   lookup, and keep the existing no-regulator check in sunxi_pmx_free().

Remembering IMO isn't worth it. It complicates the code which runs only
at probe time.

Best regards,
Jernej

> - Link to v2: https://lore.kernel.org/linux-gpio/20261026152027.1417178-1=
=2Dhsyysy@163.com/
> - Link to v1: https://lore.kernel.org/linux-gpio/20261026144751.1392715-1=
=2Dhsyysy@163.com/
> ---
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 29 +++++++++++++++++++++++++--
>  drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 +
>  2 files changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.c
> index 70099052d..d2345a85a 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -913,23 +913,44 @@ static int sunxi_pmx_request(struct pinctrl_dev *pc=
tldev, unsigned offset)
>  					    PINS_PER_BANK;
>  	struct sunxi_pinctrl_regulator *s_reg =3D &pctl->regulators[bank_offset=
];
>  	struct regulator *reg =3D s_reg->regulator;
> +	struct device_node *np =3D dev_of_node(pctl->dev);
>  	char supply[16];
>  	int ret;
> =20
>  	if (WARN_ON_ONCE(bank_offset >=3D ARRAY_SIZE(pctl->regulators)))
>  		return -EINVAL;
> =20
> +	if (s_reg->supply_absent)
> +		return 0;
> +
>  	if (reg) {
>  		refcount_inc(&s_reg->refcount);
>  		return 0;
>  	}
> =20
> +	if (!np) {
> +		s_reg->supply_absent =3D true;
> +		return 0;
> +	}
> +
>  	snprintf(supply, sizeof(supply), "vcc-p%c", 'a' + bank);
> -	reg =3D regulator_get(pctl->dev, supply);
> -	if (IS_ERR(reg))
> +	/*
> +	 * Use the OF-only lookup: regulator_get_optional() would also match
> +	 * a same-named regulator from another device.  Such a regulator can
> +	 * appear after some pins in this bank have already been requested,
> +	 * which would unbalance the per-bank refcount.
> +	 */
> +	reg =3D of_regulator_get_optional(pctl->dev, np, supply);
> +	if (IS_ERR(reg)) {
> +		if (PTR_ERR(reg) =3D=3D -ENODEV) {
> +			s_reg->supply_absent =3D true;
> +			return 0;
> +		}
> +
>  		return dev_err_probe(pctl->dev, PTR_ERR(reg),
>  				     "Couldn't get bank P%c regulator\n",
>  				     'A' + bank);
> +	}
> =20
>  	ret =3D regulator_enable(reg);
>  	if (ret) {
> @@ -959,6 +980,10 @@ static int sunxi_pmx_free(struct pinctrl_dev *pctlde=
v, unsigned offset)
>  					    PINS_PER_BANK;
>  	struct sunxi_pinctrl_regulator *s_reg =3D &pctl->regulators[bank_offset=
];
> =20
> +	/* The per-bank supply is optional, so this bank may not have one. */
> +	if (!s_reg->regulator)
> +		return 0;
> +
>  	if (!refcount_dec_and_test(&s_reg->refcount))
>  		return 0;
> =20
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunx=
i/pinctrl-sunxi.h
> index 8bd00c6ff..651249b23 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> @@ -162,6 +162,7 @@ struct sunxi_pinctrl_group {
>  struct sunxi_pinctrl_regulator {
>  	struct regulator	*regulator;
>  	refcount_t		refcount;
> +	bool			supply_absent;
>  };
> =20
>  struct sunxi_pinctrl {
> base-commit: 091b06388b117fefdcb63336ac09956a4914b961
>=20




