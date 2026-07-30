Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B80322DB7;
	Thu, 30 Jul 2026 00:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785370941; cv=none; b=WqdiUILQ2ppCldcdQG1n+dChxliKFNPVnpjyAWiqIIKU4OJ73iz2fuU/LKODojt9JVVjA66pl5oS8hpErRX2fZALuyCxM9OAUuCggNzZmjmzaVhar0gxkhYsqngWfMne8uxI5Y1zaXqUskrnaJGZdbE2aFPsH5f0NLEes0o3LQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785370941; c=relaxed/simple;
	bh=MHaYM5WU/xBjLZguI5+23qBqiNxJLjcHE3vL8ArU3wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfabt7RJQh2EdnGz0NPWsLYny2qV/5kiQYvD/jy4Yu0d0W1O0WEpvMqmeimMk+9ri3fAO5BUwG+2JpHoUHcnjH9uaPb/RQNFsJi8f9ZU4gYZO9zNy6sqWKXYvVHZD9xvQ1IM6bQY+BCvdTh194eBivYQN2gqGTWJK6+3FCQIvYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTpR1zgN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTpR1zgN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F771F000E9;
	Thu, 30 Jul 2026 00:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785370934;
	bh=VXdI7aMO0+VEvuGKwK9rEwLt5ITWmKrv1He2xJ+uhj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dTpR1zgNR0fqW0ja0xGqtf5c7a59t7Y8byz7SC/T3napFb7xktgkiULLsIXBzPcvK
	 bnicQgET5J7KoR6RyjAzdQobHGe/2zGRUB7lDwGou3X+usJsIEcMn4a0knUmDpxPET
	 JS19bOPD4KHstKZxLakv4V6BrY1cVdHXAgRTJjj8aUab8H4we4WkjeWdY7EGfXVx0l
	 9A04Na0aMk8cSuEnnJwC7PNuU/95uUkN0JlMmVSJMlIgNjChX7Rzr7Gbu4AT7mKSFT
	 Xf/a+DVKS77cN4lKRtorQmF/gAncniPIIoQIif1HEOIqWl/jkd2uS7ivNn3QM2xzdn
	 zM1AzqfJbk9Yg==
Date: Thu, 30 Jul 2026 01:22:08 +0100
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
Message-ID: <bb6a9164-6dd2-4d11-a9cd-a2ae7ab43949@sirena.org.uk>
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfU=u7tH2r19H9Ex9uEDAb1V3Fanzi2EuqzB+iohPQkog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5ZitO3eG7NJF12K"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfU=u7tH2r19H9Ex9uEDAb1V3Fanzi2EuqzB+iohPQkog@mail.gmail.com>
X-Cookie: Captain's Log, star date 21:34.5...


--y5ZitO3eG7NJF12K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2026 at 07:32:55AM -0700, Bartosz Golaszewski wrote:
> On Fri, 24 Jul 2026 16:17:03 +0200, Prasad Kumpatla

> > The intended merge strategy is:

> >   1. Merge the dt-bindings patch adding LPASS_HW_LPR_VOTE to
> >      qcom,q6dsp-lpass-ports.h.

> >   2. After the header update is merged, the remaining ASoC and
> >      pinctrl patches may be merged through their respective
> >      subsystem trees.

> Do you really want to wait an entire additional cycle for a one-liner to first
> get upstream? I mean: I don't mind it but it's a weird strategy.

I presume the thought is to put it on a shared branch, but that gets
problematic if I create that branch because the ASoC driver has
dependencies on whatever is in the huge pile of stuff that's already
going through ASoC so it'd pull in my entire history.  I suppose I could
do the tag, merge it into my branch then apply the ASoC driver?

I've complained previously about how unmanagable all these
interdependent qcom things are, now this adds cross tree issues!

--y5ZitO3eG7NJF12K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqmS8ACgkQJNaLcl1U
h9B7MQgAgm6hK4vAkMntaBcwPRR8rsOum/KanN05OaB96ft/sKZNLYZHimpODf7I
lKl4jwUXl7ZE/eF2d8UN1QrEbIx/kLtUYSz48uL7fEFH9bMPSIYkKYu5mKGQvn9p
2YLWuJnLhEexcQh8sKkVHxCwFNRnttLeXRvaZHrDcg8sHP+h4C3svYFJJq/OojjV
ypZlcV10+0uSsu5g/+ECOqNoj0l3HYlPIPxGvKGCAac60wN8mIoXWbs3J9SuFaAK
KMvniNeKaxFjyCbK8eE9OX09wpndayTwpCA0WFMtfEOC+53zWOwuLIvAwHTqipAU
DBQXIApzYuD49t4nv/h3M8kiAsqDWQ==
=5Jb6
-----END PGP SIGNATURE-----

--y5ZitO3eG7NJF12K--
