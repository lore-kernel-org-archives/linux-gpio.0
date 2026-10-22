Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694923;
	b=2TzdN9sfyVUn0ApN//RvSbJijG5Xmd9m5gOyDRU4/0fD3xqnpoiqJZsyPtZqgRd2GMG+
	 W+/VWksYvEjY4DF/hVtvYpzaiE1N9qlRasCxUVsAYqoXzng5cf7RWp9HzMWMRILIMT2/a
	 EPh7/8q+GmJMZ+cxlyTZsV54CeeRka3RDO/5D8dbsftXlX5cFXdZ0teymUqvgi8x1NPXV
	 UwcwhXY6zutz53PIdbO0PGoVbSjFGBeHCE/+6NEcKrtBR/yZAnKuAvKsI/WIgJRAWYsEr
	 KFxk0loSEfMDFbuGVJFIOdajIJevMTRFu9vi7BXgU+FP01WKeI49PqBg4HoTb0+iXmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694923;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QHM09FpIf+RN7y0dUg3rZj1s/Cb49JyGNKlNyi4taMw=;
	b=nbtW47j4WHQdqBSITCymnqSpUn+xhPTJzFWjT/6QlC2LaXtbAuNMbQEo8YXQsaUitgRx
	 fW1JLPQcntr3lboAG2bqUo3wgKAei+rhSQcr2O37iFLr+sIwQqi6q0o7FP8P0LHf6qckb
	 rUJXB6Kh5ta5MqoqRP64Gp7XzSqhCb2BPKIU926Xu3J2bwPYWPDmh9pSDHBM+shZmPKMj
	 /Z9RF4Xe8mVBrN1OxrrpcYCq8nmm7bThG18HENDnZWPQFKuVfv8Po0LMZqr588VpYL+zK
	 yPcWHFl4hsxsZW4aiHhjKBY3zHY2u/mz7oBiQyA0icXqY1qyq181rlaXNcNusph4NrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrEUmnpo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E388606A319;
	Thu, 22 Oct 2026 18:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IrEUmnpo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0A11F01825;
	Thu, 22 Oct 2026 18:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694923;
	bh=QHM09FpIf+RN7y0dUg3rZj1s/Cb49JyGNKlNyi4taMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IrEUmnpoaQNjxXxAg6VFq50onYEUBeDn0Ogk/X3Hxyr8AcqL0CTzgkkkkUs++dMmW
	 XqcUz3Aac9N+cZFX0XQmvuSimgJWfCfQzPGsH+DFrlRO7yf3ZTg0xdAV3+AE0MVAN9
	 Ea/zOGMyBTSaK0Te0xBze87YlLtVPFN3KXGUqJx00Lw0MxDq7zj/g7svPmGqTgNlWe
	 gICW9A5UP93YlXzCxg38FPVJGdflGCj8Y9tn8YwF0NZbXO/PHwz/kuah33/Q3IIY2F
	 +tY2F2Z0nk7Z/TiapgN8MSgPflEzZkbGt0mg/bHgGQ/BEQHIZ6PzKbVs5xlHRDaO6q
	 TGFnEmFIiA5Sw==
Date: Thu, 22 Oct 2026 19:48:36 +0100
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
Subject: Re: [PATCH 13/18] riscv: dts: zhihe: add A210 core support
Message-ID: <20261022-radiation-ivory-c8f9f9c66b7f@spud>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
 <20261022-a210-init-v1-13-5e438f972d24@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="iUH8Uc8l7nyP4fCI"
Content-Disposition: inline
In-Reply-To: <20261022-a210-init-v1-13-5e438f972d24@iscas.ac.cn>

--iUH8Uc8l7nyP4fCI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 03:53:33AM +0800, Han Gao via B4 Relay wrote:
> +	soc {
> +		compatible = "simple-bus";
> +		ranges;
> +		#address-cells = <2>;
> +		dma-noncoherent;
> +		#size-cells = <2>;
> +
> +		clk: clock-controller@260000 {
> +			compatible = "zhihe,a210-clk";
> +			reg = <0x0 0x00260000 0x0 0x1000>,
> +			      <0x0 0x00250000 0x0 0x1000>,
> +			      <0x0 0x10141600 0x0 0x100>,
> +			      <0x0 0x10141400 0x0 0x100>,
> +			      <0x0 0x04810000 0x0 0x1000>,
> +			      <0x0 0x05810000 0x0 0x1000>,
> +			      <0x0 0x04900000 0x0 0x1000>,
> +			      <0x0 0x20250000 0x0 0x1000>,
> +			      <0x0 0x10140000 0x0 0xe00>;

This looks very much like an incorrect modelling of the device.
Most of these should be individual devices, and those labeled "sysreg"
probably should be syscons as they likely contain multiple functions,
not just clocks?

> +			reg-names = "pll-wrap", "top-crg", "cpu-ss-clk-sysreg",
> +				    "cpu-ss-cpu-pll", "ddr0-sysreg",
> +				    "ddr1-sysreg", "slc-dual-sysreg",
> +				    "top-crg-t", "cpu-ss-ccu";
> +			#clock-cells = <1>;
> +			clocks = <&osc_32k>, <&osc_24m>, <&rc_24m>;
> +			clock-names = "osc-32k", "osc-24m", "rc-24m";
> +		};
> +
> +		clk_peri: clock-controller@300200 {
> +			compatible = "zhihe,a210-peri-clk";
> +			reg = <0x0 0x00300200 0x0 0x4>,
> +			      <0x0 0x02010200 0x0 0x8>,
> +			      <0x0 0x08400200 0x0 0x8>,
> +			      <0x0 0x00540200 0x0 0x4>,
> +			      <0x0 0x27420200 0x0 0x200>;

Same here, particularly things that are only a single word wide...

> +			reg-names = "peri0-sysreg", "peri1-sysreg",
> +				    "peri2-sysreg", "peri3-sysreg", "tee-crg";
> +			#clock-cells = <1>;
> +		};

> +		clk_aon: clock-controller@30844000 {
> +			compatible = "zhihe,a210-aon-clk";
> +			reg = <0 0x30844000 0 0x1c>;

0x1c is also suspiciously narrow, but believable. Is there a register
map for this device available somewhere (ideally in english, but I
suppose machine translation will do a sufficient job) so that I can try
to understand how this device should be modelled?

Thanks,
Conor.

> +			#clock-cells = <1>;
> +			clocks = <&aon_110m>, <&osc_24m>, <&aon_rc>, <&osc_32k>;
> +			clock-names = "high", "osc", "rc", "rtc";
> +		};

--iUH8Uc8l7nyP4fCI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatpagwAKCRB4tDGHoIJi
0mLDAQCF3l7L6GJK8DqxaRSjc/+bPAJMUnncAIj8nbTRKYClrAD9EiuXFIV8GoDh
0OKintNj/ZFsbWKsunyCnWkzx4duXwE=
=PrTg
-----END PGP SIGNATURE-----

--iUH8Uc8l7nyP4fCI--
