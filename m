Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036103;
	b=1vqEPyFjy9IvBLM7h7fjXbK7iHnVc93NkpGNN0ymerlDG7pmX53nlunz5beWzHKIV3id
	 jnNSMgutmU5DjpKpF7w2FpzwcFeU/aWwswAOsgCA09z3jQY41+fK/5oqJ3RIkPcO8qkI+
	 cWpsJ+cKDjHIYm7otlNwbN1dl/GCXJF30j8j9nhc8sKa2uitFSWEVz8Jzj/xVrsfKGHfZ
	 V2tMoWE8egJ2MoIsoAKBhftKhe736YxmfSdOC8dYeLaVXioLjgVTq6xuqmh3K/5S3+hhB
	 nCLHfp2tlyKDSbUkje00buBPb4pODfKTH2Zp6h1q5a/cj42i/kujB0YcfYYzEK2a8hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036103;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1v260OT69H55l4pPpHqX5ZIgboqZUsGVMtlBm+leSH4=;
	b=or9KKzvBmhqAr0pbpUMAv0KET1fVTi5Tr8ZqI4ka2F4s1EYxgVSVDqNpXmNmNFJkxHD6
	 k0+vYkjlOitTORjm7D7FyYXN/u1XFnZkaQHS7tEcqbcqQYx15GklJ7GFu+4aN4XpzEl7i
	 ZpvM0adlsOYWXPzzhnQ4wU1nT77uGX6Hr2aNjWK7hFwoLeY2ZfKVUiW7XXVOIwD2zk+Hb
	 clJVQYyM60VDmeKS69bA7nAi/XRyB+gu02WI1Pnd1NlhEs9QqHF0gWtrQceFUSSA5Xwn4
	 Ou0QmWRIwXOxNdOaChfFjx3cmlhWXd3NdmQ1bqJd4njpNh5XXnBRywEm8nn+xO5GdqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMtKPAWq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B63606A32F
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMtKPAWq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8886A1F000CF
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 21:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036103;
	bh=1v260OT69H55l4pPpHqX5ZIgboqZUsGVMtlBm+leSH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aMtKPAWqv/9NpkWPUxD4QcmJvVdUClTFWGkif1c7/N6d4sm0sFskJb0B9DHB1/N63
	 HTJh/0PLD4F6dZaHs9MenIlX0vZoLUwDEaawhyzrl08RY98KcmGIczJ4OsDjKdeFwS
	 Da75NJqCx0xJgQMA1fyT2nJAalcfrx5/oZG09/QDMVrPxB0wIe5E1LwuO+Z/snqmBt
	 ORDO44Zp7WyBCU8sobMyCF4OlnUDcNTGnm9jjvHbC+Hp52DffluZxasmLZqDyBQGk1
	 Jb9CANWl0YFQjpZg8KxH7wFZUKKseDa9Dw34YymJbW7VS7lbYPlgf2wR7/xEgKvnal
	 +quEpvvipzzqg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so13125761fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:08:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFz4Xe9cBI/JYnoThQwSlgkS78NK615Iscg+3x4pL/eNjCAb8vnDW6NaeTG8U6yOHbqt/IpapKXW5Sh@vger.kernel.org
X-Gm-Message-State: APuU4Z9e+rQUWZA9x3i/DoYjH9sQt16lbKh6IC4jAPhnb0Pp5L/w0DWd
	mOVnMH5DbwZIli7yLJpL6m0A9ef4gJyG0sejf4abj0YZNvy0Q/HrJHM11VNdLgAYMpK+o98nSey
	LMcdrkNfRxAPgPcC2yRt4l22neP2p0Gg=
X-Received: by 2002:a05:6512:a352:b0:5c1:ad4b:4bc8 with SMTP id
 2adb3069b0e04-5c1ad5a9200mr672182e87.33.1795036102287; Wed, 18 Nov 2026
 13:08:22 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
In-Reply-To: <20261110083253.1525-1-laixiangwu@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:08:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLkUqc1Bm-34_5ocG7Qw4oJjSNu=B93CvANba-3LNMo-9Q@mail.gmail.com>
X-Gm-Features: Aa3M54pzy5iXCZO2yGpkbAFpLnZT71qI2PdQXtRpY5tdOhwtfxvX4H4dr9ZLAU0
Message-ID: <CAD++jLkUqc1Bm-34_5ocG7Qw4oJjSNu=B93CvANba-3LNMo-9Q@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: stm32: Fix reset control leak in
 stm32_pctl_probe() error paths
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:32=E2=80=AFAM Xiangwu Lai
<laixiangwu@cmss.chinamobile.com> wrote:

> stm32_pctl_probe() acquires an exclusive reset control for every GPIO
> bank with of_reset_control_get_exclusive(), but none of the error
> paths release them again: the bank loop returns directly on
> -EPROBE_DEFER and on a failed clock lookup, and the
> clk_bulk_prepare_enable() failure and the err_register path also
> leave the already acquired reset controls behind.
>
> On success the reset controls are kept for the lifetime of the device
> and are never released either (the driver has no .remove), but that
> is harmless.  On a failed probe, and in particular when the probe is
> retried after -EPROBE_DEFER, every attempt leaks another set of
> reset control references.
>
> Release the acquired reset controls on all error paths.
>
> Also release the clocks of the already processed banks on the
> -EPROBE_DEFER path, which was missed by the earlier clock leak fix
> dfd8259507c5 ("pinctrl: stm32: Fix clock reference leak in
> stm32_pctl_probe()").
>
> Fixes: 2254e77665d5 ("pinctrl: stm32: defer probe if reset resource is no=
t yet ready")
> Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>
> ---
> Changes in v2:
>
> - Point the Fixes tag at 2254e77665d5, which introduced the reset
>   control acquisition in the stm32_pctl_probe() bank loop and the
>   -EPROBE_DEFER return path; bb949ed9b16b only replaced the child
>   node iteration helper (suggested by Sashiko AI review).
> - Also release the clocks of the already processed banks on the
>   -EPROBE_DEFER path, which was missed by dfd8259507c5.
>
> Link: https://lore.kernel.org/all/20261110065722.1340-1-laixiangwu@cmss.c=
hinamobile.com
>  drivers/pinctrl/stm32/pinctrl-stm32.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm3=
2/pinctrl-stm32.c
> index 98cf9c6f4..2a54a0176 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1966,15 +1966,18 @@ int stm32_pctl_probe(struct platform_device *pdev=
)
>                 bank->rstc =3D of_reset_control_get_exclusive(np, NULL);
>                 if (PTR_ERR(bank->rstc) =3D=3D -EPROBE_DEFER) {
>                         fwnode_handle_put(child);
> -                       return -EPROBE_DEFER;
> +                       clk_bulk_put(i, pctl->clks);
> +                       ret =3D -EPROBE_DEFER;
> +                       goto err_put_rstcs;

Looks like a bulky fix, what about just stop using
of_reset_control_get_exclusive()
and use devm_reset_control_get_exclusive(&pdev->dev, ..) hmm?

Yours,
Linus Walleij
