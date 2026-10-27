Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124503;
	b=k+Lc6Tc4xM6x8q7UhWtSUNjzud0IgG5gk7veHZipcB4EGytAvZqo0xKwuwNOnd4936Qf
	 sB5NXq8VzEOi+GFS3d6CazEDmpZFeS41asoGSZqVio9Wh+N3Hh/9SyiA1AGk2PnbuTn+C
	 aXw49hBPD2D/shcMC/5Xi4ePOFRTjC02zu0ucXV5i2sCSG0NKfCwykN+t/tu85qsZe/+b
	 dlBzMku9u23hQeX5jg3HNL20L8xIFS+xUvkdGhyHG1fgbF/eQgNTY79xOgi3wV49LDoHY
	 pzAqLPwHhmm2QWmnyAwNZC+h2RzcTX8jXzTG29kO9lG0KoLPZtvDxeeYoiYUxLjLiwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124503;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=q7KSD3oBLIFGweiTvRRsuAF2uWEJ6lExKiLu/Jc2HGc=;
	b=2yT4pzbieaNDM70i0k+EYKUBOeEZYUh81GkoW6wXrO17Nuw0I9ddZatN2f+jPrO/GCXa
	 zCunbxfaqIp5IVRSnbFV6Dyj/1s9j4H44/ohVBCgb7GSgSJLk9IucbUN0/3hxgnQAVbC0
	 iCKNLvaQv66fpqp79edGhfO+RSdk13SggH9tXLpHKuDlSbKT6Jv0KOIJIZ62EnpmU8PEx
	 1tcqTea9IQxRo8h5tOysiPFqMwtsNxf/Eid74tgoplYQw7OcwVMr0A9Y3i9xJguDMMR0/
	 X5mXKFJze+deTAEx6GSt+tdCVezNWXxLkoZNcLW0fpb/u5aBp9CUggjDq61LhSaizBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGvN39ax;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879B1606A32F;
	Tue, 27 Oct 2026 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FGvN39ax
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2986E1F031E2;
	Tue, 27 Oct 2026 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793124503;
	bh=q7KSD3oBLIFGweiTvRRsuAF2uWEJ6lExKiLu/Jc2HGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FGvN39axOybXEpIGlxH/5AyIn5e7gzP7hxk7QD45q9tU84xQtgs+ktwNirMh6Fl7O
	 c0hSIOasDAUjz0dhR8iA46UDOHOYhtM2pujtP6nPrN2GyQJXQQRT/59lUqxzBygGnA
	 UYXNLxnw1opBhCfuHbPNtfjjdJmEk61Y9rHmIa/SmLUUXzSExjCsSxNU9WA2inAFwh
	 4V6ndCiIdOnrKtTCLYUkmJVgp9W7JxMrk4yPDpj0xe6wDtlwOQgEn76SgbxDChJofl
	 lm4waYFCPQWCdE1GhGCDYXvB/ngSontCTXjFSI4RmFpR27z8U4Y390Lk+wIU9ct4HF
	 oF5MP+HkiLSOg==
Date: Tue, 27 Oct 2026 18:08:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: Linus Walleij <linusw@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
	brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add TI TDA54 pin controller
Message-ID: <20261027-backshift-speech-3791d024931c@spud>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-2-y-abhilashchandra@ti.com>
 <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
 <20261001-repost-reselect-2b597c627c11@spud>
 <9d505e63-9d99-42fd-9638-05043ad36e90@ti.com>
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
	protocol="application/pgp-signature"; boundary="oH48FBSJxLSXOFtH"
Content-Disposition: inline
In-Reply-To: <9d505e63-9d99-42fd-9638-05043ad36e90@ti.com>

--oH48FBSJxLSXOFtH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 02:39:32PM +0530, Yemike Abhilash Chandra wrote:
> On 02/10/26 02:56, Conor Dooley wrote:
> > On Thu, Oct 01, 2026 at 11:10:34PM +0200, Linus Walleij wrote:
> > > > +      ti,isolation-bypass:
> > > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > > +        enum: [0, 1]
> > > > +        description: |
> > > > +          I/O isolation for this pad.
> > > > +          0 - isolation preserved
> > > > +          1 - isolation bypassed
> > >=20
> > > What does this even mean electronically speaking? Explain in a descri=
ption:
> > > statement.
> > >=20
> > > ti,isolation-preserve;
> > > ti.isolation-bypass-enable;
> >=20
> > Is this not just an either or, so there should only be one property
> > here.
> >=20
>=20
> It is an either/or, but with a single bool, leaving it out wouldn't
> clear a bypass set by an earlier boot stage. So I'd prefer the two
> bool properties Linus suggested, does that work for you?

Maybe this is a misguided belief, but I don't think that any node for
which pin configuration is being provided should be incomplete to the
point that it relies on earlier stages - or are you thinking about nodes
that provide only pinmuxing and having no way to differentiate between a
node that has only muxing (and should not modify configuration and a node
that is meant to do pinmuxing plus set the default isolation bypass
state?

> > > perhaps?
> > >=20
> > > Some of the retention settings seem *very* generic, c.f. this
> > > from include/dt-bindings/pinctrl/nomadik.h that has been
> > > around forever:
> > >=20
> > > #define SLPM_DISABLED           0
> > > #define SLPM_ENABLED            1
> > > #define SLPM_INPUT_NOPULL       0
> > > #define SLPM_INPUT_PULLUP       1
> > > #define SLPM_INPUT_PULLDOWN     2
> > > #define SLPM_DIR_INPUT          3
> > > #define SLPM_OUTPUT_LOW         0
> > > #define SLPM_OUTPUT_HIGH        1
> > > #define SLPM_DIR_OUTPUT         2
> > > #define SLPM_WAKEUP_DISABLE     0
> > > #define SLPM_WAKEUP_ENABLE      1
> > >=20
> > > SLPM means "sleep mode", yeah pretty much retention...
> > >=20
> > > I think the corresponding retention settings for things that are real=
ly
> > > quite generic should just be added to the generic pin config bindings.
> >=20
> > Additionally, if any of the custom properties are gonna be kept as
> > numerical values, they're all missing defaults. In the case where you're
> > advocating for multiple boolean properties, one of them is gonna have to
> > be required as otherwise we're looking at indeterminate states based on
> > reset values or what a prior stage may or may not have done? The reset
> > values should probably be considered default, but the cleanest way to
> > make this work with separate booleans is have a
> > oneOf:
> >   - required:
> >      - a
> >   - required:
> >      - b
> >   - required:
> >      - c
> >=20
> > and you've also got to deal with people potentially making mistakes and
> > adding multiple properties for the same feature or trying to overwrite a
> > $som.dtsi/$soc-common.dtsi config and not realising that they've got to
> > do a /delete-property/ on the other property for the feature.
>=20
> In v2, I will switch most of them to boolean properties, with every
> state available as its own flag, so a DT can always set a known value
> and override whatever an earlier stage left. For each group I'd follow
> the same pattern as the generic bias-* properties: at most one flag from
> a group, which also catches the dtsi override case in dtbs_check. If
> none is given, the driver leaves those bits untouched, same as for
> bias-*.
>=20
> Would that work for you, or would you still prefer one of them to be
> required?
>=20
> For the numerical properties that remain, I'll add a default.

Sure.

--oH48FBSJxLSXOFtH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauDokQAKCRB4tDGHoIJi
0stOAQDi4h8L2SbImSRTGspezgU0I7QSDF1YVBweYOKmZFKxwAD/YBZ0Rl48Kiyg
yBRHC8djSfcao3uvJBeGu5+1OAqcSwI=
=JL/f
-----END PGP SIGNATURE-----

--oH48FBSJxLSXOFtH--
