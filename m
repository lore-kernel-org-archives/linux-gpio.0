Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693904119E5
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230899; cv=none; b=QwkeKNaXa7XWXfP+EFZOR9ju1Ts80r391jnNTMkI1NeG1V+BygtMOkzHwkNdE6wqwTysbnTkSFWpe90XEdATKvNitTB6e/eLqEoWlAXfNbOHXAajPgdO7cgEL+NSaLHuxoQM1oXDI3c3URJu4Ow44p7Qq8ZwRm59jKuJQIrv4eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230899; c=relaxed/simple;
	bh=SPLxkcCGF2NXuncyXM+2dBkpR4tba2HZtrDt3Qbg3F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBHDVcexkX97Owkw0FcZRmTy1zA20n8gLe2HrrWxO9TfyzOBSctpkIfqkbpwC2c6sd/eW6UIO/8MDNSLf7t+dxCw4JUR7qC8Yq5rdPSI1BC2kFnTGkuFLGMQ+2N0cDeRfTEMGqr8Nk25PuOLC3L9N0vgygN5IA2SDwC0ov+I+Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QShvYx2B; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QShvYx2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SPLx
	kcCGF2NXuncyXM+2dBkpR4tba2HZtrDt3Qbg3F0=; b=QShvYx2BsH5AL6HHxn8Z
	JAcY/dUC3UFroBcXlc775gJOOKHxgzOC6IqZCisvd5BCuZVjxuraeyHHzJqye+uc
	zXIT1W+9cQIBP+/hoFb4UaBGRiBv4v91ri3Et82kVNi8mxbe+DH/p0Ri7LJ6/klN
	iIAiM0rHLVTUIY1GIU5uup1JI7KI9HYhR3DmQ2JxoGDb6C9EaEVqtHBsgPr5oRDP
	AgZCyrUIVYZVTkGLawTkkAuyLehwCzJe1rSBq7FXILct1wpV4Zq2LaL+0zXw7wkA
	tw0H/D+q5eR7aNO57GWc68gi0Jb1GhpXVxrMPxFnJGknhO3RUX3UKjtwr8YFDORo
	iQ==
Received: (qmail 303937 invoked from network); 20 Aug 2026 15:01:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Aug 2026 15:01:26 +0200
X-UD-Smtp-Session: l3s3148p1@nR4WHnpZqKwujnuE
Date: Thu, 20 Aug 2026 15:01:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 0/5]  pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
Message-ID: <aob6pW_BQbW_hF2e@ninjato>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J02mf6Ickm3xROyz"
Content-Disposition: inline
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>


--J02mf6Ickm3xROyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Changes in v5:

Tested with my G3S + I3C setup. I3C still works, I could also not find
any other pinctrl related regression with basic testing.

For the series:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--J02mf6Ickm3xROyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqG+qUACgkQFA3kzBSg
KbaJ0w/+InIbfd03VywdBohLgEebaVVEY+lbMP5DIZ0ZNt9iHLPWHP/At7mD+aQn
Djsj16DCgr+XwqVssc4gGGzPBMGW5aE+STt1a3dKHJ8EsELfpaF8W7Y8AFcxMsU3
+hdd7J0oZhgbfq/sloTIGsSY/IP1dMDJjv8J7CDoneFBGoM9oU5ojwOxi/keOBTN
C+zFnQGD30JgtA68iCTQjepD3j1ZpVje7QaQF2tMTITPhks5GoCJvaYlpcaBO2xM
vhy1slwEdfcTnGwz2ua/Uv01bUjFO+BBJxPaAva038/tmWRMsKQy05gPzc8Rn1Aj
f+MRmow0PHoTns43GepocxsmORp5Gjd4d439QQ1u3zH78+ajrYeWCatkAjOPnAdF
EPZhju20B0UKbLaIRrzxsEeytvVfMGyPO6rdZf7D1hNVEHKgqBVPwahXju/Hp18Y
5+asFKjZW9ur3uAzVYz0I5YON0ZYnqIuj2xrmK2Ii5TD0JQqqvGbOtu0M6mmN/sm
taKevi3PDf1mMVDJhQrIxFIoZxtk/GJpR3yQsZUPDS1Jxyf0rsxkbcPfKCgfpwMR
TCV4dLE7VvQnL6LJZcVnBiNQrRM10knHdeqM5Rnd929BRQPLNxEBNrUDyZxgdwCM
AzdUXfImyf2ycLH1PS7o6kQnleX3nyOpdaGE6+2cvmIS+BVmRzM=
=3mYK
-----END PGP SIGNATURE-----

--J02mf6Ickm3xROyz--
