Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2429338657D
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 20:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433304; cv=none; b=MupnuHTGlYLVBzsTJEWQ1VO9XPmcsoARmbZjJKzV4yUM1O9meZK/xmUbCsKwWqvUb21mMUd2WbCdF94urP5byBgasCC4VQNbhWY8YW7o0urV1cgaiVb9Eu1WRyeq0gK8AcbgpJFuHw0ab9wmd25WSNBLHIwK1xME+RsSZHmr6ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433304; c=relaxed/simple;
	bh=0Jp/u04wLb/EkV+5IEz4PRnhNoUmsT2hwQB4k4ATSZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvb8J7uRunmJ3BwVoY1uz7r+3JkzDfCDTaVC5pS+y2oKvDRzHneGy8yfT7V72SjgQ/UNjMjk0B0KR0JFXRzS28Q2FrNryi80VEmv/ShAMeeZz8Y7UjwsOuWNEu/DwBKyD4m2x6rlu70ainW/peSG3QrNlIM/sgEqDMMo5hcikLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D6c/sv2J; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="D6c/sv2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0Jp/
	u04wLb/EkV+5IEz4PRnhNoUmsT2hwQB4k4ATSZs=; b=D6c/sv2J0+tkIun/HalB
	cjuhVGmYsPktQtbIapMqQJXs5H20tYwronXnIGLPpxipgN8fUPdQpenYwmzkLewk
	uJTFVRQOpLEOB4/yLw7AYUpUeSP602RKLIJwE+63pQi9Jn826nAT5n1nHP23a5kS
	Ogw2XJcd29EbKM7UuCX5/rRM0T3JklvdFyRe67zHhon8ie2dO/SKGafeVKDS5gN9
	uf5KspZdqEe4VVbrx2SQR/ZMlKz4wj6SblstDDopF7nhIQ/roKxiSG673zITwbfK
	5vPWoPxQIHWNn80+tezSGT0VA6dDvQ4OzDgA5znU96c4B8NjIdHEOdZwovzUNnGH
	gg==
Received: (qmail 3019475 invoked from network); 2 Jun 2026 22:48:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 22:48:18 +0200
X-UD-Smtp-Session: l3s3148p1@BnBFbktTuoUujnv7
Date: Tue, 2 Jun 2026 22:48:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 1/7] pinctrl: renesas: rzg2l: Generalize the power
 source code
Message-ID: <ah9BkQjUKwZ9KXMH@ninjato>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-2-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XOKotagBt3w0FUI3"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-2-claudiu.beznea@kernel.org>


--XOKotagBt3w0FUI3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:33AM +0300, Claudiu Beznea wrote:
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

Have you seen the comment from Sashiko about this patch? Doesn't sound
entirely wrong to me...


--XOKotagBt3w0FUI3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofQYwACgkQFA3kzBSg
Kbbs4Q/9FLqefrUtEteh3TK4DUV34HTTREgezCUOZEiekFfSZCtwf8+FBmZPb3pK
UUg2xQilhurnQvktvWXUSiH0XEIAqkrNVDhjSXFCPa7l2EgKQg5wECAfopl4zmD2
K1PtOeV3kxF+5sTPXj4HTOA6iLA7psdhEOKXO3Qsz0cO2J4keimKvaAHBlRw+qIl
35V1XDtKQ5M+U5bQnJNqQnygMf13N07i5Y7KjLLHt9iCIPN8g5dwNrIi/v4jw4v8
TTFqv+f3EwbGss0rFOyqVt41APEABmEDPZQt4whvLU2rqLMvMIoLR7hPJsd3qasy
5YDcBVxDYeRw7gwTh3YTxDn62sfiHklcV5b1OMDhxFND/Sj720ApbMLKnyM6exFt
JDCmRby325v2fH+98/617YXIU+CFMAWCL6hi+zV1tPVRhbyalj9ANmtftfQuxHee
WznA2G6dCuo8PVQFQGPuNWyn10DVZ7SU15GHdd7OH+FsSn05U82Pi+hWBsW/1ROh
K57qdx6E1F36z1kw4RP40jYbWkzmTQECCggIZsyNmFjfBIWDO5iQBNB9sKK2wSrV
zmIEBxw8aOxZiPaLm5G42N04h3epT9I4TXGWsrD1J+DRJPcTV+tC3hKHsRBD7KwK
8ZdQuEm1kT3SIdUtRByhxP0lKpeWFBWeHC4vKhQI2UktuSirf4A=
=2Df1
-----END PGP SIGNATURE-----

--XOKotagBt3w0FUI3--
