Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436303;
	b=VhoZvoScg2h8zzZIV3wWTGn+ozQye4Zi87MERiDA57AbrsXL2S1BXnck7rHnZq9uPmJh
	 eLk/74wTOjG6uqIJ+sB/aji/gO/gMudpGd/JYy7blb5U6hT+ATWfGktliU4HD9bIX7Gkv
	 nxLVY5U4wyCWegvaa2r3e3oalVwlmdgkAhX7dn6PT74uTXT+/UzrjUVJDh41jrVn4t73h
	 lzCpWMH6KcuyNbVz+iShTDDI8IfQy+KBdV52amjzL88GZUP1xBWUxnWXvqET/qcHRkEc6
	 Ukb7aeHZDfJbeT29kaj2vSmcLgyp5Mr6HdeRDtQJqt7+RDrhcp0tQRwcyB8lp4zIwKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436303;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fzYKTFxmBm0L+Z2LicHXDNVVDeiw5L12HCk1gRR8awE=;
	b=s2AC79H6pZk53c7paMdLZO1+8zqTaEMNZZIvvcKKq/z1CXErBb+glD5TLE0282PBOqgJ
	 xC1xseT7PTvNOn3CiDx8BbUj6VvBj+H7l2TajD/njsRN8S8GJLuMLzrpdq00rUS29NbNE
	 ONDfoA07O2RS5dbHabORFUZK58O3CysEQ4Xz7neOtoGAU9n+BITLzPIKVp1NvrhFYOF7+
	 01ye15/pdXOO+3wKCdjDu/Rt2eZjfnXFPRh3tnda/XvR6vBaTrUYJ04QbFciRSH2TPYm3
	 yf3QDYrmAwkgIduXhOq9zIr9ZRs6EBX/gMHxqhanKhiC5I/IecReN9iPOiJR0jzL78A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qx/cyhhI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585B4606A32A
	for <linux-gpio@vger.kernel.org>; Wed, 11 Nov 2026 22:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qx/cyhhI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59681F00A05;
	Wed, 11 Nov 2026 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436302;
	bh=fzYKTFxmBm0L+Z2LicHXDNVVDeiw5L12HCk1gRR8awE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Qx/cyhhIJe8RR8jbZVof0Wx5KXt8XF5rwPkpd7Ab+CFaeiuMq3UH4q95342lR6wmi
	 p74qY1ceuoIvNfNoS6K2IHQe+aH+h6AnpMCgj/yEfZ8Dx5m764560wnSWNrlzO48k6
	 t+EeIdWqwi4W3j+K0XcS9ubdlLzH7Ag6c4rFqgJHAPq6wO0tMtYMgRz5crE7RCbZxD
	 qscbIs4DGAjbyxUVitgSpfpD4Lh214/I0ro0gVZA76QarvciJvJb31hpkg+O7ECL1f
	 kAh6nAX04dxjNuArxcDEEVBI5bm1BxqOO/ik+OYCMNpr3y6j27cPoOCl08jj21q1Uv
	 zfgjNGHBEhU7g==
Message-ID: <sashiko-outbox-209797@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/10] pinctrl: nuvoton: ma35: Prevent out-of-bounds
 write in ma35_pinctrl_get_soc_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-gpio@vger.kernel.org
In-Reply-To: <20261111215256.1982044-3-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
 <20261111215256.1982044-3-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:31:42 +0000
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
- [Critical] pinctrl: nuvoton: use-after-free in ma35_gpiolib_register()
  [1]
--

commit d261fa88956097cc3c05a1bf0a8ef41b4bf318b2
Author: Lee Jones <lee@kernel.org>

pinctrl: nuvoton: ma35: Prevent out-of-bounds write in ma35_pinctrl_get_soc=
_data()

This commit adds a bounds check on id against ctrl->nr_banks in
ma35_pinctrl_get_soc_data() to prevent writing past the end of
ctrl->pin_banks when the Device Tree contains more than
MA35_GPIO_BANK_MAX GPIO controller child nodes.

> diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuv=
oton/pinctrl-ma35.c
> index 16f12cafa9404..4d1203b243c0b 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
> @@ -622,6 +622,12 @@ static int ma35_pinctrl_get_soc_data(struct ma35_pin=
ctrl *pctl, struct platform_
>  	}
> =20
>  	for_each_gpiochip_node(&pdev->dev, child) {
> +		if (id >=3D ctrl->nr_banks) {
> +			dev_err(&pdev->dev, "Exceeded max GPIO banks (%u)\n",
> +				ctrl->nr_banks);
> +			fwnode_handle_put(child);
> +			return -EINVAL;
> +		}
>  		bank =3D &ctrl->pin_banks[id];
>  		bank->fwnode =3D child;
>  		bank->regmap =3D pctl->regmap;

[Severity: Critical]
This problem wasn't introduced by this patch, but does storing child in
bank->fwnode without fwnode_handle_get() leave a dangling pointer
[1]?

for_each_gpiochip_node() drops the reference on each child node as the
iterator advances, so bank->fwnode is left without a reference once the
loop moves on.  Later during probe, ma35_gpiolib_register() passes
bank->fwnode to dev_warn() with "%pfw" if !bank->valid, resulting in a
use-after-free.

[1] https://sashiko.dev/#/bug/linux-f140abe2-145a-4f6b-b626-bbabdc7327c4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215256.1982=
044-1-lee@kernel.org?part=3D2
