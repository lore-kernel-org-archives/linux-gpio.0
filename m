Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B93806A6;
	Thu, 21 May 2026 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779359007; cv=none; b=fdY+pjFOYRv8kRJkqqEiyBRlorHRiP2+NN1BTLxJ53/CbR36BCrnno+FDZ7McPCieNfh2ux8cVT70HQyD5MiOal2HYodf0NcdfQUvgDLXA2fC2muAPtRhGQzGnGGPpoM3nkOwTjnSFLRL+XFP43g4u/KvRkLAQN4+JsdhxTsB7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779359007; c=relaxed/simple;
	bh=1XLqmK+7BKBioELVqL+LxlYtx2Up1tgCbtIMoH8w3eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB2bqEwW57rTJNZ6tJxQGVlcDvdwoeyDlxynfbKuOb4o6AZRK9TlLpJRllgSXiawNpvgl4tGqYDdiT5xhzY7m2NK8FWufIl+tListfzVmXHYYVS3Lr26OHgpwLEl576okK4ioIb3bF84uSQNrOr+GMFnd2ky+J1z6wn0MwqwgOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwFAbBK2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwFAbBK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB85C1F000E9;
	Thu, 21 May 2026 10:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779359006;
	bh=1XLqmK+7BKBioELVqL+LxlYtx2Up1tgCbtIMoH8w3eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WwFAbBK2L35QJ8/re4MZfzHQF9H2m72u/cs6v8IxUrZTF8vAYwp6o7UevOuI4IVZh
	 rwJbqcQPFLl5EWdwmICIi++lFEbSMeUYbzJ41xvzN3Hn2Ilfnd+1wnW/44Yi3aipvs
	 o1mRIm+dw6AtyjvOqEvh4e9scoQ0g3f5okiOwzGrXTZFH6bVYtaf7X6L7nfvEcO302
	 rArmtkH3UD9or+ifvfGS/tMhU1dPiAda0zaJjKme7FtKgG2Fohp53zXRh3hHrOwbIx
	 NDo23AUktY5L6YmWPvcT/Z6u9H7gHCsW/3QH47kQdPZ7eIY7PdOx3iQARRqfvg7RrN
	 BNWG0mjivn42Q==
Date: Thu, 21 May 2026 11:23:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl
 support
Message-ID: <20260521-trusting-busybody-15315a5955b7@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-brink-dealer-d0610c0dbc7b@wendy>
 <177935715446.943957.13292482270209644157.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qI5PxH+3C51E5Bgx"
Content-Disposition: inline
In-Reply-To: <177935715446.943957.13292482270209644157.b4-reply@b4>


--qI5PxH+3C51E5Bgx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 05:52:34PM +0800, Jia Wang wrote:
> > Additionally, these pinctrl patches should be sent standalone to the
> > pinctrl maintainers, they're likely to go through lots of revisions and
> > a different maintainer applies them.
> >=20
>=20
> Just to confirm =E2=80=94 for v2, should I completely remove the pinctrl
> binding/driver from this series and send them as a standalone pinctrl
> series, while keeping only the pinctrl references in the DTS?

IMO yes. And cite a link to the pinctrl patches in your cover letter.

Probably you're better off submitting v2 of pinctrl as a higher priority
anyway, since a) the biggest changes are needed there and b) the dts
changes depend on a clock driver/binding being created.

--qI5PxH+3C51E5Bgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag7dGAAKCRB4tDGHoIJi
0pEhAP9G/MtfS0MgoId8t3zIL/SxwWheoiCd4xseOlXWShSEhgEArKIHxRB+JF6M
YzhEFU7vbS7mw+u51coQ+plNB5d+YQY=
=esTN
-----END PGP SIGNATURE-----

--qI5PxH+3C51E5Bgx--
