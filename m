Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4D335067
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436113; cv=none; b=Lr7RLB0CToMG5jfuSw0x9XcKd9dcoaD07Q9sYvHXO1IbIIgNPDFjq/m64HBgHP2qQgiJ/f7MY9/f9tOZhVfq09hJonxfoos1Juhpf0PeJ6wocd5sRENtK1j9xv4DBAInFCBqwuaujIaTp7XnkQGUaqxUxidlG1dsecFg5c0hKuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436113; c=relaxed/simple;
	bh=6UlQFczQqHkaSJn9yLj+GmxEKzIUEBuFpqhYdyiD3ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ui1INbITqVYv1I8kxnzbxxEjM19zP/PXb/oDJgNs3cFagjTgdzJNNYksc3Vm0FG9tIbwglY5XrEIN6Ri1yPly36n53d6hf8/i/vLPXXkx2Of9tl5+YdNYUy2V6YWo1WIWZn4hQZNOK+cgzMZLflYEITerq3xEISM9jF8Rf6Xo2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLqKtusR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLqKtusR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD452C116C6;
	Mon, 26 Jan 2026 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769436113;
	bh=6UlQFczQqHkaSJn9yLj+GmxEKzIUEBuFpqhYdyiD3ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLqKtusRt1KYba6J7UnGWa9BIkhrYMLYDmKRFRKASj/ulGH+FNYx0xGl8MYs7TmUZ
	 QeJZpwLDdoPVMxqo655QOY9VhwtVDxTZIWszyz3N6CUzbgy2BVooHkfD6y8RkpO0eC
	 XPHz1i63+u/VdUQ9j4sx7ASxeYXdIylM2rCSgsls95ntgdlN4oqHnxdCwqDp3pJojG
	 urPlIum+AXSWBM7hFeKXZ0YlYk7kwZIxzdgkFCEyWc/u+QUb288Sr9NwbcjkUzfzd6
	 Cxj8X9fU30j7clmL1yXx/D3JZgfMUCdmDptMVsC3MadYXJ7oMtOtCIvEc3DWKkJwSm
	 aasUnNayT1udQ==
Date: Mon, 26 Jan 2026 14:01:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-gpio@vger.kernel.org,
	kernel@pengutronix.de, Stefan Kerkmann <s.kerkmann@pengutronix.de>
Subject: Re: [PATCH 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
Message-ID: <4ba68a0e-f603-419d-8162-da66f8755542@sirena.org.uk>
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
 <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cDUMvdAukypePpMy"
Content-Disposition: inline
In-Reply-To: <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com>
X-Cookie: Haste makes waste.


--cDUMvdAukypePpMy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 26, 2026 at 02:50:27PM +0100, Bartosz Golaszewski wrote:

> If you can send a v2 with added kerneldoc, I can queue this up for
> v7.0 and Mark can then queue patch 2 in the next cycle. Unless it's
> urgent, let me know if it is.

I'm happy for you to just apply patch 2 if you want.

--cDUMvdAukypePpMy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3c8wACgkQJNaLcl1U
h9AciQf/TdkGducAZii7c6pk54xfdlwoPSEle8Hljwhhye/BgXdbKvI5OAWFrk6P
8GR46AOp/7ZPIKXfQAdFMvXnQVo09VLAuioDjJm21WCO868nxsGfR6Ii87kSjMKj
TnWKDxDXV0lp/jsT6kTj9ETzhBGw9BnCsn1xRDe9yhiHNuazlog2cqYbxwWFn+o9
UteKiXUZZqByIuzfL5L2gKyiB/tHrGgI+ryO0/2PKgPnXwpPI3Rw2lz03eadTI96
X/Bj12R1gYaTCj04cKB6p5bkWW/JAX2tdssqhlmkJiRbrq3so2TK+TO1hrzCDBLc
b6xcq6iVaSEFpdYgyFbAQh3/oyIObg==
=iBne
-----END PGP SIGNATURE-----

--cDUMvdAukypePpMy--
