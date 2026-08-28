Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7BE357CEB;
	Fri, 28 Aug 2026 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932298; cv=none; b=lQrEMbkTExM2A5k7q+S/kG2S3GcdSIr5xU5Z8q4NqiM/QTzTp7Nq7YvlemlY8CHxcx1/jPJyDnVNbbnJhf+YsKbYY/PA+gOywQ95g4DQPGdEr9XBU64YCdrcYLJnvvLz8lSdx3EiULXUHHBpa9b9RrEISJdPwqMnQIcfxX4zjSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932298; c=relaxed/simple;
	bh=yQ/FFwpSapPcZkUMgJlHSmb/Tpy7hDWRSliWpemDAnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pW5yz8euyxmUM2+3ALY4FfuCWRFknUjS8U10UEvCpmkTzlpnnbbSw5DujJ1pjVuuscaL1p9htxkh/QJwdopSjv9BZgirp0ktq1V7UtO96XC3r2Bsg1lZzwoRNadBunLQvCLYpDzUNGn+pex6DlS8mut0umu1YcGldHrsLEAHpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9W/spZu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9W/spZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71C91F000E9;
	Fri, 28 Aug 2026 15:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787932292;
	bh=MrxOZII0U1V57oNJKFQCS1oLJUTJEVDy3QDWlAiwRao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T9W/spZuHxH4EXPMfNsmZdNUHolT3KUS5V9w2jKDqVNNaWF1LiutG5AYIHlOFN1dr
	 zWTFBncruZpv+5D55RTF9YG4WAiZ0vMKY3OO+EhxRYrkmpXyqL+wc5b+CsJTEXEcF7
	 F9z+AI17KJPVP35n//38Tw95QG7k7SMkUi5pA4VI2KfG/RNy0Z3o6ajCzwIb7Ub762
	 KTrDnNtpB/XobCmZWK1/opg6Sbd53Ni4Pddgr72eEa4s2bPvSThwAaWX2BTmLCV7j4
	 T4eiow3/vwSPetYbUE5IHhzt8S+zKhLlP/Pa68Ff+vdCXWhM9A85X8kKMoChLFU8Ku
	 WCcCZf1QrZD6g==
Date: Fri, 28 Aug 2026 16:51:27 +0100
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
Message-ID: <20260828-chaos-recovery-c99d547ee1b6@spud>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+NZ9peSVGfDYs8bS"
Content-Disposition: inline
In-Reply-To: <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>

--+NZ9peSVGfDYs8bS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
> Add the binding for the pin controller found on the EcoNet EN7528 MIPS
> SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
> pin configuration registers have a different layout, so it gets its own
> compatible.
>=20
> The CHIP SCU holding those registers is referenced by the airoha,chip-scu
> phandle.
>=20
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> ---
>  .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en75=
28-pinctrl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.=
yaml
> new file mode 100644
> index 000000000000..3ce1a5309d09
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: EcoNet EN7528 Pin Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +
> +description:
> +  The EcoNet EN7528 pin controller is used to control SoC pins. It share=
s the
> +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> +  registers have a different layout.
> +
> +properties:
> +  compatible:
> +    const: econet,en7528-pinctrl
> +
> +  airoha,chip-scu:
> +    description: phandle to the chip SCU syscon
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +
> +    patternProperties:
> +      '^mux(-|$)':
> +        type: object
> +
> +        description:
> +          pinmux configuration nodes.
> +
> +        $ref: /schemas/pinctrl/pinmux-node.yaml
> +
> +        properties:
> +          function:
> +            description:
> +              A string containing the name of the function to mux to the=
 group.
> +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uar=
t]
> +
> +          groups:
> +            description:
> +              An array of strings. Each string contains the name of a gr=
oup.
> +            items:
> +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
> +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
> +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
> +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
> +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpi=
o4,
> +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
> +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
> +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
> +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
> +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> +                     pcie_reset0, pcie_reset1]
> +
> +        required:
> +          - function
> +          - groups
> +
> +        additionalProperties: false
> +
> +      '^conf(-|$)':

Why is this needed? Why can you not tell from the group which pins the
config applies to?

Thanks,
Conor.

> +        type: object
> +
> +        description:
> +          pinconf configuration nodes.
> +
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +
> +        properties:
> +          pins:
> +            description:
> +              An array of strings. Each string contains the name of a pi=
n.
> +            items:
> +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> +                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> +                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> +                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> +                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
> +                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
> +                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
> +                     spi_mosi, spi_miso]
> +            minItems: 1
> +            maxItems: 50
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          input-enable: true
> +
> +          output-enable: true
> +
> +          output-low: true
> +
> +          output-high: true
> +
> +          drive-strength:
> +            description:
> +              Selects the drive strength for the pin, in mA.
> +            enum: [2, 4]
> +
> +        required:
> +          - pins
> +
> +        additionalProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - airoha,chip-scu
> +  - interrupts
> +  - gpio-controller
> +  - gpio-ranges
> +  - "#gpio-cells"
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pinctrl {
> +      compatible =3D "econet,en7528-pinctrl";
> +
> +      airoha,chip-scu =3D <&chip_scu>;
> +
> +      interrupt-parent =3D <&gic>;
> +      interrupts =3D <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      gpio-controller;
> +      #gpio-cells =3D <2>;
> +
> +      interrupt-controller;
> +      #interrupt-cells =3D <2>;
> +
> +      gpio-ranges =3D <&pinctrl 0 0 42>;
> +
> +      uart2-pins {
> +        mux {
> +          function =3D "uart";
> +          groups =3D "uart2";
> +        };
> +
> +        conf {
> +          pins =3D "gpio28", "gpio29";
> +          bias-pull-up;
> +        };
> +      };
> +
> +      pwm-pins {
> +        mux {
> +          function =3D "pwm";
> +          groups =3D "gpio30";
> +        };
> +      };
> +    };
> --=20
> 2.34.1
>=20

--+NZ9peSVGfDYs8bS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapGufwAKCRB4tDGHoIJi
0j4NAP9eETqlBXqwRzyrhwyDVzt50yWQOHH1koC7H2EXeyBIBgEAoRooVdgTczfs
cTzJYMPlZYMAxvSfHDJwvcWsyD0LYAM=
=mN/M
-----END PGP SIGNATURE-----

--+NZ9peSVGfDYs8bS--
