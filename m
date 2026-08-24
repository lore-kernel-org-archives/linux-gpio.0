Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38910377AB2
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 06:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553532; cv=none; b=PGRPyHHvU6ZNDX1sQTo017BInF75K8XsMkehYxRjw+pB7s5sIZ9uevYVaXZU5eNt6kX9aN9fOVZBlqBnEhiZwqW/xDQqjptHj4UzNtBUs0+pmd++JlFaMh16Gd+367BwBR9a0S3zj/oJA9PPLqbZ/pucUk7OgUTbKK0wjTtBKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553532; c=relaxed/simple;
	bh=Wddv4L6qRnKIQ16QUYwqw+RnHY7Eq63IoMuiBwZd6Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9jhZgWVhGBcyVDeFj6q3VFweBLr7rhMCi52hZLxi1vr5ytSn4b0UekFH1ZN+6Y9IiXjQLo+v6k6dBsKE7gZW1HjbyLqU4mHoQ+XSMwGCCqvwGBcRk9kAg+unWVKtMrvRT7ocMsQeoUAh8irLMdrZSQ0yEvrdkQcGgvj2/5zPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RaA3HNH/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RaA3HNH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Wddv
	4L6qRnKIQ16QUYwqw+RnHY7Eq63IoMuiBwZd6Ok=; b=RaA3HNH/UWlLoknD5EmM
	1jMXNhhSBZ/Ca88DUHb+RyY16ZNpJfFVdbE1SoDBcIut5HeSkBTlLlCIJYl4AMng
	rQleLD1J1qao432PHr3ecz8cEvCqvHpcYu/O65MVjQvqQTHQteTFVwsPJuafoJaK
	qJS4K9Q+DrLLu/lVkDUw09kFLIpb4xrQNrDE9vpQ+90Q2gHdS/GdU97dAJDE0iw4
	QZF+x72kh6CuCTYR46tXYqgtrxXjTw1sW85ls2DVNHUh6wNU1tahe4H53FIdDeIn
	3veuz8Vub9ijQxkg7vgix+GyjTRqD7NBxwFCl3svXJauHF+c6I4TdtU7jwnZNN8h
	fA==
Received: (qmail 1569929 invoked from network); 24 Aug 2026 08:38:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2026 08:38:48 +0200
X-UD-Smtp-Session: l3s3148p1@rrANPcVZBJcujnvL
Date: Mon, 24 Aug 2026 08:38:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Message-ID: <aovm96G0B1rZAUdq@ninjato>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="29hXSW4pPytgXKIi"
Content-Disposition: inline
In-Reply-To: <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>


--29hXSW4pPytgXKIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:35:53PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--29hXSW4pPytgXKIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqL5vcACgkQFA3kzBSg
KbZNSg//R0ihpwlgUiin0fegxWFreBgDdrvXPMxgYS9b1QChJNXU+HwrLbJmmcsz
O7pa62dSN1SOok+qTfcW0n34vkqPRxu648q+ai51+Pds7Tg49+E0P7wYfSjwBsg2
lpUmJpuUgzCrqm+Reat0l6tun3nySDaY9j/ocsrsY2EurdmSKRhGWP1uebbNpz0C
rDOYYE7WKinx2J1pKcA706hBM3vZCSb+z8YP7pc4hUqDWycNQfqPoTI/t7TBepNG
xEJTVxbB7daRp+d+e+zMVDBy+k8mA7/4BGnjEBfTtJw5K+8q4EzBhyvS91Woo1mm
NTcE39iecu/Z4SC7FTP2h7C2Cli7UtcU4aPpVUmaU41Sgvjj9fLZqBTBVuObaf2o
oMSt1jppJpV3zStBcR2QLFk/qFouPGgrN/DSJxv3U+YxPjkzRNWEjDyu3mn996tU
MqS91YAqEVSlgccfTnbMyM4w9hnwSWJ8lF1RMKEJr9eHOqJKjqpb0Bt7BawCes3X
wDwcCVYo846IjB89cGe4O+YJxP2P5piehorKZIk6DiG8Gl0k7ClH6ZI4JWf+gXm+
seLrRqN0NeETlARM3p8nDUyGstFKkBXOK1ZtuHSYjtQlE5GQRBOy2Ntw2sFySyl9
VGOfnuW5ksd2RGaKKZllsInKXjYhXbyJUcNi54N81k3VxVxsaYA=
=4MUb
-----END PGP SIGNATURE-----

--29hXSW4pPytgXKIi--
