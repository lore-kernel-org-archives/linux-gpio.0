Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1558143F4C5;
	Mon, 31 Aug 2026 17:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197058; cv=none; b=GCmNCaiIxZZUgKpl6t7j7oS5tFC8468o6UUOE/tkdnpFygEaEOBkjzJPTtjYIA+8NfJFf9yMplNsIYF/NnqRGFhCu/ylKE1dSoclVHw70x3ut20lTYIgBy8zOUVzb2q6YCU7ltvItfLxkv7q8OCTDWr/R3ZJI3uJeSRWBgaakvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197058; c=relaxed/simple;
	bh=p3yFF3CvKdGJHfB112LrD/LTraGQWLvpvBfCCj6m3RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRgYmXDdYn7lSFS4k9bXpJzMXjrgw7yj3/Ftpgo7GcOWK35mbYeJkOj4o1Igvy5e55KjclwpYqaJsdqTBxQZBcWH6eZlA94phdtMoNhCsB82NchAWPtgpaah4h/5ncGeqtkpzoCX84ZNqg8h8FOURgoCIAPTeYih88zQyE20Mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHromIHg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHromIHg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F901F000E9;
	Mon, 31 Aug 2026 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788197056;
	bh=pl1qQH1VXtVYZcHunRnuXaVLRJsgg0MsnLhdXKMe8k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RHromIHg+g7pymhFNuSEBEOD2VNEM/uIqkVlkalgFZTSnTBCghA3cW3rqoK0Lqz6F
	 xrZjpmZcG/GmtIp9c2Q4tBgW856xmfzOfcwW75+9dvVkkBDEtVEmPQO2THm7/exUDW
	 6fVJFuJPKTmV5MdHjUlFR6rVBEc1N2YFF62i2c4TbMWYxPMLr8uGJ3yVq66jgqd3bq
	 7wYfcL99f/EI5gf3DJfYJWeNtzLwrQhKbiruStJC9G+qQ9Bg5UsrtlBjXjqaFRSeuN
	 q8UZvXw6DLhtgT13t2rSW3sbUYzgGzTNxVKmTq9qaB6wJkwO2HBAVK+IgfJ+L2MY0o
	 4ye1Hztxv7hwQ==
Date: Mon, 31 Aug 2026 18:24:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	linux-gpio@vger.kernel.org, linusw@kernel.org
Subject: Re: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
Message-ID: <20260831-dramatic-phrasing-beb1b360cd58@spud>
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
 <20260830065118.51551-3-changhuang.liang@starfivetech.com>
 <417251d0-c2cc-4e10-940d-b75ab20acdec@kernel.org>
 <ZQ4PR01MB12022D97EFD74D5A80DBBE34F2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <5f99fc90-02e0-40ab-8d1f-c2e7bcce7a5e@kernel.org>
 <ZQ4PR01MB1202FB18CF51DB252C393D0FF2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F0hMRWERHp7hSAiK"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB1202FB18CF51DB252C393D0FF2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

--F0hMRWERHp7hSAiK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Linus, linux-gpio,

On Mon, Aug 31, 2026 at 06:01:43AM +0000, Changhuang Liang wrote:
> Hi, Krzysztof
>=20
> Thanks for the review.
>=20
> > On 31/08/2026 03:35, Changhuang Liang wrote:
> > > Hi, Krzysztof
> > >
> > > Thanks for the review.
> > >
> > >> On 30/08/2026 08:51, Changhuang Liang wrote:
> > >>> Add driver support for JHB100 UART Routing control, allowing runtime
> > >>> configuration of RX muxes between UART controllers and I/O pins.
> > >>>
> > >>> A sysfs interface is provided for easy checking and updating of
> > >>> routing paths.
> > >>>
> > >>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > >>> ---
> > >>>  .../sysfs-driver-starfive-jhb100-uart-routing |  45 +++
> > >>>  MAINTAINERS                                   |   7 +
> > >>>  drivers/soc/starfive/Kconfig                  |   1 +
> > >>>  drivers/soc/starfive/Makefile                 |   1 +
> > >>>  drivers/soc/starfive/uart-routing/Kconfig     |  14 +
> > >>>  drivers/soc/starfive/uart-routing/Makefile    |   2 +
> > >>>  .../uart-routing/jhb100-uart-routing.c        | 262
> > >> ++++++++++++++++++
> > >>>  7 files changed, 332 insertions(+)
> > >>>  create mode 100644
> > >>> Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routing
> > >>>  create mode 100644 drivers/soc/starfive/uart-routing/Kconfig
> > >>>  create mode 100644 drivers/soc/starfive/uart-routing/Makefile
> > >>>  create mode 100644
> > >>> drivers/soc/starfive/uart-routing/jhb100-uart-routing.c
> > >>>
> > >>> diff --git
> > >>> a/Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routin
> > >>> g
> > >>> b/Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-routin
> > >>> g
> > >>> new file mode 100644
> > >>> index 000000000000..2844133bea1b
> > >>> --- /dev/null
> > >>> +++ b/Documentation/ABI/testing/sysfs-driver-starfive-jhb100-uart-ro
> > >>> +++ ut
> > >>> +++ ing
> > >>> @@ -0,0 +1,45 @@
> > >>> +What:
> > >> 	/sys/bus/platform/drivers/starfive-jhb100-uart-routing/\*/uart\*
> > >>> +Date:		August 2026
> > >>> +Contact:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > >>> +Description:	Selects the RX source of the UARTx device.
> > >>> +
> > >>> +		When read, each file shows the list of available options with
> > >> currently
> > >>> +		selected option marked by brackets "[]". The list of available
> > options
> > >>> +		depends on the selected file.
> > >>> +
> > >>> +		e.g.
> > >>> +		cat
> > >> /sys/bus/platform/drivers/starfive-jhb100-uart-routing/\*.uart-routin
> > >> g/uart1
> > >>> +		io0 [io1] io2 io3 io4 io5 io6 io7 io8 io9 io10 io11 io12 io13
> > >>> +io14 uart0
> > >> uart1
> > >>> +		uart2 uart3 uart4 uart5 uart6 uart7 uart8 uart9 uart10 uart11
> > >>> +uart12 uart13 uart14
> > >>> +
> > >>> +		In this case, UART1 gets its input from IO1 (physical serial port
> > 1).
> > >>> +
> > >>> +		To switch the RX source of UART1 to UART2, write the desired
> > >> source to the file:
> > >>> +		echo uart2 >
> > >>> +/sys/bus/platform/drivers/starfive-jhb100-uart-routing/*.uart-routi
> > >>> +ng
> > >>> +/uart1
> > >>> +
> > >>> +		This indicates that UART1 now receives its input from UART2.
> > >>> +
> > >>> +Users:		OpenBMC.  Proposed changes should be mailed to
> > >>> +		openbmc@lists.ozlabs.org
> > >>> +
> > >>> +What:
> > 	/sys/bus/platform/drivers/starfive-jhb100-uart-routing/\*/io\*
> > >>> +Date:		August 2026
> > >>> +Contact:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > >>> +Description:	Selects the RX source of IOx serial port. The current
> > >> selection
> > >>> +		will be marked by brackets "[]". The list of available options
> > >>> +		depends on the selected file.
> > >>> +
> > >>> +		e.g.
> > >>> +		cat
> > >> /sys/bus/platform/drivers/starfive-jhb100-uart-routing/\*.uart-routin
> > >> g/io9
> > >>> +		uart0 uart1 uart2 uart3 uart4 uart5 uart6 uart7 uart8 [uart9]
> > >>> +uart10
> > >> uart11 uart12
> > >>> +		uart13 uart14 io0 io1 io2 io3 io4 io5 io6 io7 io8 io9 io10 io11
> > >>> +io12 io13 io14
> > >>> +
> > >>> +		In this case, IO9 (physical serial port 9) gets its input from
> > UART9.
> > >>> +
> > >>> +		To switch the RX source of IO9 to UART10, write the desired
> > >>> +source
> > >> to the file:
> > >>> +		echo uart10 >
> > >>> +/sys/bus/platform/drivers/starfive-jhb100-uart-routing/*.uart-routi
> > >>> +ng
> > >>> +/io9
> > >>> +
> > >>> +		This indicates that IO9 now receives its input from UART10.
> > >>> +
> > >>> +Users:		OpenBMC.  Proposed changes should be mailed to
> > >>> +		openbmc@lists.ozlabs.org
> > >>
> > >> drivers/soc/ should not define user-space interfaces. This is not the
> > >> place for them. You need to route user-spaces interfaces only through
> > >> one of other approved subsystems, after their review.
> > >>
> > >> This looks like pin multiplexing interface.
> > >
> > > I may have misunderstood something=EF=BC=8Cplease correct me if I'm w=
rong:
> > >
> > > I have found two subsystems related to multiplexing so far:
> > >
> > > /drivers/pinctrl and /drivers/mux. However, neither of them seems to
> > > provide a user-space interface for switching multiplexing values.
> > >
> > > Do you have any suggestions on this?
> >=20
> > pinctrl has some interface, not sure if writable, though. If interface =
is missing,
> > it should be added via such subsystem.
>=20
> Okay, this needs a bit more time for deeper research.
>=20
> >=20
> > >
> > > Also, could you confirm whether the implementation in
> > > drivers/soc/aspeed/aspeed-uart-routing.c
> > > is there for historical reasons?
> >=20
> > I supposed sneaked in without SoC maintainers noticing.


My first reaction when this flew by over the weekend was whether it
should be in the pinctrl subsystem. I know there's no sysfs interface
there, but I don't even see an explanation for why changing this at
runtime is a requirement.

I'd have thought that each BMC would only have one host, and so since
you've got like 12 uarts there'd be enough for a permanent routing.

Even without a permanent routing, the driver consuming the pinctrl should
be able perform the switching (uart in this case) whenever it was
needed?

Cheers,
Conor.

--F0hMRWERHp7hSAiK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapW4vAAKCRB4tDGHoIJi
0oC6AQCMQkPFFtK7RsXuZKqVNJmBszwNt9lS0oxvVLhh2WxzQwEA0pnmAv6Fms6L
G79TIIxjqnmbbmtKlu2wAh4ef2uWgAI=
=PWN4
-----END PGP SIGNATURE-----

--F0hMRWERHp7hSAiK--
