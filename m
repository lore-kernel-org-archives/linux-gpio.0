Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC7B3FE374;
	Thu, 12 Mar 2026 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337492; cv=none; b=q/hvZRG0mqSMDN7YiMJfwsjMyM/9ELmOMWoktXJim57/A1b9WL5KlQd2oifA5yaFxivKQpny42tp2M/gcX988zoGCUxqemFDrb96Mb3kCFZ7HfTY2ylRy2OyseU5zbOSBLKibOQ1iAZzASvABk1baJuclRz0Nd3biQ9Pkxbj+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337492; c=relaxed/simple;
	bh=yebvafZP0usipZ2VI2/wrr+gTjJ5AXBS/zFdtn7K/2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T30YrOpP6TCp5ThhUNlRi/3l+/xjz9oBydaUyc0B0OXWEXD6im1C7Ko4zfS28FCefsYTf++LiXpe4VjnKJ69aJ0McMyEDMEa/oHABp0Z8fOURxYSbaKeNhf2tSmed06vpaC1yzABDrkNgv0CX0HBvW7PHgit3rnRndCAi1okdKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDg/cgHN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDg/cgHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3470C4CEF7;
	Thu, 12 Mar 2026 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337491;
	bh=yebvafZP0usipZ2VI2/wrr+gTjJ5AXBS/zFdtn7K/2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDg/cgHN9xJ9PEZF1E0XNDoR5FPsdfKmziQjryC5acqoUEI4iWn3ci906JlEj8UyE
	 yZlxoXDnuOCe5MvxMrgjP+XKjsJdJMtmEIUJcro22n8I8lVKWHj6EV9sNq80MUyQwM
	 0/7spwN8zu9u6AbyTtHH4pJ2vOB7txWvrpDhRS3BgdKY6xX148t+EHWLbveBzk/yYq
	 JIl0R8uME1FJJWSSYZT6Z22yTAVDPjGq4c1PbMmRtv1quiwPpCv/kZTzefMoTeCrBG
	 IqlDEzQmXqCW2E4dJghCPBOF1voqoUya9VWHd7ENSdqUJU5roCtOocjrwvrwO4MOYy
	 3u5WoH2hfhSRg==
Date: Thu, 12 Mar 2026 17:44:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com,
	bartosz.golaszewski@oss.qualcomm.com, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v3 1/7] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Message-ID: <20260312-sizably-gleaming-07c514a1fb70@spud>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-2-eleanor.lin@realtek.com>
 <20260312-decathlon-unheard-33543f7c9f38@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4RMzMPhgra36l44W"
Content-Disposition: inline
In-Reply-To: <20260312-decathlon-unheard-33543f7c9f38@spud>


--4RMzMPhgra36l44W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 05:42:31PM +0000, Conor Dooley wrote:
> On Thu, Mar 12, 2026 at 07:30:34PM +0800, Yu-Chun Lin wrote:
> > From: Tzuyi Chang <tychang@realtek.com>
> >=20
> > Add a generic pin configuration property "input-voltage-microvolt" to
> > support hardware designs where the input logic threshold is decoupled
> > from the power supply voltage.
> >=20
> > This property allows the pinctrl driver to configure the correct intern=
al
> > reference voltage for pins that need to accept input signals at a diffe=
rent
> > voltage level than their power supply. For example, a pin powered by 3.=
3V
> > may need to accept 1.8V logic signals.
> >=20
> > This defines the reference for VIH (Input High Voltage) and VIL (Input =
Low
> > Voltage) thresholds, enabling proper signal detection across different
> > voltage domains.
> >=20
> > Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> > Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> > ---
> > Changes in v3:
> > - Rebased onto the devel branch of the pinctrl tree.
> > - Improved commit message and description.
> > ---
> >  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml=
 b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > index fe936ab09104..fd49a0d53bf0 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > @@ -162,6 +162,11 @@ properties:
> >        this affects the expected delay in ps before latching a value to
> >        an output pin.
> > =20
> > +  input-voltage-microvolt:
> > +    description: Specifies the input voltage level of the pin in micro=
volts.
> > +      This defines the reference for  VIH (Input High Voltage) and VIL
> > +      (Input Low Voltage) thresholds for proper signal detection.
>=20
> Should this be added here:
>   - if:
>       required:
>         - input-disable
>     then:
>       properties:
>         input-enable: false
>=20
> and made mutually exclusive with input-disable?

Also looking at v1, should this be something like
"input-threshold-voltage-microvolt"? "input-voltage-microvolt" doesn't
seem specific enough to the described use case.

>=20
> > +
> >  allOf:
> >    - if:
> >        required:
> > --=20
> > 2.34.1
> >=20



--4RMzMPhgra36l44W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL7jgAKCRB4tDGHoIJi
0iklAQDDaR+ooSW9jjtSvBDLW2pOjn+aaba1tgyiGHOr0jn8ogD+N7WQElixbtTf
maZCbCcqdUL63/v1jNK9YGB0J9JrKgU=
=cwPc
-----END PGP SIGNATURE-----

--4RMzMPhgra36l44W--
