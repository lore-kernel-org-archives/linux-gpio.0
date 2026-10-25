Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792943682;
	b=aghBnXLAASqkD+go9ZkX2WjEnVOSRavtG3WWoTs5HlaSHjrEddC71iz6jP/7qtKZ4OOM
	 sp0lghJG7TyprEKv9MEtb5I/xhBvHf2SPi/HslMO+Iyc/fcsdjFGrm6gNi1SHhANHJtfc
	 OrXEZ8wdPuRiIxKcfzcbEgjteXhLiQqTU5HzpfjxhgOUqU2Lph97jriR/0eY/ZnXgTLcB
	 tNGER/1K2HaUOtTj/4i26l0a39NM62VHshTP4cauQwDDwLSEVesqbb3V/A6tsX7Gca6BV
	 Jsnj9/nzseDAn8CJYVT7CvYrwv1bzm9JW2utGyN5qhiz2xDIErrKcE3klxorDrnbnIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792943682;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6M72Z0bk6SdSbqnZholF2MUJk+KKG6Yjw0dEu31VE2c=;
	b=oXWP8vfWW+4Pplf5UiW/NBqNzClPHXCix6S8ItMoeDtDox1jDXLbd1ji2w1GLgp+QqcV
	 Ujcmi8fxMoM2skkriovU5//bddzE8MWZ3P1mpQd6jbo2bN90UzU8AW52HVm9oczpEux69
	 +hCNYxK7g4hQSxvrfnQoot+bSte8liGxboXSjv4vZseLN2q8uqwukODBNXbqsbbe3kP/o
	 hkrtH9+VtA8Sm1vYlBW6TIRtCdo5WvSc1a324dSZYf3O7AWyVfMWamW07VTlUw4aIhapO
	 mhxVDksgg5TKgEJJx60gCMKvL+xMURNYre6KS1/ggjxbsdmg2hXdDm075BgUcdCM1iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AF5ehr7J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7526D606A31A
	for <linux-gpio@vger.kernel.org>; Sun, 25 Oct 2026 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AF5ehr7J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF2E1F01825;
	Sun, 25 Oct 2026 15:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792943682;
	bh=6M72Z0bk6SdSbqnZholF2MUJk+KKG6Yjw0dEu31VE2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AF5ehr7JOCF4yhcskNUPF1js5ZVwajUf4ZWbu1DbcKkzU2xyI+yGOPgw8qpCppNVr
	 kETyUybPiH1nXVXK0TpA8r6l08+Pae13SZAUH8VTXzNIwvUtSKW9r5lXVbfvgGNQKe
	 qRJWRRhLFMwZCvZEDDRKZSyCTcf1sNvhS6gNJjRWATlQOe+0UHfzvhqn05b3Sp3yfA
	 vTPZ96q8WMsxDe1vdLxuT4YTHGBWK69q/e1ZimOGcuiiCWcEwb2XEAbjLQ90dnGTuR
	 R53sMTxtKdXsFU1YZaROYRlbDmqZ1laGYSE2Y/ZWenkdcoCts9Uz0fNYPPspWWtc39
	 t+86aSn2hzGjQ==
Message-ID: <sashiko-outbox-184266@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: pca953x: Add support for MaxLinear's XRA1200 /
 XRA1200P
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWc=?= <ukleinek@debian.org>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261025154840.657888-2-ukleinek@debian.org>
References: <20261025154840.657888-2-ukleinek@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 15:54:41 +0000
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
- [Medium] gpio: pca953x: missing PCA_INT flag for xra1200/xra1200p in pca9=
53x_id
--

commit 79260b2b7ac0a0bff8a0c5399da85adabe336338
Author: Uwe Kleine-K=C3=B6nig <ukleinek@debian.org>

gpio: pca953x: Add support for MaxLinear's XRA1200 / XRA1200P

This commit adds I2C device ID and OF match table entries to support the
MaxLinear XRA1200 and XRA1200P 8-bit I2C GPIO expanders in the pca953x
driver.

> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index afec5ec236968..ea01fd152ac22 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -124,6 +124,8 @@ static const struct i2c_device_id pca953x_id[] =3D {
>  	{ .name =3D "tca9538", .driver_data =3D 8  | PCA953X_TYPE | PCA_INT },
>  	{ .name =3D "tca9539", .driver_data =3D 16 | PCA953X_TYPE | PCA_INT },
>  	{ .name =3D "tca9554", .driver_data =3D 8  | PCA953X_TYPE | PCA_INT },
> +	{ .name =3D "xra1200", .driver_data =3D 8  | PCA953X_TYPE },
> +	{ .name =3D "xra1200p", .driver_data =3D 8  | PCA953X_TYPE },

[Severity: Medium]
Should the xra1200 and xra1200p entries in pca953x_id[] in
drivers/gpio/gpio-pca953x.c also include the PCA_INT flag in .driver_data?

In pca953x_dt_ids[], the corresponding entries for these devices set PCA_IN=
T,
matching the pca9534 and pca9554 entries that they are compatible with:

	{ .compatible =3D "maxlinear,xra1200",  .data =3D OF_953X( 8, PCA_INT), },
	{ .compatible =3D "maxlinear,xra1200p", .data =3D OF_953X( 8, PCA_INT), },

However, when an xra1200 or xra1200p device is matched via pca953x_id[] in
pca953x_probe() -> i2c_get_match_data(), chip->driver_data will not have
PCA_INT set, causing pca953x_irq_setup() to return early without setting up
interrupt support:

	if (!(chip->driver_data & PCA_INT))
		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025154840.6578=
88-2-ukleinek@debian.org?part=3D1
