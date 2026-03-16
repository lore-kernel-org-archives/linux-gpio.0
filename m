Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2879B390CAD;
	Mon, 16 Mar 2026 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658774; cv=none; b=NUWeUnMEnygT/rwVZdll5R1tZ7jFd8ZOVCFhqVIOYLfehyIrLmz+CTA9NAwYIPYXxwS/uPM1vhSC/Iqh58V0FWFCNQfOMazbeFu1yjuW7vQ0Bc0v3DP5wrw7iXW3fkjeMlloIUhnQ+dfgiIUNImkBX52+LDpC6M40M2appBpxcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658774; c=relaxed/simple;
	bh=8upfTfzEga/wd+znnJ2xeNS58mtIiD4DoeQde1PSlpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhtQ0kMmodv7s40sej0kJeIpirMSLGx/3l8DcetJD/Iu2oa5Z5JyFXSQwvy7lE/oZQNnzRzaLbiDIMmejnbCIIBrRDAIOUlPjyjfvt52kA1Ul2EETY0WwBvq+S9y0yVHLTYeeFjrWHzzSzH+rNpLe7brTc+B/8LyIyK51IAw+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7kET63p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7kET63p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD2EC19421;
	Mon, 16 Mar 2026 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773658774;
	bh=8upfTfzEga/wd+znnJ2xeNS58mtIiD4DoeQde1PSlpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7kET63pyrPOPrCL+XAp/IA6sZA/ks/ynbUvkRCCLc7XsN7DTmqvkgYa2xzBhNsfF
	 e8VdUJuZoBuVhpdhHRNWdGz1kpQizSx9OZLfq0UI7//mwXNu7IU9V+uU9U8iAEp8yd
	 lrx3uDmUmRCCu1QwFJdT9iLz+m9WbUeaUSp2MXs1bEkYznlQy3HZ9OEuKrl8DAMPHW
	 QruOH1eYA9IgM2pOEN4geaajQznKxKFZBaODif/fQVT5JLsTllpPmGgePpD0TIBW9t
	 rAWjf9FIYfqvcYbtaCzLQ4Qmfe/5D+8XrE6Sq+3/kJACVhqgo14kYHtCKxpFB5I4pG
	 LP8zS6ziOcQnw==
Date: Mon, 16 Mar 2026 10:59:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/4] soc: microchip: add mpfs gpio interrupt mux
 driver
Message-ID: <20260316-verify-revise-c0ad49fc208e@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
 <20260311-vigorous-steadfast-04afdcc9e524@spud>
 <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QXaUuu184siEMQsu"
Content-Disposition: inline
In-Reply-To: <CAD++jLnXBW7FDdGRt3rN5Up6GdRvu-Ywsg8jfepjEf4rBjPQ6A@mail.gmail.com>


--QXaUuu184siEMQsu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:27:15AM +0100, Linus Walleij wrote:
> On Wed, Mar 11, 2026 at 4:18=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > On PolarFire SoC there are more GPIO interrupts than there are interrupt
> > lines available on the PLIC, and a runtime configurable mux is used to
> > decide which interrupts are assigned direct connections to the PLIC &
> > which are relegated to sharing a line.
> >
> > Add a driver so that Linux can set the mux based on the interrupt
> > mapping in the devicetree.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>=20
> We need a piece of accessible documentation that clearly defines
> the difference between an IRQ mux and a hierarchical IRQ chip.
> If only a post on people.kernel.org, just something to help people
> to know when to use which approach.

I'm guessing you're not looking for looking for me to be the arbiter,
but I'd say that the muxing aspect is pretty important!
On a serious note though, the lack of anything in the hardware to do
masking etc is key, it'd have to be nothing more than a register that
determines routing.
That said, even the simplest mux should be an irqchip if reconfiguration
after probe is to be supported.
That'd make the delimiter "a simple mux that you set at probe and never
touch again"?

--QXaUuu184siEMQsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabfikAAKCRB4tDGHoIJi
0iH1AQD6gzraxUf7eLDOoP3278COj/NHaSEqGeXofXCDYLB/5QEAvW8u94Fe+EsL
O7bkMtDdhKjZLKlM/VuSILf90VqvnAQ=
=1Nzk
-----END PGP SIGNATURE-----

--QXaUuu184siEMQsu--
