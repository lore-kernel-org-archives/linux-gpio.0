Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4E32459CF;
	Thu, 25 Jun 2026 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404892; cv=none; b=pd3HFeCkfKEmQJmnccP1SWpKVW3AdG8eBuF8Xi3Fm+gsI5q6iW/cYjsUms4BK+GUdvKlik3QZsMsBeletFUEpm437h+bDZRxOT9SFLzStaiOyix3YC7ChI3FLtp/82cGYZXQittFvH8uJQ5m8kN4T3AIbHu51wmJVyLN5LeLx18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404892; c=relaxed/simple;
	bh=4VVsx8KixFshX7pWU223Udq4wt39mD1SFHuyrgftX50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o64GKSN1EC+Qs4jmeN6FQF2M/nnTjPYY1EZQkS0mf8//H/NxDDkH85kbTERUdMkWqIlKTjCawislj2i6jb/eO4m6QjLMsHqqQLZCkIum1q1Sw0KMn6ZW34KMwNaU/AfKXmAq8t9JqK3mL9GZ0FZLleH+RfypgfZdcMQytMwsjbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrnML/WH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrnML/WH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC451F000E9;
	Thu, 25 Jun 2026 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404891;
	bh=WtHTE0ZUOjcMfiVh3eBEYex+oSym3DakLquUDoIGAK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OrnML/WHmTgEM8hECMVUFCXgOabcaUPalCHsOgPbadDyN2KlV0HJNHv1ek7iRlt5a
	 riZ/irtakiS2NB7d2Pv7N49R4idkhbhKD+VZx8CQqGX21ci6hnAwkK51k5eJOKHzu9
	 DvTL/S0QoaPEm/TkeEBoBRqEOgtaQPJliJLcKjooMTNjZLVKUGYl6Spt4ncBnpr4/z
	 VSjNzQ3EnUBZMMXPGCSsrDdteBgpgRYegtOiGjMnny9eqEXuNIrB6VnRxKzJYC+Vv9
	 f2BskVg3UcU1UO34mgOLs6gmIhp4z8Yh4TDMdmJ1AJARrSHkB3ob1qsFSyFM32/9LP
	 Pwy0rZN9EkTCQ==
Date: Thu, 25 Jun 2026 17:28:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
Message-ID: <20260625-cameo-siamese-cd78c349519c@spud>
References: <20260625104742.113803-1-l.scorcia@gmail.com>
 <20260625104742.113803-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpFCCusrIGXpI9Qc"
Content-Disposition: inline
In-Reply-To: <20260625104742.113803-2-l.scorcia@gmail.com>


--lpFCCusrIGXpI9Qc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 12:46:30PM +0200, Luca Leonardo Scorcia wrote:
> Pinctrl settings for MediaTek mt8516-mt8167 SoCs use two reg base
> addresses, one for GPIO and the other for EINT, as it is common in the
> "Paris" pinctrl platform that is described in the MediaTek mt6795 docs.
>=20
> Move the binding compatible for these two SoCs from mt66xx to the mt6796
> one as a prerequisite for migrating the pinctrl driver to the
> pinctrl-paris platform.

I've not done a very through analysis, but this seems like a massive ABI
break.
The change you're trying to make here will mean that new kernels will
not work with older devicetrees AFAICT.

>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 2 --
>  .../devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml | 5 ++++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinc=
trl.yaml
> index 1468c6f87cfa..0cff2a352b1f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.y=
aml
> @@ -22,9 +22,7 @@ properties:
>        - mediatek,mt7623-pinctrl
>        - mediatek,mt8127-pinctrl
>        - mediatek,mt8135-pinctrl
> -      - mediatek,mt8167-pinctrl
>        - mediatek,mt8173-pinctrl
> -      - mediatek,mt8516-pinctrl
> =20
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinc=
trl.yaml
> index 9a937f414cc9..c703de72e1d5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.y=
aml
> @@ -15,7 +15,10 @@ description:
> =20
>  properties:
>    compatible:
> -    const: mediatek,mt6795-pinctrl
> +    enum:
> +      - mediatek,mt6795-pinctrl
> +      - mediatek,mt8167-pinctrl
> +      - mediatek,mt8516-pinctrl
> =20
>    gpio-controller: true
> =20
> --=20
> 2.43.0
>=20

--lpFCCusrIGXpI9Qc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaj1XFgAKCRB4tDGHoIJi
0jrbAP97wobMnRO7HdyCFDRjLsINUhRhF1pHhFQuAEIeonbG2gEAsdjf82z1L2/O
CIqr2L2XbnkDV93d6huma3K037t9dQ8=
=uL4W
-----END PGP SIGNATURE-----

--lpFCCusrIGXpI9Qc--
