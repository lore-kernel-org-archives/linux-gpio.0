Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801718;
	b=tZrlCDBn9Owz04FIMRrf1pyzaGJv9wHmb6VUU7XX/8ENnqzimRCMGNF8IXT0A88ZMskl
	 hRApHzD62IgyTdIz+nCRIbkp4MEGEJB+443FwpQhord6yH2WKCwCP2/boiuTtBvQ1T8lf
	 vBZyERG9/QRU+2Q3KdXoSpa4DtqrEP1jyXB9eWD8PWdLq2pmc7y6NTpu0+P8EHLI7wldl
	 XRQU5iFOjjsXLwzoriqtEiBG40O8R9tyJ6Y+x2gSuETEOCDdwg3JKEoY5zcM+aq98gEAU
	 nWI1UcpQZ/tO6996k+03K+M481KRK3bUbfGyVS/pq/R0zQ0HD04dJNO5pUNt6ciSQdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801718;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5DgJF2eS3rynnoix8a0tCd8I+sIiA2/Zqur1NudbvAw=;
	b=K5AW1doRqKtlNn3tzqZm/LO7DFVXMTNbVroGrUK8rZ6l5wY1Mxi8Pv+m9I4ZsmfpJ9Vj
	 SdGjoJTTYrQeouCYP1CUxkHy9xiU88UBgF/74pztDy9KWkbesJRGsRSLAY3FP4sFfK92r
	 ablHsazuNQfi27pGjjENh4wi56YAvq1haex4GIr/E/DYDIZimzdpxhhQhE2Pdt/nUg1EU
	 6yUyiTUyvzHs2JizTDpEzotEHst5cFM3uLpnVpLR5qGcgJNKVOZutQnvg1geDOh/joWHK
	 M78t4S3chmVzLpTJFD2rM/wntJy1X+Beo9gJhKhRb2uYvpgtW0kn0BLGYAzck0RWrVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rdmxtu8L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47598606A33F;
	Wed,  4 Nov 2026 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rdmxtu8L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03FC1F00919;
	Wed,  4 Nov 2026 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801717;
	bh=5DgJF2eS3rynnoix8a0tCd8I+sIiA2/Zqur1NudbvAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rdmxtu8Lo1onPzSAzYG0c94vlhxOY/yvmK/XdlGQRinYkLfA4bgFr1sZQ6j1nqp8U
	 m3ZAZSsAsTD8mITmfNKuNlZjvdp0w8hKIxOt1cbmLjePGDITllOcp0E9R61n2uJBCC
	 c2XrfcQq6FtrKsXz8uUqtLK0aobD1HCcYTv/zD7wTHCxrrL+6Ze8RbLJh56G1pHYPE
	 mw7TFdL0nzWbBNeWXsTEkHowI5y7FW4//0cuY6A8HvZGSsEKTMV0rMgyVMgOze6sj2
	 R5NGJIL2gxiL41tq8QOAjf2yvQDNr2COn5aEV7N14xlPnpi0gsPg6VcNNTx+kBFhgI
	 fYiRSUoHpKJAg==
Message-ID: <sashiko-outbox-197416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 9/9] gpio: shared: generalize most code to firmware
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:15:17 +0000
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
- [Low] gpio: shared: unused gpio_shared_fwnode_traverse() when CONFIG_OF=
=3Dn
--

commit 6eeb937e478380a7cc0f030271074c97cd8b7361
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

gpio: shared: generalize most code to firmware nodes

This commit converts the device-tree scanning code in gpiolib-shared.c to
use generic fwnode APIs and restricts the CONFIG_OF preprocessor guard to
gpio_shared_of_scan().

> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> index 8c9ac9d933049..58ac049bb603e 100644
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c

[ ... ]

> @@ -292,19 +297,35 @@ static int gpio_shared_of_traverse(struct device_no=
de *curr)
>  	return 0;
>  }
> =20
> -static int gpio_shared_of_scan(void)
> +static int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
>  {
> -	if (of_root)
> -		return gpio_shared_of_traverse(of_root);
> +	int ret;
> +
> +	if (gpio_shared_fwnode_ignore(curr))
> +		return 0;
> +
> +	ret =3D gpio_shared_fwnode_scan_properties(curr);
> +	if (ret)
> +		return ret;
> +
> +	fwnode_for_each_child_node_scoped(curr, child) {
> +		ret =3D gpio_shared_fwnode_traverse(child);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	return 0;
>  }
> -#else
> +
>  static int gpio_shared_of_scan(void)
>  {
> +#if IS_ENABLED(CONFIG_OF)
> +	if (of_root)
> +		return gpio_shared_fwnode_traverse(of_fwnode_handle(of_root));
> +#endif
> +
>  	return 0;
>  }
> -#endif /* CONFIG_OF */

[Severity: Low]
When building with CONFIG_GPIO_SHARED=3Dy and CONFIG_OF=3Dn (for example, u=
nder
CONFIG_COMPILE_TEST=3Dy), the only non-recursive caller of
gpio_shared_fwnode_traverse() in gpio_shared_of_scan() is preprocessed out.

Does this trigger a -Wunused-function compiler warning for
gpio_shared_fwnode_traverse() unless it is marked __maybe_unused?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-fwnode-for=
-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com?part=3D9
