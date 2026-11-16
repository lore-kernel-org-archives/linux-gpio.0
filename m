Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816110;
	b=EAjghccmUzgWYdTJtFaKn5NB1dpCO8f6gBCLRwN8qDI/OilG45V/tugxf5WPzqQbvtFP
	 wy48UGOe1mI0ZWX5cXBDgZ9SfoUgvrLY+VwnZGT7Co4RXoWAFuaSccnywgj/mXbbt0CzY
	 5XLU5H/PBTZ85bGKZiu8hQBWNpgg4ba5Q2oNL8C78YHVax0Bm8j3o9/udcJ5lJTdy36lk
	 ZdMKxPrio8Y0hKiNSTWBaYSFlgvHi6/QGfm7uTAYOXzYo3repVQW0cgz3tWqyFMhNON3M
	 sJOmthpTNE7xHFMFqbM8Zak/6V2AHbh9WNTB/RmZwooC7oJXAHDD88X+cwirbf4eiTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gmlMhyIvZekkIo8rGz6gqK3nrauj87h21DSx+oPeX2o=;
	b=o1EpEWa2SYfhU3G/lETBXnsT/jBbfjOmG220TIw40Sp5clodlXLqGZGrdZ0U0MS+GgG5
	 ShHWkkdHPsj+1qP+KPEtm1P7bCRJkmGpPWKC2dM7UMlyHaAVImCOF08jXBmTBeCBxfmab
	 D8LEDGgJJ6sLHPxf0/HvagpDyybb7WVniZWnP8MmovApVhwV6P0XaKdBZQlCr7xStprLn
	 IMRz6A0nC/dd8T/sV7gbso76gcw7HtkZmRMcmYPCYZx6eBQeHTjMChB7B0qP80il2t50J
	 0eOVDvfOAf4/azQ0OEQxYSPo5sP8Q/qYm5qPMjqZ2VNISGexSKvnSw1AFc3IVFjudaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JOIkFkaK;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F6606A332
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 08:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 736F6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JOIkFkaK
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d28f75d62so618337166b.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 00:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816109; x=1795420909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmlMhyIvZekkIo8rGz6gqK3nrauj87h21DSx+oPeX2o=;
        b=JOIkFkaKtGVEWHk8W0HBbsvSExYtwp/lsENBt8NXe4Y87YrqQIYmWOWYDuu36qumUm
         iv6XP8o2CqAPHE2sBROrnA8+5lUs0OVZe1gveUAS8cQHfVFDu1q9WNmHNrAnlfBuLnNs
         bDJvYgDh6veoVr4aiKuqTRjrPOlpEiDADx/DdQ1iA/y804SISLqXij9JzzE1GHqyDm0O
         QiJPP6l8nr83YZfdbZLE+4HG9U37CcJmLM4LKPih1PYiwFjUEQ19P4KlsJ+KoyKS1u60
         BayvtYPDHQlapSBUVkfuUob4uKeU2cSC0RZs135h1i+53Z6R1v0xBrfZitQveRYOv1N0
         lowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816109; x=1795420909;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmlMhyIvZekkIo8rGz6gqK3nrauj87h21DSx+oPeX2o=;
        b=GgB5Gwi825J+73+UUBGZx7J4/z58ElEy2Z/Df8OX4DqUlGzi+WhTHvGslKrQrPsh1e
         rKeASY0IP8dP/U+zzbXKlzsiV8jawtdsi/i5cOvkjAQdzddvbZyRj+Ll8P+gNUKMv2DF
         qzIlOjNl6+r29/RVN5+6T9RcT8VEdjkkCrTxZGXghNhpwIsOw7anE5OrTkYd+MbM9Em5
         6zWVZKR6EAOetgl2/PxhfrTnz0g+UxIh/GzIzmAQQV59Egy7I//SAzcdMuwZpuhmuHEt
         HaJIdhNC/SNS0ksyEEBS6aalM+XeflUoAc3ETKuSY4ukWeYVOozS1h+0EEaQzXV8P9QK
         0s/Q==
X-Forwarded-Encrypted: i=1; AL+hErHYcPsN7x2VARkIzfu0n6iyjwyMwRk4ES4HDkxLGgfBYC9vqp1goK4XXQP5CVAsumhM37mvjC4CWILT@vger.kernel.org
X-Gm-Message-State: APuU4Z85I8Vhp6xBYxBDDEOz9hJVnIiRureOFE0CDZb5kxEhMgsQ7ZQd
	vaYqANsrVllDRAodOCVVzb+ntY/6WiEtgE9WjYJJknL1bYolpIG3jUxoBJvB6cV868w=
X-Gm-Gg: AYBFou3ktZ8Q92kt7YgAQF1HCV+oggu0551Lh3Xo/vKW17d6i3vPOlmGufdz/Cc2RNa
	0GVNTg9MWzOpaJRPlzezK/kc42+qCRh9mFTxryvi89VMA0Qc/jT5af1iMHnPmOGXWpamNt6crsO
	ntLRfegB9XuYFnmrvZIgWGykVE0mAAeOjFKGPU0xpaGQajVSCAI6+JSpZyzxxt1DNeu/yra9iy5
	XMkmjXBPCvbULxYEXoW5XbSwcyCs6N7gKL/8gzYl2tebg+W1kbAQiW5FuZ5MxCWBgXV2UwT9KbA
	4sG6PkcUgTGVC2OjB2naFitDVcKFNg03/BomH7C533kZ1d1Gl5Ct27K+RtwIFxjPB3sIvfjrmlG
	E4LZL0EkHY57pW6f67bcCkUTk3rXtTgpjt+Ca5tX6xjnlxTDcdUGidCRbK0lwgzWHwSmHVHZy7Y
	GgjIcuaqkMOozxHiLehfzTJNgcQWTe0pYH8rOfxVeNPAnDH/KE0EnyrHQj++aIan0DWOI/WMXzo
	xf304yDX5zE3MoIcYURQq2JIyJ9Z9DqVRsUo3CiiATWuN5jzxiGDSJTlcvsrglnEY+WoYLWAtgZ
	vSnI+InDbg8ntiTZ4n5u1ioJ0tavpvtW9W7Q49X/Tjyf7wHIToaWaMdAtr9+G9KzgFec9FjXWwZ
	wAEXT3A0Hiw==
X-Received: by 2002:a17:907:868f:b0:c50:475d:980e with SMTP id a640c23a62f3a-c50963ced7cmr772967366b.38.1794816108385;
        Mon, 16 Nov 2026 00:01:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2cd05sm18650883f8f.31.2026.11.16.00.01.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:01:47 -0800 (PST)
Message-ID: <4810f117-3003-45dd-9b57-d7e400c50560@linaro.org>
Date: Mon, 16 Nov 2026 09:01:47 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 19/23] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-19-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213522@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-213522@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] ASoC: qcom: sc8280xp: DAI ID collision in
>    sc8280xp_snd_hw_params()
> - [Medium] ASoC: qcom: sc8280xp: DAI ID collision in
>    sc8280xp_be_hw_params_fixup()
> - [Medium] ASoC: qcom: sc8280xp: missing lpass-cpu jack DAI IDs in
>    sc8280xp_snd_init()
> --
> 
> commit 3e03c7d28b8733d89a72bc91c60e7c4086af115e
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu
> 
> This commit adds LPASS Codec DMA DAI IDs and attaches DAI link callbacks
> unconditionally so the sc8280xp machine driver can be used with
> lpass-cpu DAI links.
> 
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 8cc75a7ad866d..ff57fb9051a26 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
> 
> [ ... ]
> 
>> @@ -242,6 +243,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>>   	switch (cpu_dai->id) {
>>   	case WSA_CODEC_DMA_RX_0:
>>   	case WSA_CODEC_DMA_RX_1:
>> +	case LPASS_CDC_DMA_WSA_RX0:
>> +	case LPASS_CDC_DMA_WSA_RX1:
>>   		/*
>>   		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
>>   		 * to reduce the risk of speaker damage until we have active
> 
> [Severity: Medium]
> Does switching on cpu_dai->id here without checking rtd->dai_link->no_pcm
> collide with Q6DSP TDM DAI IDs, while leaving DisplayPort and WCD headset
> jack setup broken on lpass-cpu links?
> 
> LPASS_CDC_DMA_WSA_RX0 and LPASS_CDC_DMA_WSA_RX1 (36 and 37) have the same
> values as PRIMARY_TDM_RX_6 and PRIMARY_TDM_TX_6 on AudioReach DPCM links.
> Meanwhile, for lpass-cpu links, LPASS_DP_RX is missing from the
> DisplayPort cases below (skipping qcom_snd_dp_jack_setup()), and
> qcom_snd_wcd_jack_setup() only attaches the jack to the codec component
> for LPI_MI2S_RX_0 and TX_CODEC_DMA_TX_0..3, ignoring
> LPASS_CDC_DMA_TX0..3.

Thanks for the analysys, will try to fix it

> 
>> @@ -323,6 +326,10 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>>   		}
>>   		break;
>>   	}
>> +	case LPASS_CDC_DMA_TX0:
>> +	case LPASS_CDC_DMA_TX1:
>> +	case LPASS_CDC_DMA_TX2:
>> +	case LPASS_CDC_DMA_TX3:
>>   	case TX_CODEC_DMA_TX_0:
>>   	case TX_CODEC_DMA_TX_1:
>>   	case TX_CODEC_DMA_TX_2:
> 
> [Severity: Medium]
> Does adding LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX3 to
> sc8280xp_be_hw_params_fixup() alter PRIMARY_MI2S and SECONDARY_MI2S DPCM
> backends instead of affecting lpass-cpu links?
> 
> In sc8280xp_add_be_ops(), sc8280xp_be_hw_params_fixup() is only wired up
> when link->no_pcm == 1 (AudioReach DPCM backend links), so it never runs
> on non-DPCM lpass-cpu links.  On DPCM links where it does run,
> LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX3 (16..19) alias PRIMARY_MI2S_RX,
> PRIMARY_MI2S_TX, SECONDARY_MI2S_RX and SECONDARY_MI2S_TX (16..19),
> changing their minimum channel constraint from 2 to 1.
> 

Right, I'll try to fix that properly

>> @@ -533,12 +540,11 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	int i;
>>   
>>   	for_each_card_prelinks(card, i, link) {
>> -		if (link->no_pcm == 1) {
>> -			link->init = sc8280xp_snd_init;
>> -			link->exit = sc8280xp_snd_exit;
>> +		link->init = sc8280xp_snd_init;
>> +		link->exit = sc8280xp_snd_exit;
>> +		link->ops = &sc8280xp_be_ops;
>> +		if (link->no_pcm == 1)
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>> -			link->ops = &sc8280xp_be_ops;
>> -		}
>>   	}
>>   }
> 
> [Severity: High]
> When sc8280xp_be_ops is attached to non-DPCM lpass-cpu links, does
> sc8280xp_snd_hw_params() misidentify LPASS_CDC_DMA_TX0..7 as MI2S DAIs
> and fail stream setup with -ENOTSUPP?
> 
> sound/soc/qcom/sc8280xp.c:sc8280xp_snd_hw_params() {
>      ...
> 	switch (cpu_dai->id) {
> 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>      ...
> 		if (mi2s_mclk_enable) {
> 			ret = snd_soc_dai_set_sysclk(cpu_dai,
> 						     LPAIF_MI2S_MCLK, mclk_freq,
> 						     SND_SOC_CLOCK_OUT);
> 			if (ret)
> 				return ret;
> 		}
>      ...
> 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> 	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
> 		return sc8280xp_tdm_hw_params(substream, params);
>      ...
> }
> 
> LPASS_CDC_DMA_TX0..LPASS_CDC_DMA_TX7 (16..23) share the same numeric IDs
> as PRIMARY_MI2S_RX..QUATERNARY_MI2S_TX (16..23).  On platforms such as
> sm8650 where mi2s_mclk_enable and mi2s_bclk_enable are set in
> sm8650_priv_data, starting a capture stream on LPASS_CDC_DMA_TX0..7 calls
> snd_soc_dai_set_sysclk() on the LPASS Codec DMA DAI, which does not
> implement .set_sysclk and returns -ENOTSUPP.
> 
> Conversely, actual lpass-cpu MI2S DAI IDs do not match the Q6DSP MI2S
> ranges: MI2S_PRIMARY..MI2S_QUINARY (0..4) hit the default case and skip
> format and clock setup, while MI2S_SENARY..MI2S_SEPTENARY (34..35) fall
> into PRIMARY_TDM_RX_0..QUINARY_TDM_TX_7 (24..103) and are routed to
> sc8280xp_tdm_hw_params().
> 

Hmm, yeah this is quite a regression, I'll try fix it
