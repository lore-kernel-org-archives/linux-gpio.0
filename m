Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1703A6B6A;
	Wed, 30 Sep 2026 22:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807649; cv=none; b=VlMUYa7VY/wcQeFTBPL9kQbzDkIGxmLAGRbOlLC0sR1ninfAYT+K3mdwNKDz2RsUrVTKmqYaHp5HMkXfqnDQIeXT94APzOfQj+pksBNjWJ18lVN1j5cWiFx5EJv6v5g2r5vfgyPuac7r8aUb6qkmEsgTBrA2HGcQvTPFz4h8npY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807649; c=relaxed/simple;
	bh=oJr76kD3h0PbBc6aH4cXmFFu2b6XnB90saVnn8Xl5wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afj9UblgNHBbKxL4lqK7bEzDqvvtqZz26rvpfRWK69I97X4TEM4NrqbA2q7CJaDSF+4+FPUU/rVguU2FQrbOIKvXk5bg4uMA+6pxn/C8btdrGsSy9AHt0Hyf5iXXqH0Vi/vuF0KGvd+CRC7VDJH9qfXvUPOyOSkKoO9TFY03BlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaqhdASa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaqhdASa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C661F000FF;
	Wed, 30 Sep 2026 22:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790807647;
	bh=Y9zMIJNxKpa5Bhx46XZTOnTAHlsLD1gKMetTQhVVcgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AaqhdASa8v9wWTPxKWm2KF3pmZykgLgqZfaVVC+OKDJthjCaVn0MR9j+myN4oxS87
	 3ml3pP9tZs41KnQSCrcScQgRK0U46yRAa2dSCtVLqeJlXQLfVoReLzYRrT1JDtjhAD
	 jRCyOn9Bmuo8c0qloxjFBB3uNGHYIOoVfszPhdmLO5qDD1J2FSFC1+jNOA/5a50aF3
	 8oBkd41Nh6wuVNPxDRXeuFsMANxdca1bCvdyIpvZTSYhxXRiYMM3xLvOH6qDYy4zGd
	 4mzKvVZEHqsZN0SrfcMLGuM/rj18CbQvBCbKHnBqdo8e30rAo7fJzR3YEx1czWF2W+
	 o+pnzAnGkFrww==
Date: Wed, 30 Sep 2026 23:34:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
Message-ID: <20260930-frantic-enviable-55c1a78fe7d4@spud>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PlRoT138GtctrPoH"
Content-Disposition: inline
In-Reply-To: <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com>

--PlRoT138GtctrPoH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 12:20:01AM +0200, Linus Walleij wrote:
> Hi Changuang,
>=20
> On Thu, Sep 10, 2026 at 12:04=E2=80=AFPM Changhuang Liang
> <changhuang.liang@starfivetech.com> wrote:
>=20
> > Changhuang Liang (22):
> >   dt-bindings: pincfg-node: Add property 'input-debounce-ns'
> >   pinctrl: pinconf-generic: Add property 'input-debounce-ns'
> >   dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per0 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per1 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per2 controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
> >   dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
> >   pinctrl: starfive: Add StarFive JHB100 per3 controller driver
>=20
> All of those applied to the pinctrl tree!
>=20
> I had to manually adjust the MAINTAINERS patch because it is based
> on some reset controller patch I don't have in v7.3-rc1.

I believe that patch doesn't exist anywhere other than on the mailing
list :p

> >   riscv: dts: starfive: Add JHB100 pinctrl pad number header
> >   riscv: dts: starfive: jhb100: Add pinctrl nodes
>=20
> Please funnel these through the SoC tree.

Ye, I got my eye on them, don't worry.

btw, are you going to be at LPC or OSS Linus? I'll have to make sure to
say hi if so.

--PlRoT138GtctrPoH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar2OWgAKCRB4tDGHoIJi
0grzAP9Fs6ouvcThAMVjQbj6XU2gdVLZc/LBnWTeH4InJf79kQEAohOH8MQi/Wti
rReWTShRPoUOU1zat+wE0KfWpAY7owM=
=TNVs
-----END PGP SIGNATURE-----

--PlRoT138GtctrPoH--
