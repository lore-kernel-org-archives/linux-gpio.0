Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590435;
	b=T2AQqw8I/GF9S61gS2uHZflxoPGExqJ6huoZ0eojV8erRoiT5OSUH8jI8/1Y3qrN1wSr
	 IqRJXRNsgMIodfeEIPSYfSHBVmSfUO5QK7McHr1H6T8jzplU/IP6pMu+UrYIo29xLAkCO
	 q4AOdX7UE2qFanLJdCO/VRMTNF9oxaJh7CnRa/O4eyIEDZ+l9MK9zofq1uzL9Zhzuh2fj
	 2LONOqHBEdD/6kHZcuZF+5unEnHcphPY5owu5rOJcKl0iwVqMpWPRM+hFz76Sv2cJD2AI
	 o5QJDi2itjULMomBTDz/oeS1btkEirX3yKtstxhaBguOu/6BxVkCfDIvA1L6uuhHX3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590435;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oTXxB3waWpkLlntIvF64sIESVgJnv9c9rK9MOS+VyeI=;
	b=EwzBF7bOarcrwirIj+e2MCW0oZ6tLT6RazwLskx04+W/m4AxB5mGUK3sHAst5YXAcYot
	 X6TzTt7G3j7am4sXSRdq7+g+tZFo8MaT16sUNc/ecnVBYhh0pzGiF2IR+O44dJ/AN36y6
	 Z6V6CPBTakRpYrtMCdp5Pe1r+OldKpKDC1Xp4JUnqRyETmmWrB5WqGuVj8lfqGeac6zqr
	 0GWILTXA9h+0madh5cnpd64cZzUS0KLCmx12BnGY2z8SBYsoRFNZ2oiJ97S+G6w0yLTKi
	 oIy/WMPMm74CDPv+Bdp//rodimiyBXRRq5RfBK+3g/BbFE3wT+1a+gWgSrfqGkTTYhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U3Pc7+cf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9929A60703C6;
	Fri, 13 Nov 2026 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U3Pc7+cf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2253C1F000C4;
	Fri, 13 Nov 2026 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590435;
	bh=oTXxB3waWpkLlntIvF64sIESVgJnv9c9rK9MOS+VyeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U3Pc7+cf//FcAy2oXt3p6yCM8+yW5wQfZ4HW5+RJVCEiV9ClKuo0fGW8/3NKPFzDf
	 X2BPWFZ6j5Xn2ZUQcymFiZxpaMVLt4iFcrwb8VJ/OdlHBEBPuOCzHWsjvK9NuyyeWu
	 lInmcPtcBkTt6W842zoOYdvgg6VMwWWepxrOXykCX4GThtg0AvPfvlUnQKomoP7QL5
	 Nw4oLUrylKYCTV71IijLQF/Wg5cCNHYBsPQweTM3NOnTr3ssss+GobA8n5kZ+S0CnJ
	 B3CYeRAblKgbRrQoGUxXJXkor7M3iY1pOcDqlsgqthbJaG+xSv+AbkQw7ko7sWZetv
	 YfdZ9urJLiuww==
Date: Fri, 13 Nov 2026 17:20:31 +0000
From: Conor Dooley <conor@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: ingenic: Add X2600 support
Message-ID: <20261113-probe-gravel-3c7e3cd8f7d2@spud>
References: <cover.1794557697.git.hns@goldelico.com>
 <ba9c514a8243419da3bb46fcb507b706c948fb60.1794557697.git.hns@goldelico.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="44iUcuStpHNSNSzT"
Content-Disposition: inline
In-Reply-To: <ba9c514a8243419da3bb46fcb507b706c948fb60.1794557697.git.hns@goldelico.com>

--44iUcuStpHNSNSzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--44iUcuStpHNSNSzT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavdG3wAKCRB4tDGHoIJi
0iJgAP4uNgFIP0i4mmLc6XaxoNcSMY2sBZR2A7O2WYwFkShZRgD/beg5ETfjWgGS
OQqv2eU1VHkKGNlavAotFBJNOYa4iAA=
=Rs4R
-----END PGP SIGNATURE-----

--44iUcuStpHNSNSzT--
