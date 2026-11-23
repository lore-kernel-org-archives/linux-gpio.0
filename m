Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430177;
	b=hCuae8pMP6F6kqwTdL838Qgn6ymJwwszl3Z2W6W8dAdCxAs615jfISaiUx8meDVb/077
	 K2D+2kzg0dGP7Kadwdl2265oU1ETkw02meQF4eL+Cb94NT75jId5x/JX/WcPF3N1Xhwel
	 JHYgMmDMNGSqfKgOIlu2SdISxLwLPScYqEby0WllOOWRdc2CdfEzuSdm8xpRX/mCJi6qD
	 pBCxaSXlTlVksUNxmClR8oA5nTMJRn/6m9RW8DWh6HyAaXmFkQay6mAQvcVpYMIXHhLea
	 DHLp99bqYprbN0jKamb1Pom8qblJ0Cm/jkW0y280kStaGaHfaBnx+U5BJh3RABhPMJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430177;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KVAwAmpRSmknIyClKub1M0gfNyqLqu3C1IfFJjeNKqg=;
	b=4OBkO6PbPghRtemqc25tTb2dCMldBmqYepzSwCydYjstbknh0tfGQ2EqPpiHV1SVlj9m
	 JAqgdvmGMghtscaBBPqt2lQu8l8LVi0GhrK4n/9pzqUoIlzwE+IIlp7IGKvj+R6zTx6dm
	 GB5BOOpPOpfZXvj/HGY5jlYZSG4orsRQsf8lnGDSErfP9kGO/tmdkBauuXkflpG5rz2Da
	 yvVymlDpM47dyjrY2l1nm3Iv9LJmpweHByiLaOiEVXw6Bb9gCDfUoHz3+r20uw0reh2v+
	 uKcaEjaPC8apNy2OEz8MFy2MsV1LyQdRf6DgD4N2irrtO3wvFoAwYKq2MYoppPF4caA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJDj6yV5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37ED606A31A;
	Mon, 23 Nov 2026 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJDj6yV5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64CCF1F000CF;
	Mon, 23 Nov 2026 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430176;
	bh=KVAwAmpRSmknIyClKub1M0gfNyqLqu3C1IfFJjeNKqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NJDj6yV5Kqnr0nqj5198k/VbhCfX8/6rBbAUmZDNrc6V1L7pCIsUncqFhtGiUS62T
	 BO4D9BcDIlgbOF5gPfuC4FShYUISn70oRGgoOVnpdZki7NP6hhcwTu6LogDo+o+/l8
	 WxLFN2UzSVyYnmsdqaFuM5sHsjxZw4tcQlIV5IJJdjkSg1aWcNpJ5wED7hpnLytwYt
	 CJvM8LnzKGny2rIjM/pF2Ayt/Zi/nGIUXsaVqU2UjIUXJY4A3TGfdks7cOCKFCOIVc
	 j9cXvtcjhm7/bkBdej6DHDo6HO5rU8+tXFo5nHg0FZ5koRsaEifAUsOov36Fu2A8e2
	 qPCm//Z8BABDA==
Date: Mon, 23 Nov 2026 11:36:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 13/13] arm64: dts: synaptics: add SL2610 family RDK
 boards
Message-ID: <20261123-vivid-godlike-hoatzin-3a818d@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-14-jszhang@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115102401.3520-14-jszhang@kernel.org>

On Sun, Nov 15, 2026 at 06:23:52PM +0800, Jisheng Zhang wrote:
> +/ {
> +	aliases {
> +		serial0 = &sm_uart0;
> +		serial1 = &sm_uart1;
> +		serial2 = &sm_uart2;
> +		serial3 = &sm_uart3;
> +		serial4 = &soc_uart0;
> +		serial5 = &soc_uart1;
> +		serial6 = &soc_uart2;
> +		serial7 = &soc_uart3;
> +		i2c0 = &sm_i2c0;
> +		i2c1 = &sm_i2c1;
> +		i2c2 = &soc_i2c0;
> +		i2c3 = &soc_i2c1;
> +		spi1 = &sm_spi1;
> +		spi2 = &soc_spi0;
> +		spi3 = &soc_spi1;
> +		spi4 = &soc_spi2;
> +		spi5 = &soc_spi3;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			cpu0-supply = <&vcore>;
> +		};
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon";

Drop bootargs, that's only for debugging.

> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x0 0x80000000>;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	soc_i2c0_pmux: soc_i2c0-pmux {

Underscores should not be in node names. Please follow DTS coding style.

> +		groups = "GPIO23", "GPIO24";
> +		function = "tw2";
> +		drive-strength = <7>;
> +	};
> +};

Best regards,
Krzysztof

