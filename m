Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23AD3D9DA9;
	Fri, 15 May 2026 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865529; cv=none; b=bIQU/nVwwz1prcBW9guTD6yK/9QXcyKdSNEmORztnERUhb4X8XL7bZHTu1nTLE2rou9ZFTnHYmza5iNYkQ0eMIR/sMCqF3zJBE9ahe3w2Tdq7lib0lFcKo0aNvHfc40GfiLdrekjG52/weG6wA/NJqYzUyP76etxsXqf89HpZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865529; c=relaxed/simple;
	bh=pvUZG8OFOWYSFaFznbd7VEZqz4mfURKI3BrueEuTWzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwHRW+h5ZFH7lToFwE8mOfQzpmXtvc8Q6tdI0hgGpc2ZgD49+kKM8FKgZhyd3eb+9O7ZOQrNwvadsq9m5gbL2G9nYBWhmZntmwB+fw9JPkARJtKwdSFJ5JosQNIb/3tQamFDOZteRPTWnvrdcdTbZ7vc9wMJ5IrmB4OiA1Dl6OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liRR5gCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liRR5gCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F06C2BCB0;
	Fri, 15 May 2026 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778865528;
	bh=pvUZG8OFOWYSFaFznbd7VEZqz4mfURKI3BrueEuTWzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liRR5gCgrghUx/YxVJAfx1NL632CmfqaPCvMsKr+4HE1Ogqi+h6+Y7HHYWE5GBbeY
	 R/aK6POAoUiksle7mNRiplPPutReaHupZGTLgyT8Bpg/Eb3zjeK9O4XwmtFjCFhJkN
	 10w1pG7VaYMKaXJoPfwhBFqMN+KVGmlf6q80WnwW13WxV4YN7iEMPh+c0jLFlaS0cu
	 xF3j6Kg0mq1NfqHOBWzJ9jm3R74wJlgnCI7ZCzLC8Ss1t3g3Z50A/Z4kxkt0+lkwOU
	 aResWYb5xog1FSM0lguF5nxi9rIAMx00XvVruIBjy0xS6uixx3+NOtmZB7a9gulnR3
	 5iFEMVXgKRyAA==
Date: Fri, 15 May 2026 18:18:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, patrickw3@meta.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com,
	openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC1 pinctrl
Message-ID: <20260515-schnapps-uncooked-177724828e23@spud>
References: <20260515-pinctrl-single-bit-v3-0-e97da4312104@aspeedtech.com>
 <20260515-pinctrl-single-bit-v3-1-e97da4312104@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l55Ya1GMCDxdgVnh"
Content-Disposition: inline
In-Reply-To: <20260515-pinctrl-single-bit-v3-1-e97da4312104@aspeedtech.com>


--l55Ya1GMCDxdgVnh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 05:37:37PM +0800, Billy Tsai wrote:
> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
>=20
> Allow the AST2700 SoC1 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
>=20
> There is no functional change to the SCU binding beyond permitting
> the aspeed,ast2700-soc1-pinctrl compatible string.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l55Ya1GMCDxdgVnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdVcgAKCRB4tDGHoIJi
0o0eAQCfCKP4u1gucOjpM6unsuNYH1ObZr6/u9PFfMNjTIUy3QD/cc0ejlq8efRu
gg9kIhJOjzD5xQQu5JLiBVcerSsaPwU=
=JJiP
-----END PGP SIGNATURE-----

--l55Ya1GMCDxdgVnh--
