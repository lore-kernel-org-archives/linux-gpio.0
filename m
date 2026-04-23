Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89037C10A;
	Thu, 23 Apr 2026 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776966268; cv=none; b=NSNu15bgROQ0cUOZVkucfH7fUBARoJn694dDG78eDUows6TAN+3NWSRH103NDi32X00NGi1XFymaiYjRWwejyyuOJLVuwTDtSiQDyXImGNTIWQtc2Megrxvrfdb7+N+Wg+OZuENr673DjDS8m3Zn6wxQcu2RmOqWEh9BPTxG+3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776966268; c=relaxed/simple;
	bh=Ca6918fcOAXDM3mevQIr9UFJydEQNXb86m/+edpbIC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dftPrP++McxpH3CQNxoJ0mA58V7k9ezDR6xEY4K78TP4k23QVLj17k5TwQ3GD3P9hLFa0wDq0D1TUdBTrQ2F8Xa141m09qPjPlNOwgMgG5ujHPUTd4igcBILbRCK7PItAZjmNuUXGn0JRnimzkM2MxtYZ9tdxD70X3kDpXFOW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBu8iRtF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBu8iRtF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B558DC2BCAF;
	Thu, 23 Apr 2026 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776966268;
	bh=Ca6918fcOAXDM3mevQIr9UFJydEQNXb86m/+edpbIC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBu8iRtFL+Ml28WAMlWVSTzNQysPYMICkXs8iHwEl66fo33PA83dxwmevXPQQ+8r+
	 03oNzphPXfEn2JbEdywqHe7tIQBtSWk2smDoiP5qJEz4T9SIQJTUmfhl4b9SQHt5je
	 ZOwt4sdI6EeBvPuh2YSRd1/7Nzc0ld+fSTlcJlo/M6Q/KKZVTJ9Yb0rkFLeCpYg3vq
	 RUXInthqnG+cSRYc7ZytRSXcRZSrWI99++7ZWujhmzXACHfFkIte2jw04JlDIc58OZ
	 +EYO0HeTnSkElit8Iw3fYHtGMH0IddZ9VlxfAChsS1CaEM59XvTguRxlE6Em7hXYYF
	 Onb3Y/C9LQ6gA==
Date: Thu, 23 Apr 2026 18:44:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260423-clever-swooned-a06907e9101e@spud>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
 <20260416-brutishly-saga-ba7168a4cd14@spud>
 <OSQPR06MB7252EB0C2A1A3313DE49406B8B202@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <20260417-anemia-borrower-fb90ac02b417@spud>
 <OSQPR06MB7252BD7967D2567AD6DA7A1D8B2F2@OSQPR06MB7252.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JAt2RGrDeiha8/Di"
Content-Disposition: inline
In-Reply-To: <OSQPR06MB7252BD7967D2567AD6DA7A1D8B2F2@OSQPR06MB7252.apcprd06.prod.outlook.com>


--JAt2RGrDeiha8/Di
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 07:22:57AM +0000, Billy Tsai wrote:
> In particular, I'll split the constraints as follows:
>=20
> - For pinmux, the presence of `function` will require `groups`, and
>   `pins` will not be allowed. This reflects the hardware design, where
>   the groups are defined by the pins affected by a given mux expression
>=20
> - For pin configuration, exactly one of `groups` or `pins` will be
>   required (using oneOf), so that configuration is applied either at
>   group level or per-pin, but not both.
>=20
>=20
> - if:
>     required:
>       - function
>   then:
>     required:
>       - groups
>     not:
>       required:
>         - pins

>   else:

I think this is a separate section under an allOf, rather than an else.
You can also simplify the condition above to just be
- if:
    required:
      - function
  then:
    required:
      - groups
since the node will then always be tested against what you have below

>     oneOf:
>       - required:
>           - groups
>         not:
>           required:
>             - pins
>       - required:
>           - pins
>         not:
>           required:
>             - groups

I think this here simplifies to
oneOf:
  - required:
     - groups
  - required:
     - pins

You'd also need to note that pin level config settings should take
precedence over group level ones.

--JAt2RGrDeiha8/Di
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaepadgAKCRB4tDGHoIJi
0iGUAQCSvZRjl2it7AaROKHK0Bp704DuQXDbJXJ0D6NcO6IYSQD/TPXLQsCR9Y10
jtbhzr6qfBOMLqlIhuZTFyJ2Xq5jBAw=
=i4l7
-----END PGP SIGNATURE-----

--JAt2RGrDeiha8/Di--
