Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646717;
	b=ZOoRy29AeixTPYPUKDstlYXySlrXSmTmC25N8Hpw66TfdPlXnpOYdfNIWr2fMftxQwkq
	 3iXgWYzYlp4rTeyohCJn02iz91bdCKLw+q6wzdVV/OZlpbD8zuuOu8gVcbARODIraqMxw
	 REc8Uv1ZjGrv6vLfubY4Y2P7TxdNs3hieAwiWv2fNT1zajH4GokOFBNz1lwkXjpe72teS
	 fsKOhVoo0Q2Iwu8r+tSeZfn/d2TqSz7Yh1eUZlPrskKJ7epQudiTwvm8/olyZEh1lIIxA
	 uFAgTWdFgCwWaRg+vbnEYyL9zrj7VYbnU8NO/hD1X/Y6EKoSr8idcm5g66Qiu/H4/kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646717;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AgYWzVkrd0FAA36W9FOipwPtzV7qJco9n4AtSE0Qekc=;
	b=t6pSg8PPARkG19BUx/4J75jZpwILNE57l4rCktDfAEiwFYm7TsFRJsCRP2c/7ifxv5j7
	 Bo8lQLtJg2slsOYxw39fAGUzFXgz7oUFcmj5lkcel9WY83+/p9tLODn42F+Qb4VHeBbv8
	 FQaFwNQqwtx6jqg7xkwhGVQN7W2KS9n/07YxHlYQKSi7knO61buspD4VKUec8uKZfUGtt
	 IotyH1dPHPaiZ53SodaBC5lmrxsFtcuwgDABvjmn5kCU1gGTQcPfBmraHUzsUdW4vdQiQ
	 WXQRCRkkxiLfwv0vL9UeWpCUgDrUxko/ewl0MUj2WqfzwnNpw3F37tG64r2zG9nTncw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSRZODUK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242FC606A33B;
	Mon,  2 Nov 2026 19:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CSRZODUK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A077A1F00A16;
	Mon,  2 Nov 2026 19:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646716;
	bh=AgYWzVkrd0FAA36W9FOipwPtzV7qJco9n4AtSE0Qekc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CSRZODUKiphAyBEKGfeVwgnNBvUueO5U6sCBRCmxRs67dyjtWJTfBCLDQAuhqm0L5
	 iJmYwfHwfYLIIOjFVr8YK3uMncDHOO1huqnoGMYLsfWhO4pzkbbBssdyyfiroon+fg
	 avu6VfYlpaFzex4ztPnRoTqh6TRLTY9WkkhUZSYDSG38hIjVQW3E4L/5L9rD+mWwyK
	 mA1Qia9mYcHjT7ikcZc+4vCuFPzcbjB1/dpLMAgCbcPJ/eV1MAJDee7kOO/44HsVvz
	 TZeyfJH5UVInpRn5wMxZjuxayvuzK7DQ747dN32zRg5hEzGLRFz+c5dLoETU0PRQMw
	 QD2GavBw5SSMg==
Date: Mon, 2 Nov 2026 19:11:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: gaohan@iscas.ac.cn, Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Radu Rendec <radu@rendec.net>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Message-ID: <20261102-conductor-expanse-db86270fc1a6@spud>
References: <20261022-concrete-rebound-593001f1ac18@spud>
 <20261102142300.3784622-1-rabenda.cn@gmail.com>
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
	protocol="application/pgp-signature"; boundary="Gquej4m2ddx2wa7L"
Content-Disposition: inline
In-Reply-To: <20261102142300.3784622-1-rabenda.cn@gmail.com>

--Gquej4m2ddx2wa7L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 10:22:53PM +0800, Han Gao wrote:
> On Thu, 22 Oct 2026 19:50:51 +0100 Conor Dooley <conor@kernel.org> wrote:
>=20
> > On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >=20
> > > Enable A210 platform drivers and reserve ten 8250 UART ports.
> > >=20
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > ---
> > >  arch/riscv/configs/defconfig | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defcon=
fig
> > > index 04ae305d5511..b9b3bca12089 100644
> > > --- a/arch/riscv/configs/defconfig
> > > +++ b/arch/riscv/configs/defconfig
> > > @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=3Dy
> > >  CONFIG_ARCH_SUNXI=3Dy
> > >  CONFIG_ARCH_TENSTORRENT=3Dy
> > >  CONFIG_ARCH_THEAD=3Dy
> > > +CONFIG_ARCH_ZHIHE=3Dy
> > >  CONFIG_ARCH_ULTRARISC=3Dy
> > >  CONFIG_ARCH_VIRT=3Dy
> > >  CONFIG_ARCH_CANAAN=3Dy
> > > @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=3Dy
> > >  CONFIG_KEYBOARD_SUN4I_LRADC=3Dm
> > >  CONFIG_SERIAL_8250=3Dy
> > >  CONFIG_SERIAL_8250_CONSOLE=3Dy
> > > +CONFIG_SERIAL_8250_NR_UARTS=3D10
> > > +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D10
> >=20
> > Why are these options needed?
>=20
> The A210 has 10 UARTs and the TH1520 has 6. With the default of 4,
> UARTs beyond the 4th don't get a fixed ttyS index and end up in
> whatever slot is free. Raising both to 10 keeps the index stable.

Put this in the commit message please.

>=20
> >=20
> > >  CONFIG_SERIAL_8250_DW=3Dy
> > >  CONFIG_SERIAL_OF_PLATFORM=3Dy
> > >  CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> > > @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=3Dm
> > >  CONFIG_SPI_SIFIVE=3Dy
> > >  CONFIG_SPI_SUN6I=3Dy
> > >  # CONFIG_PTP_1588_CLOCK is not set
> > > +CONFIG_PINCTRL_A210=3Dy
> > >  CONFIG_PINCTRL_TH1520=3Dy
> > >  CONFIG_PINCTRL_SOPHGO_CV1800B=3Dy
> > >  CONFIG_PINCTRL_SOPHGO_CV1812H=3Dy
> > >=20
> > > --=20
> > > 2.55.0
> > >=20
> > >=20
> >=20
>=20
> Sent using hkml (https://github.com/sjp38/hackermail)

--Gquej4m2ddx2wa7L
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaujgdQAKCRB4tDGHoIJi
0jPcAQDKI8weKUpx73/mvAz55ZSZJ2tWU0Rex9ydvDyirhyY6AEAgAFedfAkbkLn
qFuD39PtQFQgsFubq8Zyvj5bZZDhNQw=
=TAKE
-----END PGP SIGNATURE-----

--Gquej4m2ddx2wa7L--
