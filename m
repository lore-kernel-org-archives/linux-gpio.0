Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6002C3438BD;
	Thu, 28 May 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779948356; cv=none; b=N/MMTMRPDmjvFHBAkVL2Nt15d6n7+jYbSuThhZermOVymfRb7IoDxUGdZhN07Ya86f9IAuDapoKdjru9ZCuUAR7JIspa4jR6dyqZNUpDoIz02zzpRHmB9XQBCdEddcoIFZyC2x5lKcQxXhyAXWsnIYY2IDkVY0dgEcaO+xNJ1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779948356; c=relaxed/simple;
	bh=qGx2FxwyIXffy62C0gTT+E/nREjjXY8Atu7D46ZTnUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7WaeYQomKpsXGWIJLduMjWnKrCxKwzcfXUIKs+yD0rGlU774dnpLAdhoNExlCXmfWfaMnlOq4LzFL7D8hbs5HVJB4b6nvaiyQ66xMTTbqjkdhWQs37nTx8FmUP+xkewW+if6A53wg3HDtHlJlXaTNdq5JeOSJbe04v0iKDVcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZgK2Anj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZgK2Anj"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 829661F000E9;
	Thu, 28 May 2026 06:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779948355;
	bh=qGx2FxwyIXffy62C0gTT+E/nREjjXY8Atu7D46ZTnUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YZgK2AnjV4EoD9s82jY07odFWPSoS5z3G4SSjnMfgTEkOJiWDz3Mj8GzPMrJ/9c+C
	 Vq3w5ltHNR10Ok7oN7hfI9T1J9e2kUVD3dxVlErFkSSc3so+SEaXTPont4r9DUDJcP
	 SmCy16i7yQkMyCIv/DAi7DA2aIn1OS5V+RcVUMkJG9eXDYQqJM6noqHQS1+SXecW7B
	 IxVGHX9+AKPm+N2meB89j7wREeT8lS/4GDPtZKxOn4E2z7gsoLsblBH8+cKe1D2wSD
	 poAGWpNaRUSUoZksdVPXh/wquGj5l9CO1xVGCq6qmHKFbwbHzvGWGksb0LQmkJPn7+
	 MGm3wBySimmfg==
Date: Thu, 28 May 2026 08:05:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] gpio: max77620: Unify usage of space and comma in
 platform_device_id array
Message-ID: <ahfa5u7-Fugj_Ms8@monoceros>
References: <cover.1779893336.git.u.kleine-koenig@baylibre.com>
 <985c86e80f35a944a4712f0c2ac8dd795868cdfb.1779893336.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wrrx6r3chms7rxck"
Content-Disposition: inline
In-Reply-To: <985c86e80f35a944a4712f0c2ac8dd795868cdfb.1779893336.git.u.kleine-koenig@baylibre.com>


--wrrx6r3chms7rxck
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 3/3] gpio: max77620: Unify usage of space and comma in
 platform_device_id array
MIME-Version: 1.0

Hello,

On Wed, May 27, 2026 at 04:57:29PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The most accepted style for the array terminator is to use a single
> space between the curly braces and no trailing comma.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

I fatfingered my S-o-b line. This is supposed to read:

Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylib=
re.com>

I fixed that in my try, so if it comes to a v2, that will be fixed. But
if you apply this version, please fixup accordingly.

Sorry,
Uwe

--wrrx6r3chms7rxck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoX2z4ACgkQj4D7WH0S
/k5ciwgArW4FHb1GdWZ7J/592RdjLJ6Xv0Dm1T0tzyVNveLDxBFyFWQJR02yKbyE
RF7ZKJBRlGNWyqQZp06yfp1i+dexwRo82kMLVr+4IyxnHpyyHcyoZMf45McSos4H
6JSFhjgAnX3UCuvvBpEmJWC+JRBrF/z2Wga9NmwnGaayO5vwV9/uB7TQm40R+3w6
M2LCDJF26zTYsG8qxJxsZbIm72mYOSSoanNUOHrPWyfbxyrHk3nfSqhZYUqJA5x8
LUGU/u510na6q0Z5FTEXbvsdGK9Ygr2RIecbhSf+rK9mcsQ/ckI5kj3zwCCEjA1O
QWUcYdTCt9uzRiHN7jpoR5SVYQ3wUw==
=BZH5
-----END PGP SIGNATURE-----

--wrrx6r3chms7rxck--
