Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597764;
	b=wEUI941ArS9s9JXeITSTgEyfWdP+3pn50USllzNjLJ9tLW/A7opoIXe0Vu4Cj+/YQpKx
	 FxvzoHRqt4qcRbVtn0lvcjdTK2kLz5ZX6Eg3qbvAzpYo9UnLjyP0Xj7NgHIRUouUX0unC
	 Jcy9+EKcinJEqN8UfaGUM4xMeNyXs4HHIIbPlRz4lDjmUuLGDGZTq8oEFcTsZfZMg3ej7
	 6H70fqJpWy6Wi+7YcFSecMMr27FnF9qcjm6iNrzmJnKE3dAT29u5kRiAngkiA6drRT/+i
	 VRzNZJd0smApVJZRxwkzVP4V5NecPRISi0YCdZ5WwoEyje0MUWlFHaLyqpR3i35PtHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597764;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Tf4tJqn4Ep+PSCMoPN7WDoYRmcFmA/KadWfmt4/jR4M=;
	b=ysErLLoOoGZWicH7SdPyHXxsJId+Y/mNoZoq+c30xmNkMr2VsfCN9i2gTVGZO+lQ/xf0
	 76BM5bv0bluh4MMUg1poQfTobzzY8bF/fBtaIhKwQ6mkshNWQFPhJ8Gy1c7nf3PYBEasJ
	 rT6/cBIrCPtQ8AzPY4+k/IBZwPud/TtcSDdfrEQecJ/vqvDnYiIOcUN772zOuJctMOSE4
	 dXYMdXdSscPgQHYfTm7mJNBOHeS3QEY4m7s7NhXJxf99V45SBo4Nha4bDX/FHgT6LLlKy
	 RVoYIGYZjOUoahD6sh7EDD2CR+C54bV5Wg/0+uzCLDSE552S4C9QLwzxkucstVnmFng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvUVgQ7u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624C606A89B;
	Fri, 13 Nov 2026 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvUVgQ7u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051951F000C8;
	Fri, 13 Nov 2026 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597764;
	bh=Tf4tJqn4Ep+PSCMoPN7WDoYRmcFmA/KadWfmt4/jR4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MvUVgQ7ue+spDz1rtv++2dd1LQeLwKUD7VyVxOThGKINGuRHiroJHbC4d/DDcAfYW
	 iNVY5ryV6Q1IMYpvNkpp/L8W+1GoTomtG8gUp7mjtdNBVE39gtCDfcY4GgLy7cNg7W
	 44+43nCPYawt3YC4raeja2VZRV2y5aMwPnBVymmd5TlyvJ9iGnNyncZXTVgwkQKO/X
	 gBW64Kg1fpCNk5H+rYzLlajWPkH+TM6Ppvz9z6JgmdDML8a6BBCoSCeOsNyzpfOISl
	 QnaE/DX3l6H33mHUynP0oJ0irB4Gj/dQ2Gg+twjWxrejTRamxKi7yuonMbfuoP0rl/
	 I7bP8dWon1xMQ==
Message-ID: <sashiko-outbox-213544@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 17/23] ASoC: qcom: add SM8650 LPASS CPU driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-17-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-17-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:22:38 +0000
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
- [High] ASoC: qcom: wrong lpm_type for lpass-rxtx-lpaif in
  sm8650_lpaif_mi2s_desc[]
- [Medium] ASoC: qcom: missing set_bit() for RX channels in
  sm8650_lpass_alloc_dma_channel()
--

commit ee9ae911e7b58d190ad971326ccfe23116c1a06b
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: add SM8650 LPASS CPU driver

This commit adds the SM8650 LPASS CPU DAI driver variant supporting MI2S,
DisplayPort, and codec DMA audio interfaces when driven directly by the
application processor.

> diff --git a/sound/soc/qcom/lpass-sm8650.c b/sound/soc/qcom/lpass-sm8650.c
> new file mode 100644
> index 0000000000000..42050f56a4847
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-sm8650.c
> @@ -0,0 +1,651 @@

[ ... ]

> +static int sm8650_lpass_alloc_dma_channel(struct lpass_data *drvdata,
> +					  int direction, unsigned int dai_id)
> +{

[ ... ]

> +	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
> +		chan =3D find_first_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
> +					   v->rxtx_rdma_channels);
> +		if (chan >=3D v->rxtx_rdma_channels)
> +			return -EBUSY;
> +		break;
> +	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
> +		chan =3D find_next_zero_bit(&drvdata->rxtx_dma_ch_bit_map,
> +					  v->rxtx_wrdma_channel_start +
> +					  v->rxtx_wrdma_channels,
> +					  v->rxtx_wrdma_channel_start);
> +		if (chan >=3D v->rxtx_wrdma_channel_start + v->rxtx_wrdma_channels)
> +			return -EBUSY;
> +		set_bit(chan, &drvdata->rxtx_dma_ch_bit_map);
> +		break;
> +	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
> +		chan =3D find_next_zero_bit(&drvdata->va_dma_ch_bit_map,
> +					  v->va_wrdma_channel_start +
> +					  v->va_wrdma_channels,
> +					  v->va_wrdma_channel_start);
> +		if (chan >=3D v->va_wrdma_channel_start + v->va_wrdma_channels)
> +			return -EBUSY;
> +		set_bit(chan, &drvdata->va_dma_ch_bit_map);
> +		break;
> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
> +		chan =3D find_first_zero_bit(&drvdata->wsa_dma_ch_bit_map,
> +					   v->wsa_rdma_channels);
> +		if (chan >=3D v->wsa_rdma_channels)
> +			return -EBUSY;
> +		break;

[Severity: Medium]
Should the LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9 and
LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9 cases call set_bit() on
drvdata->rxtx_dma_ch_bit_map and drvdata->wsa_dma_ch_bit_map before
breaking?

Without set_bit(), channel 0 is never marked as allocated (even though
sm8650_lpass_free_dma_channel() clears the bit on close), so subsequent
allocations from those bitmaps will hand out channel 0 again and overwrite
drvdata->rxtx_substream[0] or drvdata->wsa_substream[0] in
lpass_platform_pcmops_open().

[ ... ]

> +/* MI2S mapping over LPAIF instances */
> +static const struct lpaif_mi2s_desc sm8650_lpaif_mi2s_desc[] =3D {
> +	{
> +		.reg_name =3D "lpass-lpaif",
> +		.irq_name =3D "lpass-irq-lpaif",
> +		.lpm_type =3D LPASS_LPM_NONE,
> +		.port_desc =3D (const struct mi2s_port_desc[]) {
> +			{ .intf =3D 0, .id =3D MI2S_PRIMARY, },
> +			{ .intf =3D 1, .id =3D MI2S_SECONDARY, },
> +		},
> +		.port_desc_count =3D 2,
> +	},
> +	{
> +		.reg_name =3D "lpass-rxtx-lpaif",
> +		.irq_name =3D "lpass-irq-rxtxif",
> +		.lpm_type =3D LPASS_VA_CDC_LPM,
> +		.port_desc =3D (const struct mi2s_port_desc[]) {
> +			{ .intf =3D 0, .id =3D MI2S_QUATERNARY, },
> +		},
> +		.port_desc_count =3D 1,
> +	},

[Severity: High]
Should the lpass-rxtx-lpaif descriptor use LPASS_RXTX_CDC_LPM instead of
LPASS_VA_CDC_LPM?

lpass-rxtx-lpaif is in the Audio CC / RXTX domain (clocked by
audio_cc_ext_if1_ibit), so setting LPASS_VA_CDC_LPM maps MI2S_QUATERNARY
DMA buffers from the 12 KiB VA LPM region (va_cdc_dma_lpm_buf) and enables
va_mem0 in lpass_cpu_daiops_startup() instead of using the 64 KiB RXTX LPM
region and audio_cc_codec_mem0..3.  If MI2S_QUATERNARY is enabled
alongside LPASS_CDC_DMA_VA_TX0, lpass_platform_allocate_lpm() also fails
probe with -EINVAL because VA Codec DMA already consumes all 12 KiB of VA
LPM, and if MI2S_QUATERNARY is enabled alongside MI2S_QUINARY without VA
Codec DMA, va_cdc_dma_lpm_remain underflows and assigns an offset past the
end of the 12 KiB VA LPM buffer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D17
