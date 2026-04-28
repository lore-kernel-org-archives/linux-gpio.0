Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED94132939C;
	Tue, 28 Apr 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402275; cv=none; b=UtWxhuNftFzvQ96QU/NRkwWczqs81kA1bELopOHmLsCJib/Da2zkPhJGfj4TvPgT0tdLyDc8lCzakmzb5NqQdE27+9+OQ26aHtnbcjjh5ISbNRD0hrNiVwCE2WXCxU7KCEC8IWDfknyvNGIB3UhDgnsjhzysGXaPXarlBXrClQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402275; c=relaxed/simple;
	bh=1seDTjn6972nfWjS0rEHA9YvmB2LMSwUbkkv4XJ/ipQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVQW4ovPwMb8drOnJFqpaWOfvY4KInkLT2ej/qj66IBhLG6YzLTyTM+yqo84y1sXwhMYnobGfsL9rKTiu+xrYlFFwpQcRstXKcgVXxJcr46POUIAGXFpb5PDZcjZuRI5zW5b0Pwc4EnykCdEIXfMeIE2OuWoJbxmehcvQpjQWmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGsqMJQ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGsqMJQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6348FC2BCAF;
	Tue, 28 Apr 2026 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777402274;
	bh=1seDTjn6972nfWjS0rEHA9YvmB2LMSwUbkkv4XJ/ipQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGsqMJQ3dXP21blxtK27vRWL3orDgvzaYg5b0vvG/JRAhzR4Kz9DqHk32KyhUcDB3
	 C5oU6vXj5Np3HgxMkqbU2N5jkSIkF+UP1DVflUSIXcwGDfcEiHYleMjQp3r+463PUw
	 an4Enwm8wFkHI90vonRB8OwaugryHKeuryhY65kw6WduN42Psyl4TqUjF/ucmNtnBz
	 bLrY1ndTlyAJDoztXsOHMkm8c/trO4qf9/alcoNwH68+eXwHAJyfmzJaZFUBsY/rPv
	 p2MA48sC8o1YtmCQcZsxuAqBa9JHSBy5LPJcdKwV8EKb5oG8DBh7tZPS2Jt8Ui6l0n
	 otiO/4jX5ZEDw==
Date: Tue, 28 Apr 2026 19:51:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Message-ID: <20260428-hardhat-both-1c9aa594a45a@spud>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
 <20260424-mumps-foothill-ef122c1029c0@spud>
 <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xMbyPycYGBGKvOmn"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB120229BE0DAC2658164C066AF2372@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>


--xMbyPycYGBGKvOmn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 01:28:05AM +0000, Changhuang Liang wrote:
> > On Fri, Apr 24, 2026 at 04:13:21AM -0700, Changhuang Liang wrote:
> > > Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1)
> > > pinctrl controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > +        properties:
> > > +          pinmux:
> > > +            description: |
> > > +              The list of GPIOs and their function select.
> > > +              The PINMUX macros are used to configure the
> > > +              function selection.
> >=20
> > Why is the pinmux property needed?
> > Can you use pins and function instead?
> >=20
> > Looking at the defines that you have added, it appears that lots of def=
ines for
> > the same peripheral share the same numerical values, suggesting that ac=
ross
> > peripheral, all (or most) pins would share the same mux setting/"functi=
on
> > select", suggesting that pins/function would suffice.
> >=20
> > I'd like to see some justification for pinmux being the right solution =
here, like
> > the "function select" used by one peripheral being significantly differ=
ent for
> > many of its pins.
>=20
> We think that implementing this in the pinmux will be relatively simple. =
It avoids=20
> the need to create a large number of mapping relationships in the driver,=
 which=20
> simplifies our driver implementation. I'm not sure if you'll find this ex=
planation=20
> acceptable.

I don't really see how pins + functions would require lots of "mapping
relationships". Instead of having
+/* pinctrl_sys2 pad function selection */
+#define FUNC_SYS2_UART_CTS				1
+#define FUNC_SYS2_UART_RTS				1
+#define FUNC_SYS2_UART_DCD				1
+#define FUNC_SYS2_UART_DSR				1
+#define FUNC_SYS2_UART_DTR				1
+#define FUNC_SYS2_UART_RI				1
+#define FUNC_SYS2_UART0_TX				1
+#define FUNC_SYS2_UART0_RX				1
+#define FUNC_SYS2_UART1_TX				1
+#define FUNC_SYS2_UART1_RX				1
+#define FUNC_SYS2_UART2_TX				1
+#define FUNC_SYS2_UART2_RX				1
+#define FUNC_SYS2_UART3_TX				1
+#define FUNC_SYS2_UART3_RX				1
+#define FUNC_SYS2_UART4_TX				1
+#define FUNC_SYS2_UART4_RX				1
+#define FUNC_SYS2_UART5_TX				1
+#define FUNC_SYS2_UART5_RX				1
+#define FUNC_SYS2_UART6_TX				1
+#define FUNC_SYS2_UART6_RX				1
+#define FUNC_SYS2_UART7_TX				1
+#define FUNC_SYS2_UART7_RX				1
+#define FUNC_SYS2_UART8_TX				1
+#define FUNC_SYS2_UART8_RX				1
+#define FUNC_SYS2_UART9_TX				1
+#define FUNC_SYS2_UART9_RX				1
+#define FUNC_SYS2_UART10_TX				1
+#define FUNC_SYS2_UART10_RX				1
+#define FUNC_SYS2_UART11_TX				1
+#define FUNC_SYS2_UART11_RX				1
+#define FUNC_SYS2_UART12_TX				1
+#define FUNC_SYS2_UART12_RX				1
+#define FUNC_SYS2_UART13_TX				1
+#define FUNC_SYS2_UART13_RX				1
+#define FUNC_SYS2_UART14_TX				1
+#define FUNC_SYS2_UART14_RX				1
you just define a function called "uart" and have a simple map of
that string to the number 1. You end up with a single array with the
relationships, not lots.

Frankly, pinmux just does not seem appropriate to me when it looks like
90%+ of the pin mappings for a peripheral share the same function value.
There appears only to be a rare number of cases where that doesn't
apply, but that could be handled by having them represented by a
different group/pins node with a different function.

--xMbyPycYGBGKvOmn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafEBnAAKCRB4tDGHoIJi
0uZFAQDc6TkitcowwJ7JWd4hquGJtDH8OjRFObjzwz+BsmdhqwEAjKn+QQKxLE73
SJVK2gbqIbHoREPEvyMGDMPfEaZZHQM=
=QsEF
-----END PGP SIGNATURE-----

--xMbyPycYGBGKvOmn--
