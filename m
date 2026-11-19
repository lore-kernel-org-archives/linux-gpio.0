Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131805;
	b=mIgRVWorXQTyOAEDvgVN7KU2cIuCTAckCP3URIAftcF9Bebfn3NPXYl03Hic5AfMJ0tz
	 TVrOnuFt+N/qk7N9+c/3ih0Tm+KL3v9nin1IBI4dyiv/+/fNhuA4blTaRXnC2tBBEcVhr
	 usnmu30fcT2vHg7T8pEP9D9hvd6aNGJwCzpkwEuTdPvOK+XXfb+/fb5xL3a9iB7gCaGOM
	 Af/ZovnfsNA2kvJ7ghNl1F+J8Q96N0mRRmgV5h2KVAHwDRDdXfoaN8eGybJKlW7ldciOJ
	 FvwJgU7eINQ1RDsNpYy1LLQJ/1/kVkZZd+opQr1o2ONQv20+BLUCXM8wiGQdEcmZaNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a1RcoXDCIqDz0mZrwh45AaWPwxdwv9T1vBYdeIP6qOM=;
	b=2lbAK3qoJnjLBqA9iDtMc7v1dkHja2O6ADZ4XaqlljSLpXm5zuqHI9mJFTVgYnzsLSE4
	 sM2/zfPdeTx3oafbs4CvgbJyN7H/Wo1ltH4IclL1fJkObdNMhh5C8XZWi2nGGsY6GjOiX
	 X4rH0Os0arWPGBY6kZLpnpnBkmqGfCI7fCr89HAx0GLfukzDp/8p3ndVwOtZDMoIGmk24
	 eDKDrBR4IM0aeJRPnrg9PucVR1nGHUjJTD3ZwryJfPXf78vrMtAuy0xr1mjn0xEgUA6WH
	 nSXm0eYkOdeq99x5mwDdkbnvQDIW+I3JUhUoahfa/r6NkNsXWJaBiAzvzumgagrBWjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaCqrUCw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BC606A325
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaCqrUCw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FB61F000C4;
	Thu, 19 Nov 2026 23:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795131805;
	bh=a1RcoXDCIqDz0mZrwh45AaWPwxdwv9T1vBYdeIP6qOM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=GaCqrUCwSDJhSqQquEIjlDHb+IMQNjBvju/CYOMOltPcy9Vym5Evrp9MzLZ2/3npk
	 RueukvnV3lNURPfNjgQTcRta3zDd/jaf+6QExSQ9mNkSpxklu6vdHmKbD5MxR889yl
	 rFgJM80JNJfcmxhqw9i5pOmBIQmdepJC6WW0g0UwlW4xqz6r8H1UwZky4odnrS6oy9
	 UxWlNnhksG80EVAJ992lewbnYjfRXyyv/WiWXg4y788tVG4mE1hES9PQC2gz7E7CqW
	 LVdYz3jEHtC3g2ayyJ3eiOIMqrI3BzkQRNM8pL+3WuN+WX2npkFtbcqftNYE57LLl7
	 FsC2UYl6h3BMw==
Message-ID: <sashiko-outbox-224210@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] pinctrl: single: Also free the pinconf table of a
 duplicate function
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-gpio@vger.kernel.org
In-Reply-To: <20261119232806.4093754-2-alexander.sverdlin@siemens.com>
References: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
 <20261119232806.4093754-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 23:43:24 +0000
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
- [Critical] pinctrl: single: use-after-free in
  pcs_parse_one_pinctrl_entry() [1]
--

commit f9a80b7d4b1cc004ae636f5e91a037b0d6afbc93
Author: Alexander Sverdlin <alexander.sverdlin@siemens.com>

pinctrl: single: Also free the pinconf table of a duplicate function

This commit frees function->conf when pcs_parse_one_pinctrl_entry() drops
a duplicate function on consumer re-probe.

> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-s=
ingle.c
> index 52734bd7b7f06..95c8bd38459c8 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -1102,6 +1102,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_d=
evice *pcs,
>  	if (pinmux_generic_get_function(pcs->pctl, fsel)->data !=3D function) {
>  		devm_kfree(pcs->dev, pins);
>  		devm_kfree(pcs->dev, vals);
> +		devm_kfree(pcs->dev, function->conf);
>  		devm_kfree(pcs->dev, function);
>  		devm_kfree(pcs->dev, pgnames);
>  	}

[Severity: Critical]
This problem wasn't introduced by this patch, but can the error path in
pcs_parse_one_pinctrl_entry() (and pcs_parse_bits_in_pinctrl_entry())
remove an already registered group and function [1] and cause a
use-after-free?

When a duplicate node is parsed, pcs_add_function() and
pinctrl_generic_add_group() return the existing selectors fsel and gsel.
If pcs_parse_pinconf() then fails, the error path unconditionally removes
both selectors from the core radix trees:

drivers/pinctrl/pinctrl-single.c:pcs_parse_one_pinctrl_entry() {
	...
	if (PCS_HAS_PINCONF && function) {
		res =3D pcs_parse_pinconf(pcs, np, function, map);
		if (res =3D=3D 0)
			*num_maps =3D 2;
		else if (res =3D=3D -ENOTSUPP)
			*num_maps =3D 1;
		else
			goto free_pingroups;
	}
	...
free_pingroups:
	pinctrl_generic_remove_group(pcs->pctl, gsel);
	*num_maps =3D 1;
free_function:
	pinmux_generic_remove_function(pcs->pctl, fsel);
	...
}

This deletes the original group and function descriptors while active
consumers still reference them, and leaks the duplicate function,
pgnames, and function->conf allocations.

[1] https://sashiko.dev/#/bug/linux-146c577c-dec4-4dc4-b28e-826c1cc76a9a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119232806.4093=
754-1-alexander.sverdlin@siemens.com?part=3D1
