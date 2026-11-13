Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596774;
	b=U2HZLRiBRWX9kP49NcULjYmi2Y8CSu5ds1B8rG7fGgUBsa9g0h0viUj0ttV4iNdDXfKZ
	 783wDmgqIe8P5C6Z0q8vuDhTIwL6EnicyxZdY55B7f3vnoMcdOJFdMPdEaVU9mq0JnMVg
	 336O521Wk590EqDCG63OTLHrERqGqT3iWhC2FEONcbzD6ZpgC8YsFx+iz5YgmS37mk26p
	 ufS2blPm5Th5Z/rrGwO6rmZRdxxgzSSUQqbqsiG9vznvVWhPqWjQqmWOi0ZnI8ttAvf/Q
	 k+RXTXr/cBRl+I1NvIMyvMRxW1ODSBQ2uGme1KL6Tr1ve8nr3pQuD4n9kPfr7VhlEOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596774;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yqUUeu/3FXBO8m3FPBkfUfjW6OVQaGGqj88wamvfJxs=;
	b=YsMkFF6N8LLIWhIscJXS6KUhvu1JKw+qRDp+EDXnSkag/bm/ulgat7qs0liDr6LQSZtM
	 353Dl8t8Q7ow3fW/9+Rq48Izw3uveql5bw3V7T9xIBNq42EYaFIbOO26awsPxNFN9Mk5e
	 8KhNf1TECaRTnt6ZyaqRc8H9JTVjsUnd8+gQ0qUY4glZFPnELPUYX95x39PifDbrQVVEW
	 /n6jT+rr2zOJmItlXXgz+4adK4gVgQdOap6xfv1JJZtE5a/qirIXaWIuBFyU9wZhoqqIt
	 97YD6HBaZuaZMXxUWkh2QPAY1FD8Uj/AZsCFQQYlO2CPB56yPR6xHKKNzHe0uT0Cr8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUsXzeQA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6998A606A33A;
	Fri, 13 Nov 2026 19:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUsXzeQA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D7C1F000C4;
	Fri, 13 Nov 2026 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596774;
	bh=yqUUeu/3FXBO8m3FPBkfUfjW6OVQaGGqj88wamvfJxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bUsXzeQA4fKejl1BjZt+/XyAnPgzW69VDpDqcqylezNiPH2C5xFZPBGwqIJ/H/pK9
	 64zZyduOLeaPto3vXzvqAjMY7lSQnHhG0DLlVpWWg2TnFwUPRnX7HbVly2AuSNfrY+
	 l33c4ql/g/mYnOXQOeKEGIj4/KDi5EcBDSnfZpVElTEzxp/lzUy6ExrRFJCno8qbVh
	 evr6eCMKfmfOOMo70wt2r9+SSx3gOeaQqFKEjuRdAafLtcRxdsx+8bxL2a1Xppd8th
	 pS8U0+UTpHOMNBe88rNC86DVkteATzpeV8TH7Ig+LweOeDGQEAcVDXi/0gRmWDBRaD
	 CofrLXpoTeE8w==
Message-ID: <sashiko-outbox-213502@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 16/23] ASoC: qcom: lpass: enable the right codec_mem
 clock when usin LPM memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-16-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-16-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:06:13 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: qcom: lpass: LPM clocks not parsed when only
  mi2s_lpm_enable is set
- [Medium] ASoC: qcom: lpass: unchecked mem_clk enable and leak in
  startup()
--

commit 6968d3f5a8288f5418d4e48725abed1263de22d5
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: lpass: enable the right codec_mem clock when usin LPM memory

This commit adds a helper to select the codec_mem clock matching a given LPM
buffer offset and enables the corresponding LPM memory clock during DAI
startup and shutdown for Codec DMA and LPM-backed MI2S ports.

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 4bbcd59ebd602..302c31b23090f 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -89,6 +89,17 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_sub=
stream *substream,
>  	unsigned int port_id =3D mi2s_port_id(dai->driver->id);
>  	int ret;
> =20
> +	if (is_lpm_mi2s_port(drvdata, dai->driver->id)) {
> +		struct clk *mem_clk =3D drvdata->va_mem0;
> +
> +		if (drvdata->mi2s_lpm[port_id] =3D=3D LPASS_RXTX_CDC_LPM)
> +			mem_clk =3D lpass_cdc_dma_mem_clk(drvdata,
> +							drvdata->mi2s_lpm_offset[port_id]);

[Severity: Medium]
Can mem_clk be NULL here when a board enables LPM-backed MI2S ports without
any Codec DMA DAIs?

In asoc_qcom_lpass_cpu_platform_probe(), of_lpass_cdc_dma_clks_parse() is o=
nly
called when drvdata->codec_dma_enable is set, whereas the LPM memory resour=
ces
are fetched when either codec_dma_enable or mi2s_lpm_enable is set:

sound/soc/qcom/lpass-cpu.c:asoc_qcom_lpass_cpu_platform_probe() {
    ...
		ret =3D of_lpass_cdc_dma_clks_parse(dev, drvdata);
		if (ret) {
			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
			return ret;
		}
	}
    ...
	if (drvdata->codec_dma_enable || drvdata->mi2s_lpm_enable) {
		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cd=
c-dma-lpm");
    ...
}

When only drvdata->mi2s_lpm_enable is set, drvdata->va_mem0 and
drvdata->codec_mem0..3 are never populated and remain NULL.  Passing NULL to
clk_set_rate() and clk_prepare_enable() is a no-op, leaving the LPM SRAM
unclocked when the stream accesses the LPM buffer.  Calling
of_lpass_cdc_dma_clks_parse() under the codec_dma_enable || mi2s_lpm_enable
check would ensure the clocks are acquired.

> +
> +		clk_set_rate(mem_clk, LPASS_CODEC_MEM_HZ_NORMAL);
> +		clk_prepare_enable(mem_clk);
> +	}
> +
>  	ret =3D clk_prepare_enable(drvdata->mi2s_osr_clk[port_id]);
>  	if (ret) {
>  		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);

[Severity: Medium]
Does this leak the prepare and enable references on mem_clk if enabling
mi2s_osr_clk or preparing mi2s_bit_clk fails?

Whendai->driver->ops->startup() returns an error, snd_soc_dai_startup() does
not mark the DAI as active, so snd_soc_dai_shutdown() will not call
lpass_cpu_daiops_shutdown() to release mem_clk.  In addition, neither
lpass_cpu_daiops_startup() nor lpass_cdc_dma_daiops_startup() checks the
return values of clk_set_rate() and clk_prepare_enable() on mem_clk, which =
can
leave LPM memory unclocked and cause an unbalanced clk_disable_unprepare() =
on
shutdown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D16
