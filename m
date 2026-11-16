Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815794;
	b=pa7gND6rKqFclM3pNDxqBykUwtRLcC/jM36PXgTAy+aJLk/dyYb2IUR4/ZE1I3Vw6NTM
	 AGIwxGdWE82YIuw8Z1YafgDYDrzUqMX1kLur/AvsTq0p7a9BZyPwXweJpd5vhOfekbBxA
	 g8YDm7kQtCd9J25uUbdkNa2lw2EYmywlPmCaKLS4Ha4eGKLy5fN9WtFKM5U140J/ID8wY
	 cek60d/09taMlbNf4tBknQg4Q6oJUI5dNxvjyJThjjgbtXV3LiLxjTrIGj/2niCGEM7UM
	 6XxpDZad5OHMKbxdWH5hjkTZ3P6s8vJ7EUwxZJwLL0HGYmRol2GAcvU+4B3TAE4Tmsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1czrIwBonV9DRyHujCD4XcvTMYZ+l7egFuUebdcO7VI=;
	b=dsC91tcCUvj84mQNnahxuWuwOnVUPlSJ/eYxrqRhnJURF3I7/peDjU49nMkZGAVB0gRY
	 EEU9rwKfYbw+esQV72gIiUymYZZHbe/4GLLrrRgOFNAJvjii63HX9CnKxNbfBcRWhIXOL
	 KKjAr1wzTndqXmpSG5RjE/96BSsBkcx7InoaSZb4r2S39LT9aCRjwt/fsDJHpyviL0Thk
	 vzsPz5eHxdV0UlewjlygHLMJvVc2zNJgC9tqKXvgCPuYoRQSLOcWbOGDNzeDFw8T8r19z
	 9tHbJ73SyFMYCBXJfHVdOpVFsbu8EZgUFPDeynhWZUK/9qo5rYeKTmhPR0Dg5vBeZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PagBt+G6;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651FB606A32C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 07:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 651FB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PagBt+G6
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso19825295e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 23:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815791; x=1795420591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1czrIwBonV9DRyHujCD4XcvTMYZ+l7egFuUebdcO7VI=;
        b=PagBt+G6ymrCPIifgVNqsUrSlI1qPm/eZoieceWA0Hxs7U7reD7AW1EHP8WWt+oNkh
         vrL8Emyk4jUVr6FYyo0JZY2GT8RtKtrqTGcaW249zKpD86FsXb7AT/92Q92Oc1yg7t32
         YWd4y+38222zLnYeYpd0lqLua6wdNS3PAasC78Vujk8yNnXOSS8XhOPYi4QVn9LoCk9k
         Jqh4P/N5gJLMC9gVyvWg2S2gU7y2/+JtCPIY0NwwbxtBgXdpC4FPPmjLo7y23h3iQsIu
         KgzPWzww/Y9liO6BicQuoiQKxam/0TvZz5D1dCa2zwqKXy9QPtYO+AcfbbK+BJ9aWMcJ
         IwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815791; x=1795420591;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1czrIwBonV9DRyHujCD4XcvTMYZ+l7egFuUebdcO7VI=;
        b=gmgJ/4mS5TT4GGFUAxXgXw2pkjps4YT/GRUYRfvH1YMS1i+QVc07JzmZR+OwCIaVZ3
         SZUiYBbb/ksoQ42eAL9j07GclE9o4bY06TehbHMWzthpydui41RckE/G3PVKmjzaCxEi
         woc8hsNwR9sxYRMl9xNOp3xu2aXJL5ZQZu5PaA2ZC2wnz3X7fP164D5D8wNvOK6VDZO3
         utHNwomdlm6SbXpJc9cK+BpDlIomVN0oSB1JBoIA+zqU/FfPmCs3uCEUTCZF2g9kub9+
         zMR4nTp2GWhEPHi/LYzCOVZcsE+e2icMR9Lgb0+sxJotg0/KFqPB972AHcTkvBBHIUTY
         zAkQ==
X-Forwarded-Encrypted: i=1; AL+hErHrALU7gbBzgGAoH4i0ibn/11LJwxP8xdRzE8xVR1AiTBJMqQoIZEmNESb/shFaPUHzRDA+HB7jBeca@vger.kernel.org
X-Gm-Message-State: APuU4Z9OfVe72DnisVX0bpeEDTbBMCMf4z1zsrS9Pp68SZw58R4GPJDJ
	B3u6BRM5EjnAqJESUnyG+Je2SfbSPB5kzvir93FgZxh5toOlHrCaUnkSJS83cYrJk90UWs7gdAA
	LnMqN8Vk=
X-Gm-Gg: AYBFou2LL9Hbp8qpjPDztlHa0gKW7NKa4kZGYR/g8G5VJIc8rS0OcWWyMVNH8lfmWXG
	qAmpnY/uzsaf/xVUkJdxD2KZ+Ul5YqAx3YDTRez0j1hjmYKu7FuUVGwXdD33BQIQI9aH0ScGojx
	j5j8wfJWuA7LG59SfWwSn63oGD7LuWtUUiGdyrT2AcowFHC1a7USxwQVLxhK5qKyGth9PsKyG7y
	1p0ggLvMuGzjW/YX9MqcZL6tlyBqdN4IPzfL5BYsd3LDWcs2JfPHSJmNUTzkl56HGFPzhBmthHk
	xxJBCfHPgJl77+Udg8d323rFYaWl6fSP3MnrsIwH+MVzwPbzIkqCnhfLC4qM0vFLgujXc1pM5wD
	CG7OzLwPFIAweVAWq8vQ0kOEehB4EVqG0dwTARvK8DyUTf25BKaUAvwK5JO5QW+B9/IREp06PJI
	pmjmfXQdxqQ9w5ywm2I5xKEk2xA75OfHk5nx8AS3gllyV0ne/kjhLyuTovsLnnMS0y+kGVirpzA
	MXgILYZMHRGJ6vawLwN9w7TZHYJCx2P/6SzSFdhJahWleRU0vq0l2IhQXdixU/vZCOzeX/HYLuj
	+3Hs05OPtsUsfwvRCXG8uCo8eZXyP/KAYyLLBzLQsmkfwwBN+HNiuZKZccN7xP/r57yKVXziVPa
	uKOH/O1I2
X-Received: by 2002:a05:600c:3507:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb68c4240fmr101415995e9.11.1794815791120;
        Sun, 15 Nov 2026 23:56:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm142073925e9.3.2026.11.15.23.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:56:30 -0800 (PST)
Message-ID: <73036d41-bec4-4d09-891b-8a2432a08f2d@linaro.org>
Date: Mon, 16 Nov 2026 08:56:29 +0100
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
Subject: Re: [PATCH RFC 15/23] ASoC: qcom: lpass: allocate LPM buffer memory
 to DAIs
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-15-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213524@kernel.org>
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
In-Reply-To: <sashiko-outbox-213524@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [High] ASoC: qcom: lpass: u32 underflow and OOB in
>    lpass_platform_allocate_lpm()
> - [Medium] ASoC: qcom: lpass: uninitialized capture buffer on
>    full-duplex LPM MI2S PCM
> - [Medium] ASoC: qcom: lpass: unconditional VA LPM reservation blocks VA
>    LPM MI2S
> - [Medium] ASoC: qcom: lpass: missing LPM clock parsing in
>    asoc_qcom_lpass_cpu_platform_probe()
> - [Low] ASoC: qcom: lpass: wrong LPM offset in
>    lpass_platform_prealloc_cdc_dma_buffer()
> --
> 
> commit 038ab20def13fb9da7aca847692783be3d4964b4
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: allocate LPM buffer memory to DAIs
> 
> This commit dynamically allocates LPASS LPM SRAM buffer offsets for Codec
> DMA and non-core LPAIF MI2S DAIs instead of using fixed static offsets.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index 9ebbc422c63c3..4bbcd59ebd602 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -1258,16 +1258,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
>>   			return ret;
>>   		}
>> -
>> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
>> -		if (!res)
>> -			return -EINVAL;
>> -		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
>> -
>> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
>> -		if (!res)
>> -			return -EINVAL;
>> -		drvdata->va_cdc_dma_lpm_buf = res->start;
>>   	}
>>   
>>   	if (variant->mi2s_desc) {
>> @@ -1281,6 +1271,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   						   variant->mi2s_desc[i].reg_name);
>>   			if (ret)
>>   				return ret;
>> +
>> +			if (variant->mi2s_desc[i].lpm_type != LPASS_LPM_NONE)
>> +				drvdata->mi2s_lpm_enable = true;
>>   		}
>>   	} else {
>>   		drvdata->num_lpaif = 1;
>> @@ -1290,6 +1283,20 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   			return ret;
>>   	}
>>   
>> +	if (drvdata->codec_dma_enable || drvdata->mi2s_lpm_enable) {
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
>> +		if (!res)
>> +			return -EINVAL;
>> +		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
>> +		drvdata->rxtx_cdc_dma_lpm_size = resource_size(res);
>> +
>> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
>> +		if (!res)
>> +			return -EINVAL;
>> +		drvdata->va_cdc_dma_lpm_buf = res->start;
>> +		drvdata->va_cdc_dma_lpm_size = resource_size(res);
>> +	}
> 
> [Severity: Medium]
> Should of_lpass_cdc_dma_clks_parse() also be called when
> drvdata->mi2s_lpm_enable is set?
> 
> Because of_lpass_cdc_dma_clks_parse() remains inside the
> if (drvdata->codec_dma_enable) block above, a board that enables LPM-backed
> MI2S DAIs without any Codec DMA DAI leaves drvdata->codec_mem0..3 and
> drvdata->va_mem0 as NULL.  Even with commit "ASoC: qcom: lpass: enable the
> right codec_mem clock when usin LPM memory" later in this series,
> lpass_cpu_daiops_startup() will pass a NULL clk pointer to
> clk_prepare_enable(), leaving the LPM SRAM unclocked when accessed by the
> CPU or LPAIF DMA.


Good catch will fix

> 
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index a953db262aa00..75d2c872f5123 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
> 
> [ ... ]
> 
>> @@ -1315,23 +1348,55 @@ static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *comp
>>   	switch (dai_id) {
>>   	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
>>   		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> -		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
>> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + drvdata->va_lpm_offset;
>>   		break;
>>   	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
>>   		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
>> -		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
>> +				drvdata->va_lpm_offset + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>>   		break;
> 
> [Severity: Low]
> Should these two cases use drvdata->rxtx_lpm_offset instead of
> drvdata->va_lpm_offset?  lpass_platform_allocate_lpm() populates
> drvdata->rxtx_lpm_offset for RXTX Codec DMA, and commit "ASoC: qcom: lpass:
> enable the right codec_mem clock when usin LPM memory" uses
> drvdata->rxtx_lpm_offset to select the RXTX LPM clock, so using
> va_lpm_offset here will desynchronize the buffer address from the clock if
> the two offsets ever differ.

Good catch will fix

> 
>>   	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
>>   		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
>> -		buf->addr = drvdata->va_cdc_dma_lpm_buf;
>> +		buf->addr = drvdata->va_cdc_dma_lpm_buf + drvdata->va_lpm_offset;
>>   		break;
>>   	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>>   		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
>> -		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + drvdata->wsa_lpm_offset;
>>   		break;
>>   	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>>   		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
>> -		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 3;
>> +		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
>> +				drvdata->wsa_lpm_offset + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>> +		break;
>> +	case MI2S_PRIMARY ... MI2S_QUINARY:
>> +	case MI2S_SENARY ... MI2S_SEPTENARY:
>> +		if (is_lpm_mi2s_port(drvdata, dai_id)) {
>> +			unsigned int port_id = mi2s_port_id(dai_id);
>> +
>> +			buf->bytes = lpass_platform_lpm_mi2s_hardware.buffer_bytes_max;
>> +			switch (drvdata->mi2s_lpm[port_id]) {
>> +			case LPASS_RXTX_CDC_LPM:
>> +				if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
>> +					buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
>> +						    drvdata->mi2s_lpm_offset[port_id];
>> +				else
>> +					buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
>> +						    drvdata->mi2s_lpm_offset[port_id] +
>> +						    LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>> +				break;
>> +			case LPASS_VA_CDC_LPM:
>> +				if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
>> +					buf->addr = drvdata->va_cdc_dma_lpm_buf +
>> +						    drvdata->mi2s_lpm_offset[port_id];
>> +				else
>> +					buf->addr = drvdata->va_cdc_dma_lpm_buf +
>> +						    drvdata->mi2s_lpm_offset[port_id] +
>> +						    LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
>> +				break;
>> +			default:
>> +				break;
>> +			}
>> +		}
>>   		break;
>>   	default:
>>   		break;
> 
> [Severity: Medium]
> Does lpass_platform_prealloc_cdc_dma_buffer() leave the capture
> substream->dma_buffer uninitialized when an LPM MI2S PCM has both playback
> and capture streams?
> 
> At the top of lpass_platform_prealloc_cdc_dma_buffer(), only one substream
> is selected:
> 
> sound/soc/qcom/lpass-platform.c:lpass_platform_prealloc_cdc_dma_buffer() {
> 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
> 		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
> 	else
> 		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
> 
> 	buf = &substream->dma_buffer;
> ...
> }
> 
> Unlike Codec DMA DAIs (which have separate unidirectional RX and TX DAI
> IDs), a single MI2S DAI can have both playback and capture substreams on
> the same struct snd_pcm.  When both exist, only the playback dma_buffer is
> initialized and memremapped, while the capture substream->dma_buffer stays
> zeroed.  Opening the capture stream in lpass_platform_pcmops_open() then
> sets runtime->dma_area to NULL via snd_pcm_set_runtime_buffer(), causing a
> NULL pointer dereference in lpass_platform_copy().

Good catch, will fix

> 
> [ ... ]
> 
>> @@ -1464,6 +1527,64 @@ static const struct snd_soc_component_driver lpass_component_driver = {
>>   
>>   };
>>   
>> +static int lpass_platform_allocate_lpm(struct lpass_data *drvdata)
>> +{
>> +	u32 rxtx_cdc_dma_lpm_remain = drvdata->rxtx_cdc_dma_lpm_size;
>> +	u32 va_cdc_dma_lpm_remain = drvdata->va_cdc_dma_lpm_size;
>> +	u32 rxtx_cdc_dma_lpm_offset = 0;
>> +	u32 va_cdc_dma_lpm_offset = 0;
>> +	int port_id;
>> +
>> +	if (drvdata->codec_dma_enable) {
>> +		drvdata->rxtx_lpm_offset = rxtx_cdc_dma_lpm_offset;
>> +		rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +		rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +
>> +		drvdata->va_lpm_offset = va_cdc_dma_lpm_offset;
>> +		va_cdc_dma_lpm_offset += LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
>> +		va_cdc_dma_lpm_remain -= LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
>> +
>> +		if (drvdata->wsa_enable) {
>> +			drvdata->wsa_lpm_offset = rxtx_cdc_dma_lpm_offset;
>> +			rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +			rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +		}
>> +	}
> 
> [Severity: Medium]
> Does reserving LPASS_VA_CDC_DMA_LPM_BUFF_SIZE whenever
> drvdata->codec_dma_enable is set prevent using LPASS_VA_CDC_LPM for MI2S
> when only RXTX or WSA Codec DMA is enabled?
> 
> of_lpass_cpu_parse_dai_data() sets drvdata->codec_dma_enable = 1 for any
> RXTX, WSA, or VA Codec DMA DAI.  Because the hardware lpass-va-cdc-dma-lpm
> region is 12 KiB (LPASS_VA_CDC_DMA_LPM_BUFF_SIZE), subtracting
> LPASS_VA_CDC_DMA_LPM_BUFF_SIZE here even when no VA Codec DMA DAI is in DT
> reduces va_cdc_dma_lpm_remain to 0, causing the LPASS_VA_CDC_LPM check
> below to always fail with -EINVAL.

Good catch will add the check for VA

> 
>> +
>> +	if (!drvdata->mi2s_lpm_enable)
>> +		return 0;
>> +
>> +	for (port_id = 0; port_id < LPASS_MAX_MI2S_PORTS; port_id++) {
>> +		if (!test_bit(port_id, &drvdata->lpaif_port_enable))
>> +			continue;
>> +
>> +		switch (drvdata->mi2s_lpm[port_id]) {
>> +		case LPASS_RXTX_CDC_LPM:
>> +			if (rxtx_cdc_dma_lpm_remain < LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE)
>> +				return -EINVAL;
>> +			drvdata->mi2s_lpm_offset[port_id] = rxtx_cdc_dma_lpm_offset;
>> +			rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +			rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +			break;
>> +		case LPASS_VA_CDC_LPM:
>> +			/*
>> +			 * VA Codec uses 12KiB, but MI2S uses 8KiB
>> +			 * Meaning only VA _or_ a single MI2S can be enabled
>> +			 */
>> +			if (va_cdc_dma_lpm_remain < LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE)
>> +				return -EINVAL;
>> +			drvdata->mi2s_lpm_offset[port_id] = va_cdc_dma_lpm_offset;
>> +			va_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +			va_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
>> +			break;
> 
> [Severity: High]
> Can rxtx_cdc_dma_lpm_remain and va_cdc_dma_lpm_remain underflow and assign
> out-of-bounds LPM buffer offsets here?
> 
> Both cases check for LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE (8 KiB) remaining,
> but then advance the offset and decrement the unsigned u32 remaining
> counter by LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2 (16 KiB).  On a 12 KiB
> lpass-va-cdc-dma-lpm region (0x3000 bytes), enabling one MI2S port on
> LPASS_VA_CDC_LPM passes the < 0x2000 check and subtracts 0x4000, wrapping
> va_cdc_dma_lpm_remain to 0xfffff000:
> 
> 1. If a second MI2S port on LPASS_VA_CDC_LPM is enabled (such as both
>     MI2S_QUATERNARY and MI2S_QUINARY), 0xfffff000 < 0x2000 is false, so it
>     is given an offset 16 KiB past the start of the 12 KiB VA LPM region.
> 2. Even with a single MI2S port on LPASS_VA_CDC_LPM, a capture stream in
>     lpass_platform_prealloc_cdc_dma_buffer() is placed at
>     mi2s_lpm_offset[port_id] + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE (8 KiB ..
>     16 KiB), overflowing the 12 KiB VA LPM region by 4 KiB during
>     memremap(), mmap(), and DMA.
> 3. The same u32 underflow occurs on LPASS_RXTX_CDC_LPM whenever 8 KiB
>     remains before subtracting 16 KiB.
> 

Good catch, will check for LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE*2
