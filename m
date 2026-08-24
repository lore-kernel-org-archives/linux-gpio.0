Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85AA3EC801
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553504; cv=none; b=WHefPVVc3w/lIwnOIZ1u7jRopKZdVzCu9iXcZvQTh7wBNCQyUxpQkgImk0ZqsL63+NWyOmzqInas22r3dg78v4oIMVotKwa/QJjCXq1LB9ka7nwTn2jha+NZNoKYEzykbar729x7aAqytzAysBHhYUYngmcPeqFszwLk0FjIMtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553504; c=relaxed/simple;
	bh=5SsRSulYuD+3x7INM2YoswOjf61RQpkPEg/xeBuPLFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2toUNMsB5nECbFO+PpdwOOCRkhPW7CqP+Dl2x9k5e5wrib3XlXNuo6t/n0pGppGvY+yIH142rPuZFYfmaUZ5GXBiZj5fvaaq5OZ+1sOJhrapwcRT/TaWjvLkCW5yB2PA4xnzuil+wN7Zdbz3QCaAKnVOSlMPph4DkRurBKp8aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=A1EA+888; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="A1EA+888"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5SsR
	SulYuD+3x7INM2YoswOjf61RQpkPEg/xeBuPLFs=; b=A1EA+888QuMY2Z8GIU2u
	FOXMUIDpyXvcqtm4d3ecQKA8KpOpgdnl6q9yscoknHnaydnteu/a8jUSRhSDOWw5
	scByNvzR04sT/Tv2sxFG5g1fGMKqDWKOkJ/DHXAZCIOy6JluxtMe1sAtj5Wl0brR
	37PAoxV2XlgO0KTzYZ1Y+PjZ60e2VHmUDs5SkFCkw9I8OycLeuifKKwtp+NCCUq1
	eLDXANwNUP0SrVyiW+rNH6DO+IhAWcfZRSsgvJohJzQvjmS2tFscpSNoO79rnYPA
	StfHKpJqKzKRkJVX0cguVjVwfx/PXpwXd6OEvZYSsmZASofmnVQessG5l4TvqvxQ
	Rw==
Received: (qmail 1569572 invoked from network); 24 Aug 2026 08:38:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2026 08:38:19 +0200
X-UD-Smtp-Session: l3s3148p1@CqZaO8VZhMAujnvL
Date: Mon, 24 Aug 2026 08:38:19 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
Message-ID: <aovm28-a5inxl8CY@ninjato>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Da7ZF2KwpmbVFnvR"
Content-Disposition: inline
In-Reply-To: <20260819143553.2478984-2-claudiu.beznea+renesas@tuxon.dev>


--Da7ZF2KwpmbVFnvR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:35:49PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>=20
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>=20
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>=20
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Da7ZF2KwpmbVFnvR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqL5tsACgkQFA3kzBSg
Kbb5FhAAokskPZvLetM1Z7gooANHcXEbCoKbx1a6wxufzwYt1AbT+vN1nCBqmLKn
W5YH4WXfajh5Y72dLjeMLmSjJ86xDKConT1ShmGqhxfVQQqQR8pUVCJ6UcjBGkqg
+SLbzMGFeLPFMHB0S6N6aB8TTdqFyggwGrJoXwAqggX7tTYjve8kWmV42Bnt0TmQ
WP/qstjy3Kocm8d7LGpKSPwuRLhYK0+x2/lIR4nMO/alV53aYjjcIh0o4xsobJXt
Aeqg8yURXqpn+Lz49TuEMtDhslM6EesxmLYyytZ+RNEItQWnpObQKQ5SorMG2k+u
rSWf7zkd1XCM2yy8/Uy3RZB8l0+cDZFzBcDBTkQ5mOY/ftVDZh4mWBsWWWOX/wTK
9DRVQ+mGNIZBPJJgJTSQrPlj7DUyp8jASXURdylE6drdvHu+JG58ik0VIl0HUcuQ
nJg/Shh/tFt6Zm5v6pRntPdEX0DFc9qEsoyFtK4SbkGPnZSpGscJFdXk4qUaWU85
QraWGmhSeMGMzKlUbKOr2z75KKGMzpx5qXa5v09PNkZhyJm37/+dio6vN38hb1KE
7VvMZb7JmGhw+lhOk9yuxQEjsvFDyXcvzUsZy1T+V2I45QeuJRIv+ej6dDU1U+aW
EtGWc21F3PuDzyh8jbk3fseRHpxHhzvI6LKHB6Jdn0l0Yc/aeCQ=
=sp0m
-----END PGP SIGNATURE-----

--Da7ZF2KwpmbVFnvR--
