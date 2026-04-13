Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2987B3DF010;
	Mon, 13 Apr 2026 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776094749; cv=none; b=HNsu4llro1j8slUrLcADXsJz7S6rcejKxMAVuwrDb7gbPisMfh3u5ewV3Xg3ixRyl+GfkDVQ7VC6b9WXAO2CGTQRlCzgwQKjizv/BJVa+KWXrvLDyQUWLTk+dLWr91wIZeCuRR+XC6bWoWGOELF2JpucvECrd6Qt7EBupsf4D7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776094749; c=relaxed/simple;
	bh=5QadCKKgpXr3kgDA5Kh5wEnfHoR6sXkaWzTiQDRCL8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3Ug9mdS0hyWbCAUPhhmYrMI7I6/EAROQkVKSjjgl2JdlRuQqJy4wLLhtrBKJYd8Pc9FCc4UpBziLrxG5wHrEHfhyp7wfCIScYdh85FqkX19YXsRDTKb5dgktJIhBK4OR6qph8x+zTgiv49bs7SPbKkoFNZX1bSvpCmi80sWlAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSDcF0Mq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSDcF0Mq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BCCC2BCB0;
	Mon, 13 Apr 2026 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776094748;
	bh=5QadCKKgpXr3kgDA5Kh5wEnfHoR6sXkaWzTiQDRCL8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSDcF0MqFhxRfd6z8Mq9kpdj2Of1AdRqwPDq9/WY6gX67s2Fdpq091C3uhjJek37e
	 rDJv5nnj58b4BsDHX/dhWlXb0pPPX2vrFlgmaA+81CqZMbvu3LEsMxSlgjr6eMwRur
	 Tz343eqnCM8jtACyImiVQldcbgKsTEhVpRlume0ysXuOYIQAHX3p1n9TgandQaNPhE
	 rUWsWd8fFM7y9EAen8wMbIAWKGhpAFpzsFzymBBbNimOixYXo7QN03Z6+I7zO2JgOw
	 Q6w3+Gm4jiKZuwXVPVFfxUW3dl+30LSk4xDykzvSjVwGCzI27aNHVk6ODxfHzut7b0
	 xT5BYngh1aqHQ==
Date: Mon, 13 Apr 2026 16:39:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
	Ondrej Jirman <megi@xff.cz>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 20/21] dt-bindings: gpio: describe Waveshare GPIO
 controller
Message-ID: <20260413-unwed-energy-02b0f152d165@spud>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
 <20260413-waveshare-dsi-touch-v3-20-3aeb53022c32@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mU8o5eBcLdlDCcZO"
Content-Disposition: inline
In-Reply-To: <20260413-waveshare-dsi-touch-v3-20-3aeb53022c32@oss.qualcomm.com>


--mU8o5eBcLdlDCcZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 05:05:43PM +0300, Dmitry Baryshkov wrote:
> The Waveshare DSI TOUCH family of panels has separate on-board GPIO
> controller, which controls power supplies to the panel and the touch
> screen and provides reset pins for both the panel and the touchscreen.
> Also it provides a simple PWM controller for panel backlight.
>=20
> Add bindings for these GPIO controllers. As overall integration might be
> not very obvious (and it differs significantly from the bindings used by
> the original drivers), provide complete example with the on-board
> regulators and the DSI panel.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mU8o5eBcLdlDCcZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad0OEgAKCRB4tDGHoIJi
0gC+APiip+54dvGW6xw4Pg/dOwwMiT7o7wl2wFDjy02hzx0xAQDTPdnt6DUjttpa
Sjd8YI561hvPMtRCDjboZ6XIiLoiAA==
=htZd
-----END PGP SIGNATURE-----

--mU8o5eBcLdlDCcZO--
