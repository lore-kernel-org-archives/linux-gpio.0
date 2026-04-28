Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80972DB7B4;
	Tue, 28 Apr 2026 03:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777347609; cv=none; b=XvbvClEauLFGfm+96vG5pmJKf1OnUQOUBCqAk2sHpRur6FTE+ArqZiTBWvrsL4lQC6UDdSF8OtPXTmbhsWX+MZCtKC46ywfIzGG0+LvlPRM/FA2GWqE+UySQIqWg7Nk45sOsFSe8NIRI8YIIZ0RSl6RYtqiNQ4unbWotekLpuNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777347609; c=relaxed/simple;
	bh=tciipBfN6vxEQA++yDaPsZs/cffL7BXyOIjkrkOatdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELnBJkDPVulb4c3S2mxoUhPvg/1pCFR41ptZkiTU8R3QyWOR8S5B9/AV7+ZqgI/rU7kGaUsL+nnTXUUZ6MKuTCoaKmkj51O6x6wlbixjX9nNuEXWkJSR+IkJ31zZNUqWzmkOinpdFWbqTsAt7cNVEBc2na+bCGznOdPUxbeh8a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT8ZZz9u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PT8ZZz9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB7AC2BCC4;
	Tue, 28 Apr 2026 03:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777347608;
	bh=tciipBfN6vxEQA++yDaPsZs/cffL7BXyOIjkrkOatdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PT8ZZz9u58TmBScOUwl+aDVDYcfHPnDtU4fbPH0CvsxSic/gGROQ4Dua8gHDnub8j
	 ZyQyn0IrCDw+DO8ofQ2uAEuCVs1Ga7FbgNLGouv3OBgf60vI3f2vC4Siv9e0L6dY5q
	 FPXuyssUE1M6ZT9LxwLbAFg+jx96p16JsFqilLdr9R6qroqoGwuimKOZvSHCDdWGvu
	 6hivtfaIuzoSZI8SfH9iXt8jskkM4MxGKFbEguKGwNRp5GgZ1fi7x3ycraRUpCr3sS
	 CNyOBIIFdacjyE/m9MJQgd+PDe0TdpFqU4Jfh4SE32WTd5Y/UPfkBRcLF+Sy9H4x3P
	 hp7He85FQqRkw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A55E51AC5840; Tue, 28 Apr 2026 04:40:05 +0100 (BST)
Date: Tue, 28 Apr 2026 12:40:05 +0900
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: wsa881x: Move custom workaround to gpiolib-of
Message-ID: <afAsFcydwlCEgWZf@sirena.co.uk>
References: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u/1OWsNPlQcuGK2l"
Content-Disposition: inline
In-Reply-To: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org>
X-Cookie: Victory uber allies!


--u/1OWsNPlQcuGK2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 10:43:21AM +0200, Linus Walleij wrote:
> The WSA881x codec driver has a local workaround for old device
> trees that have the "powerdown" GPIO flagged as active high,
> despite it is active low.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-wsa881x-gpiolib-of

for you to fetch changes up to bfa336cee3324f991e93e9e570e8b827273df97e:

  ASoC: wsa881x: Move custom workaround to gpiolib-of (2026-04-28 07:39:15 +0900)

----------------------------------------------------------------
ASoC: wsa881x: Move custom workaround to gpiolib-of

Move a workaround for misdescribed GPIOs from the wsa881x to use a
generic implementation in gpiolib-of.

----------------------------------------------------------------
Linus Walleij (1):
      ASoC: wsa881x: Move custom workaround to gpiolib-of

 drivers/gpio/gpiolib-of.c  |  8 ++++++++
 sound/soc/codecs/wsa881x.c | 35 ++++-------------------------------
 2 files changed, 12 insertions(+), 31 deletions(-)

--u/1OWsNPlQcuGK2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwLBQACgkQJNaLcl1U
h9A8Fwf/RBYc3lgJ6uaIaetgHwkfNe97gFTvGfLt7aFB0Er09dp9xDlflChhSiVL
q2+BA6a4Ea9NT4rpH6f6SrDn/IrmYX+doLtqUL3+jrivzV1J4HW00jLNrWJUn3CF
2BFc1/hCOc/cdmVBc3iHresimI0LckOM+RvaBKBORZ32YZribLX2vLAq1nVj0GT6
WK8QsNUBcndVRGOcE9xCas3b61qQJqkyEeBWRCBKtNDxnuOqEXmVR9JI76ZN7bWE
O6JASY/cVzpK8mpU3p1umSao7jxX0EZi6xeInEu9C+9GzY4+poYk+YZoaZsXalj8
53kpGKlqydYWv0Z0Dn9Mov3MWrKLKg==
=wO9n
-----END PGP SIGNATURE-----

--u/1OWsNPlQcuGK2l--
