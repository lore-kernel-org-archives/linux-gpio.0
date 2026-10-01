Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB8349BD86;
	Thu,  1 Oct 2026 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889984; cv=none; b=PSVuooFGK3ZOx0Ua+kC+KEMKilmXdXMwOt9vtqWOnpY9YhJTzUjm0en9vJCAqRx4ib2z6tILTPk7hEjsC21MIBykJxKz8DhGf6oyPgJH2GYjbXKeqsbIp76Q8+WDR+YdmuiGLa7uSC6ONiekqXon3wJv0xvwMjpirThm6uSj3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889984; c=relaxed/simple;
	bh=Ltf9gyvxefy0jVtFroAsd8q6bJwDNy/upbuhU7Hcc9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6DzuwHJOZGAFAVD2DzxK8BYoeq9DiRcsTHVsAmT1itrF1eB3p6Zyf6zTNM5UwyDOSVLpbQK19BCfzEfTRWnY/3c316lJl/2ZjsjBY8AG6cqHVWvUiXrnonldm92f+NzH1iGN2eF0M+zDjIMStxZK90iItlImKSxN24nXBWhDTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3jDF5yT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3jDF5yT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E12C1F000FF;
	Thu,  1 Oct 2026 21:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889980;
	bh=J4TV0b49DMUb4s9V8THpO/dg6QtAbKgGa71G1KGPoyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3jDF5yTTCRtYHGZjtnQoy+aLpc2DV3zJ1hz+/EaO9CigQgY+GkwuJp0NMjjkliiz
	 hj4GNE7xq90PbAco6Sq7zU/SqiS5MwC8eSx68tY9YXuIPiYsw/aycw/qA2lIi07V9o
	 +oABAnkS9gmTt+G1ZCbr/fUUiGw0hVRbvxhYUgPbmLCD7YvGrAETnp6KxygOrERXYL
	 5uh8S9LYcm5YX0E1fBRwFvjmecEa5ihSc+MmetuPbznuX9hQp//b2mrKXK2EeR25D/
	 aNqnLx9haoIDbOTSWf35oa10NUAXxQLz7qGpYCim4Fg1o60zK6b6OLAcF+biOr9XT5
	 pi4uV9OpsasAg==
Date: Thu, 1 Oct 2026 22:26:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, brgl@kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add TI TDA54 pin controller
Message-ID: <20261001-repost-reselect-2b597c627c11@spud>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-2-y-abhilashchandra@ti.com>
 <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dVB2jDxu3m4Tk3Ds"
Content-Disposition: inline
In-Reply-To: <CAD++jLnok0bz9kXiW=O8+4fPBYvm9nG-AA-8CopDpc-DBvBiJA@mail.gmail.com>

--dVB2jDxu3m4Tk3Ds
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2026 at 11:10:34PM +0200, Linus Walleij wrote:
> Hi Yemike,
>=20
> thanks for your patch!
>=20
> On Wed, Sep 30, 2026 at 11:21=E2=80=AFAM Yemike Abhilash Chandra
> <y-abhilashchandra@ti.com> wrote:
>=20
> > +      ti,debounce-select:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3, 4, 5, 6]
> > +        description:
> > +          Selects which DBOUNCE_CFGn period register in the control mo=
dule
> > +          drives the debounce filter for this pad. 0 disables debounci=
ng,
> > +          1 to 6 select DBOUNCE_CFG1 to DBOUNCE_CFG6.
>=20
> What's wrong with the existing input-debounce property?
>=20
>   input-debounce:
>     $ref: /schemas/types.yaml#/definitions/uint32-array
>     description: Takes the debounce time in usec as argument or 0 to disa=
ble
>       debouncing
>=20
> Just translate usec:s into your custom format in the code, problem solved.
>=20
> > +      ti,virt-gpio-instance:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > +        description:
> > +          Selects which virtual GPIO instance controls this pad, allow=
ing
> > +          protection between multiple virtual views of the GPIO control
> > +          registers. Has no effect unless the pad is muxed to GPIO mode
> > +          (muxmode 7).
>=20
> Wow crazy stuff. OK keep it :D
>=20
> > +      ti,wakeup:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3]
> > +        description: |
> > +          Wakeup event configuration for this pad.
> > +          0 - wakeup disabled
> > +          1 - wakeup triggered by any change of the pin input value
> > +          2 - wakeup triggered by a low value on the pin
> > +          3 - wakeup triggered by a high value on the pin
>=20
> I just have the feeling this should be a generic property. It seems so us=
eful.
>=20
> Can you just add this as wakeup-mode =3D <custom value> in
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml

And I think it should probably be strings, so that there's some hope of
commonality, since obviously any user is going to invent different
mappings.

>=20
> > +      ti,retention-bias:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2]
> > +        description: |
> > +          Enables the internal I/O pullup/pulldown resistor when pin e=
nters
> > +          TDA54 I/O retention mode, and configures the I/O pull resist=
or
> > +          direction.
> > +          0 - OFF mode pad pull resistor disable
> > +          1 - Select OFF mode pulldown resistor
> > +          2 - Select OFF mode pullup resistor
>=20
> Use names inspired by the generic config types and flags instead
> of enums.
>=20
> ti,retention-bias-disable;
> ti,retention-bias-pull-down;
> ti,retention-bias-pull-up;
>=20
> > +      ti,retention-offmode:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +        description: |
> > +          I/O behaviour when retention mode is active.
> > +          0 - I/O maintains its previous state
> > +          1 - I/O state is forced to the OFF mode value
>=20
> Behaviour of *what*?
>=20
> The driver stage?
>=20
> I suspect you should make two bool flags
> ti,retention-output-hold;
> ti,retention-output-disable;
>=20
> > +      ti,retention-output:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2]
> > +        description: |
> > +          Output driver behaviour while the pad is in retention mode.
> > +          0 - output driver disabled
> > +          1 - output driver enabled, pad driven low
> > +          2 - output driver enabled, pad driven high
>=20
> Make three flags:
> ti,retention-output-disable;
> ti,retention-output-low;
> ti,retention-output-high;
>=20
> > +      ti,retention-force:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +        description: |
> > +          I/O retention controls.
> > +          0 - gated by the Device Manager logic
> > +          1 - forced active, overriding the Device Manager gating logic
>=20
> This is clearly a bool flag. It should contain device-manager as that
> magic entity is involved.
>=20
> ti,retention-device-manager-enable;
> ti,retention-device-manager-forced-active;
>=20
> Both seems to be related to the device manager whatever that is.
>=20
> > +      ti,isolation-bypass:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +        description: |
> > +          I/O isolation for this pad.
> > +          0 - isolation preserved
> > +          1 - isolation bypassed
>=20
> What does this even mean electronically speaking? Explain in a descriptio=
n:
> statement.
>=20
> ti,isolation-preserve;
> ti.isolation-bypass-enable;

Is this not just an either or, so there should only be one property
here.

>=20
> perhaps?
>=20
> Some of the retention settings seem *very* generic, c.f. this
> from include/dt-bindings/pinctrl/nomadik.h that has been
> around forever:
>=20
> #define SLPM_DISABLED           0
> #define SLPM_ENABLED            1
> #define SLPM_INPUT_NOPULL       0
> #define SLPM_INPUT_PULLUP       1
> #define SLPM_INPUT_PULLDOWN     2
> #define SLPM_DIR_INPUT          3
> #define SLPM_OUTPUT_LOW         0
> #define SLPM_OUTPUT_HIGH        1
> #define SLPM_DIR_OUTPUT         2
> #define SLPM_WAKEUP_DISABLE     0
> #define SLPM_WAKEUP_ENABLE      1
>=20
> SLPM means "sleep mode", yeah pretty much retention...
>=20
> I think the corresponding retention settings for things that are really
> quite generic should just be added to the generic pin config bindings.

Additionally, if any of the custom properties are gonna be kept as
numerical values, they're all missing defaults. In the case where you're
advocating for multiple boolean properties, one of them is gonna have to
be required as otherwise we're looking at indeterminate states based on
reset values or what a prior stage may or may not have done? The reset
values should probably be considered default, but the cleanest way to
make this work with separate booleans is have a
oneOf:
 - required:
    - a
 - required:
    - b
 - required:
    - c

and you've also got to deal with people potentially making mistakes and
adding multiple properties for the same feature or trying to overwrite a
$som.dtsi/$soc-common.dtsi config and not realising that they've got to
do a /delete-property/ on the other property for the feature.

--dVB2jDxu3m4Tk3Ds
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar7P9wAKCRB4tDGHoIJi
0uEAAP0cOa24ZA8ax0vvN2MZDigQznH1gU0puuf6fxAIdRKxqAEA6GNLdXqZI5TS
PaTfG4xs2OTP1gaXawTbAfNC3RY0/Ac=
=fHVV
-----END PGP SIGNATURE-----

--dVB2jDxu3m4Tk3Ds--
