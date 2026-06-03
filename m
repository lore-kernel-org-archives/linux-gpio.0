Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DCC3A1E7F;
	Wed,  3 Jun 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499775; cv=none; b=PsD3F9A93prjmuO4z8jQkUixYR8q0UnIamF6yOzOu9lH6NaI4vlJ9Z5tTSkP4JsjGssWLBIXB5LRfG812z9N5P0P5ogsKIOJ7NZcDHfICp7F8ztm0JQNVgJFpn3/PPjxU5vPBvLUYTn7Ny98cJOUGVcDxNMxvyVRdNA+Kt+IyZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499775; c=relaxed/simple;
	bh=E15Z2HLpNxRdOoHi9lUwcc6adK9szvvSvtwq3QLPM0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmbZju+g0v5LlGIKUN600xPsMcnMLQez1snPoafW/E9ayj7ii79CaonCa8adgdhpSL6Tw5IWED53l8US7htagEUhZqwtqKlQnsUN8/kd8a07qxB/S9LQLYNb+wx4q6ewMysSYsIJNlgHlDMCAqOz48KKTCvfad+WI2Ay48NHNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5JYwOQT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5JYwOQT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846B01F00893;
	Wed,  3 Jun 2026 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780499774;
	bh=E15Z2HLpNxRdOoHi9lUwcc6adK9szvvSvtwq3QLPM0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H5JYwOQTiAby5DiNxuTlBrOH3Yt+5EvwTBKNlX1yS0VY/SLLg3OYlcP68KWLquWFv
	 2l66Kc9Al2RnTB8qbrXCFSVo5jhbqqyStmgb85lT5KRbH0BoV+8QR1MWovLV4Y2wpq
	 69BBCjl59y+RddFbjopMEZbzei/76ugUQ0r3XduoUpbR1KGAhsx64HFTmCTCNld/kR
	 hXtFKZVtNmp+ZgJD/eiBpJzBVfDREE7iP2MvtWhxAzPJ08Q6s63x9JPCmbz1l948d/
	 bwqB9KsG4uRbB5L30LWfuXiA+iSrdBT/0In59JUEGScPT9gduLf30c7W8MYRIHvThE
	 r/bXOxI3UbmyA==
Date: Wed, 3 Jun 2026 16:16:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 01/21] dt-bindings: pincfg-node: Add property
 'input-debounce-ns'
Message-ID: <20260603-prevail-stereo-e5c6f56a433a@spud>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="71FISapX4KtVwp+B"
Content-Disposition: inline
In-Reply-To: <20260603055347.66845-2-changhuang.liang@starfivetech.com>


--71FISapX4KtVwp+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--71FISapX4KtVwp+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBFOQAKCRB4tDGHoIJi
0t5jAPsG52WyxIdGqkWQXbNR7WWwBbFJJlig8nviGZ33zar7yQEA6vpxDt44oWRn
+RG29Due1ymZZztK7tR9/NKS9Q5p1wc=
=2VF4
-----END PGP SIGNATURE-----

--71FISapX4KtVwp+B--
