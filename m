Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E803B637A;
	Fri, 31 Jul 2026 23:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539218; cv=none; b=qiYSgdeXBU6x0If/P7BEcyisYPODBqB10luTiSxbGWd2wt7YzTbcWr9AwghTzJBujngqZFLADskelb/V894krxOLWKdCKc7tgp7vX8hXUCtu7R5z5cj/FebQ9gUseXTHt+1rQ7JsEjFE1LBejjpGnkKsLR7MELm73+W9tA32xqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539218; c=relaxed/simple;
	bh=eT9wEG+wlg01KSfVbVwYO2+wQaciKcdobN5JzoNsKe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7MQvUO2wNZQb4LjP0jy7SSir1L9TnCWahbPnzM4Lkhbnq6+08+yuPMPJCx48+bdmpby0a919cbIopkhl4vKoGISh4WCQAmPDnfuMUtslhTLisMnxhwCOzb+/Nwl/UHj9ETwKGcJVI75WOuhFFg6N+rrBeOKbB1q8eAEv1/S1uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZNjgZOE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZNjgZOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14F01F00AC4;
	Fri, 31 Jul 2026 23:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539217;
	bh=B9XeoQvFkPIpFpAT3jzschAT0IMexWzU9+5RBV9qxiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YZNjgZOEZ3hb5Eintm7xc/lNuFSIS5cRlhwZrxj8nRoCQEdjOL93+5vBFmcd8F52u
	 OyKMFZEwL+jbqkaPGhXAci/ISFA+iLzr23G/nV37ewDVRs6kcQpTHj2f61zciuylad
	 ZxgImbcJvfBLXGkONiy1jkabArvhBHfIuRKielnYuMwAP6tTiIshJJw6CWfHFkzwlu
	 gQyhMo0I+7ZdxfyFjQ7/jrpsirRbNA3nwt5T60Z1lxSoSjvidgjwKWwqLcMaJFzZ/S
	 Uhisy7q96Mpv+BkigEgwzNoyNWUneBj+JUXxAVRx4SG8y1Fv/HGWzTTmrz4MVg7IrG
	 /P8tnImmJ5how==
Date: Sat, 1 Aug 2026 00:06:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v6 0/5] Subject: [PATCH v6 0/7] ASoC: qcom and pinctrl:
 add LPASS LPR voting and Hawi LPASS LPI support
Message-ID: <05da6b3f-6643-476e-961f-4fa7b35f6eac@sirena.org.uk>
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfU=u7tH2r19H9Ex9uEDAb1V3Fanzi2EuqzB+iohPQkog@mail.gmail.com>
 <bb6a9164-6dd2-4d11-a9cd-a2ae7ab43949@sirena.org.uk>
 <CAMRc=MeQRn6dSZ8KM1VGg_7sqqS7p3XjNXm-ohhU6Jm4hVJvVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rfg6HKZDtZPrMepR"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeQRn6dSZ8KM1VGg_7sqqS7p3XjNXm-ohhU6Jm4hVJvVg@mail.gmail.com>
X-Cookie: No shirt, no shoes, no service.


--Rfg6HKZDtZPrMepR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2026 at 04:38:03AM -0700, Bartosz Golaszewski wrote:
> On Thu, 30 Jul 2026 02:22:08 +0200, Mark Brown <broonie@kernel.org> said:

> > I presume the thought is to put it on a shared branch, but that gets
> > problematic if I create that branch because the ASoC driver has
> > dependencies on whatever is in the huge pile of stuff that's already
> > going through ASoC so it'd pull in my entire history.  I suppose I could
> > do the tag, merge it into my branch then apply the ASoC driver?

> Sure.

> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Actually it looks like the header patch is part of whatever mess of
dependencies there is here so there's not much chance of a useful shared
branch.  I'm just going to give up and apply the ASoC bits for now, I'd
suggest just putting a raw number in the pinctrl driver for now then
fixing it up after the merge window or something.

--Rfg6HKZDtZPrMepR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptKooACgkQJNaLcl1U
h9C/1Qf8DMLIIed/pLBpF+RBOnM1biKw+YaXtKJUl704kUYLG0uP+xMJ2g7TkF9x
o22hQFx8TKs43zcUGUMhu38qL/kW9YI/L88wVb9y9eY5Ifvnf3m3TKqK7yjwfa+w
Fh4fuWl4XZfCm1A7VGLpDQrt6yRrCNJGgPfg51vnke0k2ymKtQkcQjwN3wupoDv/
BToV0Z9jMMSv9TynnQjGKGoU2X9I3LMJBNCMNFU/smUyN2Uasw96EEbRwqco0VWX
NY4XiumOFV6rL1PPMs+Jn8p9E0lNhNtr9dIC5DWdKEEf0C9QtK+DrhAeUPHBy/yC
ereCM80g2woDJ91THDwJFj73SIGqSw==
=c1Wp
-----END PGP SIGNATURE-----

--Rfg6HKZDtZPrMepR--
