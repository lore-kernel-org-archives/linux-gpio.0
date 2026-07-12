Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3081248F73
	for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2026 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783848793; cv=none; b=Fn9aVHp9BCiiecdk2pf3uWgDrbF2tBt1bACau1xk8ApSEwMTJcpjF+2035wOpOTEV8kGExDi5otyGcoOKw3ajEYDYpqoYDOtIjhfxDB6UH0aVvCzbZRf/7upvpgvgVM+rkrD5nsa2kDVuobVFamDbjjVGKwidgoASC+CLWPlMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783848793; c=relaxed/simple;
	bh=3IxMpPjAbLB8wGgvevGTq0i4Dya6mQ/x1M5S0NFP7mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNuc72da0LiECyVgDyQ3ScaQGSKMrDPWHX1QWfOEqGQtQKiLRJeUXpoWGb351Gk5xZsuP4MVpkvBygWT3wkv7i0oiaMDLQbXAT21H1PSObY8fHfcy/eOmkGQKWCLsFSe5FRRPpxW7f9QQvCjA9MtAcjlPXO+Sc9bMBqEFcuYWAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Wio+AyRS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Wio+AyRS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3IxM
	pPjAbLB8wGgvevGTq0i4Dya6mQ/x1M5S0NFP7mc=; b=Wio+AyRSv6GF2W9Te/sF
	Aw2Xteh/qiJQFnHBLA/2F5tqL5lotsNVaU/sVPGKLg7RXGLIJ82aGSRsJHbO5GOv
	aHDTPtrQSa5cd3ooxIMndqGQJK/yhQxHB51EGBNra9o+7Qnt13otR+psxjV1kRRu
	0V01kHfvDvEzFlbpiiO2eOnfrS99S5A5yZUeyU3SptlpVcVE4/l/Vcbm+UKhV5jw
	G8saZQnK9mrfKnwJEY/vDZc+7IDozxmRK88EiQ2Lu2EQFeYsCeuXurz6qixKbse/
	ungxINpah4DBFfncKdGp/PlopZpTR/umzFoLcUNMbTq+IxmUu27G0s8bPq71mf9f
	vA==
Received: (qmail 2179723 invoked from network); 12 Jul 2026 11:33:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2026 11:33:09 +0200
X-UD-Smtp-Session: l3s3148p1@j+9wqWZWft4ujnun
Date: Sun, 12 Jul 2026 11:33:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: linusw@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: Fix memory leak in
 gpio_la_poll_probe()
Message-ID: <alNfVXfnto_p2T5s@ninjato>
References: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q6U5bfl74U8s8X4V"
Content-Disposition: inline
In-Reply-To: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>


--Q6U5bfl74U8s8X4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Compile tested only. Issue found using static analysis.

Please update your analyzer to check if the original pointer is NULL.
Which one did you use?


--Q6U5bfl74U8s8X4V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpTX1UACgkQFA3kzBSg
KbbZxxAAnpLoB4YmuBqAjMYox66tBIb1q1xoGOmYOgupiwjpbNHd64+32p87uSu2
5jl0bIri+oMHqwJDT21WeWg5ey3MBMMry7/n909sXR/zkx8p0LFPpNU7QTltKTuG
rvpIzDmqVBTkC7VtR/xhFvytMyOnt5PoWUJ5yYwSotPCDcmbFbUZw90OiR48vxdk
PSEJDkj3pDzuJXJ8m3glpE/1LanJYfCTUPY3+u+dGbQg0Xl/UdCqiqORNo5u7ohc
XnIZ+YJOZ9kmEO76us23+8JqawK9BQETMxiIBOP9ywshOZjDxLqvxf1rqbxb806a
74sYkVrEe+2eASFixJ8ALo4nhBabJQWcS9imxrym4pECXrdJsByNY6Y0T8K7buI1
iROjvNIOK7SAkyQXX4iiL2bopsgF3CIXtMGx/YLQFD/AhkE/v5HkUvR7qT7uGv3E
ZewD+E6cVugmBLlc84dwr1kFwQgYVMh7EOc2w7XD6wRefBfzVTvvuKfQbaveIeH2
nEYOCYieEv6fXQhMpBSOn50GtFCrypPN5MseQWmIvt1L5fro8P1iN4w8aIA0JHs2
2lXk8gtlmD+ZRRtmu1DK9BG9Gssaxm/UgFyIQv6LT+VpkWQsBel6WR5VjORDT6ja
uJnZHNpzhfGWIUyjFmTp17F9AXNZUGbCcKdR8l4IhdOI9ou1hz0=
=8EYB
-----END PGP SIGNATURE-----

--Q6U5bfl74U8s8X4V--
