Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BCC4657CF;
	Tue, 16 Jun 2026 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625599; cv=none; b=fUTAo0YpOAVhLh7DckObDfMASRpj1+a1AV07LKD1Ki7b7Fn+Cy4cJ9GF4QGAhZOzInKQOQvvWm0feCLqsEdtbzqxOdQrY/QtL1RLf/Q8+gadOnbWQJqnOAuvWcolki2RpVifADXysl+ikuhiuJV1eNXuoSSSXJVviIICmN2hPhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625599; c=relaxed/simple;
	bh=RIse3iwtT2+Os5evlGt3yi2fypjT2QT8SgerPML2hCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7H35DusHHgJouJ0Qt9vvgLqfisn7KFGulBBrtzQaDVyU3WOmbPgHuYhND7MlM8Q8bzCbJUp8ykd6bUwFdrSDTzaGeJK4lzemz1I6ZcWEomjMQVHEuOGzJ3MG/5FvGSfFIMgG/4UNGUr+2NnShpM+h/bkMYb2HKvEoS4cLC4Uro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVIlwhd6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVIlwhd6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00A31F00A3A;
	Tue, 16 Jun 2026 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781625598;
	bh=RIse3iwtT2+Os5evlGt3yi2fypjT2QT8SgerPML2hCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZVIlwhd6oD9IM9hhq5ifVe+dQbWEypsk7MvrPoQ2DIj+CRLFkMXl+uddZ/IeXoUXw
	 Ds3gOZI6riFQezdvBQmcNg+WuPytgkqRr1OULzZqCDqHBYvdtCGQglpJI2rTDNn0ot
	 AQDV030F2Ul9tFkcYm86ptat4zuo/XbkBo1ZuvO3iJwwgyv6V65xaGLv56N7F7fRd/
	 GR9wT6b0BkcRKW6NDH0yz3chjaWNV4h7KAC4xQoJN84gvASWUe+wYx4F2U2pOIZGBN
	 DFGckWFG17boMCTZdPEDRFotpe1siIgTvppyMACFl/J6znVoICieUGDYbCCq1IZI2F
	 iK7zZ7fJOZ86w==
Date: Tue, 16 Jun 2026 16:59:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: aspeed,ast2700-soc1: Add
 JTAGM1TRST group
Message-ID: <20260616-surgery-fritter-8583b091fd6b@spud>
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
 <20260616-pinctrl-fix-v1-1-621036e45c7c@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sLe+DVJgetvs8zz8"
Content-Disposition: inline
In-Reply-To: <20260616-pinctrl-fix-v1-1-621036e45c7c@aspeedtech.com>


--sLe+DVJgetvs8zz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sLe+DVJgetvs8zz8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFy+QAKCRB4tDGHoIJi
0nyzAQD/cfSEv7EyKRM044BXBjhasA9Yr52g/vKaTKlxcUnd+gD/dLz2G4ZVL2LX
+vn4OonXgVtVBt+atEzn1pOoaRvRjAk=
=uh/e
-----END PGP SIGNATURE-----

--sLe+DVJgetvs8zz8--
