Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F4229CE1
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 20:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433776; cv=none; b=o/nGfW2pIKJbBaT1lLAWcAh/gdDdvFPzhLTZKBav5GZBR4KDtYQE2SWNIKkWwsq6Hu1Bfk3JMLUc4SgQjR9l3f+jCraatr3KiDpcL3Ib1wB0joukP0CmGMMcDIHWDxI09/oFDV5kDny1asuo44TmUQX+W9fV76XkpRxhQKJinEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433776; c=relaxed/simple;
	bh=CQdkJzNSN7KYp8UJnkA0YcRmxVhL85hELiH1V9WBzvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw94PGR7UtdDri9uGluuykMMAU2nnwINvN4DBFGEQ1+dOoYbou3mQo22AvlSS+zQzsaOx4eaT19pzrejSXpeIdB2uOXxjrsksbdCfu0+nmjxocLCEvxClHUTS9UUSdu50j7kUpHtrlNi2AY/Gn4qaDHHuoPxqiku4/2aJSi7WHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DBC0jfpI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DBC0jfpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CQdk
	JzNSN7KYp8UJnkA0YcRmxVhL85hELiH1V9WBzvI=; b=DBC0jfpIF8rCD/nI7LWa
	I1EOTOtu8v+FsTOjyz63pYZgbuP/SULAu1oI1jbvVMYn/3jUfFfcaB/6CNTVac7L
	y2Q2uMc6QE4PeU6v/ecTg7S7tm8CIQ5peyhF3Uf74OT9LmJvGdo4yb56ePb9F1t1
	JRJtPAuj+di2D+Qfh09Oy3DrEapUNcjcIj9kjEbJvNWzjHYZbnorSlFjLedYsesf
	xCaWQlAPq+1I92GCClyHQvav37AVi/wxEaEUpfFVVoAhb+5vDpMn3R3D9eaHP00F
	f6OibtBj6tnCN4FE9uQBElT3h4+rkJWaKaNdD71UdBFPdcMVuiylBYEJHICB69mH
	+A==
Received: (qmail 3021425 invoked from network); 2 Jun 2026 22:56:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Jun 2026 22:56:13 +0200
X-UD-Smtp-Session: l3s3148p1@esKViktThJgujnv7
Date: Tue, 2 Jun 2026 22:56:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
Message-ID: <ah9DbJcnYYR6eLeZ@ninjato>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <ah7AAgK0plmNfL5C@ninjato>
 <385c0e3c-f131-4d38-8d82-0e0b4ab8e96a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0NvjqdZ42maH1a9f"
Content-Disposition: inline
In-Reply-To: <385c0e3c-f131-4d38-8d82-0e0b4ab8e96a@kernel.org>


--0NvjqdZ42maH1a9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I pushed it at [1] along with the v2 that I'm preparing for the i3c driver.

Thank you! The patches from this series work fine \o/

I didn't test the I3C driver patches. Dunno if I have time for this and
review in the near future. Maybe Tommaso can help out?

But cool that we can finally have I3C on the G3S fully upstream!


--0NvjqdZ42maH1a9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmofQ2wACgkQFA3kzBSg
KbZIvg//VK+hiQ4BffbX6ShyxUQF+5YHH74eyxTz4xPp19rXt9gYnI2imS8u6kKl
btha9nQl4Xy6E+/teV3BCivIAF+qQ4FwKXuI5MDXY0U5j09L3Ei0gaNwC4onyE68
r+t2CRC286BkvtBKN8ZQTYWvx5tm0kNLYFXtyblWVBn02yFOoSiuLtyP2ysEg7nu
xXabRu2ggAeWhc6sT75HM4swZ/3kBiZcsg3A1vTt5Tt628CTcDv2JVv3IePvHphU
fne65Ag9vDkKhWgLLi65xrOlqSKBf0Yn4inUviD3YwlqhpqY2Frfeh6HCCl8kMMp
p3o0kEWy95dQrs4uX7ceFZNQAnAMwnp8uhDub7lzWBtWKHe661ulMEbKNGCLLN5v
BWc32bQ+pi+kFQQCkd/qu9ozRMASICp2m5bzdnIhnjPP9pNyn47Byfb8A5X4sZjp
cFcUKNywr/eWvv6zuSKXQcd5H0i+6CQBvoX3k4pjmTjGnG9JRWGgWKFsbb2IuSuw
F9C61ZtRju0ld8WZD5HtNR87EYkzaxvFvwfJe7tdhAiycvvbAzLPayL642+aEJu8
clSGvV0kdBVSKf94g4GecjhO47Enq4UJOy6ObbBhLy3rmXCbDG/PuwQw2f8cmrs3
GLXz4WhC012cPQ6KSaLUnUHr5A9QSV20rzKxNjH8R/YN9F66jQA=
=R+U8
-----END PGP SIGNATURE-----

--0NvjqdZ42maH1a9f--
