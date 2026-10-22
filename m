Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695059;
	b=5NuIof5M+SnGkEJEuFf9yemu4bxpFzXIyJe+KlzBjyDgvuVy/CCeHbaT8suhvWyN3wO4
	 hJ86XxMVHGsXY3wzR4uoMndACBfiqaYWgv9ge/Nxdj7sawnlSHLEad9Q86po7M2lO9reg
	 e29Wd/IncB/i93JnUvNAZxo6MtywxOgqQ2uVUAJZjOrEq7biNVaeCwOJB01zT9q3SPlRs
	 sTC7voWpBlPmB8T+Pk4XtktURYsExk2w8bJu6Q29GZZaXdLk5vY33XRYNI2D+XbGUCsUJ
	 CWuEhGZQiW8dG3LvdL1ha1TOnac8XWkh0zzZgozfdUt4YRs0BAZnIh/LspPQlsaMQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695059;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LGkffLqIi4CCplhNQsGE6qWrcEYnr0An5Jc/0inVaQI=;
	b=A3v0dpUTq7Ys8sYh20uZkwR1MIrDRNe/BA8bo91fCeGWKXwGIs4rFJ0F4lMjckIzVtgs
	 c3uLgyEo6tcum1tdhTE9DDvM6+jLb+65Qd3PHzSR3mzs5TYUnl8GKmbanHKEP2c78mppO
	 bhjSQfZQM74CtYn5k6/K71gxDZn0VASrFU8HVtBk6bW0ECl/MYR9HPucXjUjGSwypdyky
	 I+ufEIqQhEG6a1rQMFStC9Av36hgme2TT+clQV2NUxGbwXZA8DpE2HnrtIdCSgduz1RBz
	 4AMKsVDknGL2z71lkeO0x7kDd0abT8bngkr4yo/yU6bFxMHd9bxU6eYKT66nu5NAcWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1BshVGv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404CC606A31A;
	Thu, 22 Oct 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F1BshVGv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C681B1F01828;
	Thu, 22 Oct 2026 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792695058;
	bh=LGkffLqIi4CCplhNQsGE6qWrcEYnr0An5Jc/0inVaQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F1BshVGvR8sQaABlsf9t1xJQxtCJRbhU4Jlyss7KVQk78+JLi2m6uf7JmtF1XfCpF
	 z/jMEJFpXRC8RaAidcMbHklA0/v8AjbTJEbWQv4CA67Ebub1rVZ4ZlaVCYEJOrvQVS
	 4thyCjijB6OKNVBm+kVfZam79mkRz1NfelMtC2noV+WaA6SqH1IwTrvIh3345oRvX0
	 6RUYIRbDzCVBRTVoy9QTN2ngiAdPEliBMGkgX0MJxxPBiUr8J4TsOTMmGmOhVoLvmx
	 5GC+O6q6WkCPI5xXNUjyGusQBgSAdZAMRmuFpmva+JN96oqRZG/tLI0DqytmK5H7bT
	 /IkGU7ClH3t1Q==
Date: Thu, 22 Oct 2026 19:50:51 +0100
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>,
	Drew Fustini <fustini@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Message-ID: <20261022-concrete-rebound-593001f1ac18@spud>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
 <20261022-a210-init-v1-17-5e438f972d24@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="W6zy+wXyS25k0uQT"
Content-Disposition: inline
In-Reply-To: <20261022-a210-init-v1-17-5e438f972d24@iscas.ac.cn>

--W6zy+wXyS25k0uQT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Enable A210 platform drivers and reserve ten 8250 UART ports.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 04ae305d5511..b9b3bca12089 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=3Dy
>  CONFIG_ARCH_SUNXI=3Dy
>  CONFIG_ARCH_TENSTORRENT=3Dy
>  CONFIG_ARCH_THEAD=3Dy
> +CONFIG_ARCH_ZHIHE=3Dy
>  CONFIG_ARCH_ULTRARISC=3Dy
>  CONFIG_ARCH_VIRT=3Dy
>  CONFIG_ARCH_CANAAN=3Dy
> @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=3Dy
>  CONFIG_KEYBOARD_SUN4I_LRADC=3Dm
>  CONFIG_SERIAL_8250=3Dy
>  CONFIG_SERIAL_8250_CONSOLE=3Dy
> +CONFIG_SERIAL_8250_NR_UARTS=3D10
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D10

Why are these options needed?

>  CONFIG_SERIAL_8250_DW=3Dy
>  CONFIG_SERIAL_OF_PLATFORM=3Dy
>  CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=3Dm
>  CONFIG_SPI_SIFIVE=3Dy
>  CONFIG_SPI_SUN6I=3Dy
>  # CONFIG_PTP_1588_CLOCK is not set
> +CONFIG_PINCTRL_A210=3Dy
>  CONFIG_PINCTRL_TH1520=3Dy
>  CONFIG_PINCTRL_SOPHGO_CV1800B=3Dy
>  CONFIG_PINCTRL_SOPHGO_CV1812H=3Dy
>=20
> --=20
> 2.55.0
>=20
>=20

--W6zy+wXyS25k0uQT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpbCwAKCRB4tDGHoIJi
0kOtAPkBzDzMgoDcB+YT1aQaWGHqAvUG/4okRxElvImnJUQklQD/RFE4ty3vJOWE
p8DrbgDvh7Xy5rvb+724fcYiBIaWXwU=
=58in
-----END PGP SIGNATURE-----

--W6zy+wXyS25k0uQT--
