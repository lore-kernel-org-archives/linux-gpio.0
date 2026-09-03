Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E77472F82
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473440; cv=none; b=VLwHtQ3+3XUX1pOg98Rb7kMI9miinCLdpTr8R8aFyHK7ZVmgO7w//dDCL/TcfP9dpQG5kUhVAMl6uJcjo9P+mSQc421B4kqyRhUyTgX7Rc9oDLSfaFa7LAM4aAwk3uiB2Kcubb29oXPcz+txCDVB7eeG8U+qNlrhMLCGOdHmMhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473440; c=relaxed/simple;
	bh=P64DSby6KpZgBUBzpTOSDQt/Acwoa2cKPfMCX42TtrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTR5+g11hnVDfMp0ZiuVIZy002/LyYRSSApaKci+eC74hnkeZ/bupFXOtQIWV1GLVqNH5c62vfW9Y1EPYHw/fyyDQi/w4BHm0ZTbMHCVZvXmrFa1I5nWgQFBQSG8U6+J68MBDXlsDQNrJEQ844qNX+1LdpGt6BkExwV5WfogYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A1c/qceP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A1c/qceP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=P64D
	Sby6KpZgBUBzpTOSDQt/Acwoa2cKPfMCX42TtrY=; b=A1c/qcePJ57h+N5AxlxW
	IMmZte7N+vYak2/7WaDGYCD7/HbG0Cqa4UXUjW1EsnKzgHWQ6Q7VuQruOeRSzRVd
	ZhFOUtwTBV37fZ5c3pX9DttoceRSaAPP/jVx3jqQI6k3eUsndwUyV04KJyO62bvr
	T9G/+T5L9RiL8IwZpxV4G6oE/33smwmLfhvU3/fO6cYKzCgLpc0/KqUbkFhzlcuu
	X0XDK1wQQoXhX7l+uH9/gWp/0w8XDS1IiFAi5A8RCyUL79OPsN4sTYMpqVn2633C
	kHzCe8G/HPX4BJt1aNIVaNyaMr0ZZocd8JTzzjH25wqXhZyX8XTCKtjMHrHAv3Ew
	IQ==
Received: (qmail 1198798 invoked from network); 4 Sep 2026 00:10:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2026 00:10:33 +0200
X-UD-Smtp-Session: l3s3148p1@ZNSxa5tajpYujntC
Date: Fri, 4 Sep 2026 00:10:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v6 3/5] pinctrl: renesas: rzg2l: Unify the power source
 handling
Message-ID: <apnwWW8DVzOyyhR2@ninjato>
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev>
 <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDGGuUPwngPg01BD"
Content-Disposition: inline
In-Reply-To: <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>

--qDGGuUPwngPg01BD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 02:33:25PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>=20
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>=20
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>=20
> The register values for the soft power sources were kept to zero since
> they are not used across the driver's code.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

I3C with temp sensors work. SD card on carrier board works also.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--qDGGuUPwngPg01BD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqZ8FkACgkQFA3kzBSg
KbZghQ//YrZSwEb7a0wC+whQNYRKANHQG+YFNDEUAEF31kjeargwy/YQwxo92l7u
BZ4u/xTt+Mro6iy9+nDL25QdYisjsBGG5mKlHE/RQQxxfh9qiPyxE8RLNckRHwFU
NKnrxi2Ue40lIH7JK9jaiNtP9TJdprEXYpfX0YiS83/GPVL9M8VVtQt1Bruhp/1y
GhK0fVUR/7CQLQKB43k/jKy3ZDSSr58oJEXS/I2/mapwY/ep9JWanOmfqSCgLTZ9
M2Y0csagFvSCiKvRZFDIa5wzL/ksDwNI78DHxd7C6iL+1JVeU1uTYayKx0/k23Nv
yqk0flF54Rfhm36vNa9hw/EsWsiWiH50EWGz6oYl1MyW0q8/+ow/Qbd/WVQzng3c
cNJCRK4bPci8XGqJC3qcq2ruWaTqJiVLRi5FLZZM2zjGB4rkdufMAe6JGWo5cQwC
H+JL8J0fEDMSkBzRwXLwVzo9fxOsJuL/tWBizDkwgmwJJuVe9mBER0E0wJioF786
viDZs3bR55LaW8LqO+wHxvY4S1fAAKWgvbJHhp+fphdajawPgg2uBFi6oEUEZzcR
0oqsq9eYtv55z7V6mwJMHZY3iG1uShEdt+8mlNMcbtYGa/JlnO62la7gWLSdSmaf
aZRgW12ggt5b+tV5iJBaQ2JFKUUc/CNrLeoeKdCUL6mh1Aw5H5Y=
=lAb2
-----END PGP SIGNATURE-----

--qDGGuUPwngPg01BD--
