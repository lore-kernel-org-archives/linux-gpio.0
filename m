Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791492;
	b=vRgbv4Q6MwwtWqLNE98Mh3T0t88R8bJfWJiEsRZ70cq+NXFLU7Ty14FNYMaSwXHp+ZvG
	 qtDucu5lCeMWPrC4JXsMX7GJ1gwwWmkKW3SKmBVs9wy/EbXOUFfxEN182giHKd4TMT6X4
	 JkjX3Nd+qo8+P0HTjl/Qp7/xDWODIOOyM9bULQWFQTRe76prOj61IsE1dmADYrGzZA95D
	 vqYeWpRcMkdq7/Q2k8ETrqUPstW9ZjPIoRnQJAwBNiRF8Uy24JWwCm1WBCZDbCuJOh3GC
	 MuaKJy9GMEiun9bMm8fK23npeiudhdwGP9rv5sSre+L39ONj9lMo95iM++NIUFZqa5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791492;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=4IBdrSIssnJ05THmo7WQfZycMs7WrEcD17MjNmRyjv8=;
	b=hIQ7T/O/e1yzdstfdo+IG7H5ZWXFYwSbiUGDl5pd3yF3WgvAhCBuUQex9pahfmqisOVo
	 SLvIQOQa6WF/8co2OJfwH/kma+cElklEDy5BrubeUWXqrx7KTQnZt9fpUfUbikJL7ZdL8
	 g35PN4SLoKuNsPpawmPtOcpXVLGcHUG7sfYWjHPnDTldiOoT4/0Zy6PmWcmfSyaEwAjFZ
	 LK9H5Kv7tZT7AVCMlxiQ/8QZ/mmU2Cqt/KwZSvyLGKKSd1AEIrsFRzKnJw3a/XAJ6FcuR
	 CDwV9kbcBtEs1z6F+2vqtaFgV0deByY+nqQNgSXuOi46jZR+LHkl6FRINcJ17Y765zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itcxuo75;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A718606A328;
	Wed,  4 Nov 2026 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itcxuo75
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85231F00919;
	Wed,  4 Nov 2026 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793791492;
	bh=4IBdrSIssnJ05THmo7WQfZycMs7WrEcD17MjNmRyjv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=itcxuo75GX41lc40SLUkOBXhcdmq7EgSW9q5wU6wo4tKpB5Ea5pfFhcuosv7YMx6I
	 CMfA3X85LpLUt1T9amPV9qHWWIWwuqxC9sBJrWHXgLcrVuMV6Mb9ojcnBQbBHvQt6z
	 9nTCOD0b5Xzk+LEq2alA040hKQgJfh9UeP5Jl0PaCgqvGX5DLpIvwzRYLgckIw7/fP
	 sxK8JxGYccxXH4/paBHiABVHs8A4Ptxmt1laMTImTZ0+PkRAl+/qfjCRc5t4Mn7XiW
	 rDORn+CkVcPNngYNq1AZ6LTQbEnepGj4I4dao1qkV+6aq9dEh7WMAMxGizQLRYdPm1
	 Icc0rcXplWQeQ==
Date: Wed, 4 Nov 2026 11:24:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linusw@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ASoC: pcm3168a: don't request the reset GPIO as
 non-exclusive
Message-ID: <9b3609a7-5897-4141-9ff6-9ec1d0a1228f@sirena.org.uk>
References: <20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com>
 <179375063580.2186205.641519776071903771.b4-review@b4>
 <laiektucfxhzdf7ifiypwy6plkifriuovtarzz3qrwyd2yk7ks@3cskrh7fkwbf>
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
	protocol="application/pgp-signature"; boundary="dcvHIohDVW+bMuHq"
Content-Disposition: inline
In-Reply-To: <laiektucfxhzdf7ifiypwy6plkifriuovtarzz3qrwyd2yk7ks@3cskrh7fkwbf>
X-Cookie: All rights reserved.


--dcvHIohDVW+bMuHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 04, 2026 at 09:06:31AM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 04, 2026 at 12:03:55AM +0000, Mark Brown wrote:

> > sound/soc/intel/avs/boards/pcm3168a.c would beg to differ about this
> > being arm64 only, though that only has one CODEC and shouldn't share the
> > GPIO so it should be fine.

> Right. Do you want me to resend with commit message amended?

May as well, especially with Cezary's other note.

--dcvHIohDVW+bMuHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrrFf4ACgkQJNaLcl1U
h9AG5wf/QxXlZFq7WOBTmfdMx/pPsm1Y2LdJht5JFdnlJlIDq/tTnzZAwrM0LKKU
IVxHyK06bZi+Y05YXu9fBZ8j6qmYHr/xwmTBZ4VU1FNa78m02o7pyRT9P8gyjyLK
xzCHcD/tPBtNYSU0yzVxVCQCNSzGA9zpxJzr9K/ZmaYP5kknNB81j3jtC1eF3jry
n8BUCvSPuk9Bv3hoALp3xIvqi0/FM6nA0mB2rGM3IBnbvW8kLdtEVTbBbmDVXdaQ
9/Q66vT8A/iNqQXegXTlpCUjg4COYAadxVNvudeRvsVp4hOLzTldtHlxUvMzpBkG
WqXZt9fO+/4O3ZjundjwMc5nsnlMew==
=2/Pe
-----END PGP SIGNATURE-----

--dcvHIohDVW+bMuHq--
