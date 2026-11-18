Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025440;
	b=ptmDJG6vuBDyG4JONPcqeqDSyqYL520fhu4niKem3Aa/OsJ6A9hj4/oZwIGySrhV/B4a
	 tKJmsfYHlvSDa/bkNj8Lj2U2buRCEPI0LWU1jHwO+48yv/pFuoXg+Bi27Mu5w3Syc6F3n
	 /VQeoB88uPRu6opZu+mxrZFxMsCo746ZWOiayk0g7lLhDpb55+7sdwtBFgfaZbeDwFZ8H
	 QzaYL11gEw/ZTNEGyIzL4/6KXW22lXYaFcLNk7gpw4e0IPF5dxWzPduVtQfXKmJiibMZZ
	 cqBmRsx2/L2UzJD0uzQzhJtROcjn2ybX1RBOQkuYKZ0yU6fiRuxOWHRJUDoDzKXPNBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025440;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a3st07qsmtWUD6m6GwTi4D4k6gutsGseuQHaOE/Bp+U=;
	b=OL7gwlytUmY0oN4Wk+IY9AIKPlhmdfp3e5v2U221YR/H7Gmc5omO+EXkWFISEFkpfG90
	 lQW6H3a0Z28Vo1kokWCegKczl5Fai3d0R9lNVS6397kl8aL61WqB4QHU48AU99NjbK15F
	 tOPkAiS7B0zQwxhT/ScY4D9mMuoKFeucelDKlFL0MFgnpiydrxjk1lmnWl5p6tgd0GlIv
	 qUSzTybNpUMaQbFW1WYKHUZEetwPfN/6wY/Itj3dNlujx4ShOrPVjIlRk6v8oFQK7SNIv
	 fQTkm/UFDn6oq4rk7eWa0h/mu2Jwdewv0XEYKN+4iK8IFGmC978FWadRsPyuTF0TbFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQMISZZo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F33606A32F;
	Wed, 18 Nov 2026 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQMISZZo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190FA1F000C4;
	Wed, 18 Nov 2026 18:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025440;
	bh=a3st07qsmtWUD6m6GwTi4D4k6gutsGseuQHaOE/Bp+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eQMISZZoi8FJSmGIzO+9AQeKeA1mow4ylc6obQupxbyssa90KAvcDI6A/j/SGGT1A
	 kSJcD5DagS0+MjLJjrscjLtTG8j4Zq2RXDjFLtRXvgqoTxo5PovMCgAfMaytfkil21
	 7jJEEdXKbzFoGvpMyDFQx1g4vs/6hK6v1h9Q3T9Voi2XnJAJvxGMWNAuwHDSNO7kL/
	 cz4HZU+n+e+ypDSRd++eWT46Ark69hU3vhkrCGEsLqrJVxhxb/KfoDeHZUu4bCRcsc
	 xYA3FkOQwKO8iCca3fqszcfnpjcmPdbro+rIyhT1x/VHk0iCTMNg7H3A0IUKhuzONd
	 XFKjc+pUa49AQ==
Date: Wed, 18 Nov 2026 18:10:35 +0000
From: Conor Dooley <conor@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH v2 3/7] dt-bindings: pinctrl: ingenic: Add X2600 support
Message-ID: <20261118-makeshift-emit-c0fc8a520691@spud>
References: <cover.1794940166.git.hns@goldelico.com>
 <98bd8062ff2cda00ec96c8a540aa9d2ac789af2d.1794940167.git.hns@goldelico.com>
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
	protocol="application/pgp-signature"; boundary="HGGsQtc9sLboBVWA"
Content-Disposition: inline
In-Reply-To: <98bd8062ff2cda00ec96c8a540aa9d2ac789af2d.1794940167.git.hns@goldelico.com>

--HGGsQtc9sLboBVWA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--HGGsQtc9sLboBVWA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3qGwAKCRB4tDGHoIJi
0mPuAP9KMpoQZXxzmu7moGN9ftodwze6QiVni88UdavxwewOWgD9HRSaEm/pklCY
/uE3Ss/f6xAEWsen+eDgFdBz7GiTjQk=
=unCR
-----END PGP SIGNATURE-----

--HGGsQtc9sLboBVWA--
