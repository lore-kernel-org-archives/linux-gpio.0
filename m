Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E523E49E9
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553521; cv=none; b=rpfALF9QTWNq1cdRbtyvymAvTrtLtTOvq2JQnwFbK7RWSnmoqVEC313CM947IdPShctuOTk/OmSsj2GRvTbks/0Rr6JrkDwoJFK9d3EtMMDBz5mTHFlt9aCIqBTQ2LVwVhsAT9koSS99kYAsBBLc69ITxsK+y3ucxrIBT1W90vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553521; c=relaxed/simple;
	bh=b2N+jRyifg+EU9fYcjUDv9hE+gQWBbeF0vrRD3/Q7vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PisPPVzkrOFBoxtVFkmeUBKNlLWPalIXuf0ONj6Rn83dDO2eKx5vRAESX/JUnZF0LMIVKMCmhAU+9rRoAD/c4JZjFl8z6CcRX8Lf4hf8Mgx4iJVHRAcBQaGInxZY/sP4TDaktvCHb429f8rGJz34u8GWFbk5vZltQKm9DqyhFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S3CVHqin; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S3CVHqin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=b2N+
	jRyifg+EU9fYcjUDv9hE+gQWBbeF0vrRD3/Q7vY=; b=S3CVHqinC45LNWlHrJO/
	q21fpvGfZhxKI1+k3vFdtsWRSBdJVLyOym1HF2NB+KFv6RE2cCbtBbvQEtWcdlbM
	mx+O8Qtq9AsHbsvGKaoOj0oUV2rbQifFp/lJEm/0H40ovMAFTumKR+NOG5nfITHE
	gRywnuzW/dTkXmCvWVEExraVFXXOYWwxzn5OwwhnR46PV+P4F2o4NlPqbvnz3MIc
	MUJf4b4sNaypN09mIIGGkm2HYqv7y/aEcY/JJpQC7WMRSkrKubvUrczxYvy/2FNV
	S7BhkfQT1lkNtK7LponJpX1DD1s7dT4l1Zv2FAWzeOIeHM+1dy8DbqEHQCBZ3Iyr
	jg==
Received: (qmail 1569795 invoked from network); 24 Aug 2026 08:38:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2026 08:38:37 +0200
X-UD-Smtp-Session: l3s3148p1@SMFkPMVZ1o0ujnvL
Date: Mon, 24 Aug 2026 08:38:36 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 3/5] pinctrl: renesas: rzg2l: Unify the power source
 handling
Message-ID: <aovm7EQkF8ssHpm5@ninjato>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axHRTu0mkmk/4oSF"
Content-Disposition: inline
In-Reply-To: <20260819143553.2478984-4-claudiu.beznea+renesas@tuxon.dev>


--axHRTu0mkmk/4oSF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:35:51PM +0300, Claudiu Beznea wrote:
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
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--axHRTu0mkmk/4oSF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqL5uwACgkQFA3kzBSg
KbaP7xAAhPq7TjuIS/IBE0L9UPw/gi5BrDp5CECq3wPig/fb8wYq92ItS9b0w6VM
BbLEI8LPMuSNvu7GOXZMVVJQFsYbMU6tBhZyXm4XT7lBToQvq1RPLb4pHw74t7oO
+5jJgiKmDoI+dj5qpPKU8L9lqIo8gtfM1vi47ujSQc4uC7P0O2UaMkCwQx8leGU/
OFZ95IE50Tz9Zts5GtmopLhiimjPx6CsBueMKGiC4pFlC+KUnU7ZPJyisQVTjg/q
JcYLcnAyKujLAlFRKt4nB/FI/w+Dq6xXd8ZWJ/hnSyvG8X7imbMxGCyI+HTBRpZr
bUYq9HgJE2jqKZ3sFu+cLfT7j6erEzE85AcTV6y0WwxqlsgY9t0bxNbC6tp5jOvk
o1TeQnkrbO44XP1kJ/BgDnsh5hH5tm9b9G+Z4mDJSERxtwDHqwKruaKFoKQD38Zj
rXYk8RM5L09BhGxI6iJXeS43OtHbrXs5bIqoOHwGHrZ3pfAbxz7s3LbJNti+l/pv
68svtPwPd2ZomVWmv17CbG4F89j8xjOpc9VzncK/PBXOFOS5OpYdd2WZHEQXenb7
mAe1HfjOAk/7XDFUb0vvatMLz7ad+nWtt3gtvvr68miZa3dHsTNmidgEXk8yGaOQ
Yz82eieohizIrLM9yYgqH39CcW8GUmPvIAjIIUX0y7zU5Rb7WWY=
=aUvr
-----END PGP SIGNATURE-----

--axHRTu0mkmk/4oSF--
