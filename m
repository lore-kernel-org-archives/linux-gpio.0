Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1313BC68E;
	Mon,  7 Sep 2026 16:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800059; cv=none; b=HiGAr8AHJIk7DmtxBc6m9LpjcGTjmjITvK7vQOgOP3ZS0QZFhjNgb08Eb+43PDE3w5y5/Nthn1g5S1UIa6DR/evX0rCJJfMJ1MJ2qgANnvZ52ePVSiZ172xx+KgORNkISSy81Twwyt1M0K99UjGehH+r0UX41ZDP9WQbWNBUiyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800059; c=relaxed/simple;
	bh=GKZZny7aMhl5k5Xl79fHaZbfQVI9aamNlsGt2oxXCWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8gGjP7vm/3SbHsk34c6wv3oEig+/UWaJK7yZfRPTZtW8SRrX3A83KkVZID8Zb6iiFlngwdksATPvWVp3Q2pnixlk246TsG0yCmbTi8nD4m0i9Axzb1we/atH7JJZhadDbO+sbsxfNAVULaM6GQncJjO69GiByev+a+MvKJJ858=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS8qt/Vd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS8qt/Vd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4132A1F00A3A;
	Mon,  7 Sep 2026 16:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788800057;
	bh=fTcG0zRnjibBnzdTxOkRK4sFEF9Nj5QobdtE77g2EMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fS8qt/VdHzbFsvSLja2PNSSv8mROw+FqMJ4CbOSKdR2qdE+tCB4iXFTP3url8UfpP
	 ovBwVyqGGgFHkUKBPgLrciZtHKCr0gZ1mJlrC4cRHFmP6hazY0g+xou+Oh3wiSIR5n
	 WQt5MpjqyDaNlGDsMQPrNBw1Qi75Myxji8Tb8RxKkKvIwY7GKH9GzxObHSoj+OL/eN
	 yAxqMY4SvzvjywMpGP/eQ9p9m5qAOUJ5LoMgAAFYThqeVRCW3VajKjCSgWLtdFRNFT
	 FhfT1HNGdutuwQn+qeTHx49TDZR7OCIZQjbtV7g1ob/DZbTZOqyxM5PNi77x0EbNfn
	 Ihr2wZ31HRFVA==
Date: Mon, 7 Sep 2026 17:54:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: pca95xx: add onnn,pca9655 compatible
Message-ID: <20260907-unnamable-geography-d04f61df0fe5@spud>
References: <20260905000919.155694-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i6boig1kl3i2UcBi"
Content-Disposition: inline
In-Reply-To: <20260905000919.155694-1-rosenp@gmail.com>

--i6boig1kl3i2UcBi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 05:09:19PM -0700, Rosen Penev wrote:
> The pca9655 is the On Semi variant of the pca9555 16-bit I2C GPIO
> expander and is register-compatible with it. The addition of the
> compatible in the driver missed the documentation update.

The commit message makes it sound like this device should use a
fallback. Why doesn't it? Either it should, or the commit message needs
an update.
pw-bot: changes-requested

Thanks,
Conor.

>=20
> Fixes: 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi pca9655")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/D=
ocumentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 4631388a7d91..563f61e6e543 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -67,6 +67,7 @@ properties:
>                - nxp,pcal9555a
>                - onnn,cat9554
>                - onnn,pca9654
> +              - onnn,pca9655
>                - ti,pca6107
>                - ti,pca9536
>                - ti,tca6408
> --=20
> 2.55.0
>=20

--i6boig1kl3i2UcBi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7sNAAKCRB4tDGHoIJi
0pSyAP443T6Ba/r415iW3TBm/unJOBPexuejUCYEdLgutVbPUQD9H4/fGYPb6TUU
QjTnNSm7vcITIQ3TbIXNdsG5lzEk1gc=
=DJha
-----END PGP SIGNATURE-----

--i6boig1kl3i2UcBi--
