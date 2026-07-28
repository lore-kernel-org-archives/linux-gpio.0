Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5942902B
	for <linux-gpio@vger.kernel.org>; Tue, 28 Jul 2026 23:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281927; cv=none; b=C+8jE4cyQwflDJAMK4qqP2rLDe4Qg4FgaZwERV4b0uHlciBXHk1XS+2qOwcJ2NS5AJ82yAGcFeX73lW1cvVyD5IdCSSmTiMiER4CUo8NSTQtZ7+z6roxJlWErD6mdRBPY2pkwiT7E6e7WnmIGMuwoX+I6cXhnien+gNcZ2uVo4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281927; c=relaxed/simple;
	bh=+OYDx6W25GdX0yXKkH//7SVxfQzfQRWPnvFFTdT2ky0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tlp4YswVY1/nhq1usSmshKwDfmqWcX9rrw/PtkifD7zdeDfSmWTlNPk3bctxjBCmK+Ww6+yOIyqfncgy+mY2OWSm9QegxQFdZSI+Mv7ossMTBTh7wS7yzb+V7FkS3UMWB5FxIiRJFo1M/iby4uhP/6wcwdRADeS9DsiVBtgO/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JdYLgDWJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JdYLgDWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+OYD
	x6W25GdX0yXKkH//7SVxfQzfQRWPnvFFTdT2ky0=; b=JdYLgDWJ3abscoQIkcoy
	Nu87fKihViDqGJVXpauVs/1tAcguo/g1kpQ0OFhMaAauA4/zmmDjiQ3vG6KkbgYV
	ZygCHR4BAQmaaGIjOn3/4TCDeZGEdjIIs+hqbSa4EeHM4WJLvjwXc99itZd8vfVD
	YTFRQ9V/5syMsidxXyNySIOWk1idsYX2uBl55u5ZYAMTuUbVBP4cnqHc91YF6p0j
	qpJ59D09gjAkknTyEf7eTc03qilsu5UPCJYlsXhbDLU8gAZZURnfDF8V1SShAtUR
	vUdlOHOtXmMMEtUV+gL0PbUegBCLka+k/hde4C1PCJa+HSYz7H3ZomcW6DcoopWv
	2A==
Received: (qmail 1119914 invoked from network); 29 Jul 2026 01:38:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2026 01:38:36 +0200
X-UD-Smtp-Session: l3s3148p1@PEF0VrRXMOUujnsk
Date: Wed, 29 Jul 2026 01:38:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cengiz Can <cengiz.can@canonical.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: fix use-after-free via
 debugfs trigger on unbind
Message-ID: <amk9fLBRR0B-uNpP@shikoro>
References: <20260727231026.470146-1-cengiz.can@canonical.com>
 <amh6txid90mJjd62@shikoro>
 <7f31351f-43ef-41f7-b30a-2a9a008d4f3d@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uAZIhHkuIUVrET+2"
Content-Disposition: inline
In-Reply-To: <7f31351f-43ef-41f7-b30a-2a9a008d4f3d@canonical.com>


--uAZIhHkuIUVrET+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Switching them to debugfs_create_file() would just add a second
> get/put around the one they already do, so I would leave them.=20
>=20
> Happy to send a follow-up if you'd prefer them consistent.

I would prefer them to be consistent. The overhead is negligible IMO.

If you prefer to leave them, ok, too. Then, I'd just ask you to add a
comment why this one file is different than the others. Because it
stands out and it is not directly obvious why.

Thank you for looking into this!


--uAZIhHkuIUVrET+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmppPXwACgkQFA3kzBSg
KbYXNA//Y81xDC/IQQKjp2KbsJDQvq61ePONWJ2f51pnivO5u+udvXRpGDVFLrKz
gY4iU4tkUmOLSpIj4TqBD9RruRDG44lzNvU4f/HTx/RfAj79tjfrHJmI6T4LXFai
lOr/dUiIlLQa1rKPf7UNW4X6KRD48ZR8Z15jHNVZCYrYXQSKLKhjIQ6m3nfGeOqT
hArZV6gX+dXIYZbYgy6KPVx6+N2g/1PdQYblBNPWBNVZ3snMrPb4wSEYsVeyHOiT
O4MB/FgpTL3Y7Dffu6JEmSezJrRyDLlfg9i7WiSlqzUDMKssDR76gmbWeK4vz0b3
m32fYVCOTb44iWV135+MIFKMjJegJAIjFewshXoG3NT65HyubQButJf2qAwqqBRw
wQLjZj55Q2k/ob7bhL096ob6efDSPU07cGUZ3G4+PCGWzfLcJ2WtmQYkD4EZSOxK
TTVkPOPmrLYoWUdPM38a+Ntiyjkno16FB2JoOgndgN8ypkEGsP7ecYuMMKo/R1nH
og3WBOtrzXLTjU6UryFxnD1MjVLeC4oFl0Wfsp9v6nwMzbhuvYzKcvN7KaxW98xA
ey2xCmHJAEhbO+rzH8isXADxk3vycXmUNWOgGTdkwPjlumiIK1C4lTvkl03pOKjp
odh+AiZuGexU/G+lmQHOcCJp0/WHIImZz3/a1K7VXrCpdfQAh8c=
=tJA2
-----END PGP SIGNATURE-----

--uAZIhHkuIUVrET+2--
