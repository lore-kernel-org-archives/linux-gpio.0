Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770237;
	b=TosE9UdpCtA/BUVcrlEsFB9GggNsvJvcFrvJMt32Mr/UE0OaveFNSpyAskHQ+ME/J6n/
	 vJLgdxCMbecgE1I+En40mkrEXaVPZz6gvrsjYMwbSO1WVEKAIw/acglUcBCKsg/ZCX8Uv
	 C+8DtpqhVarhJhliYwQnxk1nqhBX26Igz7hSKItw4OGBsCZesmduWjvEUQTWoOsMV32sB
	 Fly8+AhxTyBUmktpFLuKt8PUuPBVRjuEiVJwk5clrOWgomYbIt4Zp/xc9VeJG8UxhwCzQ
	 1J75p8urMtjjYNwdtefWrsgIKsWk+0YHKn/zk7O7srZQ59p7G5G2xyZ0CpPz5N+z5fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770237;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:Cc:
	 From:To:Subject:X-Mailer:References:In-Reply-To;
	bh=iKqB6KARpCxD8VA+B5XGHtmrw7kPulEmt8VCNbPpCj4=;
	b=W1z0yT2PeRqhXNupMyx1aHvoS4PZU38WsiFTeSz+kOMEc/p36+wDeCB3jU+cIXt+uSO+
	 ELlCVL7YacVaCUaL9DMtC8EzO48T3y0swWwIdBtMlJW344u8ndUcMbiUKq36BIwDeTsSs
	 /hzlVTJeguccp3SCdmH4PFbtbhb7PhVbovVhHBQz1PJHVOqiNWrGKYzpYjdDFimibbclX
	 0axhlGltaRvTyz0e4jJ3ylxLIf4RnFaHEXqmVoVdj7spbVq1c9JsvN3U+rQR4pJvsytkm
	 5uX/OU28lenyVKSh5wmD6W8qtNW3kpMwzOqc/2b1PfB3Mhkgqeb1iXUMX3CcP9vW06w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aW9aQ6RM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 14A52606A339;
	Fri, 27 Nov 2026 09:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aW9aQ6RM
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9FC731F00898;
	Fri, 27 Nov 2026 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795770236;
	bh=iKqB6KARpCxD8VA+B5XGHtmrw7kPulEmt8VCNbPpCj4=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=aW9aQ6RMYX0A5XCcqaXNjNR+X5ZffR3xf21jD/TWs/+AfCfWClHP6JecLfzc1Db6Q
	 i+qh+0bikrNwIBLwD9C6XLcqn0jIhm6EPryOSL5HJuZbpttRvsbaNNB5kjAbJbE9ah
	 chLJpSASmSTO18Tuu175E1Jq/KVk1MI15cB8Wvljz2/4YO2mwKlKJMXXh9aLl9qX6y
	 Wy7heXmyUxQVwAqPB3pCzId/nUcc1qGt6gY2SPGdv4JC2eCFWp67zfhpLJmampl5Pu
	 HdEkG6NO1e5GuY1hJPxOc6cZyKKyEucDpBLoo3myPpjufcnZ5WRCC1jEpCIBKQPaX3
	 kW/pHqzoccD9g==
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=341e3521ae29b758733c15bc21e6cf5a37e91bc56a26414ba877b4c552ef;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 27 Nov 2026 10:03:52 +0100
Message-Id: <DN5VF42P32GF.2HMRYUG9S3CZM@kernel.org>
Cc: <linux-gpio@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <sashiko-reviews@lists.linux.dev>
Subject: Re: [RFT PATCH 09/13] gpio: pcie-idio-24: create the regmap-irq
 chip from the gpio-regmap callback
X-Mailer: aerc 0.20.0
References: <20261126153600.299724-1-mwalle@kernel.org>
 <20261126153600.299724-10-mwalle@kernel.org>
 <sashiko-outbox-235846@kernel.org>
In-Reply-To: <sashiko-outbox-235846@kernel.org>

--341e3521ae29b758733c15bc21e6cf5a37e91bc56a26414ba877b4c552ef
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> [Severity: High]
> Does switching to gpio_regmap_add_irq_chip() cause IRQ requests on the
> Isolated Input lines (IIN0..IIN23, offsets 24..47) to fail with
> -ENOTSUPP?


Yes, so installing our interrupt locking helpers doesn't work for
all drivers after all.

-michael

--341e3521ae29b758733c15bc21e6cf5a37e91bc56a26414ba877b4c552ef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCawlHeBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ilkQF/X3JHymYP4xYGr+cGEVF2a9QiOkYzaZaP
wk7m+5eO7lCKNDoK1Rj+EDkn0xL9KxDfAYCfdBucHQoKctFOX/l56t9O8jhKu/Dg
Kswu0O4sv+FU44AVLQmq9LlYoQk/hYEuT6U=
=QsCS
-----END PGP SIGNATURE-----

--341e3521ae29b758733c15bc21e6cf5a37e91bc56a26414ba877b4c552ef--
