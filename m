Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFC0511191
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 22:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473468; cv=none; b=mL8I7s1J07oZMPwTVhmpZn9s5ljukJXqjKVbPKqwh9vFZq51cIzqeKLUlR1Bhd1s2uVZXF+xxE6ekwUT8A9QEvUviFbnvuUoQQ4tQKcI9LXYhvEKoe4fVMLZxMG+w0943klpvQc36iBLfNo48ySGMkil/D/1+oQ0du7aISXJapo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473468; c=relaxed/simple;
	bh=XkxG3nEF7DPQ7pAxi7ZRjlDAd2bjT9OCIQ1il2jyVT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtKwS9pbaPKp11b4fzagnMXagLLRNC01OqVwiiTGa6J9/VhxoHcGYFM+dkBHLUPTEpEIwhoY/rtlA5FVN5SOZRc7C3B2KM2Tsvf2dDRHndA5DqlbigtXl6Hf/ArBb5cjKjsCRUy2PrDgANUtAhESvPnx7S9WmKY4wuYu5Adb10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kvg900Uj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kvg900Uj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XkxG
	3nEF7DPQ7pAxi7ZRjlDAd2bjT9OCIQ1il2jyVT4=; b=kvg900UjjMPGrNTEcKyx
	G+aX3D9t4w2PozlBzzIXhcdVoOwLYEnmeZUIYounq5Jbfw/LylfFHrjHCs+Y2bJB
	URxAHAR6s0sJ4OU19q9W5FgjVhjPz8G3Y+mqDxIncBocio6yl/zlaaMIRwRYgYQC
	LqVl8GAkbOGrZSAh12AZC7Mjs2400T4wgzbVm7wxmFVC+kl8wDt/y2o07Z7SAww2
	pfq6OiPggDIsHrq/CzxouQ+gJmATdTE/Cg4ASsW24i60NuNvAMotMWsWIbCpBOAB
	885nvew8bas6CuV7BLoVsRnkqqxILcMJ8Y2J37nk824oKhb2SDMezU2hOZp5Ga93
	eg==
Received: (qmail 1198926 invoked from network); 4 Sep 2026 00:11:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2026 00:11:03 +0200
X-UD-Smtp-Session: l3s3148p1@Nkl9bZtaCt8ujntC
Date: Fri, 4 Sep 2026 00:11:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v6 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Message-ID: <apnwdyh8bhwwYZqM@ninjato>
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev>
 <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ayzMqwrzNndV3fmH"
Content-Disposition: inline
In-Reply-To: <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>

--ayzMqwrzNndV3fmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 02:33:27PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ayzMqwrzNndV3fmH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqZ8HcACgkQFA3kzBSg
KbZn0xAAh/XrlWFWE8JatSEW8r/ZYEKMq3zvxgf8yveiVQvmO6DRs61coLyel4/e
jbcsMCxwKjUlOb8/3i4eILdTnZP2/LXAREa3RUlpIbh3HkMYFtUOzVSkJSL70cFR
oBRNyA3nytHOmskkfTEExP+Tba1A4Xjau/CAhRZYkBAGHFnqfTD9fxNimu+lFH/e
m+ZMb+Jzj3vAPuw65gB2et13LEW0/sAvnJqXzN6xgJkAPYqJT/l580VLZrWEOEBV
TyuQv/9ow33RGErZBw6YSKpW8Ob8Lq9+wlhXYwOs0A/CBHGitan0L/LuI5v+xBE7
C/4mCfHQtqWPsUXFLakuBFk1YOJrq5enxo2ReVEK44gvKUXwPkVebZCipk8HOkmO
VNGHQgqA0AtpSG5H7E1Y0MTs9P5B4zd01h2xw6JJvZJvw4ZwmymW1aQYkhyqVUbt
4R1aXFU0Z5jhMiElavJB+aoqffsJqXnVc1t/Q1tY8wRZi8wFDvlOmDVl5q6JbA3t
wFskDfsgaMhA01qHpO4QdF977NQ4NKoyjH0GA7ddJrykrYL44Dwglngr9EYjNoHN
p+pSeyYb9qcAD/AAF3nVHzNTdJQxd6h9vDf+z+5xB0KOv/jSPtuXqke/oRAGHncU
COWf7ASBOBx1f1nNPWmHsfWEvpFcz0dAErNXDLL8E/Fuzplhulo=
=1a5X
-----END PGP SIGNATURE-----

--ayzMqwrzNndV3fmH--
