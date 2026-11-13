Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597165;
	b=RbyXaOPfPE0EMJ17Pm6U/VPXi/qxJ4VaOXt3TWqNcjto4Y1gjlzZxhcmqKVBXgcX3kIE
	 3M2N9oAWsRFwfy4BJnGMTRHa1ETFQiRw/pixfQTOaFx4KFG1+tn/qL1IuY7acjae1g/Ln
	 uTtFgOosVuNIeurvNt+C1sKXRKK4FQfiEBxQ29QpVohlQn0lmF4Sy6E7d9zHwQXy7AgP7
	 umWpvj0Pj3LbQnYCJcWXsjzucDMkJlRpL3inaRr1OpOxTNEfBaUb0vhMcRT3ZcdbidOAm
	 NdMIZPyf5ocfx5XyAOY6elvQ4tjENzs+2FsuHkp8R7mZ2c0RHjRiXTtxzBOuPrIRHKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597165;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y2HQWNh8zk76bwPC7DTXJpiqFpmqxHyNB4inboKIY08=;
	b=N9CjRjuI1SrPLkiI5UXxMFJY5cHC9eI/c4OJFyWCRORXIHtIukFelplTw3DziYSkkCB5
	 kOuS4D4P64LhEpYCCSZeA94vyYkqnDR2JTuy01e1tf7qZOI1AOf0DQllsNb+U7b3g9lmQ
	 H1RrtXHc7M7VHmDRDpHfSiQ9ice16kF/I05IiBbz63SdNfqtBLb5Jq6xlUJ9h+/XIEIye
	 veFXSBxq4LeC8tS+fiSb8/RzOxYiFg8uz1HfcFbIxKf7Y6ryKnWe6U6r4tbEQ7nuFh2eB
	 r8VJ+6UmaB/CL5yleBdLOzqF5sEuezZbo5dZoXl6oLaJlABGlrg4uV8F/cdeDgtmN5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YaJXQurq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54045606A327;
	Fri, 13 Nov 2026 19:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YaJXQurq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BEC1F000C5;
	Fri, 13 Nov 2026 19:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597165;
	bh=y2HQWNh8zk76bwPC7DTXJpiqFpmqxHyNB4inboKIY08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YaJXQurqfjPF9Hvm0GUpTr9urpMnxRKU/4cKgjLQ52DKg+7+BhqPyA42JL6LLcNrv
	 srrRLB3TVETgh0IXOq/21XashwDaJEWbUtkBDtd89tueGHLGei1lgcTD456+7tNwfR
	 7DhfFOTwsi9rUuH12kZ+wTZdQs7bVGDuk51lntAs7Bk1XFZF7NGN1hxtIiPdGnrw4h
	 jL63JEHS0Q85eBQ0WL/eh4k+nACGBaLzkMhcUNDrvtQTqhMsADUheeEHCIXGx3D5Yc
	 tTjBI2mp8g0r+yvK0Kx8nj4dG25RSkYs/3nkMMKS6q6125F4H+mOj8RaGRekojsNdz
	 IwFSPS1/4vj5w==
Message-ID: <sashiko-outbox-213524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 15/23] ASoC: qcom: lpass: allocate LPM buffer memory
 to DAIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-15-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-15-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:12:44 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] ASoC: qcom: lpass: u32 underflow and OOB in
  lpass_platform_allocate_lpm()
- [Medium] ASoC: qcom: lpass: uninitialized capture buffer on
  full-duplex LPM MI2S PCM
- [Medium] ASoC: qcom: lpass: unconditional VA LPM reservation blocks VA
  LPM MI2S
- [Medium] ASoC: qcom: lpass: missing LPM clock parsing in
  asoc_qcom_lpass_cpu_platform_probe()
- [Low] ASoC: qcom: lpass: wrong LPM offset in
  lpass_platform_prealloc_cdc_dma_buffer()
--

commit 038ab20def13fb9da7aca847692783be3d4964b4
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: lpass: allocate LPM buffer memory to DAIs

This commit dynamically allocates LPASS LPM SRAM buffer offsets for Codec
DMA and non-core LPAIF MI2S DAIs instead of using fixed static offsets.

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 9ebbc422c63c3..4bbcd59ebd602 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1258,16 +1258,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct plat=
form_device *pdev)
>  			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
>  			return ret;
>  		}
> -
> -		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx=
-cdc-dma-lpm");
> -		if (!res)
> -			return -EINVAL;
> -		drvdata->rxtx_cdc_dma_lpm_buf =3D res->start;
> -
> -		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-c=
dc-dma-lpm");
> -		if (!res)
> -			return -EINVAL;
> -		drvdata->va_cdc_dma_lpm_buf =3D res->start;
>  	}
> =20
>  	if (variant->mi2s_desc) {
> @@ -1281,6 +1271,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platf=
orm_device *pdev)
>  						   variant->mi2s_desc[i].reg_name);
>  			if (ret)
>  				return ret;
> +
> +			if (variant->mi2s_desc[i].lpm_type !=3D LPASS_LPM_NONE)
> +				drvdata->mi2s_lpm_enable =3D true;
>  		}
>  	} else {
>  		drvdata->num_lpaif =3D 1;
> @@ -1290,6 +1283,20 @@ int asoc_qcom_lpass_cpu_platform_probe(struct plat=
form_device *pdev)
>  			return ret;
>  	}
> =20
> +	if (drvdata->codec_dma_enable || drvdata->mi2s_lpm_enable) {
> +		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx=
-cdc-dma-lpm");
> +		if (!res)
> +			return -EINVAL;
> +		drvdata->rxtx_cdc_dma_lpm_buf =3D res->start;
> +		drvdata->rxtx_cdc_dma_lpm_size =3D resource_size(res);
> +
> +		res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-c=
dc-dma-lpm");
> +		if (!res)
> +			return -EINVAL;
> +		drvdata->va_cdc_dma_lpm_buf =3D res->start;
> +		drvdata->va_cdc_dma_lpm_size =3D resource_size(res);
> +	}

[Severity: Medium]
Should of_lpass_cdc_dma_clks_parse() also be called when
drvdata->mi2s_lpm_enable is set?

Because of_lpass_cdc_dma_clks_parse() remains inside the
if (drvdata->codec_dma_enable) block above, a board that enables LPM-backed
MI2S DAIs without any Codec DMA DAI leaves drvdata->codec_mem0..3 and
drvdata->va_mem0 as NULL.  Even with commit "ASoC: qcom: lpass: enable the
right codec_mem clock when usin LPM memory" later in this series,
lpass_cpu_daiops_startup() will pass a NULL clk pointer to
clk_prepare_enable(), leaving the LPM SRAM unclocked when accessed by the
CPU or LPAIF DMA.

> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platf=
orm.c
> index a953db262aa00..75d2c872f5123 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c

[ ... ]

> @@ -1315,23 +1348,55 @@ static int lpass_platform_prealloc_cdc_dma_buffer=
(struct snd_soc_component *comp
>  	switch (dai_id) {
>  	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>  		buf->bytes =3D lpass_platform_rxtx_hardware.buffer_bytes_max;
> -		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf;
> +		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf + drvdata->va_lpm_offset;
>  		break;
>  	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>  		buf->bytes =3D lpass_platform_rxtx_hardware.buffer_bytes_max;
> -		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_B=
UFF_SIZE;
> +		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf +
> +				drvdata->va_lpm_offset + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>  		break;

[Severity: Low]
Should these two cases use drvdata->rxtx_lpm_offset instead of
drvdata->va_lpm_offset?  lpass_platform_allocate_lpm() populates
drvdata->rxtx_lpm_offset for RXTX Codec DMA, and commit "ASoC: qcom: lpass:
enable the right codec_mem clock when usin LPM memory" uses
drvdata->rxtx_lpm_offset to select the RXTX LPM clock, so using
va_lpm_offset here will desynchronize the buffer address from the clock if
the two offsets ever differ.

>  	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>  		buf->bytes =3D lpass_platform_va_hardware.buffer_bytes_max;
> -		buf->addr =3D drvdata->va_cdc_dma_lpm_buf;
> +		buf->addr =3D drvdata->va_cdc_dma_lpm_buf + drvdata->va_lpm_offset;
>  		break;
>  	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>  		buf->bytes =3D lpass_platform_wsa_hardware.buffer_bytes_max;
> -		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_B=
UFF_SIZE * 2;
> +		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf + drvdata->wsa_lpm_offset;
>  		break;
>  	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>  		buf->bytes =3D lpass_platform_wsa_hardware.buffer_bytes_max;
> -		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_B=
UFF_SIZE * 3;
> +		buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf +
> +				drvdata->wsa_lpm_offset + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> +		break;
> +	case MI2S_PRIMARY ... MI2S_QUINARY:
> +	case MI2S_SENARY ... MI2S_SEPTENARY:
> +		if (is_lpm_mi2s_port(drvdata, dai_id)) {
> +			unsigned int port_id =3D mi2s_port_id(dai_id);
> +
> +			buf->bytes =3D lpass_platform_lpm_mi2s_hardware.buffer_bytes_max;
> +			switch (drvdata->mi2s_lpm[port_id]) {
> +			case LPASS_RXTX_CDC_LPM:
> +				if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
> +					buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf +
> +						    drvdata->mi2s_lpm_offset[port_id];
> +				else
> +					buf->addr =3D drvdata->rxtx_cdc_dma_lpm_buf +
> +						    drvdata->mi2s_lpm_offset[port_id] +
> +						    LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> +				break;
> +			case LPASS_VA_CDC_LPM:
> +				if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
> +					buf->addr =3D drvdata->va_cdc_dma_lpm_buf +
> +						    drvdata->mi2s_lpm_offset[port_id];
> +				else
> +					buf->addr =3D drvdata->va_cdc_dma_lpm_buf +
> +						    drvdata->mi2s_lpm_offset[port_id] +
> +						    LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> +				break;
> +			default:
> +				break;
> +			}
> +		}
>  		break;
>  	default:
>  		break;

[Severity: Medium]
Does lpass_platform_prealloc_cdc_dma_buffer() leave the capture
substream->dma_buffer uninitialized when an LPM MI2S PCM has both playback
and capture streams?

At the top of lpass_platform_prealloc_cdc_dma_buffer(), only one substream
is selected:

sound/soc/qcom/lpass-platform.c:lpass_platform_prealloc_cdc_dma_buffer() {
	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
		substream =3D pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
	else
		substream =3D pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;

	buf =3D &substream->dma_buffer;
...
}

Unlike Codec DMA DAIs (which have separate unidirectional RX and TX DAI
IDs), a single MI2S DAI can have both playback and capture substreams on
the same struct snd_pcm.  When both exist, only the playback dma_buffer is
initialized and memremapped, while the capture substream->dma_buffer stays
zeroed.  Opening the capture stream in lpass_platform_pcmops_open() then
sets runtime->dma_area to NULL via snd_pcm_set_runtime_buffer(), causing a
NULL pointer dereference in lpass_platform_copy().

[ ... ]

> @@ -1464,6 +1527,64 @@ static const struct snd_soc_component_driver lpass=
_component_driver =3D {
> =20
>  };
> =20
> +static int lpass_platform_allocate_lpm(struct lpass_data *drvdata)
> +{
> +	u32 rxtx_cdc_dma_lpm_remain =3D drvdata->rxtx_cdc_dma_lpm_size;
> +	u32 va_cdc_dma_lpm_remain =3D drvdata->va_cdc_dma_lpm_size;
> +	u32 rxtx_cdc_dma_lpm_offset =3D 0;
> +	u32 va_cdc_dma_lpm_offset =3D 0;
> +	int port_id;
> +
> +	if (drvdata->codec_dma_enable) {
> +		drvdata->rxtx_lpm_offset =3D rxtx_cdc_dma_lpm_offset;
> +		rxtx_cdc_dma_lpm_offset +=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +		rxtx_cdc_dma_lpm_remain -=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +
> +		drvdata->va_lpm_offset =3D va_cdc_dma_lpm_offset;
> +		va_cdc_dma_lpm_offset +=3D LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
> +		va_cdc_dma_lpm_remain -=3D LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
> +
> +		if (drvdata->wsa_enable) {
> +			drvdata->wsa_lpm_offset =3D rxtx_cdc_dma_lpm_offset;
> +			rxtx_cdc_dma_lpm_offset +=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +			rxtx_cdc_dma_lpm_remain -=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +		}
> +	}

[Severity: Medium]
Does reserving LPASS_VA_CDC_DMA_LPM_BUFF_SIZE whenever
drvdata->codec_dma_enable is set prevent using LPASS_VA_CDC_LPM for MI2S
when only RXTX or WSA Codec DMA is enabled?

of_lpass_cpu_parse_dai_data() sets drvdata->codec_dma_enable =3D 1 for any
RXTX, WSA, or VA Codec DMA DAI.  Because the hardware lpass-va-cdc-dma-lpm
region is 12 KiB (LPASS_VA_CDC_DMA_LPM_BUFF_SIZE), subtracting
LPASS_VA_CDC_DMA_LPM_BUFF_SIZE here even when no VA Codec DMA DAI is in DT
reduces va_cdc_dma_lpm_remain to 0, causing the LPASS_VA_CDC_LPM check
below to always fail with -EINVAL.

> +
> +	if (!drvdata->mi2s_lpm_enable)
> +		return 0;
> +
> +	for (port_id =3D 0; port_id < LPASS_MAX_MI2S_PORTS; port_id++) {
> +		if (!test_bit(port_id, &drvdata->lpaif_port_enable))
> +			continue;
> +
> +		switch (drvdata->mi2s_lpm[port_id]) {
> +		case LPASS_RXTX_CDC_LPM:
> +			if (rxtx_cdc_dma_lpm_remain < LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE)
> +				return -EINVAL;
> +			drvdata->mi2s_lpm_offset[port_id] =3D rxtx_cdc_dma_lpm_offset;
> +			rxtx_cdc_dma_lpm_offset +=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +			rxtx_cdc_dma_lpm_remain -=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +			break;
> +		case LPASS_VA_CDC_LPM:
> +			/*
> +			 * VA Codec uses 12KiB, but MI2S uses 8KiB
> +			 * Meaning only VA _or_ a single MI2S can be enabled
> +			 */
> +			if (va_cdc_dma_lpm_remain < LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE)
> +				return -EINVAL;
> +			drvdata->mi2s_lpm_offset[port_id] =3D va_cdc_dma_lpm_offset;
> +			va_cdc_dma_lpm_offset +=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +			va_cdc_dma_lpm_remain -=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +			break;

[Severity: High]
Can rxtx_cdc_dma_lpm_remain and va_cdc_dma_lpm_remain underflow and assign
out-of-bounds LPM buffer offsets here?

Both cases check for LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE (8 KiB) remaining,
but then advance the offset and decrement the unsigned u32 remaining
counter by LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2 (16 KiB).  On a 12 KiB
lpass-va-cdc-dma-lpm region (0x3000 bytes), enabling one MI2S port on
LPASS_VA_CDC_LPM passes the < 0x2000 check and subtracts 0x4000, wrapping
va_cdc_dma_lpm_remain to 0xfffff000:

1. If a second MI2S port on LPASS_VA_CDC_LPM is enabled (such as both
   MI2S_QUATERNARY and MI2S_QUINARY), 0xfffff000 < 0x2000 is false, so it
   is given an offset 16 KiB past the start of the 12 KiB VA LPM region.
2. Even with a single MI2S port on LPASS_VA_CDC_LPM, a capture stream in
   lpass_platform_prealloc_cdc_dma_buffer() is placed at
   mi2s_lpm_offset[port_id] + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE (8 KiB ..
   16 KiB), overflowing the 12 KiB VA LPM region by 4 KiB during
   memremap(), mmap(), and DMA.
3. The same u32 underflow occurs on LPASS_RXTX_CDC_LPM whenever 8 KiB
   remains before subtracting 16 KiB.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D15
