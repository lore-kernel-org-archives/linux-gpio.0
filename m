Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB494A3D35;
	Thu,  3 Sep 2026 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457014; cv=none; b=hztPIJhAW7s6dnv3bxO++TjUV4raDzW4VmDecODWQFt7QZutJ0RrkTE9w5RWDVUyDhL9vAJYKn1TcKeUwapL/CQx6AuV0lAxResiNtARdQWrDFG0EJ+t2GQ0S77SgSR1sNWuKzwi/SY9olPARuhZl81i5PpgLObdddQV8hJve9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457014; c=relaxed/simple;
	bh=GYOszcyAv2MHFI4KF++FD4YVfwcmAEWNPRJzM4zf2i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ux5c3QFDr1xBoO3exR1Ydj8SlNgLBxsN3ZF70xNQqsmVk8EEIyo2MyhE07i/s1o7lNOvICXrbr99AAAou68DhgPC8LuEiGCenfQac7CjbhPDzrpqKqUq2c/ZSUkWxy/kaRvWwemBquQirrvh7FS0IRv3DQp9SObZWNZorWTJrrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkbwZNy8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkbwZNy8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FEA1F000E9;
	Thu,  3 Sep 2026 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788457013;
	bh=GYOszcyAv2MHFI4KF++FD4YVfwcmAEWNPRJzM4zf2i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JkbwZNy8ok4L4oriC8g3PM+zQszbreb7sedqMSeb0lCmL8KNRQdk5SRx/ZaTNcXtz
	 ufHDYwCIbZ7UMLbp4fN1OVUw9rOJElPyHPWGavsomJfga362CvrOIYJJ2HtE6uvyiH
	 MJ1XEY6Fa7d+alzegb6GoFGsazjoCdrbMD/CRCS1/3vrx1Mw0iKXcJPodIBTcVKIrS
	 mj1VNF5d6+5Kt5RsriKPeAWNX82Uu4wjnDBbrN1PhaQaJYv0NVfN1uIpnQtwe1UrOA
	 ELWhCzT2guKZ968riHybpQ8mTazR2glo8JDvfyR8QvgBCV0QGc47urTPD3dNokOlFS
	 WA/oBUDc6u7mw==
Date: Thu, 3 Sep 2026 18:36:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO
 controller
Message-ID: <20260903-duckbill-cartoon-d1877e4c0e3c@spud>
References: <20260903-axiado-ax3000-sgpio-controller-v3-0-b30820e1b858@axiado.com>
 <20260903-axiado-ax3000-sgpio-controller-v3-1-b30820e1b858@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OrWhVXbbco6P8u3i"
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-sgpio-controller-v3-1-b30820e1b858@axiado.com>

--OrWhVXbbco6P8u3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 12:11:32AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the SGPIO controller found on the
> Axiado AX3005 SoC.
>=20
> Each SGPIO position provides one fixed-direction input GPIO and one
> fixed-direction output GPIO. Input GPIOs support edge-triggered
> interrupts.
>=20
> The controller serializes output values and samples input values over
> dedicated data, clock, and latch signals.
>=20
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OrWhVXbbco6P8u3i
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapmwLwAKCRB4tDGHoIJi
0nUSAP0dyjCLkvgRkuJeO5EQJWdRF9RerX1spQo+2jyKk4+HfwD/bcZvsxMEDDd3
auDb1zeyszZb4i9nsXRYElsNRzHgAAk=
=lVaB
-----END PGP SIGNATURE-----

--OrWhVXbbco6P8u3i--
