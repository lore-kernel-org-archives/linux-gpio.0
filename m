Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D034DB6D
	for <linux-gpio@vger.kernel.org>; Sat,  1 Aug 2026 20:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785616567; cv=none; b=DQtBCAnChI3xdDqWj9SIIo3QdHwHgj1a/a8wcLyBxO4NjfPREt79e1DJ5kiqgnofpMJth4RM2ja57rwGdHF3u4CUw3qZ6zUboyZCxqzbdGHpgp11S19duZEFeBtQfl98t/oi119N9t7sP8XVC+eyA38nHartGLdfXYGIX3G/cFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785616567; c=relaxed/simple;
	bh=yK22Stux9UPrvNWK2bBRclWpoSn3I5fVEKRb7fU0pyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEUnLpVzv3L9VDea9OeZECYUKTGc22PYv44nEDcFmE7poMMlGr6sWfVBzb00f2sOl2a0OJ40jbNGbeFgyrBSo7gdlSX5yTJIP+inWlbIBgHTkcIR44nJX282bsEyadfqPjLJhyZZTEEAh3q2ECMx2QCx/YSar1doB2hGPdutIBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FSpTMlTl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FSpTMlTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yK22
	Stux9UPrvNWK2bBRclWpoSn3I5fVEKRb7fU0pyY=; b=FSpTMlTl0P7mVyi/2FDT
	i2CfEM1RnUHAuD3zhMWIK8NkV7+LZqdjmPtQdRSplo+IXqdGMAXPEOpYzm/VOHTm
	9UYkjDKeuWTVZnQp8HYJyO80kLFweeOroehEaC7V8a3+PgfbInuO25XucOUndhQg
	Micq8yo77swx7FulBj8bNDBLy3HVU6gEO1uYXu9HqjeM10jgwcwPWYKUgrGOhlXk
	GirCKMhtfSntwAPWAlw2G2+2vq7mZu4b5mXZ0YkbXytxemvIr5UPXwbR13I76P/5
	zKi3usFHTQqCaFAGlbC73LsxcCZKMA5zwLmBdPP1mp9c12JrFO0qlbTI88uzaUOq
	ww==
Received: (qmail 2491325 invoked from network); 1 Aug 2026 22:36:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Aug 2026 22:36:02 +0200
X-UD-Smtp-Session: l3s3148p1@+17nQAJYvKkujnt8
Date: Sat, 1 Aug 2026 22:36:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cengiz Can <cengiz.can@canonical.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpio: sloppy-logic-analyzer: use
 debugfs_create_file() for buf_size and capture
Message-ID: <am5YsrOS3lmDwJh4@shikoro>
References: <20260730220258.358169-1-cengiz.can@canonical.com>
 <20260730220258.358169-3-cengiz.can@canonical.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m4xUjN+nZ6XlrdFH"
Content-Disposition: inline
In-Reply-To: <20260730220258.358169-3-cengiz.can@canonical.com>


--m4xUjN+nZ6XlrdFH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 01:02:58AM +0300, Cengiz Can wrote:
> The "buf_size" and "capture" debugfs files are created with
> debugfs_create_file_unsafe() and DEFINE_DEBUGFS_ATTRIBUTE() fops. That is
> safe on its own: debugfs_attr_read()/write() take a debugfs reference
> themselves, so debugfs_remove_recursive() drains them on removal.
>=20
> Now that "trigger" uses debugfs_create_file(), switch these two to the
> same call so all three debugfs files in this driver are created uniformly.
> This is a cosmetic change; the extra debugfs_file_get()/put() added by the
> full_proxy wrapper is negligible.
>=20
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Cengiz Can <cengiz.can@canonical.com>

I'd squash the patches and keep the stable tag for the combined patch,
but I'll leave this to the GPIO maintainers.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--m4xUjN+nZ6XlrdFH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpuWLIACgkQFA3kzBSg
KbYqtBAArSZGTU0TE6CqxvdXf+fY9WbViTUupwT/5+jihHKaXZDHZPgS9+oZ5ZiE
6dR4LwAU4HiWJan2WshypZlfaDBZwDo0mNL+IIFggK6vHMWBFGTL4PWsSzna3hKD
rMwOK9+kjJaj8RrFP86fXQHq3RiWh5D7xtE1uO6Af3BXE/ami7XkSZ4E14I0WdTZ
gYj937nnrWsdTLEV0FA1ivlU6Dq7zS7NoVpFnm/lQx7ZpXWDXz9jNifEfRUhV9/F
7WmW1GuAVFtG6HThe9x4mkRHHZpF++C3rUjEfcvMqJ9SeWaqCA5AC56IcZVs7BfT
J+MuvQbcvYj7/6MrP/5xN6XBXWALeGCXgkyUddZW2BQ3B/JVbymRYMx/mhVtyNd8
uRLojVZhzIA7VDKXOdxQP5Kyax2lwXZ5MIyuUv0j/4kVc7GdrHEu/yYGH2uHqPjn
+HGa5aJ0VilwqHAcPNCPnBlCj4hBVEMRDX57ftMAS+lYGKwpx6VEbooqdKdXrYSF
C6txBLQtuFrUsxJrvH0slkg+SWuIf6mSudVokGoJjbaBLXRVQFv/4BdXvvjEWEDN
KbYIEomVx6JIR2jCYLsoELa8rWAelj8ZZS6E9MstwqCZWFkD3U4Ko81pCGpZeJpC
07HnQxWbBx5TBCQP59C71v37dq5wIjvR1dpkbsX3+n7D6su074g=
=5BTl
-----END PGP SIGNATURE-----

--m4xUjN+nZ6XlrdFH--
