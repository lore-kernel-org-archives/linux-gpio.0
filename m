Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596828;
	b=4Sn38iAaXpyL93XCSAHM+qPTaJWMc4dJ74r15aD37aiMZJcNOueTausON7VtW9YhoSsv
	 395ua/C9xijesBqLTpjIaNGxaUaWaOwPQCy4ew5ssxx4tKS0qbZNFwGq3KKWjaBkofcZu
	 y6a0jiKlQ4rzjECi96Dnyxx0SCyvBF3pAAsN2fHGpTenQBNzcrLRLznT7ugNOq3q+Y0HB
	 nJTM2LWxC2Vc5o0sU34ZmJW61uHYPc8OnWRbucYf1DvOToVK+DBOJcgnByFdcXdsPY4Ma
	 Eu/Xk1an7VRdbB2s9aVECgqJNogKwcZZM+A3gYBUCiv0Pl1I1JgGtU8w3/9GCGly62g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sv9JNmRwJL/Zho+/YZ4FdYyCMvXsqe00tdbyp5x+NMQ=;
	b=ZiVrD7N2MnTtK4KF2LxJu+subAfNN0KHj3cTSAfxI8orD9jfNUxrLZeVDACacbHLsPIu
	 s8BFjVpqt3yjD8Po59XAPLocOyNpkdyA8DWpOXCJ271gdaDydQqR9/W8sWpPtQztgSbqS
	 t3uGpaqlj/IpAqt2AAVKyQVXNSDkZ7hWNJuTGyRujwMn5x28tQE87+56irKFbDweuNStI
	 f0pvwmV43aa5OpZrxyvqeqj1lFcRGg2SK4UWJPa4TM/yzb4XwCw+ZIZPK+U7HnHQT6Naz
	 WDX4yD3vPnAfFJEBL9c4GH/aB3QbQLa1zS1MBEU6qEVAeFmjt0nJN3aa3bycR2cIqbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYfvY5ey;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F1606A323;
	Fri, 13 Nov 2026 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYfvY5ey
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BC81F000C4;
	Fri, 13 Nov 2026 19:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596827;
	bh=Sv9JNmRwJL/Zho+/YZ4FdYyCMvXsqe00tdbyp5x+NMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CYfvY5eyKv8sg72crT5WKugfq97Iznp+2FTEBv63DThxLaqb5xd6YJ8PexXTvwhI8
	 IM40WF93V5r11SpE6OBWCm+dDx7AfKQBaAWDyv0jfYJ69lklC02F4vQE57hBwL8ofN
	 hJB2swmWVzY6TcrSrif8uzgr+M+yBNgz4Jt28Bte3i7oY1Hfu9idYU7dGcyuTI9QG+
	 T593H7zSzL9/XQl+JDlL6mfEc6k+NOmxl6ev1rGwFM5TKEFxyVwB+whLuNhINeBAvC
	 1CEUa89USzlyB/LfVHHDiOBErVunLT6C1eikLEj2J9LaXS4K4UMlXZZLX6n2XT42da
	 jKnZ46byZfw2g==
Message-ID: <sashiko-outbox-213505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 10/23] ASoC: qcom: lpass-cdc-dma: add support for
 WSA codec DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-10-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-10-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:07:06 +0000
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
- [Medium] ASoC: qcom: missing WSA_TX4 case in
  __lpass_get_codec_dma_intf_type()
- [Medium] ASoC: qcom: unchecked clk_prepare_enable() in
  lpass_cdc_dma_daiops_startup()
--

commit fe9e37da583fba7a4cfa98118783d3ccffae7524
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA

This commit adds WSA codec DMA interface plumbing and clock handling to
the LPASS codec DMA driver.

> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dm=
a.c
> index 2dc8c75c4bf08..903055e3188d8 100644
> --- a/sound/soc/qcom/lpass-cdc-dma.c
> +++ b/sound/soc/qcom/lpass-cdc-dma.c

[ ... ]

> @@ -68,49 +76,67 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
>  	case LPASS_CDC_DMA_RX0:
>  	case LPASS_CDC_DMA_TX0:
>  	case LPASS_CDC_DMA_VA_TX0:
> +	case LPASS_CDC_DMA_WSA_TX0:
> +	case LPASS_CDC_DMA_WSA_RX0:
>  		ret =3D LPASS_CDC_DMA_INTERFACE1;
>  		break;
>  	case LPASS_CDC_DMA_RX1:
>  	case LPASS_CDC_DMA_TX1:
>  	case LPASS_CDC_DMA_VA_TX1:
> +	case LPASS_CDC_DMA_WSA_RX1:
> +	case LPASS_CDC_DMA_WSA_TX1:
>  		ret =3D LPASS_CDC_DMA_INTERFACE2;
>  		break;
>  	case LPASS_CDC_DMA_RX2:
>  	case LPASS_CDC_DMA_TX2:
>  	case LPASS_CDC_DMA_VA_TX2:
> +	case LPASS_CDC_DMA_WSA_RX2:
> +	case LPASS_CDC_DMA_WSA_TX2:
>  		ret =3D LPASS_CDC_DMA_INTERFACE3;
>  		break;
>  	case LPASS_CDC_DMA_RX3:
>  	case LPASS_CDC_DMA_TX3:
>  	case LPASS_CDC_DMA_VA_TX3:
> +	case LPASS_CDC_DMA_WSA_RX3:
> +	case LPASS_CDC_DMA_WSA_TX3:
>  		ret =3D LPASS_CDC_DMA_INTERFACE4;
>  		break;
>  	case LPASS_CDC_DMA_RX4:
>  	case LPASS_CDC_DMA_TX4:
>  	case LPASS_CDC_DMA_VA_TX4:
> +	case LPASS_CDC_DMA_WSA_RX4:
>  		ret =3D LPASS_CDC_DMA_INTERFACE5;
>  		break;

[Severity: Medium]
Should LPASS_CDC_DMA_WSA_TX4 also be included in the
LPASS_CDC_DMA_INTERFACE5 case?

__lpass_get_dmactl_handle(), lpass_cdc_dma_daiops_startup(), and
lpass_cdc_dma_daiops_shutdown() all handle the full
LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8 range, but omitting
LPASS_CDC_DMA_WSA_TX4 here causes __lpass_get_codec_dma_intf_type() to
return -EINVAL and __lpass_platform_codec_intf_init() to abort without
configuring or enabling the DMA interface.

[ ... ]

> @@ -184,6 +210,17 @@ static int lpass_cdc_dma_daiops_startup(struct snd_p=
cm_substream *substream,
>  		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
>  		clk_prepare_enable(drvdata->va_mem0);
>  		break;
> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
> +		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);	//??
> +		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);	//??
> +		clk_set_rate(drvdata->codec_mem2, CODEC_MEM_HZ_NORMAL);	//??
> +		clk_set_rate(drvdata->codec_mem3, CODEC_MEM_HZ_NORMAL);	//??
> +		clk_prepare_enable(drvdata->codec_mem0);		//??
> +		clk_prepare_enable(drvdata->codec_mem1);		//??
> +		clk_prepare_enable(drvdata->codec_mem2);		//??
> +		clk_prepare_enable(drvdata->codec_mem3);		//??
> +		break;
>  	default:
>  		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, da=
i->id);
>  		break;
> @@ -205,6 +242,13 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd=
_pcm_substream *substream,
>  	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
>  		clk_disable_unprepare(drvdata->va_mem0);
>  		break;
> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
> +		clk_disable_unprepare(drvdata->codec_mem3);
> +		clk_disable_unprepare(drvdata->codec_mem2);
> +		clk_disable_unprepare(drvdata->codec_mem1);
> +		clk_disable_unprepare(drvdata->codec_mem0);
> +		break;

[Severity: Medium]
What happens if clk_set_rate() or clk_prepare_enable() fails in
lpass_cdc_dma_daiops_startup()?

Ignoring errors here lets the stream proceed with unclocked LPM memory,
leaves any earlier codec_mem clocks enabled on partial failure, and
causes lpass_cdc_dma_daiops_shutdown() to call clk_disable_unprepare()
on clocks whose enable failed.  Later commit "ASoC: qcom: lpass: enable
the right codec_mem clock when usin LPM memory" removes the "//??"
comments and selects a single clock via lpass_cdc_dma_mem_clk(), but
still leaves clk_set_rate() and clk_prepare_enable() unchecked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D10
