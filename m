Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852966;
	b=lE/8/KXsHRmwVhskCMddowrfPyiVi5AScTM0VNTFWG9LP74ExIn002epZ6nWCvWeG1P2
	 k/tS1p+D8Io7WfTmDqRT587CDkWwBTn5aumB4fYSBrwSopzu+33NMkeqOzP110ZI6Q79H
	 7qk6qPMe35H1iAoiYuE7UJDXXJ1NmrVmNBfqIxgoeExnjPQULlPgF/v5giI9CHOmW3JXW
	 5ViAfYE5Mvl7FvAr0YlaHz5r4SSCDRU9V+ZMbh4q+SO3mdV2u8bGGvwluOv8KUIBsn3+I
	 7AMmCggNbEzBcfwgFLzUNgpTcg22+K1Ii/Uc8fuxYf21JbYqBa1HcFCwf7iJbRLy3Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852966;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Pv6Z2msONZOMn5X5XcAinXRtg1l0bwQ6c+ZoL0wLzd8=;
	b=YZBWQr34smuALVLV5DiKTvyFDeHHwE7yNxVqpAkQirmXomh+fdzX9621sACqwZscvuDU
	 IM0w4ovUQOOz36ZFUaWHaFIg5mZ7z+GD2GD+xMTWlWqduERqf8sAISFYHZNXsvvWJ8hnl
	 WrkzPbdr81cf+LdIVLBgXTNsJOc0kBlrBrR4EccMf28bEAAoTOR8nsEvNZVVCEUagZ3C4
	 IpqSk0GcccVnNq1UuG3AFr1bMPmLPZ5gxegNBFB2Ahe9kDIuciluP1RvE9YBcTnOWjwzL
	 X4zG2OGrLeWqbTmfh/Q8O+ls+aTrus9ez2KaSrMkdwEeuMPBv+pssOzvFFa3FEmlmqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5ovi0ah;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B198606A335;
	Mon, 16 Nov 2026 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V5ovi0ah
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CA01F000C4;
	Mon, 16 Nov 2026 18:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852965;
	bh=Pv6Z2msONZOMn5X5XcAinXRtg1l0bwQ6c+ZoL0wLzd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V5ovi0ahBoGhG3oLNCEMv0ZweRhbmg263fiz5Z3OEaOEe1EmkWwElr4NjaV0pBusZ
	 U+67Z1pdlYuquNsjEp0NPddWduHHqKo+LKkPrpsT2q7gHKgpvpIvuEkDDf1/Qay2RB
	 AI8/0Kj6NWQ08mCT8nfZX/qhbwcvRwIaVQWavWv4KxVlOo28ErPhEbHkzh/Z9b6jJi
	 KD7qK09dM/wMxPYpOkFlNsSfsr6eq07XSEHf7AhNj3J6NX4eMhDoGASxEqAt2Q/PCH
	 ECfBizh/XSlQuSbazX7YpvTKulAspE/JWhpc8rQiYbtQ1XCzQLvrhl6hTvTdLdKLjg
	 tSR2LkGrA3UsQ==
Date: Mon, 16 Nov 2026 18:15:59 +0000
From: Conor Dooley <conor@kernel.org>
To: John Crispin <john@phrozen.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, lei.dong@airoha.com,
	Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: airoha: add AN7589
Message-ID: <20261116-resolved-riot-c6a310bb2d8c@spud>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
 <20261113-fame-smock-6ea3b8fadcd0@spud>
 <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>
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
	protocol="application/pgp-signature"; boundary="1NzTVWXoeJIha+mg"
Content-Disposition: inline
In-Reply-To: <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>

--1NzTVWXoeJIha+mg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 06:47:27PM +0100, John Crispin wrote:
> On Fri, Nov 13, 2026 at 05:40:42PM +0000, Conor Dooley wrote:
> > As Lee requested, please split this out. Two patches, maybe even three.
>=20
> Agreed. v3 splits it into three patches.
>=20
> > Do we even need a child node here? If all this node does is
> > gpio/pinctrl, why can the driver not bind directly to this node?
> >
> > What else does it do that warrants being a syscon?
>=20
> The block also holds the PWM controller. Its registers interleave with
> the GPIO ones. The PWM series adds it as a second child, as on the
> EN7581. That series has a depency on this one so I have not posted it yet.
>=20
> > Otherwise, there should only be one. uart1 and uart2 should have
> > different nodes.
>=20
> Agreed. v3 sets maxItems to 1. Only pcm_spi and pcie keep more, as
> their groups carry different signals of one device.
>=20
> > So here, maxItems should be 1 for similar reasons.
>=20
> Agreed, v3 does this for i2c too.
>=20
> > I'm also curious about why this goes up to 74. None of the functions
> > have 74 pins, surely?
>=20
> A conf node can set the same config on any set of pins. 74 is all the
> pins. The EN7581 binding does the same with 58.

A difference in philosophy I guess - I would be grouping the pins in the
config node by user. So that there would be something like

spi1-stuff {
	spi1-function {
		function =3D spi
		group =3D spi1
	}

	spi1-config1 {
		pins =3D 1, 2
		config1
		config2
	}

	spi2-config2 {
		pins =3D 3
		config1
	}
}

spi {
	pinctrl-0 =3D spi1-function, spi-config1, spi-config2
}

or

spi {
	pinctrl-0 =3D spi1-stuff
}

IMO, having config nodes covering more than one "feature" doesn't really
make sense, as you'd end up with something like:

spi1-function {
	function =3D spi
	group =3D spi1
}

all-config1-config2 {
	pins =3D 1, 2, 4, 5
	config1
	config2
}

all-config1 {
	pins =3D 3
	config1
}

which kinda falls apart I think when a node can request a setting for
pins that are not part of it (in this case, that's pins 4 and 5)

spi {
	pinctrl-0 =3D spi1-function, all-config1, all-config1-config2
}

So my opinion is that the max number of items should be the size of the
largest peripheral.

What's the largest actual user on the 7581?
	=09
>=20
> v3 will follow shortly.
>=20
>         John
>=20
>=20

--1NzTVWXoeJIha+mg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtIXwAKCRB4tDGHoIJi
0oxXAP9igIK0RsOLK/pxL71ixgfrLAYNjRe+ecNILh7URWV9CwEAvJFQWB0vwtGw
/lVvbbCWDcLaRjkTti8imdts7RQIMA8=
=DA3U
-----END PGP SIGNATURE-----

--1NzTVWXoeJIha+mg--
