Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892797;
	b=UtUy4epRatXaECF9Nr0pAA30DbvBh16VtFPOHHgv6cHr0MowfaXmzcjTlOW6qjkknl3w
	 SXeV5enOJxgP25JgDiqSlscqQf+r1y7drVaUGEm3XQLOCltXoxqy5MDAy9ESbI2JTNNZG
	 d2jWBAeIEIAUdR++u2k7rzBMXmmbQ6N7PNx3QySfpX7KE/R0zsoVkuP4Oja9gdR19lTDh
	 pVrq1I5hikkkbPIA9llIuDPsJdjBtB3xPgZ93mtMmjytQ3Jok1hxn8B8o4SLQI7hpuAfC
	 m+w3wrNhS0sD0sbEz9PudFfyFpGPtLky0qeOEqencMAjajTzchV6nrHm++t+Hc8QCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892797;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=isC2AL25To+MLCl3aYVMEMb2gGLkTpgCybZWqSbFh3I=;
	b=2+tzxwAZdHRXUTgbhJNT2XWnY8IgmHjfAgRv9NTIY8vfJqa71dSfSIYKUIVkWNRVhS8l
	 TOYswhf2a36n1e1gJjsWeJhn0gyeqHfVxlk7eOUqVw5dBYlN/ZOUVkftZ68FhJaP7FJa7
	 BcevS1qQRhW3xBiOzhTQHg3ukZdwpruJSVYZhwBROplQ+dk/UCHvZb1zeuL1yi9msO7u1
	 M5a+5m2rgfCChTztXRstKNCmKMTVSK4VkgGx4cX0L25Mwz9wGI6LXr/6/Pe7BdvR3SAAu
	 NIgnlv7C3g/xE9a1H4lLUWddUCNuGBgizHctaARDDezJK3AELW4j7rLy45Ci4HsEd+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OP+e3gCo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7747E606A334
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OP+e3gCo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3AD1F00919;
	Thu,  5 Nov 2026 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892797;
	bh=isC2AL25To+MLCl3aYVMEMb2gGLkTpgCybZWqSbFh3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OP+e3gCoQ49TuhKNPOfMVs7lqB0x7C4BqOy0cZEOmoOp1bVfnudAm2wlT2Fm51EdQ
	 fHI07uev9dasH70lzSTe3A0bYUy26gux1EIj0ZnRmid5DwIcOHwBbgd8l8NcuRqdkp
	 MLyhpynf1mQ+EfHb7Lgxh0ZhyaCNEtb5DmsvgCGalyz81vh0X0OOCIJndqFm85qUu2
	 MGrbQYOnEm/clJokwcSQNXJKQJJJUYZpoTh4AtpO7iIFkh6mqdQWUicK/x1lgeJzrP
	 Uc7D8e6cGTBDK99Vqt8fUsxc79fj9cvAnKiFqg3sZ2GLUHaQ7oUjlQdhrcX3iubw6i
	 T4smG40PTFggg==
Message-ID: <sashiko-outbox-199315@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] pinctrl: aspeed: Hand over global GPIOP passthrough
 to local mux controls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prasanth Kumar Padarthi" <prasanth.padarthi10@gmail.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
References: <20261022024314.48623-1-prasanth.padarthi10@gmail.com>
 <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:33:16 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: aspeed: use-after-free on unbind in aspeed_g6_pinctrl_pro=
be()
--

commit 7926ad91b4f1741a83b80da360b9a845357a5376
Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

pinctrl: aspeed: Hand over global GPIOP passthrough to local mux controls

This commit transfers global GPIOP0-P5 passthrough selections in SCU510 and
SCU51C to per-pin mux controls in SCU4BC during probe, and blocks GPIO and
mux requests on GPIOP0-P5 if the handover fails.

> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g6.c
> index 85d6640ff4c4e..be22a918420df 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
[ ... ]
> @@ -2778,15 +2827,103 @@ static const struct pinctrl_desc aspeed_g6_pinct=
rl_desc =3D {
[ ... ]
>  static int aspeed_g6_pinctrl_probe(struct platform_device *pdev)
>  {
> -	int i;
> +	struct aspeed_g6_probe_data *g6;
> +	struct regmap *scu;
> +	int i, ret;
> +
> +	if (!pdev->dev.parent)
> +		return -ENODEV;
> +	scu =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(scu))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(scu),
> +				     "No SCU regmap for THRU handover\n");
> +
> +	g6 =3D devm_kzalloc(&pdev->dev, sizeof(*g6), GFP_KERNEL);
> +	if (!g6)
> +		return -ENOMEM;
> +	memcpy(&g6->pdata, &aspeed_g6_pinctrl_data, sizeof(g6->pdata));
> +
> +	ret =3D aspeed_g6_thru_handover(scu);
> +	if (ret =3D=3D -EPROBE_DEFER)
> +		return ret;
> +	if (ret) {
> +		g6->thru_error =3D ret;
> +		dev_warn(&pdev->dev,
> +			 "THRU handover failed (%d); GPIOP0-P5 mux requests blocked\n",
> +			 ret);
> +	}
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(aspeed_g6_pins); i++)
>  		aspeed_g6_pins[i].number =3D i;
> =20
>  	return aspeed_pinctrl_probe(pdev, &aspeed_g6_pinctrl_desc,
> -			&aspeed_g6_pinctrl_data);
> +			&g6->pdata);

[Severity: High]
Can this cause a use-after-free of g6 if the device is unbound?

In aspeed_g6_pinctrl_probe(), g6 is allocated with devm_kzalloc() and
&g6->pdata is passed to aspeed_pinctrl_probe(). However,
drivers/pinctrl/aspeed/pinctrl-aspeed.c:aspeed_pinctrl_probe() registers the
controller with the unmanaged pinctrl_register() helper:

drivers/pinctrl/aspeed/pinctrl-aspeed.c:aspeed_pinctrl_probe() {
	...
	pctl =3D pinctrl_register(pdesc, &pdev->dev, pdata);
	...
}

Previously, aspeed_g6_pinctrl_probe() passed the static
aspeed_g6_pinctrl_data structure, which remained valid for the lifetime of
the kernel. Because aspeed_g6_pinctrl_driver does not define a .remove
callback to call pinctrl_unregister() and does not set .suppress_bind_attrs,
unbinding the platform device via sysfs frees g6 via devres while the
pinctrl_dev remains registered with driver_data pointing to &g6->pdata.

Subsequent calls to aspeed_g6_set_mux(), aspeed_g6_gpio_request_enable(),
other pinctrl callbacks, or pinctrl debugfs entries will then dereference t=
he
freed g6 structure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105152348.8567=
-1-prasanth.padarthi10@gmail.com?part=3D1
