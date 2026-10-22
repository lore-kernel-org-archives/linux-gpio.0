Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792660974;
	b=HdPg3lAJoP0XUllhzQ5g50wNhYKL0flJHkWpJOx4gIyaLEKX+Sve21NosRouZOJRZG/P
	 vogAtfYVRo8CjWsrJEYA1TOhSzQr4LaeRSnA3iyWbxEG9wuvSHwlU7RPasqlBG9yebyhS
	 TXa+8Lqr8nMqYhUaExAcYFieEjfGm3jNR+D1dYQIYX0tF2CieyIuz3U6q0kvoWvDd/fOm
	 fhUmcWsd2uiqXqrMFQokM5XQNeknJtFzRK576DEYB9y4iRq0s/IrU/8d5ONljWm2XRwP/
	 x6/80+y3tZjcUpvC9negdA6egE15LOMPzYxBiaCjhJWo/3Rt+CQfgJKuHpohggOmHWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660974;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=4wmcDPWEKLBzrIxX+Ibo0uWDTHVsLEg1YsLnub8SYKk=;
	b=oGWbxtqFwxCAQ1UuRW/KDskq+01LTgwRvzxdFY93om8N7NEpnKt5JEAIHeFALsYi8EQJ
	 oHWLmlHhJcx75YLF7TzAnW4OE9A7PvMLFKLzfPTurH9oQgdtdPSm61Ygtu1FExkyPS13i
	 JHNDu0VHHK7ptwOV25Sua3pza43sHdFmGdUn/qT6GMsbJ5J0s3BfNDjNjfPLZUfg6bqox
	 OKi1bI+wJgNVVK/9ojUsV7xPCZDIqfEa05767WEFvhvrptFGgN6KSrTP+gPD6HUcpPjvD
	 GiSWCmDBXiW9/VXHbm0E6p7UPC2/oBKjfqTEOifJghaCXijkxJq3DpuKxqDeDpBcGNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DoGzN0Vd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768DB606A323;
	Thu, 22 Oct 2026 09:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=DoGzN0Vd
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 702952004FF;
	Thu, 22 Oct 2026 11:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792660971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wmcDPWEKLBzrIxX+Ibo0uWDTHVsLEg1YsLnub8SYKk=;
	b=DoGzN0VdYhpldqdi1+jz3OLnJPSPBDW6+JRbBvThzUgPuMdkhOQp6tpedhuDd7SUVh3elc
	fMMabeWe1g8WjTDHf56FZ38Q9uHEwHCu9U65sQhrAD3JyWOmCjBkuBbxEs8OSdrdVjfgst
	56vAZ9rXpJ+82xyjbPmGGKZfPzB5jwYj7Y0wBYewZwAAZ3hrjpod5FF+av1SMZySTYHD1R
	USMPWCS9XVQiGGhETKvlKgPydypyG/Kz0/wPvkv7hYCw4atPBGJvVJ6R5BfFAOn9V56Ikx
	N237xCVoQd5yJEb2B0nVdc+VDpAb8/aLc4RDd4aXU+//uK1aMjuTVprMDbUh1Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792660971; a=rsa-sha256;
	cv=none;
	b=GoYrNGzPnyZ80vQRqYm1ZdPrusvwI0iwA/D/e+tLVzpBo67HEqm4NULHNbRP6mIHdU6I13
	Zw+VjX2D3c7GcQWQ2HfphXbiqiWXSfJ8t0yZlRVIYAtp5S1qe4dxWafEAZo60rj7FO2BA7
	lIctvFrRGTtmxAvafcURsF64W1qu+qyLy0u9QDKuzmiQnyCOKwhT1KJCFwWC5g2RkDV+jc
	xBqveLsQXYXXUfmjrT0QjyKl+udzM8tMuZqXLfudWGYoJjpir8XW68Da7rwQBG0Ue1eObE
	GeZ/pkS+G0+D4chqyV6Eyjwo9ctjbr7ELgNhZ4sXLNOGsOVuerhsQiPRZ38VLQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792660971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wmcDPWEKLBzrIxX+Ibo0uWDTHVsLEg1YsLnub8SYKk=;
	b=DFxMgagx3VDAvleH0DdLcAiesq/JJe8gxfeFnhPYLtAHu7tEyyyvFSiYgWmnzlr/hoWOym
	dG6BxplaEByLQzBLjoANNbWbT2NxTt1QkviLMgt644ty+rWXKVSoloqUTihCw9GQgko1Sf
	uHUFmuatBvcFLc6Kbhx+mnvQAjQIXip+24zGQeW2L7N7O+W30ttoHwAyeINbLyxfDYkVOm
	F0e40HVUpWom7ZM9i3oh1ukfmACay2y7dbL9xrtJauc50kTjv0/vuOC26ObD773IwApaCt
	NcCb75Db5ojo4VD2A0e8T1wKXazqQAQTNw3HyBw/uHpPIZxeSeO1tciYK9HcLQ==
Message-ID: <ef0957a4ceaf754989f8a7132cb6276686244d24.camel@pengutronix.de>
Subject: Re: [PATCH 14/18] riscv: dts: zhihe: add A210 UARTs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley	
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu	
 <zhiguo.zhu@linux.alibaba.com>, Stephen Boyd <sboyd@kernel.org>, Brian
 Masney	 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Thomas Gleixner	 <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Samuel
 Holland	 <samuel.holland@sifive.com>, Daniel Lezcano
 <daniel.lezcano@kernel.org>,  Anup Patel <anup@brainfault.org>, Icenowy
 Zheng <uwu@icenowy.me>, Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Date: Thu, 22 Oct 2026 11:22:51 +0200
In-Reply-To: <20261022-a210-init-v1-14-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
	 <20261022-a210-init-v1-14-5e438f972d24@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-10-22 at 03:53 +0800, Han Gao via B4 Relay wrote:
> From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
>=20
> Add the ten A210 UARTs with their clocks, resets and interrupts, using
> the snps,dw-apb-uart compatible.
>=20
> Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/zhihe/a210.dtsi | 150 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 150 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zh=
ihe/a210.dtsi
> index bbad51a3edb0..a07b67d10633 100644
> --- a/arch/riscv/boot/dts/zhihe/a210.dtsi
> +++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
> @@ -405,6 +405,66 @@ rst_peri1: reset-controller@2010400 {
>  			#reset-cells =3D <1>;
>  		};
> =20
> +		uart0: serial@2014000 {
> +			compatible =3D "snps,dw-apb-uart";

Prepend a vendor compatible if you need two resets, similar to
"starfive,jh7100-uart"?

> +			reg =3D <0x0 0x02014000 0x0 0x400>;
> +			clocks =3D <&clk_peri PERI1_UART0_SCLK_EN>,
> +				 <&clk_peri PERI1_UART0_PCLK_EN>;
> +			clock-names =3D "baudclk", "apb_pclk";
> +			interrupt-parent =3D <&intc>;
> +			interrupts =3D <321 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-io-width =3D <4>;
> +			reg-shift =3D <2>;
> +			resets =3D <&rst_peri1 PERI1_UART0_PRST>;

This looks to me like it should be

			resets =3D <&rst_peri1 PERI1_UART0_PRST>,
				 <&rst_peri1 PERI1_UART0_S_RST>;

instead.

regards
Philipp
