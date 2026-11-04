Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836024;
	b=M5bHUiw/9D8sMV4AI9Xgn5CjZf7T+gwQeGbIdk2ZVr94v5TzPn6G1ySwnMHl0qf3Z2A0
	 84/2tixCAqhkU760vc2D2uGP3N3uBnpqQhUwRFcSoczmcOVuKq9TtIpj1SmkLXw3emyrg
	 MqXttJ1mNjZtKKP1YpqrotpP5hKI5EEjUC2qdHVPu5oaoAtWZ/MmfEjpbAGJQwpl+HbaU
	 5dwqWcqlyq2ZuZvb7lcdfNpiKlbRYltgpNBiD0SrhFfkl7r/74XL/Uv3yD+VSIHs6Cb/i
	 3bwxVZR5D8fnnvV8kndP5mBNdf7QG5DWUlHx2ysUBl5AdKy1bEDU0I1X05dCcyV5Pzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836024;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ybn1U4ck4SXPPg0/2HE2JPN2c6fPoDZjnz2lKASv9Gw=;
	b=ssuhS0iwNWhRpxH+oL4wBfnv/RvSTO/f6m3qCRntuKBE6n6NS1fTPyp5+NFg1mwIC9u5
	 XKjqy+6KAVPurloKszcXAyqTKpBK/4OX+JE9bFk59OmHyzZfjPxZgdjlMebZoDmDAHcQk
	 3gdeIEivnyUeZPAl4PV2KEJNy3L0H9y99T1bmv7c69G0RLnaEy1pvzO9Nx880L+zDpm5E
	 JKHBPj2FjDS7D6IihJG5kVDAjIHZYzd6tkvnqP6WtJoMr6I9asHB16fVx7/mGOvSxKcq0
	 iO9inTGkMqt8XH27SfLJbd+4uJt2gb/u9GEQcm2zCD8iGJm2USZQgflzUuZt0Wz282w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjGtR966;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F52606A31B;
	Wed,  4 Nov 2026 23:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EjGtR966
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5491F000C1;
	Wed,  4 Nov 2026 23:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793836024;
	bh=Ybn1U4ck4SXPPg0/2HE2JPN2c6fPoDZjnz2lKASv9Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EjGtR9666Gthy0HNXpBo2D0K7UWgNef9bYb34g72ci+M06cNmWMdOE2ChuRb1iKws
	 HIy7vWx/l2UPx9pF1IZY1FQLvuPt9uDT4Qqa1h4Bk74ozloxpije2J9rHVPOQjO5oe
	 gUZdPJQHu6G+3RyKnekvxVfLqr8de5lYagpJobyEFvFM7oHI8qjJIQ202oFaHJaTsN
	 yIh2bkuRCdvIYsglSpXJtxKqleS7doC7NVyMAGkz7vKVNR61+JYrtSKOqFSNQP9qLZ
	 sIXaHrqwYfK3j7eTlSZtB40PVTazRJEsYMYSt5i+hXRagWVHc3LTDxxDtyDFBSZ85Y
	 0snuA1PB5AOYQ==
Date: Wed, 4 Nov 2026 23:46:59 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chuanhong Guo <gch981213@gmail.com>,
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO
 controller
Message-ID: <20261104-judiciary-fool-05c4157a7cc7@spud>
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="8lCGnY4rd1pPxcek"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev>

--8lCGnY4rd1pPxcek
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:21:37AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
>=20
> Document the GPIO controller found on the Siflower SF19A2890 and other
> Siflower MIPS and RISC-V SoCs.

FYI, these other devices need their own compatible strings when a dts
for them is added.

>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; Joseph Telaak as the binding's
>  maintainer, GPL-2.0-only for the deprecated GPL-2.0 SPDX identifier,
>  example indented by four spaces, commit message, subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  .../bindings/gpio/siflower,sf19a2890-gpio.yaml     | 84 ++++++++++++++++=
++++++
>  1 file changed, 84 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gp=
io.yaml b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.ya=
ml
> new file mode 100644
> index 000000000..6708d92fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/siflower,sf19a2890-gpio.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/siflower,sf19a2890-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower SF19A2890 GPIO controller
> +
> +maintainers:
> +  - Joseph Telaak <joseph@telaak.dev>
> +
> +properties:
> +  compatible:
> +    const: siflower,sf19a2890-gpio
> +
> +  gpio-controller: true
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges: true
> +
> +  reg:
> +    maxItems: 1

Move this below compatible.

> +
> +  interrupts:
> +    description:
> +      Interrupt mapping, one interrupt per 16 GPIOs.
> +    minItems: 1
> +    maxItems: 10
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  ngpios:
> +    description:
> +      The number of GPIOs available on the controller implementation.
> +    minimum: 1

With no maximum?

> +
> +required:
> +  - compatible
> +  - clocks
> +  - gpio-controller
> +  - gpio-ranges
> +  - interrupt-controller
> +  - interrupts
> +  - ngpios
> +  - reg
> +  - resets
> +  - "#gpio-cells"
> +  - "#interrupt-cells"

Please fix the ordering here too.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> +
> +    gpio@19d00000 {
> +        compatible =3D "siflower,sf19a2890-gpio";
> +        reg =3D <0x19d00000 0x100000>;
> +        interrupts =3D <GIC_SHARED 246 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 247 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 248 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SHARED 249 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&gpioclk 0>;
> +        resets =3D <&gpiorst 0>;
> +
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        ngpios =3D <49>;
> +        gpio-ranges =3D <&pinctrl 0 0 49>;
> +
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +    };
>=20
> --=20
> Git-155)
>=20
>=20

--8lCGnY4rd1pPxcek
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvD8wAKCRB4tDGHoIJi
0hmLAQDFn8AQyWFbVtBLNfA/Jk6Pl5eG57rfoCu+xDzAklKXIwD/T2QiMRx1gfAx
FLiy0lgH2wbO+h+sOgGTGVqK4xS6Bwg=
=VE47
-----END PGP SIGNATURE-----

--8lCGnY4rd1pPxcek--
