Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53C383C9F
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 20:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433367; cv=none; b=OvVJQDetbs4/kYdAHjaiCHExRNqPpqk9bkffYzBXM+1sCUlRYC6VUfCrDjewuZI9a9lfKfrcXPSs+DbeQ9taigoO8edJrYiZ8gD3aFQpVA4EjmdplqdbEsG63rMC3+g29mlK5NvHw/n/7+Xl/4MGk/BhKFrXMd7Sp7hm/CKoH78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433367; c=relaxed/simple;
	bh=luhmNQvyddlHl62y5QJ6eHza2MJTaHmju9x3gPsoIOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwzfhNcdZjFtRs/RIeTHOEHEdGvembZM1oTiKPgjiZa3/vYw+V8U0c373UuDirRwBnqJT1f411I4sTPVGdxXX51F0swfc5lmWRf/KIyEnWWbe3phdVEh26SK9xHtVr/Q1U5islTxcfQ9afiF+OMECSnl/sEsFbUbBhIH2H0E0K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MpYwQCbA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MpYwQCbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=luhm
	NQvyddlHl62y5QJ6eHza2MJTaHmju9x3gPsoIOY=; b=MpYwQCbAUZBi8U9Nj39u
	DMqTGYMRF6S703aqTcIpEjrp6XFi3Y0xs4wHF+cAwFRPg7XkYkFZS+F00StJRE51
	wX5sGYG7m35LJr/IDjYBXMPgWI9RgMM77dH4JZJtGVVt/zPLuNiFsypb8SakV4d9
	CBFgcViVGhLJeZwuXL1cYzi7iqntE8J5W8Mlii2Uxd7/oLdtKodYJhFJwB6Iet8T
	s1RcK/Put6xjZm0DxRP6+cbviWQf4DK38HKEeeQV9vO1GCJ2y3Hzjc8RsTRKbWGH
	NZ+XqYlI68EsrJI9lxLRxVJtsMlJ6V1ND9Ka5qMTox0ZQ0KQjT9VWLKKKnMVALXf
	IQ==
Received: (qmail 3019741 invoked from network); 2 Jun 2026 22:49:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 22:49:23 +0200
X-UD-Smtp-Session: l3s3148p1@7P4jcktTfuMujnv7
Date: Tue, 2 Jun 2026 22:49:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
Message-ID: <ah9B0nEBWKTXGtIt@ninjato>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-3-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WacZbiQ7wOCmZ0Po"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-3-claudiu.beznea@kernel.org>


--WacZbiQ7wOCmZ0Po
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:34AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This patch doesn't affect my G3S, so testing is moot here.


--WacZbiQ7wOCmZ0Po
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofQdIACgkQFA3kzBSg
KbYO/g//V/MJp/NaYWOj3YmmfYHlcekF9o+ppsBfqOyTbYfrKhpMkwE85cZJEZky
t1CCzTsRbfU6zj1LRbd7JaaWgLcEUhNKPsJbA70qfi2fjPSZMNGe7rXs41J3NWMU
JX0oYmR24IPPBKmXW0tdw/hr2XOMoWG/yk/Jhwu3vJI0+yacU2p7MfXQpEMrImOu
9d1g0YD5qQFg05BkraKeN33JuFpQSHyi5cQY5Xb3/bxQ0EmRSnYR+y5C2PufD6uT
HHh0rvnkXVMGoPzFW/mQnkBYuv4nqWqFPILyIwVF/+70JgwU0lcXYxI7b5XpBa9X
1bGYBKuouGFljVSKzBoBZGoj6ipZdFebmg/B5DuZou/Cla7S3OqjufhsW9mfGm0C
YFZ5XWLFWXwPq4kTlrS0PN5uS+cFwMXA15MrVGz8aC0ir7luTSA0+zgg6+uuJGtz
ytHgvyM0KCEyojkNFZ0B9J3r5dqhH5a90alwAEV2KZQNc4nDFzumK5jATGwKodI3
WnmSwoqCaCBsoarn7G0AS+Hdlu9CS5/aPTp3WU6W8PLuapm4TzMnTmtjwSr2zMXk
IUaEBUXavrZ7B237ikDGAELDP6HsnRdKQShqrFOeULeB11uwCg/InDhr54S+Ryea
+bAg+bJ24xwMHkv2wFJZ5VwLSiYaC7PbrSK7g/I0poP4dx4/RpA=
=lw0h
-----END PGP SIGNATURE-----

--WacZbiQ7wOCmZ0Po--
