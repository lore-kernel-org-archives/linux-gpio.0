Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A413423760;
	Thu,  9 Jul 2026 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600662; cv=none; b=DzG3fTO/t2LWKJv7OH3MIvXsiR9OKOGBwqFNW+RVx0qeX4zwNEyif/9vu5kf6kkTc9HBeQ1tKF7Sg6TT/rCMCeg39V1RAMW7wb+WQB3xdsxkeumKHbbrhPQErBb4ZaQv1I/qfbw7/HuxYaJZi2Y/8ipWVktED+8Axyl8F4uHv88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600662; c=relaxed/simple;
	bh=0J7hIgkwB5sE4OU6Sqh60k9YNz3oEtRruhHnA5cNaM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmdvK9GCkKdkl5bbD8V0c2kY36eQP9h40vFiaGlvG6OdkYXsyyer2vDZM/NurEQFFTUTPx8lqbxVP+bpXWh0syrVrAd7Yu0uITR0waVr3AP0+NkWGwgNL18C0thx5I3G5QBlRBWDik89ic9qzTryxC3vgQuG7/JPGDbBYrDLLaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBvof/BB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBvof/BB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DA71F000E9;
	Thu,  9 Jul 2026 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600661;
	bh=d+I6Ij0RIVg4FWAhVXqvFwgT8exdZa7Y7XGYR47xqP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oBvof/BBK2qlFdfZqtGxer2TfVy4zGc+dfBe34gfduhEZ/RPn3FWVeSDc2IDqE66v
	 bJ4Jmonx2fkfW6XfrHVkh2BwLrPoEJJFJhaGaM2WV4jEmmr8pUxs8bhOBTQVQLRSQO
	 +0kxyfWzzeo0yLnIxQpvmVrC2MMr2ab5QbiLDl5gAEfnmHx3c73NmcNbeA1IYPHgqd
	 N3nPTx2RoncCXefMvZ4WUN5kV0yh0PCSUWgyh0fZE8kHLMf3CtiqBih9GREO4owe2E
	 rlcDRoo2FHLQbCfQAQjcqlEEPMej9oaxyR5+VXrEn1nFWr96f6woouuhXXhx8gb2Th
	 5nsJTf1BEUufw==
Date: Thu, 9 Jul 2026 13:37:35 +0100
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
Subject: Re: [PATCH v1 2/4] ASoC: qcom: q6prm: add support for LPASS LPR
 resource voting
Message-ID: <806426ae-d110-4e15-bd33-1ee689e9d1c9@sirena.org.uk>
References: <20260708114924.1069239-1-prasad.kumpatla@oss.qualcomm.com>
 <20260708114924.1069239-3-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfE3thXsff0JO2f2Ly_+CqzDfqs8V9CdcrT84h81OFV3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UVr7qDEcqlz5LFxi"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfE3thXsff0JO2f2Ly_+CqzDfqs8V9CdcrT84h81OFV3A@mail.gmail.com>
X-Cookie: MS-DOS must die!


--UVr7qDEcqlz5LFxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 01:23:24AM -0700, Bartosz Golaszewski wrote:
> On Wed, 8 Jul 2026 13:49:22 +0200, Prasad Kumpatla
> <prasad.kumpatla@oss.qualcomm.com> said:
> > Add support for issuing LPASS low-power resource (LPR) votes through
> > the PRM interface.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--UVr7qDEcqlz5LFxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPlg4ACgkQJNaLcl1U
h9Cjlgf+Nz5uKRE/NLkLLPGryvc60gmomFY+Luj+HjVvajw33sMYqHdrZcWiMjas
i8SvLnQJDIQOKSe339Vf92a9AplghkHDBkGqx2ZruNqzPUSvHc1k6Hc/PljbmwC2
Pv/6U1txwrr3WSRUY8ph+U8qGYNttYkDIySJ1oqxQIINoL139hkWKe/1/u9Qz98f
Q/LxyY159NRPMWrj5VHFqlt4YuVB4/IBxJSMhl9leYYRxXXESeFYvOV6Pwa/85Ur
FLcrYfmS33lDR4u5uM5rRyTHL9DIKOjrPu5iHKPSe2YPOpxYNKpKnVTP00Gg3N+3
4PZ221lSnuuVM2bGVkAnWN9IMT8UGw==
=XU7P
-----END PGP SIGNATURE-----

--UVr7qDEcqlz5LFxi--
