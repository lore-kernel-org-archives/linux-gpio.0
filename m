Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794597157;
	b=1WOUnISfZ0rQu354Pxk6xC19qqhT7U9tgH3PHKJuKmK/+xF3jrLpBr4AY6pxumNykeL8
	 8Ga6HeWkv/280wsyzKPxG/o8D79Hr8mlA7nQLUFL6LiniSF3vHTjYnUll5LPu1BHAN8Ad
	 3xE7jZeuasuuzmpWGHskij+Qsjt4pPWhFAYqhFUtUsZ5vhBqCo6/9A+ztVrOv1BDRDht1
	 OUFVuX5K4OuYGUrQYlS7Arr38GIoEYBEOJf9uswvGp7uE2C1Xkp4Mj6//w8yorO2a9Wsx
	 +K8C1lotIwE0+fWhY8BNIN0/BCFelFg3wqr2ZsVpUt6NZpok1LMwKdKRZIJiLwD3KXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794597157;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0eSJ+UAtox68wwTt+R3rVw07d7N2vCwegB2p3jJqm7Y=;
	b=sKJ+ja3vVHv6J4sOUn86urSpkYn7MXlTFW0ZxpQNhlwhZ5p+mPFi3cVKz0NRwm05esNE
	 H+EtHm9XEx3gD78AyIY8UhLfX7CsiV6hpcvUyGectk3xIr1FA0COCwjO2c+bylTfFxk0o
	 BJVym4e6I2wx5v4x52yW8ips1IxHL7sneVP2qNfcAMjt8Iy83pS58IL0EIP8/YIiHvLdi
	 c9PHGeNg0BOOrKZpPn6gL765s+nphHUitedYV5ilC9mHHSSSl6OtbWtBqhia9SLHRVEg/
	 IqV1oHwcb2LsN1laFIrCzOqAidTT0/DxsKS+kPrVZiRL19/yxLlWqX5qntrLx3wAJXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LeMHAVGA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990DB606A32D;
	Fri, 13 Nov 2026 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LeMHAVGA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1817D1F000C4;
	Fri, 13 Nov 2026 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794597157;
	bh=0eSJ+UAtox68wwTt+R3rVw07d7N2vCwegB2p3jJqm7Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LeMHAVGAimEvVKKcqELJONHmwSL5IL5EYJlQaqIKT2vieBkel3XvHd7LOdFtxh9VY
	 oNxMZk5nONhbD07KpTqNKXXmOFRgXNcIIOv7BscKv3hSrhqILBYwLddI7+A4E2oasC
	 O2fOXItpjKSXdhNnljjoepZAZ34Sk6dKitlagS5HdgvTbpptVftP7fuBbcnhwLz7p9
	 MH6qno8ftkmtoSRh6GHbyjo90Hg2wDAoS5dgfUjvtWxiFAjL2QHnWx41SXnZXQF1PI
	 DVdv29qJGPhVE7zDBlZ7KeboOI2Wa4++BvfsuW5/RD80psuJeeOtqUw+WqlsBLZo4I
	 +Z4qin7kRWQZw==
Message-ID: <sashiko-outbox-213522@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 19/23] ASoC: qcom: sc8280xp: allow using the
 sc8280xp card with lpass-cpu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-topic-sm8650-el2-v1-19-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-19-5183f6aab9fc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:12:36 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ASoC: qcom: sc8280xp: DAI ID collision in
  sc8280xp_snd_hw_params()
- [Medium] ASoC: qcom: sc8280xp: DAI ID collision in
  sc8280xp_be_hw_params_fixup()
- [Medium] ASoC: qcom: sc8280xp: missing lpass-cpu jack DAI IDs in
  sc8280xp_snd_init()
--

commit 3e03c7d28b8733d89a72bc91c60e7c4086af115e
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu

This commit adds LPASS Codec DMA DAI IDs and attaches DAI link callbacks
unconditionally so the sc8280xp machine driver can be used with
lpass-cpu DAI links.

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 8cc75a7ad866d..ff57fb9051a26 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c

[ ... ]

> @@ -242,6 +243,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runti=
me *rtd)
>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
> +	case LPASS_CDC_DMA_WSA_RX0:
> +	case LPASS_CDC_DMA_WSA_RX1:
>  		/*
>  		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
>  		 * to reduce the risk of speaker damage until we have active

[Severity: Medium]
Does switching on cpu_dai->id here without checking rtd->dai_link->no_pcm
collide with Q6DSP TDM DAI IDs, while leaving DisplayPort and WCD headset
jack setup broken on lpass-cpu links?

LPASS_CDC_DMA_WSA_RX0 and LPASS_CDC_DMA_WSA_RX1 (36 and 37) have the same
values as PRIMARY_TDM_RX_6 and PRIMARY_TDM_TX_6 on AudioReach DPCM links.
Meanwhile, for lpass-cpu links, LPASS_DP_RX is missing from the
DisplayPort cases below (skipping qcom_snd_dp_jack_setup()), and
qcom_snd_wcd_jack_setup() only attaches the jack to the codec component
for LPI_MI2S_RX_0 and TX_CODEC_DMA_TX_0..3, ignoring
LPASS_CDC_DMA_TX0..3.

> @@ -323,6 +326,10 @@ static int sc8280xp_be_hw_params_fixup(struct snd_so=
c_pcm_runtime *rtd,
>  		}
>  		break;
>  	}
> +	case LPASS_CDC_DMA_TX0:
> +	case LPASS_CDC_DMA_TX1:
> +	case LPASS_CDC_DMA_TX2:
> +	case LPASS_CDC_DMA_TX3:
>  	case TX_CODEC_DMA_TX_0:
>  	case TX_CODEC_DMA_TX_1:
>  	case TX_CODEC_DMA_TX_2:

[Severity: Medium]
Does adding LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX3 to
sc8280xp_be_hw_params_fixup() alter PRIMARY_MI2S and SECONDARY_MI2S DPCM
backends instead of affecting lpass-cpu links?

In sc8280xp_add_be_ops(), sc8280xp_be_hw_params_fixup() is only wired up
when link->no_pcm =3D=3D 1 (AudioReach DPCM backend links), so it never runs
on non-DPCM lpass-cpu links.  On DPCM links where it does run,
LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX3 (16..19) alias PRIMARY_MI2S_RX,
PRIMARY_MI2S_TX, SECONDARY_MI2S_RX and SECONDARY_MI2S_TX (16..19),
changing their minimum channel constraint from 2 to 1.

> @@ -533,12 +540,11 @@ static void sc8280xp_add_be_ops(struct snd_soc_card=
 *card)
>  	int i;
> =20
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm =3D=3D 1) {
> -			link->init =3D sc8280xp_snd_init;
> -			link->exit =3D sc8280xp_snd_exit;
> +		link->init =3D sc8280xp_snd_init;
> +		link->exit =3D sc8280xp_snd_exit;
> +		link->ops =3D &sc8280xp_be_ops;
> +		if (link->no_pcm =3D=3D 1)
>  			link->be_hw_params_fixup =3D sc8280xp_be_hw_params_fixup;
> -			link->ops =3D &sc8280xp_be_ops;
> -		}
>  	}
>  }

[Severity: High]
When sc8280xp_be_ops is attached to non-DPCM lpass-cpu links, does
sc8280xp_snd_hw_params() misidentify LPASS_CDC_DMA_TX0..7 as MI2S DAIs
and fail stream setup with -ENOTSUPP?

sound/soc/qcom/sc8280xp.c:sc8280xp_snd_hw_params() {
    ...
	switch (cpu_dai->id) {
	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
    ...
		if (mi2s_mclk_enable) {
			ret =3D snd_soc_dai_set_sysclk(cpu_dai,
						     LPAIF_MI2S_MCLK, mclk_freq,
						     SND_SOC_CLOCK_OUT);
			if (ret)
				return ret;
		}
    ...
	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
		return sc8280xp_tdm_hw_params(substream, params);
    ...
}

LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX7 (16..23) share the same numeric IDs
as PRIMARY_MI2S_RX..QUATERNARY_MI2S_TX (16..23).  On platforms such as
sm8650 where mi2s_mclk_enable and mi2s_bclk_enable are set in
sm8650_priv_data, starting a capture stream on LPASS_CDC_DMA_TX0..7 calls
snd_soc_dai_set_sysclk() on the LPASS Codec DMA DAI, which does not
implement .set_sysclk and returns -ENOTSUPP.

Conversely, actual lpass-cpu MI2S DAI IDs do not match the Q6DSP MI2S
ranges: MI2S_PRIMARY..MI2S_QUINARY (0..4) hit the default case and skip
format and clock setup, while MI2S_SENARY..MI2S_SEPTENARY (34..35) fall
into PRIMARY_TDM_RX_0..QUINARY_TDM_TX_7 (24..103) and are routed to
sc8280xp_tdm_hw_params().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-topic-sm86=
50-el2-v1-0-5183f6aab9fc@linaro.org?part=3D19
