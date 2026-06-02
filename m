Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D43F44CB;
	Tue,  2 Jun 2026 17:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419669; cv=none; b=Cq/ihq7NqcsUM4XF6rHYCJJpq1PQRqxALbYGSRCD8gtVKzM5pVev9c8AXheTCgEyXA4Zibzopk4PQx2t+UkaiN0wtS0xUkpOAcfK3GMhaafbI2OLfTm1mXd3VhkUBlcez68wD5MEIOYUdQG4Lhj/Zp4kBRHA5yROJkYn5G6bCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419669; c=relaxed/simple;
	bh=cR1ALlj+jB1tsDbCfhKZz3DyXvvp4ylXmf2XkJWOxUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqP3oevsmjSsJL+sg48FWRm1Q1WTz+V+0Ih7SmkDt8yBdnKgKG8PAIA5uwyR8zJXBI13JFZRewGtEZJFkHqAyyGKiEyOAjBdlIDaEXDTdpGVNxmIpBsfzRkfpXYQ2O2b7J7G2Cgk+rAHsWjTsdafDKx6eGibkaX3HH/bzXffzlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqJWqpFs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqJWqpFs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F121F00898;
	Tue,  2 Jun 2026 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419668;
	bh=cR1ALlj+jB1tsDbCfhKZz3DyXvvp4ylXmf2XkJWOxUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CqJWqpFsnFeBtwIEf+dP/dlZU3HF973//t1ZrnIj5gr1E38MLqTbLUvrrAvqwmKoz
	 RxLbY+ZUO59k5fBR+b1tbYrZr3R0mXKKPwAM9+RoHBhpOJSOAN5QVuv6cDkJ5kkyIV
	 kqfKWLawlUFwGerrn6uIjAe5vrPUiVX8eSvZcYC7RNi7sLWpwGMRzmBGNZb2iTdLr/
	 FFGHtE8nqULsRvdgkrEMPD/0/9CzocL3YSeHQVfoUJnF1S1BS0hv4W5lfjfJu2VLSU
	 njhQCdU6PhRPBeM4xulqxmQ1tTtdKBUF45PKqJSZxIeZ5AFzLwdERVKgxmZ8Rsuixr
	 jHQbH3VJa8mtg==
Date: Tue, 2 Jun 2026 18:01:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tychang@realtek.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cy.huang@realtek.com,
	stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: [PATCH] dt-bindings: pinctrl: realtek,rtd1625: Fix input voltage
 property name
Message-ID: <20260602-statutory-grimacing-f36afa83afad@spud>
References: <20260601075229.2936513-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kLgSkdQyN5oK/h8O"
Content-Disposition: inline
In-Reply-To: <20260601075229.2936513-1-eleanor.lin@realtek.com>


--kLgSkdQyN5oK/h8O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kLgSkdQyN5oK/h8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8MUAAKCRB4tDGHoIJi
0mLpAP9IP57UfIaqVQ88FPwZ7MJZ7t/ZBCV+X+6XPj05NrvK1gEAjbHgnJ/u8Is9
QvKWldM92/3UFt6jcY2st+3K/Ajz/Ag=
=qkYQ
-----END PGP SIGNATURE-----

--kLgSkdQyN5oK/h8O--
