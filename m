Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B14AF668;
	Tue, 15 Sep 2026 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490554; cv=none; b=umLPlZrXuI7bddEfTs9pV3xBvmBpx9X2uXcbI7mJfyP2+XVVmvG2tC4cy6tz5SQYp6lcHf9XIX3qJqDAykEO27a3W1YkgUXgq1GHA3nAwPXn9uktDHBJl6aEOFOF9wRqWB1wSN0iVH1uhwnyAV637T8vNfvu6cQn5t/eL4Nl1oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490554; c=relaxed/simple;
	bh=Ue9CfM2cM/e7/nG3pd2kja0IfM/sz2XJki7tnukuyIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNW0uq0mKBG3qg/Q8w8vueRut251NyUdiQJa1xZ3Q5Cr0DzdFmXNQ25FyIGDqsOz4TRvZ5Dc6eWeMsXO5NzWG1DQJP4Azx2ROEV9jKekXl5XzLWENZ+xHXNGkS2N08adiS6wJ5OYTiohVXyc1A4qDu/6bDDzyoXkkOl5iehRlxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHQek1PZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHQek1PZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CC11F000FF;
	Tue, 15 Sep 2026 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490552;
	bh=i6jsPo5fwev65b4NIMnO5ERApuAIGgRbQ0AN2m9i3uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHQek1PZMCXO4RAGz0FVnULnLo0uXBSIZ5MfQSiWDcff+/hxrNKg1Rwe4DdqcAzpB
	 J7UQXOdUFmrI+jjY9zzKgUaqcWYYa02OJxhAagC1rAkCEmMUgEFldqJrzqIuqZEX7w
	 7VWdeLlNp4uKc4Q+lxIMLnIzptGLUqu4h52xkmiqSAOk/p8OraZhEqg1R6xqG8Jqms
	 1hdLgh6QSCbU4I7qmmuhmwvbyAzKV+XBJOwV9u5DizMko/wH00A+w/u/UJecldixPO
	 0bUzp6p1DcTJMvH4to/gyw48371JNVutfF8EsrAw6Wn34ScwvliD2V7fgts4ylQXDV
	 ucq5S2t3HCSlQ==
Date: Tue, 15 Sep 2026 17:42:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add CAT9532 GPIO
Message-ID: <20260915-mystify-overvalue-89148836a662@spud>
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de>
 <20260915092046.931449-2-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iGmJa6SPxZxOcb6N"
Content-Disposition: inline
In-Reply-To: <20260915092046.931449-2-alban.bedel@lht.dlh.de>

--iGmJa6SPxZxOcb6N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:20:45AM +0200, Alban Bedel wrote:
> Add devicetree binding document for CAT9532 LED dimmer as GPIO
> controller.
>=20
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>

Some very interesting comments from Sashiko here, about whether this
should be handled in another subsystem.
At the very least, valid commentary from Linus.
pw-bot: changes-requested

Thanks,
Conor.

> ---
>  .../bindings/gpio/onnn,cat9532.yaml           | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/onnn,cat9532.y=
aml
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml b/D=
ocumentation/devicetree/bindings/gpio/onnn,cat9532.yaml
> new file mode 100644
> index 0000000000000..6f3e3d0f4f29b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/onnn,cat9532.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/onnn,cat9532.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: On Semiconductor CAT9532 LED dimmer as GPIO controller
> +
> +maintainers:
> +  - Alban Bedel <alban.bedel@lht.dlh.de>
> +
> +properties:
> +  compatible:
> +    const: onnn,cat9532
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  ngpios:
> +    minimum: 1
> +    maximum: 16
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - ngpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        gpio@60 {
> +            compatible =3D "onnn,cat9532";
> +            reg =3D <0x60>;
> +
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +
> +            ngpios =3D <16>;
> +        };
> +    };
> --=20
> 2.39.5
>=20

--iGmJa6SPxZxOcb6N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql1dAAKCRB4tDGHoIJi
0taLAQDJHhik3hB4ouZCZ09zJj+Qm+KDFRZmgjoIr0amyD0qmQD+Jviyu9yXvr3o
b6ZbJhmg5QxdeSl3d8uZIP3UW+Qx7A0=
=Ec3f
-----END PGP SIGNATURE-----

--iGmJa6SPxZxOcb6N--
