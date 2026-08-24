Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F2E3E5ECF
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553501; cv=none; b=kW5kuqoX+vnGWyyJZ+/7nqkEnUjIpIGNFbl5Gl6uO8kYWZppaByzJ/q2Xr15KZnVn2nAmTiqo53FPBda2DuUgvb7kcq724DlVW++QJDHEHqvLsb4ZIkdug6ortamhJ62SXxQ5fQetOwVbHzULVTD8epm/6UCqB5ZkM9OCDgziBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553501; c=relaxed/simple;
	bh=WJDOeFqE5pvS4jT4UHVb2FkUY2zOAGr+Hm0x1HLfBWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6ee58MuSsv4Lcfur48sUgtExJ5T3Q3JBeW4XPzNSssB5gFQ1cNoZWJY7rgXBri0l3lpM5cKt8OjVKS+DXGT7aZ6h8RAZptpXcIa3zAD7c9x0huY9YM1zgGL8RtVHyBaiiIUK1ysEHTCR5iLFancwNlQBNJIxtgm7pIrcbu0RzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=d35bAoL7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="d35bAoL7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WJDO
	eFqE5pvS4jT4UHVb2FkUY2zOAGr+Hm0x1HLfBWI=; b=d35bAoL7RGy/m11Nf2qE
	TtYwv6ZUiWbUALX1hH5eo/5PCns25DmlIAopqRUq5EVCTLpQ9gboxTouZ6/vSSMh
	dK4XuYnKXhBQtmDi7S8pdX80MZbOi0mU5ZhJisjarnVCPWic0sLVa1gaVdY1DzjE
	1ThIRvRVSJ5u57IuJRHHUMcsKJhxf4zMY3NP7LVga2JZ3clam2zMCzl/qpwRl7Mf
	DWzHVhGTYuGtiXgWYdPMk2gw/avy/I7dgGIvpjVqv5V31bx/KzuHaF77yyVkbix3
	a6Tj1f4REEmzYdGO0QiOUhUY3BUEcrFfuTHIk1AFTShkQBi3+tn6hwX8I3bfsRxD
	1w==
Received: (qmail 1569408 invoked from network); 24 Aug 2026 08:38:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2026 08:38:06 +0200
X-UD-Smtp-Session: l3s3148p1@oSWOOsVZ0J4ujnvL
Date: Mon, 24 Aug 2026 08:38:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 0/5]  pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
Message-ID: <aovmzeyXAQtb063B@ninjato>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <aob6pW_BQbW_hF2e@ninjato>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CJQ8fPQ8QREUbxk7"
Content-Disposition: inline
In-Reply-To: <aob6pW_BQbW_hF2e@ninjato>


--CJQ8fPQ8QREUbxk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 03:01:25PM +0200, Wolfram Sang wrote:
>=20
> > Changes in v5:
>=20
> Tested with my G3S + I3C setup. I3C still works, I could also not find
> any other pinctrl related regression with basic testing.
>=20
> For the series:
>=20
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I'll reply individually again because patchwork doesn't pick it up like
this.


--CJQ8fPQ8QREUbxk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqL5soACgkQFA3kzBSg
Kba+3Q/+JDGr6DYANkYtMoOO52+ljpO7D07UUtxkA0YH2Ve2CAEpt0sN/lr9fYY3
nqCmJ79Vn03zFLIu/Do3OwfhwAHehb9MB6h85lycUv6+VZRUFbNcOvmlhprxIs7R
T4xHHi8rm1S0q3iMWNuTVJn47Q/1gW24GvW30c+dfrwkaiK104tacsvGWdRmh+Z4
TphnevaGRQ3VGqfAc3ByZOvKp3ZKIFT1KUbBDxbLGENDS9LUCQOmek8wBnZdbG/c
n7oX4zhc8PUCq3SpB5Fh+nogkq+6HCGcMKDKkGOEonOJ/mK5KUHKKO0elTHd04KJ
EVnGqvHdG+XN7FN47rayWkScYQZz42u/NH4JcRic5oz9K75Yr8A68qQqaII6kXJ9
1TF0dY9wthXqpXP7UH6oO9SYGd7y1p5aRvN4sek+3LDUVC3uXMvKGrdZPQSlV/UL
xw+jvblUEO5RcHk8KmEp9UqhEV6MV3mDfGV75nM7x7Q/9leIU176VtlySLw6ayWY
DHJoFcPrXaKOh3jBIrUEmzRFKoh/xrEs+SvhEVPQqW3SsY/Av8Oukwn5yc28IbjI
u0ztJsV8ikb5cKjf/ymPRb/NggRAJXAEg3zrkFbquUpRy91A0XhXBfVwBjlGy1vp
xqhkqLajoHEkZxApnoIYNbF+E6M/dBngrvE3nSKXWqA0IbiyuG4=
=RkCY
-----END PGP SIGNATURE-----

--CJQ8fPQ8QREUbxk7--
