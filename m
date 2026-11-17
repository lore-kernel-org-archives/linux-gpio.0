Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938633;
	b=r/EiRjtW0qhXq+0E6zSpMK43nFT7aeC/g5yTcrnzW27+nos3MXigXu4bBWmC2S4h3EWg
	 Ua0y6xR3hJtwIDtZniQT5lWFeEUFi4jmLEf2DhcBEcrNML60qGb6Al4/eFRrXGEkshrEd
	 WmyHCebQRovtpCSIJEdsrS+M8G4xYci3D8CMecT/Bo4A9bhEvo3GxvRK0wNFPO8cqE72t
	 7KPNqC1LnFV2vfu44TCu+nXNoKLXqUog1zRrsb4p2nit5X8w/fo7WyOx4u9vwujOjQUIC
	 DzNuinFJ8hxUgskGEJadymmQpYqhwJKtsVqQ6ZFYy6YMb4D2xco28bnNQIDejkkT3Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938633;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IhKPOj7Hor5KmSjiCzxW9s+vgx6buagkucJfrANTbbM=;
	b=Q2XqagWYcV0jXj5VpftJerBb5IaYVGE14zWwoUwDO0wqZmQU/KCWBEQII7IO5k+/xZJw
	 ohnTLvs1TNzKtNr0f7UI4qmCjpAxTb6neJforGKuB1q1oLvPYjWosZq5m1TEY/CU3SLKY
	 uwyROeSD0PoViThlKhF21iR7l7hCV986w9wsXHcRr67s8vFqDdIibxTtmG9Cv9vSsjG3V
	 PJhnTMQhjzx51gOLDmmkt/L+cY5T5A2iZlyBBJbJWozvr2wypnZUwXiY/1w3vKgr7TpPg
	 9+Qo1PHbmSwD9mftftXw+OWqq2h0sVh8eCSviJ6AQUaPkZC9+AzJeEcvJInFIye3Qww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKqwZ9AI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2EE606A31C;
	Tue, 17 Nov 2026 18:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cKqwZ9AI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E231F000C5;
	Tue, 17 Nov 2026 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794938632;
	bh=IhKPOj7Hor5KmSjiCzxW9s+vgx6buagkucJfrANTbbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cKqwZ9AIMIJWxujQ8XjH4udI9D9vAjOKNWATMZYLEBdrXO17pKIA8QO7EMiMftYW2
	 1zEdmsTstOQ2ZvvctwDEIwkHTWR7ed+XDCxWPC1NqAj/A/lQt0wB2KMDZlXtXkn4Ef
	 +c9IhEYakqLVuzuFPVsDfC3Ez/ezg/mCFEy82bTws6jKskf1Vj5fKpJqgLsyxALH0Y
	 0XLLt8Z5q1DNt63iguUD3P1Z5qdcJC2daECEzt34/M5Zk/6ioRF2eCVvPmKmUgrqAe
	 lgqhpDTBBuRh1+jk3DynAX3Nk5yxB7SGlAF0SIoIKG84rlVoohM+GjlJg0tiTiO1aV
	 2vcxfm/KxhsTg==
Date: Tue, 17 Nov 2026 18:03:46 +0000
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
Message-ID: <20261117-illicitly-translate-2d16b1279df9@spud>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
 <20261113-fame-smock-6ea3b8fadcd0@spud>
 <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>
 <20261116-resolved-riot-c6a310bb2d8c@spud>
 <e20f708f-ebfe-4dc0-a64c-1590fdf608f3@phrozen.org>
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
	protocol="application/pgp-signature"; boundary="8k1LZRwMDy0PRoKK"
Content-Disposition: inline
In-Reply-To: <e20f708f-ebfe-4dc0-a64c-1590fdf608f3@phrozen.org>

--8k1LZRwMDy0PRoKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 08:39:21PM +0100, John Crispin wrote:
> Hi Conor,
=20
> On 16.11.26 19:15, Conor Dooley wrote:
> > On Mon, Nov 16, 2026 at 06:47:27PM +0100, John Crispin wrote:
> >> On Fri, Nov 13, 2026 at 05:40:42PM +0000, Conor Dooley wrote:
> >>> As Lee requested, please split this out. Two patches, maybe even thre=
e.
> >>
> >> Agreed. v3 splits it into three patches.
> >>
> >>> Do we even need a child node here? If all this node does is
> >>> gpio/pinctrl, why can the driver not bind directly to this node?
> >>>
> >>> What else does it do that warrants being a syscon?
> >>
> >> The block also holds the PWM controller. Its registers interleave with
> >> the GPIO ones. The PWM series adds it as a second child, as on the
> >> EN7581. That series has a depency on this one so I have not posted it =
yet.

Hmm, or just add #pwm-cells to the syscon node itself? There's no need
for a child node just to put #pwm-cells and a compatible in it. The pwm
driver can be probed via mfd using mfd_add_devices().

> >>
> >>> Otherwise, there should only be one. uart1 and uart2 should have
> >>> different nodes.
> >>
> >> Agreed. v3 sets maxItems to 1. Only pcm_spi and pcie keep more, as
> >> their groups carry different signals of one device.
> >>
> >>> So here, maxItems should be 1 for similar reasons.
> >>
> >> Agreed, v3 does this for i2c too.
> >>
> >>> I'm also curious about why this goes up to 74. None of the functions
> >>> have 74 pins, surely?
> >>
> >> A conf node can set the same config on any set of pins. 74 is all the
> >> pins. The EN7581 binding does the same with 58.
> >=20
> > A difference in philosophy I guess - I would be grouping the pins in the
> > config node by user. So that there would be something like
> >=20
> > spi1-stuff {
> > 	spi1-function {
> > 		function =3D spi
> > 		group =3D spi1
> > 	}
> >=20
> > 	spi1-config1 {
> > 		pins =3D 1, 2
> > 		config1
> > 		config2
> > 	}
> >=20
> > 	spi2-config2 {
> > 		pins =3D 3
> > 		config1
> > 	}
> > }
> >=20
> > spi {
> > 	pinctrl-0 =3D spi1-function, spi-config1, spi-config2
> > }
> >=20
> > or
> >=20
> > spi {
> > 	pinctrl-0 =3D spi1-stuff
> > }
> >=20
> > IMO, having config nodes covering more than one "feature" doesn't really
> > make sense, as you'd end up with something like:
> >=20
> > spi1-function {
> > 	function =3D spi
> > 	group =3D spi1
> > }
> >=20
> > all-config1-config2 {
> > 	pins =3D 1, 2, 4, 5
> > 	config1
> > 	config2
> > }
> >=20
> > all-config1 {
> > 	pins =3D 3
> > 	config1
> > }
> >=20
> > which kinda falls apart I think when a node can request a setting for
> > pins that are not part of it (in this case, that's pins 4 and 5)
> >=20
> > spi {
> > 	pinctrl-0 =3D spi1-function, all-config1, all-config1-config2
> > }
> >=20
> > So my opinion is that the max number of items should be the size of the
> > largest peripheral.
> >=20
> > What's the largest actual user on the 7581?

>=20
> The largest users are EN7523 pcm_spi 14, AN7563 pnand 17, AN7583
> pnand 17, EN7528 pnand 17, EN7581 pnand 17 and AN7589 emmc 12 (these
> numbers are based on a hackish "grep foo | bar", so they might be
> slightly off).
>=20
> I copied and modified what the other AN/EN bindings do. These set the
> limit to the pin count of the SoC: EN7523 38, AN7563 38, AN7583 53,
> EN7528 50, EN7581 58. Your call really, I do not mind either way. I can
> send a v4 and then a follow up series cleaning up the existing bindings
> as well.

btw, please do not top post.

I'd much rather not let this permit doing things that do not make any
sense.

--8k1LZRwMDy0PRoKK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyXAgAKCRB4tDGHoIJi
0kYvAPi/HmH3Vy8OOZFdQP22lPQI2A+1zxWZ5QRthgGK9h06AP9Ck9DBOrdwBmuf
j1r5gIqXcDkItxjnbOdp4z1RBb6vCw==
=sWmb
-----END PGP SIGNATURE-----

--8k1LZRwMDy0PRoKK--
