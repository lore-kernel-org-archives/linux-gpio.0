Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CAB1DF73C
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 20:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433615; cv=none; b=nQeB4MJ1GyWBVVIz2SfkwJT3Wjek8IPGtNoyCLqHIHlYP0V0GKWFEaqU8XGDHl72HX2YNj7KOnREVEQq+kUF6S/n9og+f7iORW6Z9PGgyywFqokzeSiYb3Aq8xzAmSM35RMRArgoGlpy3JAt0u4bzlGMG/+uqpp6f0laQ2HhUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433615; c=relaxed/simple;
	bh=GG3yd9a/ofQvxgRx7PTZU6BVVGmdh7Cf50F3OjopV9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4ngZ980sJ9Ca4ak6Bwda6/GeJcFCgBty2F2r8FU1jgZr0Ji1v/aofdwT7JqtcW7gx+N1LHD1+s5zX0Yqq/+xbUAA6ISNEMfn9TpIIETR7s+fPCZZm8TqFXUdEIWQbnGz0pG16t5SMwgGZg0CneMZQ5JCq01ZrwDGb7yoQ/5miE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hAeuQM4x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hAeuQM4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GG3y
	d9a/ofQvxgRx7PTZU6BVVGmdh7Cf50F3OjopV9Q=; b=hAeuQM4xm+KSg56kcXSl
	L0AtObz7ir3xfDpo0b+26uC19GQsbCBiHG50HQN0mPq2ghch1lnEHDnpwzlA+5zn
	asiwJ54xapW/vf2e2tJEijBowd5mzbqBlAbiLP1BH2tGmkrHi7CtYdHd7FgCQLAh
	YzdtND+y76FfoLvB5bgQOTS+hpRiO1fxIGxdli1arvqx+q+30JQqS00Bu8N5CMqQ
	3KabSkMfcaaz9WZtk8Nqfo0VAV5yhgsRTGJYJqOhOq3ulP5YlzFrYHNeq5C4nw5W
	V8U/yGD1RBdPiGUVbCmZ2NuRpth5ym/kW2tW94vsAJnYmQoa8Gj/uU9gqADZSpF1
	tQ==
Received: (qmail 3020695 invoked from network); 2 Jun 2026 22:53:31 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 22:53:31 +0200
X-UD-Smtp-Session: l3s3148p1@jAL2gEtTXpMujnv7
Date: Tue, 2 Jun 2026 22:53:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Message-ID: <ah9Cypt70WLMYLEF@ninjato>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <20260528080439.615958-8-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lxJajlOGLMQkz4kx"
Content-Disposition: inline
In-Reply-To: <20260528080439.615958-8-claudiu.beznea@kernel.org>


--lxJajlOGLMQkz4kx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:04:39AM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> The Renesas RZ/G3S SMARC SoM board has a connector for I3C interface.
> Enable I3C.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--lxJajlOGLMQkz4kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofQsoACgkQFA3kzBSg
KbYY9BAApIlsHQkUMd81mi8lYST6dKvVcboNq6UEvMvJ5Zwz70YRw8SYioLhuGjr
sQ1VQ/TryoRGmkh80Qn2pO0rM3F/iwpHGC28CQhAbm3XoX6h5cC4v3LIj2Co3HLx
exOImd4qMtntzIoFHpmOhqekwiGmAum2gJcytoIyI7TrniXAEM0kTcMC4nb7Zk5g
KRFgoK4hW9M0aTaF7iexARkk1OK/vVB/smL3bRFuPaFzFvShYKdlZl/pxzBdmo0J
TaZHVWAlDHpDKrsaWgVYME3+UMci3QOC5OQHBmylgV/gqdfChxMEI+FbMZitu65P
HvxafQigU/a6InUo8hfBu87xA1nSEK3kXWtTUgnyoVI2pa5EYIm4Im5RREszoOUa
QoFrfiXZ5BUQxHbCBlHk4ngxsC9ak9kAv03m5hO00gITornj1x9uPwEs/zo7R20N
bO4J6IRiIQGKxcYDlJbJFzfJVx4mvRnzx6uL0R6+w8pMd0GX+MfZhybKO43nyuWU
ZxetzG3oxl6OdHauhNKQOYBb1d4qI1Zw5Wl4YW2m2CLEIhQpHgmRT4uDy1v10Qfx
CCYFbM6Hfv1tJIlJkxcdt9aL3qBbbh/e17OFrOoX0ZfU9moVlLW/Q9iuqJ3epXtZ
woJ9unaJgcZNIBHUFQESK9NJfqsoPIDYnAaO4tpbbndzEka00IM=
=VAsA
-----END PGP SIGNATURE-----

--lxJajlOGLMQkz4kx--
