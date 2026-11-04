Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836202;
	b=xSg0NRE789IUAJhYtM4uO8mh2i86kH9+CzUpyCTox1iinEYYSoMy4sAWvLL3XlTH0L4M
	 DGjuG0fY71riPfq0aRWAVXrL1kR1E5ZU7Usvpdwi9ahSkXW5838oQHGZirHwxpeOBBbXD
	 2xE6J7azSYIVXbeWh1bZv1i+2ViEpI6vanPBPnVKkkw0HHCEYeSXdNrageS4WecIzTBW5
	 b47ndExHb1DTWKMnMel41OLyHhN3u1u61HG9iade+n9U4eXzmWdXdBX0AUHl3HkxgNsyp
	 oO0PtCOGHbgGN9SkSDk9jwVS2ANe1l0m9GBiFQxHokSXOBpmYixbPiCgybtbC+BsZBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836202;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iDu3o6juv8Uod0hoihtHeFVep74g4tQbmc/uasmupfA=;
	b=qHLOkricn2C95wQ/TrCiLRuHi6ieHvvflRTek/BzR++vmk1m62IUle2OM/NEr7FgQuil
	 ynY4G+6aW39hdxkOD1u+3jtRd2d1L0og/EdYxK4Ol9VsdVT93AiZpepyfHep4bnC2g4gX
	 7wE3oQsoGf312LMelQd6pR8fbeG531x79/DVtlTfbcoLHJzSJfqWLJKkDIM+RxZsCe8TV
	 O6vB7xSP/wzHtRCZWb939W9fUTPDz4h1CCFytlJx9cY339L378jozyc44tLqS6btIWHEa
	 1BabsiQugBmUq+wFbH8IQtgXVpPorD/SRlBNfTokU8voC1lLSpLnaI6I3lqop/k4BEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GMSlrRMb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67CA606A32D;
	Wed,  4 Nov 2026 23:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GMSlrRMb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6401F00919;
	Wed,  4 Nov 2026 23:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793836201;
	bh=iDu3o6juv8Uod0hoihtHeFVep74g4tQbmc/uasmupfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GMSlrRMb8du0nBh3vRwOpVbv3pShKCI0Veuh8uYYhW1x7WiqEfvLBiloIYLrjvtnE
	 MJWfzL/PVi3lLWOuX1mqKMFHG6TrVAgvieve8DaUN9y0nthxAPmgxF42+6cmyX7E5y
	 7SIR1LPXoUvIyP5IIStffPeVNtAtlxljFM5rXCy1ncivAF/dfFiI9G/s2WBFLlmo4s
	 PFoWj3X+NZueDAQx4faXggtSh2SsgHPQtuEcLwzlyz+cplCb2JNeo+1XWNWqt4hDwD
	 i3UCfETNP4aGgMDbvAQadE1unjEgS51JrNmR2ONZxfAW/0qtNYUtYmqd83B86+aJOx
	 yrEfG5fR1VDvA==
Date: Wed, 4 Nov 2026 23:49:57 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add Siflower SF19A2890 pin
 controller
Message-ID: <20261104-enlighten-handling-a309345b229a@spud>
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-1-4bb83afdbacf@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="KgwtC2W00/4Cv3bY"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-pinctrl-v1-1-4bb83afdbacf@telaak.dev>

--KgwtC2W00/4Cv3bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:21:17AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The pin controller of the Siflower SF19A2890 selects the function of
> each of its 49 pins and sets their bias, input enable, Schmitt trigger
> and drive strength. Each pin has a register pair of its own, and each
> pin state node holds subnodes that set some of its pins.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  .../pinctrl/siflower,sf19a2890-pinctrl.yaml        | 113 +++++++++++++++=
++++++
>  1 file changed, 113 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/siflower,sf19a2890=
-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/siflower,sf19a289=
0-pinctrl.yaml
> new file mode 100644
> index 000000000..8b52d3175
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/siflower,sf19a2890-pinctr=
l.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/siflower,sf19a2890-pinctrl.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower SF19A2890 pin controller
> +
> +maintainers:
> +  - Joseph Telaak <joseph@telaak.dev>
> +
> +description:
> +  The pin controller of the Siflower SF19A2890 selects the function of
> +  each of its 49 pins and sets their bias, input enable, Schmitt trigger
> +  and drive strength. The GPIO function is selected through the GPIO
> +  controller, which maps its lines onto these pins with gpio-ranges.
> +
> +properties:
> +  compatible:
> +    const: siflower,sf19a2890-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      A pin state. Each subnode sets the function and configuration of
> +      some of its pins.
> +
> +    patternProperties:
> +      '^pins(-[a-z0-9]+)*$':
> +        type: object

> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        allOf:
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml#

Same format should be used for both of these.

> +        properties:
> +          pins:
> +            items:
> +              enum: [JTAG_TDO, JTAG_TDI, JTAG_TMS, JTAG_TCK, JTAG_RST,
> +                     SPI_TXD, SPI_RXD, SPI_CLK, SPI_CSN, UART_TX, UART_R=
X,
> +                     I2C_DAT, I2C_CLK, RGMII_GTX_CLK, RGMII_TXCLK,
> +                     RGMII_TXD0, RGMII_TXD1, RGMII_TXD2, RGMII_TXD3,
> +                     RGMII_TXCTL, RGMII_RXCLK, RGMII_RXD0, RGMII_RXD1,
> +                     RGMII_RXD2, RGMII_RXD3, RGMII_RXCTL, RGMII_COL,
> +                     RGMII_CRS, RGMII_MDC, RGMII_MDIO, HB0_PA_EN,
> +                     HB0_LNA_EN, HB0_SW_CTRL0, HB0_SW_CTRL1, HB1_PA_EN,
> +                     HB1_LNA_EN, HB1_SW_CTRL0, HB1_SW_CTRL1, LB0_PA_EN,
> +                     LB0_LNA_EN, LB0_SW_CTRL0, LB0_SW_CTRL1, LB1_PA_EN,
> +                     LB1_LNA_EN, LB1_SW_CTRL0, LB1_SW_CTRL1, CLK_OUT,
> +                     EXT_CLK_IN, DRVVBUS0]
> +            minItems: 1
> +            maxItems: 49
> +
> +          function:
> +            enum: [i2c0, jtag, mdio, pwm0, pwm1, rgmii, spi, uart0, uart=
1,
> +                   uart2, wlan]
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          input-enable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          drive-strength:
> +            description: Output drive strength in mA.
> +            enum: [6, 9, 12, 15, 18, 21, 24, 27]
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
> +  - reg
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pinctrl@19e3fc00 {
> +        compatible =3D "siflower,sf19a2890-pinctrl";
> +        reg =3D <0x19e3fc00 0x400>;
> +
> +        uart0-pins {
> +            pins-tx {
> +                pins =3D "UART_TX";
> +                function =3D "uart0";
> +                bias-pull-up;
> +            };
> +
> +            pins-rx {
> +                pins =3D "UART_RX";
> +                function =3D "uart0";
> +                input-enable;
> +                bias-pull-up;
> +            };
> +        };
> +    };
>=20
> --=20
> Git-155)
>=20
>=20

--KgwtC2W00/4Cv3bY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvEpQAKCRB4tDGHoIJi
0m3RAP4tSduLHcc635vQclYVe+5c6OHsdsBCcyeckcRxYRXQLAEAulIzFqe6YIT5
1weZtglDmHFBdAYOuT+M6UQeOSUZkgs=
=zMQ1
-----END PGP SIGNATURE-----

--KgwtC2W00/4Cv3bY--
