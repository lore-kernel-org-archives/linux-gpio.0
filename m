Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4680D3E49D4
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 06:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553514; cv=none; b=B8CXFBOw8X6WiSXFG4V2GUBzaPNG+uh9Y2brgfUGEh+iP+WHwi5nw2CQSsdLUr807VgDC4rKOe2i9UCZleiArS8IENk24UxQnwUwpUVVhkq6b2fD0k3CDmmfQxr2vh3jvGzmCn1wj3chS7bRPvhM6qOWLhBDm0LQLOJCHcEXrRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553514; c=relaxed/simple;
	bh=7Xd+BCmdED5gxyjJgMasxs+Mgm/upcFWmR0TEZ+Zag8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzj7DfzLlBXWXHeewBGJUdpueUKl0puZrIJtnn0eVxY16cgwJ0oaHyX+vSqsuWdhxzt98AZ4/KVSNDIK3+TO3eSeBBRaKHnPgtTZN9Zs9wehodL7YLrYxWXA0it44bHDebCu2VuqLkIgQQLnanCLXppTaWKvteojF21sve4sTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J3btIDhn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J3btIDhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7Xd+
	BCmdED5gxyjJgMasxs+Mgm/upcFWmR0TEZ+Zag8=; b=J3btIDhndXwrdtyyF2+f
	Q2RTSCNE/ggq3KBSruHOhSgl9+bhmO59a5k4CWTHjOOjQDSWKB6mCShuOpvDfXWF
	G+2y7Tk0EECcusS8CTduHnBaQ+ueM+lcLezCA3DuSg5y2dL0cvuDBje5KuEsWY4G
	bGy06saSQjYdZLqhp297ddsuvq58gbQ+js8UhhSb4ZbhX1Lp3j4lZ8lr/h8mW4Qo
	bd2pf+W5DUvfmfzCEx5pqx8KmAH1G6ecmWQtJjEKm+K7f9X/sRZQ0th+xMl87O4o
	ssRZD22kJ+pYQsaGCl1JmbUHUYYtqg+QV72k9ecp5KXEqlx5J9HIZz2NsbM7iPII
	SQ==
Received: (qmail 1569687 invoked from network); 24 Aug 2026 08:38:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2026 08:38:29 +0200
X-UD-Smtp-Session: l3s3148p1@OrPqO8VZlqEujnvL
Date: Mon, 24 Aug 2026 08:38:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 2/5] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
Message-ID: <aovm5ODTWuSkzOx3@ninjato>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <20260819143553.2478984-3-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aM1NGfmg6X/ChnMP"
Content-Disposition: inline
In-Reply-To: <20260819143553.2478984-3-claudiu.beznea+renesas@tuxon.dev>


--aM1NGfmg6X/ChnMP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:35:50PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
> move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
> initializations as sorted (by offsets) as possible.
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--aM1NGfmg6X/ChnMP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqL5uQACgkQFA3kzBSg
KbYzkA/+MY/lQ2q2czna+O0XuIPH4TPxYhM184yid8psCKExlM4Odmvb2Xc3Y0Hc
j33AOkf1GA1fulpXilaQ6oIxUTX1pVxl7JVaAUJMGk0mb6VrhgYJ6KiKh+8OTmXT
WKKAdFTlwodembXlXtWcIFda3JR2ubcprhrFuN4CxjKJIXxdiQYl9kmQUlA8gEsY
/HtBVH27ZMFb1NgMovCsf6iI6lMmc6lSuiv6UFcgn/6jzgDh+zHJeOL7oHcr1TvZ
LwTSEfE56ThhoIe3J2VNDe7BuCmU1SPoDGjVaRpzCspusxnqe/Lsk2f7kafCMJza
Kfb8NbvRCw7uG/W7tvaHPqS2HUfBAG4scFlGtLQsLqe16c4hqeg7x1vvc23oPFUL
XScSE3lG62N11jWqLDeQPfLGF1sHcXK6OZ7f+XNiDeDJB0jhUQG9UMw/3cLwmo36
dLkJgq07Juk+xEiy7HEHrnz0vDTTIvNl9dn0cFqeeGf9fLKZU1UKeuVvi/LXaZmC
/v+ppSPEaATTpTEjcVKaRyxIiKxYFzOI0Tuax2UymDqJRbS2bkjhhQ1fj9f/gpGk
OyX3ThAk3dBzb2HkA43rZSFLTDpqHX5d8ZpU6lzEbDttGOadok+fvuuQYS3Zzs0U
A9idy/dcPCAhLMWw3akHTszm7uVp+EZ0EVzdEPIR+EjMXVbXt1E=
=dK7m
-----END PGP SIGNATURE-----

--aM1NGfmg6X/ChnMP--
