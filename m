Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0F346A1E;
	Wed,  4 Feb 2026 17:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224922; cv=none; b=a11KdJVGDB3OeDOmXpy/OG1AI2aS348jo3WNd9QkeXyemFgGEsyyx5R5tZjlAtr7eW9Hs/iV3/r+27Zql3ajRbM1xy5kTa/m5hGSlLf+fFgy0LMWcGmrHayQk20fytnovQzaP46NUMkZawJP31C9Q3WlSXSIO6fxNslZikroz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224922; c=relaxed/simple;
	bh=D3EyukiCSM+h7n8SYlN3muS0qp32YNJ6NPicl4K9wfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8QURSu5Y/MbYrj+A0IDbEYcovTeijhxm53WWGrgKczMCQWmwveBdfVabTYnOrh3L5YVuCuqBa2HlH0GJ5L4Q8Gcj0AtnkdSuu+Z4+2lRivBB+thXqV4K/6Qv7WSDSTF0B/sSCxYXf1ZdSfv4DEwVNE0AmbFSMkEl3TMJbBj1u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvPpYvUh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvPpYvUh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FD3C4CEF7;
	Wed,  4 Feb 2026 17:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770224922;
	bh=D3EyukiCSM+h7n8SYlN3muS0qp32YNJ6NPicl4K9wfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YvPpYvUhbMXqrXVDizdhytqcStlYc/UFe2mnGVdczZvS4vNk6mcG7CTV4WDCkEyiS
	 cOOBGoH+o5v01y+cIqz2JLiTYMsTITxk1j0zUBXqF+y1lvzYW/NA+KkqMx/6jFSwKg
	 UKpTV1m5JW7gynZaTucoYep6sxMVdFmaktOTUJ4FuC7Wsa5QX4dBBHyL+ZSsxzKuka
	 Aq6QAH/xxUaZFlaLSmoWxb3rx+wxmrTVDujkS48ElUEgm4SRZJW8CRYzOhX+529gMJ
	 py40PR5JQH44Bb62fHGbR6YguZF4oesqc14eBl3FGKQ6LprFRNFurU+ZfdiBj7+HA+
	 t97CYK7FTIi1Q==
Date: Wed, 4 Feb 2026 17:08:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux()
 to amlogic-am4 driver
Message-ID: <20260204-claim-chemist-5dbaeabf8b8e@spud>
References: <20260203-craftsman-battered-3491ff68f462@spud>
 <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
 <aYL9zgEyCarrluvP@black.igk.intel.com>
 <20260204-crawlers-nacho-d7c9021cdb6f@spud>
 <aYNWMndBWxxoPABG@smile.fi.intel.com>
 <aYNXFdxZiO2TMwSy@smile.fi.intel.com>
 <20260204-credit-precinct-5424c122a79f@spud>
 <aYNw-k1q_vuP-4DZ@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5/IQz1J+r/WX5zO5"
Content-Disposition: inline
In-Reply-To: <aYNw-k1q_vuP-4DZ@smile.fi.intel.com>


--5/IQz1J+r/WX5zO5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 04, 2026 at 06:16:58PM +0200, Andy Shevchenko wrote:
>=20
> TL;DR: My point that double dots is confusing and non-standard way to ref=
er to
> something which is cut. If not full, ideally it can use triple dots follo=
wed by
> underscore
>=20
>   pinconf-generic: move ..._dt_node_to_map_pinmux() to amlogic-am4 driver

This looks good to me. Linus, want a resend or will you adapt it
yourself?

--5/IQz1J+r/WX5zO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYN9FQAKCRB4tDGHoIJi
0jCDAP9ghQGLq3UEtyqJ3Uy4dfQsMrMGDgMLmeR42TdMuGWY+gD/UQQXM3MG48NG
YCNfSE4PhthTFEv2fQTF6PByzZmD0Ac=
=IB54
-----END PGP SIGNATURE-----

--5/IQz1J+r/WX5zO5--
