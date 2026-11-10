Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300651;
	b=Cf6UfDRSYG1X3ijDkx8tZgmxPhP4vWXQx5wg4eksjYYpPCFJsmgePM3WS6HwJGMpXuSw
	 dlHiqcgNsL2GWNC8twwg3oT8PJVbeyWh3ZXZ8j7GL5J9iMXqS0BbNg2r3lal+D4WPLHbB
	 UkamouHA5GYc9AXbygbR+bNeFEvKwZLi+NUxDJWcdvEqyH/l96ysKuhuEndTsBYkZC+Su
	 c7IYp067XXLv+DYv5bjZ83y0aSvzU7Ob8HvCL4uwAotIt0WwfElc0Gi1PBCL9+NoIIbXF
	 PqQT0n7wZpPEq9ejNSf+uWiQ0hjAZt86t23lopmUMVMnrklFC9G3Wkom54WnpGQ3ZHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300651;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=o3VdPSRK9H0HuvqvVAIiSd+1PkVCf5x+okbObysvyMQ=;
	b=aJPjDKHix5qN79nCUbf+SaSf62//vQ4iW/ZRbNkGO+DeHpxGDQtMWcLJ39xjof7rIjA5
	 H99BQfOAOAbCuqELH7hfKjA8lqN+nDrQIF5oc3DXb/hZAiHwRLa5fJLZaIU8q0h28MbXO
	 QOEpr5mWDniNJ9hQ0CGCuHFyaunE0ujf7BhF/Qa8b5qxx8iPcXZr3i9yE0EfPVtyU4AyS
	 rNwp+mKg/VdNhMaYBpVXMHEFa7PatMzeGAToBDhWHCWnWWO5fs4LEHEfMF68I9J/4eWVJ
	 JMSo5922s6rJjYoxSonC/Z0+bIp8nRBMhcCD5m77xSfegfXFIQxJITEx2KQNAsUzvYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+weE6s5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 52D29606A321;
	Tue, 10 Nov 2026 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+weE6s5
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 46E381F0089F;
	Tue, 10 Nov 2026 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794300650;
	bh=o3VdPSRK9H0HuvqvVAIiSd+1PkVCf5x+okbObysvyMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+weE6s5MD/8387GBJImcLeu74R630SpRdsqVYTBfryEGucgGQ7K1EiUWw7LeqzxM
	 +E+Pna221n3af+qRE+0hRsugcutMutEM2c85ArD3MBlnFAgoPxWo7VI9L446NuduSs
	 mZahv+mW2Q0QB8G20UldXUGA1bkPDy+GtLHTq9ym1/D6mFH2/PAh2ptOxaC+N0HbGq
	 cnnF8gcCTnyihRD5CGAZe1hEjpFH4tEZH76pN8tGWwE8fb6AdVSwxyk0fFBa8g0Ype
	 yaWyIxI+aH8wlz3d8pbp5yfwGuStiCAxEfjcDyehJEH1bBqg9xiOIVWi+ZR7o5WJYd
	 jgvmIsCNiOKHQ==
Date: Tue, 10 Nov 2026 09:50:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
Message-ID: <avLZsjdbASMaYN1L@monoceros>
References: <20261104215959.24035-1-rosenp@gmail.com>
 <20261104215959.24035-6-rosenp@gmail.com>
 <cw32kfja4uifaotvodb7cfxrpzawt4zqcuzf4k3hvjgxwutxqu@gyaayjuyq3j4>
 <2d9d1da9-0d2e-461b-9c9a-eaf3dc512035@kernel.org>
 <CAKxU2N-oA_EQ-nC4y6E+Y1XCaai_QNmicobvJZ03mRRDikZ5RA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="hu5qy6ejaulp5gcl"
Content-Disposition: inline
In-Reply-To: <CAKxU2N-oA_EQ-nC4y6E+Y1XCaai_QNmicobvJZ03mRRDikZ5RA@mail.gmail.com>


--hu5qy6ejaulp5gcl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] gpio: ppc44x: tidy up includes and probe
MIME-Version: 1.0

On Mon, Nov 09, 2026 at 12:46:13PM -0800, Rosen Penev wrote:
> On Mon, Nov 9, 2026 at 3:30=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ke=
rnel.org> wrote:
> >
> > Hello Bart,
> >
> > On 2026-11-09 10:01, Bartosz Golaszewski wrote:
> > >>  static const struct of_device_id ppc44x_gpio_match[] =3D {
> > >> -    {
> > >> -            .compatible =3D "ibm,ppc4xx-gpio",
> > >> -    },
> > >> +    { .compatible =3D "ibm,ppc4xx-gpio" },
> > >>      {},
> > >
> > > Uwe: is this in line with your recent cleanups?
> > The change is fine, I'd appreciate to also do
> >
> > -       {},
> > +       { }
> >
> > at the same time.
> {} was done by clang-format IIRC.

I saw that already, too. I'd argue that clang-format is wrong here, with
non-empty initializers we want a space after the opening brance and
before the closing one.

Last time I looked (and IIRC), the kernel intended to still work with an
old version of clang-format and that doesn't distinguish between a space
between { } and ( ). For the latter we don't want a space, so there is
no way to configure clang-format to do the right thing. That's better
with newer clang-format versions, but I didn't find a way to specify { }
and () without breaking older clang-format.

Best regards
Uwe

--hu5qy6ejaulp5gcl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmry2uUACgkQj4D7WH0S
/k6Z3Af/Ukihvr6an8xoXI2ftoIc2p51BSO0igI0VAtExDpb6IR+1D+Krj+nA4fE
SzlUgDZPNUXkXm/RLhOi2UY4Ax8spKGumwiVTFzHE/yu12N9Jt6ze5gu6vubTsrm
YqNd0Lv7WSNiJNeivLBKdSa1UkoDLGnF0XjPkemgosVdbB767BsTQ5xSdGl+wy2H
GuysSB9aZdHU51P9mTP63HvNZRS47lK/pdVNE8z3Xzv3ajsShn4P7Yplv7csj6m4
ChjCjHTfXOllzT83T/sqn42TiRCioWrbvt9SqlnKXqQCboy9fjwd8BPZNA5lbHZf
ziuUR23Q9F5kG8ECYpRieF6SwRGzFQ==
=uXlP
-----END PGP SIGNATURE-----

--hu5qy6ejaulp5gcl--
