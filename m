Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F9433937E;
	Mon, 31 Aug 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195485; cv=none; b=Opa4w0tk0In5w2olp+0zj2yHNK3S9OIf++61h3pEMm63rtnGYwm/zUPVfrtvx0b5G7QGSdTSQtTUHrYaDKNk05Ic6A2ruLLCf0hBkbRlLJ/io08sCa3buLwYtQWBofA+LAhuSLTid97Z57kePhPlwAaiVk3uWIzaqSFAS19cUeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195485; c=relaxed/simple;
	bh=TB7Yd4T5XfnQ8/ZBpPGikxZjB3yTG60D7pNjGyQMtsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fW0hGzz0lyQ8xAuw4Va86bVmHNScWexzfT7ZS9XJERIp2aSYKG8yiSMnQELDScgtqKJSLuKow8A7j14r2iC/34WYXW40DLNmHDqxhSp+pTN8hCTM6QSfcc7Euc2b4xpU49JOc8cvKsZxhzfMDY+DStDZyK6ZoLzKDwX3o/9atqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUL7qaZL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUL7qaZL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A921F000E9;
	Mon, 31 Aug 2026 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788195483;
	bh=rA43EeKV8LPRke+CsmGqZ7tixGf/WtDeP6Az63YJjqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NUL7qaZLUENlqitLdG6xODYg1xvVdaMAH0CDe93Vf6HAg5QP8u6tIkyO69lUBPutX
	 aB2KDI3yyoF64hXXsuT6525XESDW2aCrSYstyG/2IS+uM+pYB1KqEHPnti/WjWbksO
	 lcGafSPFh+/GEknQWqOudkjP+UmbRSnduR6YqHb6NgPIODKgJ2F7JuuXr163oMuXSq
	 FJmC5wi1Fq/6jnyQs2S3cnuI6XDSu8CJ43ghFgCBYk9u5+YJNeNpI1TIprFq3t5Gqz
	 MxUvNsbwgi2Ql6KuNmyrQm4LnJlLiLXCiwuY7u7KGzdEqfgi5/dk89+lY3xAVKAosO
	 yBTTmYr6otCqA==
Date: Mon, 31 Aug 2026 17:57:59 +0100
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
Message-ID: <20260831-sibling-isolation-3849a5e4845f@spud>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
 <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ormZb02WsNzOKFXG"
Content-Disposition: inline
In-Reply-To: <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>

--ormZb02WsNzOKFXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 03:47:00PM +0400, Ahmed Naseef wrote:
> On Fri, Aug 28, 2026 at 04:51:27PM +0100, Conor Dooley wrote:
> > On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
> > > Add the binding for the pin controller found on the EcoNet EN7528 MIPS
> > > SoC. It shares the IP with the Airoha pin controllers, but its IOMUX =
and
> > > pin configuration registers have a different layout, so it gets its o=
wn
> > > compatible.
> > >=20
> > > The CHIP SCU holding those registers is referenced by the airoha,chip=
-scu
> > > phandle.
> > >=20
> > > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > > ---
> > >  .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++=
++
> > >  1 file changed, 190 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,=
en7528-pinctrl.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-=
pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinc=
trl.yaml
> > > new file mode 100644
> > > index 000000000000..3ce1a5309d09
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl=
=2Eyaml
> > > @@ -0,0 +1,190 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yam=
l#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: EcoNet EN7528 Pin Controller
> > > +
> > > +maintainers:
> > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > +
> > > +description:
> > > +  The EcoNet EN7528 pin controller is used to control SoC pins. It s=
hares the
> > > +  IP with the Airoha pin controllers, but its IOMUX and pin configur=
ation
> > > +  registers have a different layout.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: econet,en7528-pinctrl
> > > +
> > > +  airoha,chip-scu:
> > > +    description: phandle to the chip SCU syscon
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  gpio-controller: true
> > > +
> > > +  '#gpio-cells':
> > > +    const: 2
> > > +
> > > +  gpio-ranges:
> > > +    maxItems: 1
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  '#interrupt-cells':
> > > +    const: 2
> > > +
> > > +patternProperties:
> > > +  '-pins$':
> > > +    type: object
> > > +
> > > +    patternProperties:
> > > +      '^mux(-|$)':
> > > +        type: object
> > > +
> > > +        description:
> > > +          pinmux configuration nodes.
> > > +
> > > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > > +
> > > +        properties:
> > > +          function:
> > > +            description:
> > > +              A string containing the name of the function to mux to=
 the group.
> > > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_=
led1,
> > > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi,=
 uart]
> > > +
> > > +          groups:
> > > +            description:
> > > +              An array of strings. Each string contains the name of =
a group.
> > > +            items:
> > > +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uar=
t3,
> > > +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
> > > +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_=
cs2,
> > > +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_=
cs6,
> > > +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3,=
 gpio4,
> > > +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio=
11,
> > > +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
> > > +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
> > > +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
> > > +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> > > +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> > > +                     pcie_reset0, pcie_reset1]
> > > +
> > > +        required:
> > > +          - function
> > > +          - groups
> > > +
> > > +        additionalProperties: false
> > > +
> > > +      '^conf(-|$)':
> >=20
> > Why is this needed? Why can you not tell from the group which pins the
> > config applies to?
>=20
> Not for all of them: i2c_sda, i2c_scl, uart_txd and uart_rxd are in no
> group at all.

Why's that? Are they just fixed output pins?

> The spi_cs0/clk/mosi/miso pads are only in pnand, which is
> 17 pins wide, so no group names them individually either.

That's easily resolved by breaking up pnand though.

Devils advocate thing here might be to say that the dedicated
configuration node should only be for the things that are fixed outputs,
and the muxable ones should get their config from a combined
pinmux/pincfg node. Personally I think that presents a nicer interface,
where someone doesn't have to go figure out what pins are in the group
they just assigned a function to to also set the config properties for
it.

Cheers,
Conor.

> > > +        type: object
> > > +
> > > +        description:
> > > +          pinconf configuration nodes.
> > > +
> > > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > > +
> > > +        properties:
> > > +          pins:
> > > +            description:
> > > +              An array of strings. Each string contains the name of =
a pin.
> > > +            items:
> > > +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> > > +                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gp=
io13,
> > > +                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> > > +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> > > +                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> > > +                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
> > > +                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_s=
da,
> > > +                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
> > > +                     spi_mosi, spi_miso]
> > > +            minItems: 1
> > > +            maxItems: 50
> > > +
> > > +          bias-disable: true
> > > +
> > > +          bias-pull-up: true
> > > +
> > > +          bias-pull-down: true
> > > +
> > > +          input-enable: true
> > > +
> > > +          output-enable: true
> > > +
> > > +          output-low: true
> > > +
> > > +          output-high: true
> > > +
> > > +          drive-strength:
> > > +            description:
> > > +              Selects the drive strength for the pin, in mA.
> > > +            enum: [2, 4]
> > > +
> > > +        required:
> > > +          - pins
> > > +
> > > +        additionalProperties: false
> > > +
> > > +    additionalProperties: false
> > > +
> > > +required:
> > > +  - compatible
> > > +  - airoha,chip-scu
> > > +  - interrupts
> > > +  - gpio-controller
> > > +  - gpio-ranges
> > > +  - "#gpio-cells"
> > > +  - interrupt-controller
> > > +  - "#interrupt-cells"
> > > +
> > > +allOf:
> > > +  - $ref: pinctrl.yaml#
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    pinctrl {
> > > +      compatible =3D "econet,en7528-pinctrl";
> > > +
> > > +      airoha,chip-scu =3D <&chip_scu>;
> > > +
> > > +      interrupt-parent =3D <&gic>;
> > > +      interrupts =3D <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +      gpio-controller;
> > > +      #gpio-cells =3D <2>;
> > > +
> > > +      interrupt-controller;
> > > +      #interrupt-cells =3D <2>;
> > > +
> > > +      gpio-ranges =3D <&pinctrl 0 0 42>;
> > > +
> > > +      uart2-pins {
> > > +        mux {
> > > +          function =3D "uart";
> > > +          groups =3D "uart2";
> > > +        };
> > > +
> > > +        conf {
> > > +          pins =3D "gpio28", "gpio29";
> > > +          bias-pull-up;
> > > +        };
> > > +      };
> > > +
> > > +      pwm-pins {
> > > +        mux {
> > > +          function =3D "pwm";
> > > +          groups =3D "gpio30";
> > > +        };
> > > +      };
> > > +    };
> > > --=20
> > > 2.34.1
> > >=20
>=20
>=20

--ormZb02WsNzOKFXG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWylwAKCRB4tDGHoIJi
0s41AP40TrmiqHWo4ntEwgnYCO+jNj4vtpfSHM4hkNL+G/xNjQEAt6iqSvsWsuEM
i5TxRWXOXtMknOYWdPz27QNgpp6pRgM=
=iLtR
-----END PGP SIGNATURE-----

--ormZb02WsNzOKFXG--
