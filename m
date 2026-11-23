Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429055;
	b=eMf8NN7Df+vzSwnP8KfXQzr7OwTWJzbpE8+FuCfYiZzenpcpRtv7yR3/Bb8VooNDSgIN
	 gKcE0tFlUNDMC8Ny+OI5jokP2ez3alvYiGF/jJvi3uKIzOX362rUvdV6NSDzfaDe6VNjb
	 PnaRQFpdYh7IKTe3X98dKzgN/ooripU/GSAmlj56u86o60zEhMicXYCMSTh1eedcUPtgn
	 4NzTcT3bcJKTe0KvUGD43RJBdviSFZVjD23P0xQT0zoECBg+ps+afuU1SNBLxC7DsPyoS
	 Dg8jXWNKh+pRcr7Bhuj8u/El9K0fLZ8F52DNEkD5+jBrUwosZZPoMpIOoORAcuqIdhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429055;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ducv/mz4hmKhT5QO6HCKfk5+lde9Z7VIz0eteTv3C9c=;
	b=mYwPazD7HCr6Ks3FpkaCrH29YyBJXNZx7g8vG97gowMtpTGjmfX8q3FSu7CHnKELZ/rh
	 O2LKltVvwCB4i1E3hjiryW49uTIPiTIdkDbhA5M+meVrpY6HL8RXibZcxM5ZD6Afp+C0h
	 gtdHVy9q0nEQg4hp8M1w+3dzJtagAWba7t4qYHA3GHnTWqR9L1Bp6OzVnPP/cwUhPi95u
	 xZiVzBSJcN4EDTiFWPrscSgM9j9eCeGPyCTdE9OQf3bKo2qmb2xZ5j9Mc90YHdo2yaS3r
	 HOsqp4Rgxyr9G/oyF7pn8Y+ut0nWMehhoAR4dU9Xg3fimHRBrNiZgsYHujccrMZRDmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bbnraiON;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3E606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 10:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36A3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bbnraiON
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ducv
	/mz4hmKhT5QO6HCKfk5+lde9Z7VIz0eteTv3C9c=; b=bbnraiON6bV5sSTu5iru
	PYflYZSl9jl+IuxyLlgEY9+JPOcuQOMQMXrmURJyetU+kabeTdeykCRi83G+Eyhs
	RKyogmgjDPRmqOWCwfP2rq6f0XpNsmcwIZ3w+WyKIciPahXKrNz5j4w/wHSblyiJ
	9zpqpRPmpZQBtyWkXEJFs0lx1WlpJeyOvZe9DLsQDFOn+8eA1kwuTPkz9bS5zP3i
	jekw62Ww7RvO/lNgQ/EXU4cC0ldkDc7TndTEF5J2L2kCq1x2H7xdlhWjJFnc9UN3
	5otU9T4QpUYEmpKPYHN9ZqTDV1OlCngEy6zHo9feCuTxPncd4v/37UVVi5qlstIW
	+Q==
Received: (qmail 2658429 invoked from network); 23 Nov 2026 11:17:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 11:17:31 +0100
X-UD-Smtp-Session: l3s3148p1@+anU5u5g8JIujnsu
Date: Mon, 23 Nov 2026 11:17:31 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Artem Novak <artem122novak@gmail.com>
Cc: geert+renesas@glider.be, linusw@kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: fix typo in RZ/A1 driver description
Message-ID: <awQSuzxVZkCZr-9q@ninjato>
References: <20261122174427.276446-1-artem122novak@gmail.com>
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
	protocol="application/pgp-signature"; boundary="j7CUZoOm/IRBz0Hw"
Content-Disposition: inline
In-Reply-To: <20261122174427.276446-1-artem122novak@gmail.com>

--j7CUZoOm/IRBz0Hw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:44:27AM -0600, Artem Novak wrote:
> Correct the spelling of "Renesas" in the RZ/A1 pin
> controller driver's module description.
>=20
> Signed-off-by: Artem Novak <artem122novak@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--j7CUZoOm/IRBz0Hw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsEErsACgkQFA3kzBSg
KbZuMQ//XjKsOZ8XOyC+BXwMuoP/w7PbhG9gpNmPX/bdH6ZJOKYBe+pkezMbWKDf
PHi/H5BVJmt3OK5/9H0/W/xjxnHKLLk+goSuPwzZbzS6q8Gc4IU3KCmDkVX2D7At
9+GaeZ1+E2abW9Yh/sPI42srzyg6GbrsAnAfDGzgT9/AhTk4DoWy/DkU/rFN2I31
T0Ex9npTV5ghMnk3HJffn2AhfzRllEMfBEZtVEQFP0AzT/9I85++3XKGu7+an9AF
enFKpEMsTMa/cmgWVS3w3mchtd7+7EZzyWhhtcJ3Rg6dmJ3tu3JqtN/9JP2xRN6B
Bl3Qy80nD2p0BoH1PYFvwWczpPdgsC1rBySjiHSVG8Wg1EWWtSxTsuhskSWxpf8Z
788Ng76yTxl5GiPCXZ8kclUTt5q4XrSdtAfIIcN7NrvCg4CT6KsKgG92PN8Ni7Qv
Ok/xkg7FxxMz39KDJzfRtSlr7UoV0FjFqY01gkhu7cmILnFc274k8kGSmEx+/oBq
QbF/Z+nikopUHVdxSReDyDXRoZE+eG75Zv+Fxt0SJ7tEBUkWc6D3L/gWfOv80qnF
D8Veaph0U4pAh2n2h6nZolkXBFbdB2ELBDMUuR1doWIct3nzrOgkqEUaofVQjR24
JjWbC27msnYk+RNsNOv//tLJ3vPM8K2SzjU6xC9874PiXe+6ihs=
=7AD0
-----END PGP SIGNATURE-----

--j7CUZoOm/IRBz0Hw--
