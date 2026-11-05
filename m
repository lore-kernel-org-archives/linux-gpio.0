Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842515;
	b=ugNxwLQS7DXVsnlGBoxMJ+hBmWRdl0maFO55qdxYcYzu1RpArrNzLmQpyhAuMA/Wo2pt
	 rd7Iwo57M4LYHjny12pgpGzVKCsqS9BJodiv8uXGp0Vo7mJfTc9EUFyghUosj9CO+PLH3
	 mGag9frmV32zB8vZy0M21TD/qIjIHcQ2Hm5jYZBQ3zuUGiZi87Pj79EbY8cV0WgcyKJ7x
	 pZ2hLmqiueIh5rsItE5zImp0Rze5qZwhTYQuLFxYisdbZ7Nq/uAoHoX9VPepG7YwoDHPQ
	 1yZTN043WQKO0NZAnuC4iE0JRgXjVe7WRfvkYEzzK+DCe0G7BCZs2biSJwAjpE/PEAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842515;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7j7eXtopd4fTD7IchJ7gP/TCQqzhKRsM6gf3nsjMSD8=;
	b=ST8TRkSsJckftA69z+50pPL70ffgkvEsZwF9l/2e4YZn0savqA1dV6i93l6tS+Qb/mFe
	 Fc3DCndCGJN6w9UO3Is7OWKQ706l/JCgUwCotYldsCEtXk7Sa0lVYzYlQtBFdXM9ZFhZF
	 Kb/v+hGBZ+AB1Cfnb2LB5hdrgULWCxQWXzoh7rSMO8mKDDZmZKWcXYzEFHYNCe7CdtTXb
	 efQcF2GidwMKCvXmjR+Yv0OwjmR/q9j5/HJ2K0GeD2wfE45QKoC5N6wG+Ow8f3TX7VxRD
	 CfbT4ZpgudPHrkEXtWaXO+sxss+Hrv/i4jYLFB0MTZO7MObqtsJgKWpE7aXLGt4XRrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niuOK5sV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D12606A328;
	Thu,  5 Nov 2026 01:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=niuOK5sV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3F01F000C1;
	Thu,  5 Nov 2026 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793842514;
	bh=7j7eXtopd4fTD7IchJ7gP/TCQqzhKRsM6gf3nsjMSD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=niuOK5sV+9k1gCANUWNzpVd33MI5Gc7tJimE9ETdvSZ7oFtZJJgNrMlABed+Vdipb
	 7mEMq37CYPy3cJrkuwI3e2skxUEFfLbWCcI9H5FWwTbd0uJ24mVlRPJtnx7xTpzJv4
	 Osp0hGyv6Kk2NT3n+2+u98GqJ8CO2TxMCDhrdBElXVrizE0ZQ6idysI8mdSpdMl+XR
	 m38uVv2DFogmF+WKJHHXmt9WB4xyY/tvFLQCNiw3YnCFWGemnbHp4qYhrXcRNEOtCz
	 ylM5RhJUndQIfC4l9inmGoPt2zrMN3hFClABVFQkSzAVAxCYkypNcgtlDdNblXsOvk
	 l0IemSRZlTT1w==
Date: Thu, 5 Nov 2026 01:35:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
Message-ID: <20261105-cilantro-neglector-a4cdaf9bfb2d@spud>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev>
 <20261104-geiger-handler-f6688647819c@spud>
 <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="EkAQC/Rj2HIGh6Qb"
Content-Disposition: inline
In-Reply-To: <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com>

--EkAQC/Rj2HIGh6Qb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 07:54:25PM -0500, Joseph Telaak wrote:
> > Can you just use pinctrl_generic_pins_function_dt_node_to_map here and
> > dynamically create the groups at runtime (and also make use of the
> > generic get_groups_* implementations)?
>=20
> Yes, I'll switch to them in v2. One consequence first: the helper reads
> "pins" as pin numbers, so the binding's pins would change from names
> like "UART_TX" to numbers, as in microchip,mpfs-pinctrl-mssio. The
> function names stay as they are. Is that change fine with you?

huh, I totally forgot about that. I guess you don't have to do this if
you don't want to so. I think all the generic stuff expects pins to be
numeric.

--EkAQC/Rj2HIGh6Qb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvdTgAKCRB4tDGHoIJi
0pE6AP4jmJngtSTCIU0/3v6BYr1kgsvbbHNxhv7BSqH/43Dv0wD/bh3KH4G5a7q5
zaY97qJaSGTDUx7CRWthBVk0w0O4Pw8=
=LcHE
-----END PGP SIGNATURE-----

--EkAQC/Rj2HIGh6Qb--
