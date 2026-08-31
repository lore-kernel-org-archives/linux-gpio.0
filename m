Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8B3C0A04;
	Mon, 31 Aug 2026 22:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216624; cv=none; b=AffFdhrz9lezcUn0nulPk6SnacW7yufQfE135MjLOugScvxs5Zvso/ED+D+cxvFS52ZAtOtrXQ7BUo34aAeG0D/X88lBgPBDT3AAQDeEXWWZuS2X20USIXQrhBXgRgH7C4ZmQNcwQoo6HnKxKVJvq2fyz+0rmUvvaSv/s+lgnN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216624; c=relaxed/simple;
	bh=I9Vyt9KQvT3rysO7I1hAfHRJpQC9451pDjB8QsWEnXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJjrXBl9+IPXDDQ4i1Oe8t+1KcqUutCICvU7ltWqbDNWaNRGUSaL4/L46y3esvfPT/FEYXkRY8K3y+XR5v0oG9xA0XmgcTLQIkBAWYos3oj8z/ml7p0cORSiZ0wQWg27ciHgAbx4Emi7UD2VSER27XVxSJRSKeiqsbKYFjUA8qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbG+Sprv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbG+Sprv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7BA1F000E9;
	Mon, 31 Aug 2026 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788216620;
	bh=ML5wQ/GS1Kk9O2kkgjdsq7B7FgNtx0tPN9WZYFKffG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WbG+SprvCGWXQydLTVRiCH4U022X3r3siIUPzyeoemhhNnZF3zUgzsb5Q5nWIcI3a
	 Yo/WWQt3k6k0l9/RBBemW5KPRHbf/drENFz8xdQI71He9/dM40P18bx0ztjVy8ZIjk
	 WadCOFZe7DQlagS29gUDnEULNB89T9TopJUB0jhtTng45qQ7RFl9XeE7l1NnYsjV2I
	 /+tkxbI9Oz6d28cbOjcbqz7+ATFX3SSjTlMRTybFSh9rHqSjTPeMrXY0XCBcophpJl
	 RzNWvqIeTaeWLFmdAlgm0eXCxTexWO+QwXrOetMixkIDwgYdLJhxWVDp0aCOBlX1gi
	 JG/azQBmESUww==
Date: Mon, 31 Aug 2026 23:50:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
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
Message-ID: <20260831-reps-staunch-1522442545a4@spud>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
 <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
 <20260831-sibling-isolation-3849a5e4845f@spud>
 <679db287-3cf2-4d29-b690-d87196402378@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FVu6sS8O0N7Jmwge"
Content-Disposition: inline
In-Reply-To: <679db287-3cf2-4d29-b690-d87196402378@genexis.eu>

--FVu6sS8O0N7Jmwge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 08:46:52PM +0200, Benjamin Larsson wrote:
> On 31/08/2026 18:57, Conor Dooley wrote:
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
> > > > >   .../pinctrl/econet,en7528-pinctrl.yaml        | 190 +++++++++++=
+++++++
> > > > >   1 file changed, 190 insertions(+)
> > > > >   create mode 100644 Documentation/devicetree/bindings/pinctrl/ec=
onet,en7528-pinctrl.yaml
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
> >=20
> > > The spi_cs0/clk/mosi/miso pads are only in pnand, which is
> > > 17 pins wide, so no group names them individually either.
> >=20
> > That's easily resolved by breaking up pnand though.
> >=20
> > Devils advocate thing here might be to say that the dedicated
> > configuration node should only be for the things that are fixed outputs,
> > and the muxable ones should get their config from a combined
> > pinmux/pincfg node. Personally I think that presents a nicer interface,
> > where someone doesn't have to go figure out what pins are in the group
> > they just assigned a function to to also set the config properties for
> > it.
> >=20
> > Cheers,
> > Conor.
> >=20
> Hi, I dont fully understand the exact implications but there are at least=
 2
> more Econet pinctrl drivers coming. I would prefer it if we could keep th=
em
> looking exactly like the other Airoha drivers that are already merged. All
> the SoCs share the same structure and logic just different pins and
> addresses.

FWIW, "I want to do X cos Y other driver does X" is not really a
compelling argument in general. In this case, what's being done isn't
terrible (and I was just about to tell Ahmed that I didn't notice that
there's actually code reuse going on and his patch was adding 1200 lines
of definitions rather than functions), but in general this is not an
acceptable argument.

Also, in this case, I amn't overly opposed to what's going on here, I
just want to be convinced that this isn't trying to shoehorn something
into an existing model. It looks very clumsy to apply muxing by group
but config by pin, when a little bit more judicious use of groups could
get it all done in one go.

I think I have already made similar comments on Airoha pinctrl in the
past, so I guess I will just let this go as long as this is effectively
describing the same "IP", or "structure and logic" as you put it, and
expect that when the mechanism changes (which it will undoubtedly at
some point) that either pins or groups, not both, is used then. If I
remember or haven't burnt out and quit...

Cheers,
Conor.

--FVu6sS8O0N7Jmwge
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapYFJwAKCRB4tDGHoIJi
0rhfAPoCRovzdnvEECViMGN0T4+i78mBqtD0E/djpiikXqh3IAD5ASoX0E4dDq4/
5FqyGFY9SVasXFPGCiG1oJgr/9hUfAU=
=I6q4
-----END PGP SIGNATURE-----

--FVu6sS8O0N7Jmwge--
