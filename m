Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA0537BE7B;
	Mon, 31 Aug 2026 22:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216674; cv=none; b=LXdT7ASjQ9zMPHfIcfFA8q76r9/PP7074PCifTgybpSBIJu/eOF9TKJVdLf8is+hHqo8OuecB+POv5RgH/HfzqcxCchMsI3tsf2NiTaL0Ei6hBx4JaJE++oYNm9C41pnX997A6K1RurgKlpwFokAtH3IDrZ0END+RU0ZeFlwihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216674; c=relaxed/simple;
	bh=jM2Xfd79uvNoxSJ1lPSv71qTXMbr2O8axyL+NZNwuaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+zpkYd1f/5s4fyZg6HGd47cSbTAdUgjXrMf8pNGwg5atPaAppf/cR+7qqx1NDidDLSYhVt+5I6R/TVlY6dCZT7pfQLgR5vM6hqHmTNuNRT5C6pbdUf4geJHIx5bmIZA+bLBTfVrduGrvtxqT56+zNp4w6FFLIWlQXxE6UiaM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9LcrWoY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9LcrWoY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3671F000E9;
	Mon, 31 Aug 2026 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788216664;
	bh=LE1tRsuf20iiZ+MwZN9mRaew+1jtEq4b8AWQ4BS4V60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q9LcrWoYBDYCJOi2xN4bc0ej3hW9nHMNJ1hmqXl8LSBe+rBvVKDxMVK9NbTHQI6e+
	 PdjRGO6+WOOcCluEEw7S8wti7AEd24tIbKoQxe1Rdf+FN2BsfOeegjWtuwYbYDtbwv
	 52V83ZW6uwSEI4hWfsVeFOmf69PPjPH2AVlwiSLo7W29/aS1+4kfz1LXHZEMUBQBYM
	 tDbuu4BKd4pLwhm6XfBK7kCJYwIEC9U7oYeypF63QZNT1hfuhZsEI0oGbPf6u+Nis4
	 O0rviqbr+qrx+QdL7hQ+rNxz9Z1ioP/lZnse6vRoPKYvmvk25ZofySk0cMvuDab1yP
	 FqUEnGJQ4OJiA==
Date: Mon, 31 Aug 2026 23:51:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <20260831-imply-unreeling-a6b527b7fa8e@spud>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
 <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
 <20260831-sibling-isolation-3849a5e4845f@spud>
 <apW7r6IdVx9Cmk4G@DESKTOP-TIT0J8O.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YprlfHj1gkHCX4El"
Content-Disposition: inline
In-Reply-To: <apW7r6IdVx9Cmk4G@DESKTOP-TIT0J8O.localdomain>

--YprlfHj1gkHCX4El
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 09:36:47PM +0400, Ahmed Naseef wrote:
> On Mon, Aug 31, 2026 at 05:57:59PM +0100, Conor Dooley wrote:
> > On Sat, Aug 29, 2026 at 03:47:00PM +0400, Ahmed Naseef wrote:
> > > On Fri, Aug 28, 2026 at 04:51:27PM +0100, Conor Dooley wrote:
> > > > On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
> > > > > Add the binding for the pin controller found on the EcoNet EN7528=
 MIPS
> > > > > SoC. It shares the IP with the Airoha pin controllers, but its IO=
MUX and
> > > > > pin configuration registers have a different layout, so it gets i=
ts own
> > > > > compatible.
> > > > >=20
> > > > > The CHIP SCU holding those registers is referenced by the airoha,=
chip-scu
> > > > > phandle.
> > > > >=20
> > > > > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > > > > ---
> > > > >  .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++=
++++++
> > > > >  1 file changed, 190 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/eco=
net,en7528-pinctrl.yaml
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7=
528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-=
pinctrl.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..3ce1a5309d09
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pin=
ctrl.yaml
> > > > > @@ -0,0 +1,190 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl=
=2Eyaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: EcoNet EN7528 Pin Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > > > +
> > > > > +description:
> > > > > +  The EcoNet EN7528 pin controller is used to control SoC pins. =
It shares the
> > > > > +  IP with the Airoha pin controllers, but its IOMUX and pin conf=
iguration
> > > > > +  registers have a different layout.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: econet,en7528-pinctrl
> > > > > +
> > > > > +  airoha,chip-scu:
> > > > > +    description: phandle to the chip SCU syscon
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  gpio-controller: true
> > > > > +
> > > > > +  '#gpio-cells':
> > > > > +    const: 2
> > > > > +
> > > > > +  gpio-ranges:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupt-controller: true
> > > > > +
> > > > > +  '#interrupt-cells':
> > > > > +    const: 2
> > > > > +
> > > > > +patternProperties:
> > > > > +  '-pins$':
> > > > > +    type: object
> > > > > +
> > > > > +    patternProperties:
> > > > > +      '^mux(-|$)':
> > > > > +        type: object
> > > > > +
> > > > > +        description:
> > > > > +          pinmux configuration nodes.
> > > > > +
> > > > > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > > > > +
> > > > > +        properties:
> > > > > +          function:
> > > > > +            description:
> > > > > +              A string containing the name of the function to mu=
x to the group.
> > > > > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_le=
d0,
> > > > > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, p=
hy3_led1,
> > > > > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, =
spi, uart]
> > > > > +
> > > > > +          groups:
> > > > > +            description:
> > > > > +              An array of strings. Each string contains the name=
 of a group.
> > > > > +            items:
> > > > > +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts,=
 uart3,
> > > > > +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_s=
pi,
> > > > > +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_=
spi_cs2,
> > > > > +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_=
spi_cs6,
> > > > > +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gp=
io3, gpio4,
> > > > > +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, =
gpio11,
> > > > > +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpi=
o17,
> > > > > +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpi=
o23,
> > > > > +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpi=
o29,
> > > > > +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpi=
o35,
> > > > > +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpi=
o41,
> > > > > +                     pcie_reset0, pcie_reset1]
> > > > > +
> > > > > +        required:
> > > > > +          - function
> > > > > +          - groups
> > > > > +
> > > > > +        additionalProperties: false
> > > > > +
> > > > > +      '^conf(-|$)':
> > > >=20
> > > > Why is this needed? Why can you not tell from the group which pins =
the
> > > > config applies to?
> > >=20
> > > Not for all of them: i2c_sda, i2c_scl, uart_txd and uart_rxd are in no
> > > group at all.
> >=20
> > Why's that? Are they just fixed output pins?
>=20
> Fixed-function :  the dedicated I2C and UART pads. The only registers
> they have are bias and drive strength, there is no mux and no GPIO
> mode.
>=20
> >=20
> > > The spi_cs0/clk/mosi/miso pads are only in pnand, which is
> > > 17 pins wide, so no group names them individually either.
> >=20
> > That's easily resolved by breaking up pnand though.
> >=20
>=20
> Not as mux groups: pnand is a single register bit, so muxing a
> sub-group would still switch all 17 pads while pinctrl only claims the
> subset. As config aliases they would add nothing over pins.
>=20
> > Devils advocate thing here might be to say that the dedicated
> > configuration node should only be for the things that are fixed outputs,
> > and the muxable ones should get their config from a combined
> > pinmux/pincfg node. Personally I think that presents a nicer interface,
> > where someone doesn't have to go figure out what pins are in the group
> > they just assigned a function to to also set the config properties for
> > it.
>=20
> The driver would take that as-is (it uses the generic dt_node_to_map,
> which accepts config properties next to function/groups). I kept the
> split mux/conf shape to match the other four Airoha bindings on this
> driver. If you prefer the combined form I would rather do it for the
> whole family as a follow-up than have en7528 be the odd one out - but
> can switch this one now if you want.
>=20

Nah, leave it as-is. Read my reply to Benjamin.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--YprlfHj1gkHCX4El
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapYFVAAKCRB4tDGHoIJi
0v3uAQDAIEepPcWZKqwJEspz/XLSLGqfZDW6Zu7tRMPuUszZzAEAvu+0lcpe0TEg
Noio1LI66OwoFxlIvbtBmZDLsIx4Bg4=
=GFJo
-----END PGP SIGNATURE-----

--YprlfHj1gkHCX4El--
