Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429906;
	b=o5wIYyl4ulvIwy9gy2NGiZvAhRfNW7KLgVJjUzpP7PiESFTvtZt1EUQD+1YU7lp/TfXj
	 mDHa6K1Da6EUEY/xLUtQQ15tOmPZb7+irvDOyPLJqqwJBONaOZkFvNbeIODoRzWV3n/BN
	 q910x4OotO39CPAcveStM4f/BjCrZG9NVt7KpblsFOOzHmFyDMHNxqu1SjQcHDXpmYxMh
	 4SKK675+G/EjeRuHYmO3nhbDcI0CiZT9905ib5uXd7XCF+1xG9BTpCqd3kuASuRBGhauV
	 5h2fHMWNuEX4qTozYE0fl8xIerqvxcwJEIjFW082QwzgMBTifz6ear9ye2ZfRWjMyXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429906;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=J9J3atRjzDUkmzU4NP7PeoY9nYVjUiWTLXAb7WnvcUQ=;
	b=bV0rs2D/oBUskvhEM868TiuKrsIjiPECHsK1RsX6Fq3UR14RCc4yV0tXo2vlTxC+IwK1
	 hZ5IDf+XuC+oGbZ2ictzLzjehRBFz1Nty37xTmSY/KKwNVJ0DWvzlt9yOKv2e0ceFk5b1
	 /uSLm9X28vcDh4ZXYDEPUXgg7lWiFpVXBIpF7zQVrHgcf1xeacNtRpTzj5jy2R28WKMI/
	 HuoIdJ7JtA5NkXz7R4uZQR/zyKd9TnO1cCLqZ36EG/d2tHU6H+zyWvLu+vHV1BA8dCOjw
	 7xOslgGgRby0p2BjtbF8e4quQttRMfHLclNqN/PqceUS/UEpFI84oyLs1PWc3TpbBWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUOuTDop;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA45606A327;
	Mon, 23 Nov 2026 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUOuTDop
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB331F000D0;
	Mon, 23 Nov 2026 10:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795429905;
	bh=J9J3atRjzDUkmzU4NP7PeoY9nYVjUiWTLXAb7WnvcUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FUOuTDopHNOZqzhQEQ8HnET20lUE83sOqc4h0i1Kz51+fv54xEkDuNdvui4cLJnUS
	 Of+CzgAcQjeK404BqAc2El9m4g2VlESlu5B2HrQZz69yL0JIboaET5fOvcXrVHepF0
	 POifw9BWfmODvWk1/UDXTJ8MVSCz7EwSaoVduZSu+tIIl9dnOOh3IQ+s0y8R7EifkP
	 RKf2f4LTvewEBHyYeS4B6bPzTlL2rW1xUI3ABd7r4UyDqneEnzh7s5japFg4rhFuiI
	 Mn38Afxl5ajQSK47zIxJUwDHcHgJqoI/jC0o6zLsFcnKP1xbpdBJH6wzuLhi2UwelE
	 ym5JNV2Y59Szg==
Date: Mon, 23 Nov 2026 11:31:42 +0100
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
Subject: Re: [PATCH v2 06/13] soc: synaptics: add SL2610 system controller
 support
Message-ID: <20261123-knowing-eggplant-buffalo-fddfc3@quoll>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-7-jszhang@kernel.org>
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
In-Reply-To: <20261115102401.3520-7-jszhang@kernel.org>

On Sun, Nov 15, 2026 at 06:23:45PM +0800, Jisheng Zhang wrote:

> +static const struct sl2610_syscon_data sl2610_mcu_data = {
> +	.cells = sl2610_mcu_cells,
> +	.num_cells = ARRAY_SIZE(sl2610_mcu_cells),
> +};
> +
> +static const struct sl2610_syscon_data sl2610_avio_data = {
> +	.cells = sl2610_avio_cells,
> +	.num_cells = ARRAY_SIZE(sl2610_avio_cells),
> +};
> +
> +static const struct sl2610_syscon_data sl2610_cpu_data = {
> +	.cells = sl2610_cpu_cells,
> +	.num_cells = ARRAY_SIZE(sl2610_cpu_cells),

That's just MFD driver, so should be in MFD, no? Why placing standard
MFD code - nothing soc specific - in the soc directory?


> +};
> +
> +static int sl2610_syscon_probe(struct platform_device *pdev)
> +{
> +	const struct sl2610_syscon_data *data = device_get_match_data(&pdev->dev);
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    data->cells, data->num_cells, NULL, 0, NULL);
> +}

Best regards,
Krzysztof

