Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4CB2EAB6F
	for <linux-gpio@vger.kernel.org>; Sat,  1 Aug 2026 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785616496; cv=none; b=WNPIrTwfARgr80KnEa5CHikWa0f3EQ53kQRtP2+f6RQP3aaEeu2znY10MjS/2xmvzzDiLnWtMzIBILUCI31K1zB8DmfaTFVOKPottJIHzBvWbw6QjN7AGuG/Mbfu7Y+A9kx267iHzTLNQeP1MsOUlBDU0LOqQ5xH+VP7s0pQvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785616496; c=relaxed/simple;
	bh=sAUz099dd161yFE8MfIjR8abxAaJ2FyhSWBUpEhGqwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oijvqQazGm5QNEX9n0HUwNTV0IvFPrPYJlB/rIflBcVPWTRz3SX+GOyQ3+nBAXjsobRI7zZj66QMoIAk0LjXYtY7CL/TFVdNGA2AcC7YMptPuck3U282ngnwBm7XOqHGPhb0QzuhavNkRx6VjJYYPjJOVN2MlHpE2YvL8vujV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cDN+63f/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cDN+63f/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VGfz
	hyS3O2UB9EZXGmLEHbmRCKAzVe6i0532ZV6jqzI=; b=cDN+63f/fBu/NCPwfWNW
	2SevbxFfRu31o+0Se561D4kEfclNgnocOsWHWMWzhSG8SNxv7KMlFRuCzIJCVR9v
	4nXH4TzQdT5CjG4QZd5/8zDq2Si25KWy2vmofzka3w8KnGyBV3nqd0BhrywA6wyD
	1DSLYs3RrmD/EpUx4mF/cyfLI6uygAE1vpEq5ZVCs+IWgdmx4HLVERvpc2frbEkI
	iBeWvWLnTUzTFXLL4j/VkpthqmKThORRyOAFWaa+uoSCoexs+wAbI5vXrD56FmKv
	oeEVDBbgPtZj3HOTvQ6pPOZAQfd2JUPh99Z8aMjQW74+HIRlHTRfn9dLqlXhIEvb
	1g==
Received: (qmail 2491072 invoked from network); 1 Aug 2026 22:34:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2026 22:34:50 +0200
X-UD-Smtp-Session: l3s3148p1@vLegPAJYIIAujnt8
Date: Sat, 1 Aug 2026 22:34:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cengiz Can <cengiz.can@canonical.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: sloppy-logic-analyzer: fix use-after-free
 via debugfs trigger on unbind
Message-ID: <am5YamFGKrDSBzQU@shikoro>
References: <20260730220258.358169-1-cengiz.can@canonical.com>
 <20260730220258.358169-2-cengiz.can@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hJpq6GjMxq/zMXqA"
Content-Disposition: inline
In-Reply-To: <20260730220258.358169-2-cengiz.can@canonical.com>


--hJpq6GjMxq/zMXqA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 01:02:57AM +0300, Cengiz Can wrote:
> The "trigger" debugfs file has a hand-rolled ->write handler
> (trigger_write()) that dereferences the per-device gpio_la_poll_priv. The
> file is created with debugfs_create_file_unsafe(), and the handler never
> takes a debugfs reference. Nothing keeps the object alive while the
> handler runs.
>=20
> priv is allocated with devm_kzalloc(). devres frees it when the platform
> device is unbound. debugfs_create_file_unsafe() installs no full_proxy
> wrapper, so debugfs_remove_recursive() in gpio_la_poll_remove() does not
> wait for an in-flight trigger_write(). The blob_lock taken there does not
> help, because trigger_write() never takes it. A write that races an unbind
> therefore writes into freed memory:
>=20
>   trigger_write()                  gpio_la_poll_remove()
>     priv =3D m->private
>     buf =3D memdup_user()  [may sleep]
>                                      mutex_lock(&priv->blob_lock)
>                                      debugfs_remove_recursive()  [no wait]
>                                      mutex_unlock(&priv->blob_lock)
>                                    (remove returns; devres frees priv)
>     priv->trig_data =3D buf   <-- use-after-free write
>     priv->trig_len  =3D count
>=20
> The race is reachable by root via
> /sys/bus/platform/drivers/gpio-sloppy-logic-analyzer/unbind.
>=20
> Create "trigger" with debugfs_create_file() instead. Its full_proxy
> wrapper makes debugfs_remove_recursive() drain any in-flight ->write
> before it returns.
>=20
> The use-after-free is confirmed under KASAN with a minimal reproducer of
> the same debugfs_create_file_unsafe() plus devm_kzalloc() pattern
> (available on request); it produces a slab-use-after-free write in the
> handler.
>=20
> Fixes: 7828b7bbbf20 ("gpio: add sloppy logic analyzer using polling")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Cengiz Can <cengiz.can@canonical.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--hJpq6GjMxq/zMXqA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpuWGYACgkQFA3kzBSg
KbbUDxAAsWK37NbgW+VKEOJp2xFuzvnQs5z/IoLfLtfwoLBjmRGbJ1rcsj00nzKX
0utqOJBer6tA+9Ucj2KDOk1FqziLRgXjMDxBBJn9vQoQD1klAPvuXqodW+IoA8Vb
qYAc0MtEAo38stYrLknEOHg98UQgtfOMDmGaAL2z8FFfr2MZb745ksYoL39gnp4J
qSb1OJkxxlAImgr3Wf8nZmzFEGtb4dimIwpOZU43uuC9Qefb0zLV8Yf3mdgzcuDA
BWyKeAwVkLw1bfM+m1n8B1VI3gE/KahSlwFLw9+3dp/8EQTlwz4XTzYnaeUdMKvX
Kn8tt3y4VzFdH3erEIqSru+xZqeMHwePqmsvlavTiAt4cMSA6sYcZJ0CA3BSHw+J
HEnL9BtMYK3Ln/J2Hs6TFe8OCjWzKMVoaLGXPK87AVn14CGa0vPbZbd//B3lZ1QA
iAaNqp9/JCenwE6oFqxxopWu/xHRkVtCVvcqK9PhjX36aPNtx+jTD97fDmcLXCHT
v3YPlJfIeKXxh0TMO0E6i/3t5LoTIn2MqDS7uBsq8/4LgR5j2gtKmOb/5uqQgr4K
n5BTlNzq7M0FFQ4aiya1qaKw2Pr2BSBYH5YVyDAdngbqfe3oHt/u+5VJv9GnUSFi
qJKRb6sJ/jRyOfiTDQAIEixzSZwKMuqZubnCTzbYLuCvojME2DI=
=RyH1
-----END PGP SIGNATURE-----

--hJpq6GjMxq/zMXqA--
