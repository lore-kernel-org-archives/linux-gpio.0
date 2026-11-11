Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436355;
	b=eEB0SgbDIjfTcUqt2gC/6uVA3I3pCat/CG3RxFgYhR1SAuHSjTTEsoC8zei2oF4Yqamy
	 IrRQkZnPuhn9dd/HedxaiB6zEhJFXpSuu8e2A5e/LI43Zd4KCh5Eh9OgZa9c6tpgyxyoT
	 dMyYa+cg3Hm3x8iNSg4xGiHqBW8TX1lMcGHACZkR898Gma28dqBCpRQTWSWKG0wpuuJWA
	 uzA4TodQ8iBbnZoYnqIy7RxC0UsELOya8//2kyn282i8288KRRSdTVvf5jlygtAMRvdwB
	 TAquuhepDEGYzWFVDsVbuDfwd37mPZBVN6cGPL15pkPhvV5wKnynft8+HGPrQEcazzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436355;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Vw/iZRjnq5u6olNAG8TzrzeWTSkg8Ff7GhTzirFMS28=;
	b=UgU/goF/kYj7OP4bIedpspxzHEy/4vbry7rS+s/SpcDqqgmbCme1ZiEQrWqd05fLw/S9
	 2Wevi9Qc3ipr3LVYaoDtONVxDgvPXK3ujbB0uUqEhTMUYdpo+NL+hDJhWEyTyBBFllUQD
	 XZ0eUr03h00kxAIrQu38t3jOwJIk0ophzEKHSk9Bj6fYXVyig5r+9hMe8iIuCKvTgUMhD
	 74ip2DYnxEo8kUlvdbtAqToB/sS5dTQl7IS2u2Nnq67r5CFmOgOOcbArEi3kdSoYoPtqO
	 M8wvfIgN4W4rj54BS2ZyOya2pkKf086csw/U5aCMhSxDF+NN16m1P5VfK2wpJxh+MtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpKr+4jY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249BB606A32D
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 22:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gpKr+4jY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71C01F00A06;
	Wed, 11 Nov 2026 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436355;
	bh=Vw/iZRjnq5u6olNAG8TzrzeWTSkg8Ff7GhTzirFMS28=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gpKr+4jYbjuJw/rLLqoYV5xNoPa8MxNT8eVMf7y2bfn3SgFBXGhj0ldXaiJ6YoNvV
	 DZ59DKyEvrc0G7NNzdbdPh8VThb0NpnGcls/TryIfWpsVjB7IFwUEt+Hpph/ZduJ7e
	 jTRqT3+lE09nP8ApLwMlS8WLEm/CoN38t7UImPR16trJHRjNxX6RP5q/DwN3kjmqOD
	 Pw0vVOh2KWiVLQzkUy0lzNJ7GeUMMIBsFlNK/CpfzOF4MU4CdjBQ/7r6QZTLACAwTf
	 pIynq4Q7x0LuL2SQ/ZtK06w/UZnu383x+QelRnxMgi9SMWJpg0wy9m9ei93bT77pSP
	 lQe4WxnKLG3Aw==
Message-ID: <sashiko-outbox-209804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] pinctrl: nuvoton: npcm8xx: Propagate
 npcm8xx_gpio_register() error in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-gpio@vger.kernel.org
In-Reply-To: <20261111215256.1982044-6-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
 <20261111215256.1982044-6-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:32:34 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] pinctrl: nuvoton: iomap leak in npcm7xx_gpio_of() and
  npcm8xx_gpio_fw() [1]
--

commit 86095407b58f80f7127008d829c751165be4ce58
Author: Lee Jones <lee@kernel.org>

pinctrl: nuvoton: npcm8xx: Propagate npcm8xx_gpio_register() error in probe

This commit adds the missing return statement in npcm8xx_pinctrl_probe() so
that errors from npcm8xx_gpio_register() are propagated by dev_err_probe().

> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/=
nuvoton/pinctrl-npcm8xx.c
> index b695a682b4342..39fcd05fc522c 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> @@ -2582,7 +2582,7 @@ static int npcm8xx_pinctrl_probe(struct platform_de=
vice *pdev)
> =20
>  	ret =3D npcm8xx_gpio_register(pctrl);
>  	if (ret < 0)
> -		dev_err_probe(dev, ret, "Failed to register gpio\n");
> +		return dev_err_probe(dev, ret, "Failed to register gpio\n");

[Severity: Medium]
This problem wasn't introduced by this patch, but does returning an error h=
ere
(or on earlier error paths in npcm8xx_pinctrl_probe() and npcm7xx_pinctrl_p=
robe())
leak the pctrl->gpio_bank[id].base MMIO mappings [1]?

npcm8xx_gpio_fw() and npcm7xx_gpio_of() map each bank's registers with
unmanaged fwnode_iomap(), and nothing calls iounmap() when a later bank
initialization step, devm_pinctrl_register(), or GPIO registration fails:

drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:npcm8xx_gpio_fw() {
    ...
	for_each_gpiochip_node(dev, child) {
		pctrl->gpio_bank[id].base =3D fwnode_iomap(child, 0);
		if (!pctrl->gpio_bank[id].base)
			return dev_err_probe(dev, -ENXIO, "fwnode_iomap id %d failed\n", id);
    ...
}

[1] https://sashiko.dev/#/bug/linux-cf83b9c0-f3a2-4dc8-95a0-af6fafb6d092

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215256.1982=
044-1-lee@kernel.org?part=3D5
