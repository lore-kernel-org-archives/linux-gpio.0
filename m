Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7B357715;
	Fri, 30 Jan 2026 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769793092; cv=none; b=LGbboe0RZ6R2tS+eNX/7h+UPZCWdURddOJWejYFFn6tlblF9TUl3a7fcDI/qI/8EyOwHnFhonnYMMFO+Ct/8iCsXJrCsgs8j/HfFZBfe/CvcwJvg7+Q9SuW//ELsqaCujR8SzpGvJXYpCWmrsVMapM1Kh5uxZfohHEFdqhd38ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769793092; c=relaxed/simple;
	bh=aIOowKRbbtWXCBTrIHVIrdOUVd0KWK+9sOxeQrb9Ik0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NmApT0FlKjB7iQpzTNbjmBHQGRxB63nU/crEJKXXPcvRIzI0kYHuQcU3TRDAkifcKnGqfQHMI/hNdxcsfozMEUZ5PAfwhtCCkIhGz1EFaZcd2mF0O+/hPU+RyV0r+BdQd+/nb1X4Z+1XjrePoSs/XTaBHO1cUesQiDG3TQcaiw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOm4AEZg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOm4AEZg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2892C116C6;
	Fri, 30 Jan 2026 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769793092;
	bh=aIOowKRbbtWXCBTrIHVIrdOUVd0KWK+9sOxeQrb9Ik0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOm4AEZgDq3BINv4ERUCFxnUo2rsm1AVJdfJIOgBhB4PmksARYScWcO6voVrPnYGg
	 /7eI3N2vahljl5YNsTjZQn2EZwNKeKjisq99NTqFJEZhqsRIc9BrQRpZkL75Hqmm2p
	 hUdXtLxoR2tOlNN0HW/ZEbWDrw8KMR1rJL4ojLBvoao5P27HgL6WlZZnsqvBFzIzxB
	 RXSESCYXrPeHDoDgDDk8m7C0iYiogmPz67Zodg68N1Ru6bvVJ7gDI57LL/IiW3Xdci
	 Sho7k1vNr+vu8KTk0YEbw/QkjNPrijCsU3b6hgJ0ut2OCu3RWzUAR57tLxgNKT98Hc
	 c5vmb30d4Y6eQ==
Date: Fri, 30 Jan 2026 17:11:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: spacemit: fix drive-strength check
 warning
Message-ID: <20260130-outsmart-ether-73a7927b4c95@spud>
References: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BXE3nMVoCCy1SEy/"
Content-Disposition: inline
In-Reply-To: <20260130-k3-pinctrl-io-drv-fix-v1-1-077aec3ba7ae@kernel.org>


--BXE3nMVoCCy1SEy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 07:22:15PM +0800, Yixun Lan wrote:
> The problem is that one value from drive-strength may match to more than
> two different enum groups which lead to DT complaint, switch to use 'anyO=
f'
> to fix this kind warning.
>=20

Acked-by: Conor Dooley <conor.dooley@microchip.com>

And I guess:
Reported-by: Conor Dooley <conor.dooley@microchip.com>


> Fixes: c3efac0592f8 ("dt-bindings: pinctrl: spacemit: convert drive stren=
gth to schema format")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Doing DT check with command: make dtbs_check W=3D1, will get this kind
> of warning message:
>=20
> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: pinctrl@d401e000 (spacemi=
t,k1-pinctrl): gmac0-cfg:gmac0-pins:drive-strength: 21 is valid under each =
of {'enum': [2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33]}, {=
'enum': [11, 21, 32, 42]}
>=20
> Instead of using more complicated minimum and maximum value of property
> with constrains of compatibles, we decide to use 'anyOf' to fix this
> warning.
> ---
>  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctr=
l.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index f009fed87e6b..5194fa92fe93 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -76,7 +76,7 @@ patternProperties:
>            drive-strength:
>              description:
>                typical current (in mA) when the output at high level.
> -            oneOf:
> +            anyOf:
>                - enum: [ 11, 21, 32, 42 ]
>                  description: For K1 SoC, 1.8V voltage output
> =20
>=20
> ---
> base-commit: 3fcdb264b61a5bb0eb3fb7272717468aa376a74c
> change-id: 20260130-k3-pinctrl-io-drv-fix-5b11752dae1f
>=20
> Best regards,
> --=20
> Yixun Lan <dlan@kernel.org>
>=20

--BXE3nMVoCCy1SEy/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXzmPwAKCRB4tDGHoIJi
0l9OAPwIZSVqA3HcerTZTYpElKg+7wSay+MnJcfS6DqQXii4XQD/XnTWlAiX3ZXJ
XmLWxI52yWO62/AAzYhO6YGjdIbqOw0=
=LlSc
-----END PGP SIGNATURE-----

--BXE3nMVoCCy1SEy/--
