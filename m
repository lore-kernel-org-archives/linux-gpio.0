Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703863;
	b=ui14ws0GjnTZ3c+Ax0WGoXYUxf1RTPfcWXp3r1V2XEBY2wAdpvO5DHISGSA4r4AYItYp
	 obAtkNMi8GooA6YBspB/rjajvUVUYPC/+Sa7Ct9pV9P1TdYXG9wTuvOIbB31WqNTSxwc1
	 vI/5ei+G5eSqHI6DwgSfXkz0lsu9gNrEA2P02pNhdk2ae8pZddF47wb6fZo291r7ztz3D
	 +tqy7pzOnU5oF+/bX5xkajcwRSGKKEw9Or+3VqbrGDPwOq5Y5KTESNR34VGSgFgCpYOIT
	 VhvZ2ncpS7sbRxUWulp4+xzzJoli+bPDhUSvP4F4oJjI+l1tviq9B5YDKavaTKPjwmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703863;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=raxDnfRsb1wb27xhRaX2DQ4tnujeCdMJ/Eut1gP5YJs=;
	b=DnwB1N5yzWvwchSkOSKVFgNJwX8EdnL6ljost7k159oDOugRcS5BpBZ8DdnU+QzXe7XN
	 ZXnA93WLU8p8xYjtutHldJhV1nRNyEwG2vkUBFvPoeC9qpVsCArFybyxXqfUhJlmVbQp+
	 2FqQMG0ykSMe7gkqjk7Hg+ZDWiQijoNpZKb8eN6XzBUUrmDNnY4ogh1DRaxM1zsHHLNuC
	 HOcpvxHSPAUjR6cJNC4zujVHEGQz5/c7ESCcgcodHNxiSRO+VJrEqQO12KsyG7v+GYqnT
	 yBQksbyWPMANLlzvKRSEGAxIKkVyiOu4hn9HNd3V0WQTlQ4iyyRUHEaCmhmbi96lMMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fm4Lbi0J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7225C606A31E;
	Thu, 26 Nov 2026 14:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fm4Lbi0J
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id DB0F21F000D8;
	Thu, 26 Nov 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795703862;
	bh=raxDnfRsb1wb27xhRaX2DQ4tnujeCdMJ/Eut1gP5YJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fm4Lbi0JF86dDB3d7wYxeAB1FUd/gyyA+ZhVYyuRTTHTvoKjT7n+OAYwHrS64gEBP
	 fWsCzVOB1EFirkCWnBeixvPq+8Lyrfs8jOaaeQ9UkhJS+rUenCR/HR6n1uC3sv9cJT
	 SR4wulja1wH9tJS04kFC7P4H7XwZfZeCH3A9A3b6eh58lTGVT8/9Ojm6cEZ5MaBG5a
	 IlvSAucych/GdDR3R/Ppg8w8itSWC8m48L4Swayy3vhoIE/426+ABxupfRM0yT0VDl
	 v88ZX7JUn9YbbFwPz+OWRF2x6rOKDZiIKgu2lmC92kc9wyp6bYwtDKNuPqSRo1GPZp
	 YJvskvKa/UYiA==
Date: Thu, 26 Nov 2026 15:37:39 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: SignKirigami <prcups@krgm.moe>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Netrani TLMM support
Message-ID: <trnv55pophj76vyltw4bqg4scax2mjxg74guvnz35y4ik5yrdo@6co34tei5ihp>
References: <20261126-netrani-tlmm-v1-v2-0-3426fca870c1@krgm.moe>
 <20261126-netrani-tlmm-v1-v2-2-3426fca870c1@krgm.moe>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126-netrani-tlmm-v1-v2-2-3426fca870c1@krgm.moe>

On Thu, Nov 26, 2026 at 04:53:38PM +0800, SignKirigami wrote:
> Add the Netrani TLMM pin groups, mux functions and PDC wake interrupt
> mapping. Register eGPIO for GPIO114 through GPIO140; selecting it hands
> ownership away from the TLMM instead of programming a TLMM mux value.
> Also expose the dedicated UFS reset and SDC1/SDC2 groups through their
> separate control registers. The GPIO register bank starts one megabyte
> into the TLMM window.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---

...

> +
> +static const struct msm_pingroup netrani_groups[] = {
> +	[0] = PINGROUP(0, qup0_se1, ibi_i3c_qup0, cmu_rng, qdss_cti_trig0, _, _, _, _,
> +		       _, _, _),
> +	[1] = PINGROUP(1, qup0_se1, ibi_i3c_qup0, cmu_rng, _, _, _, _, _, _, _, _),
> +	[2] = PINGROUP(2, qup0_se1, _, _, _, _, _, _, _, _, _, _),
> +	[3] = PINGROUP(3, qup0_se1, gcc_gp3_clk, cmu_rng, qdss_cti_trig1,
> +		       wlan1_adc_dtest0, atest_usb0, _, _, _, _, _),
> +	[4] = PINGROUP(4, qup1_se0, ibi_i3c_qup1, _, phase_flag, qdss_gpio,
> +		       _, _, _, _, _, _),
> +	[5] = PINGROUP(5, qup1_se0, ibi_i3c_qup1, _, phase_flag, qdss_gpio,
> +		       _, _, _, _, _, _),
> +	[6] = PINGROUP(6, qup1_se0, qup1_se1, _, _, _, _, _, _, _, _, _),
> +	[7] = PINGROUP(7, qup1_se0, qup1_se1, _, phase_flag, qdss_gpio,
> +		       _, _, _, _, _, _),
> +	[8] = PINGROUP(8, qup1_se1, ibi_i3c_qup1, qdss_gpio, _, _, _, _, _, _, _, _),
> +	[9] = PINGROUP(9, qup1_se1, ibi_i3c_qup1, _, phase_flag, qdss_gpio,
> +		       _, _, _, _, _, _),
> +	[10] = PINGROUP(10, qup1_se3, _, phase_flag, _, _, _, _, _, _, _, _),
> +	[11] = PINGROUP(11, qup1_se3, _, phase_flag, _, _, _, _, _, _, _, _),
> +	[12] = PINGROUP(12, qup1_se3, _, _, _, _, _, _, _, _, _, _),
> +	[13] = PINGROUP(13, qup1_se3, _, phase_flag, _, _, _, _, _, _, _, _),
> +	[14] = PINGROUP(14, qup1_se5, _, phase_flag, _, _, _, _, _, _, _, _),
> +	[15] = PINGROUP(15, qup1_se5, _, _, _, ddr_pxi0_test, _, _, _, _, _, _),
> +	[16] = PINGROUP(16, qup1_se5, _, _, _, _, _, _, _, _, _, _),
> +	[17] = PINGROUP(17, qup1_se5, _, _, _, ddr_pxi0_test, _, _, _, _, _, _),
> +	[18] = PINGROUP(18, qup1_se2, _, phase_flag, _, _, _, _, _, _, _, _),

Same issue as Molokai, please look at the series[1] from Taniya.

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com/
