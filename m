Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815453;
	b=3vK/AuwSd63vzsgGd6PM/xV5kAhPaUSzBS+gWxRXfby9AbsNGyJ79pejqxH1m0izWGzg
	 mY8TjK+UuTxYEuyo1jzORvPPl8v+XoS3zZV4wCPOe/NFCQtRGa6buCYC07fMav4xsGPad
	 har8r85j+l2wF0UXSSQRGvU6Fn5b12tKoFUEsMg7UAImow87PKVlkhBzm1PS6k4UJ+svm
	 oYlw03mEEe8qGpSx/wwlW2pf1GMtcYJ8f+/W5sNaczlXxEbTzpgkhBJWKO8uoh2YKAmSj
	 qdFD/F/LlZAkR8NHZ34twFolOIOJztQk9tsKEiKtw8UL/M1/YnxSHawojCBLM2pPgNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=gBevyYkB+KqpxLupXF92krJAbcbx52iOwb7rRaPzSaU=;
	b=xV2FdOdKe1/OG15Iw54XSy5Ybv72IyhzA5soM73lPzpvbOM3KIJS91rj8ia0kvYzMs31
	 +tI7hC6t0Dx3ech7bSPxU+XiyxaFNSZZCSPChx/9IqAZvo5lLQXNZmwLo+O/rB04YF5at
	 m3T6ZkiMhQc14jRAiGKkw+UuTfAIeCDRIR1y1o2LYfyilMkGGQQpl821fRGZfczb/qOxE
	 aEbZ1dOJK1l/XkmjUAaUmCtRQKbnPrSkFlCkNcAtIpFLKGQmfQ6bIfOT6P33jzgU5qBKH
	 KkmZ/shEzkN4j3biinaXp4xCx5zvCSyhbYlWJbmyKxydfXL/wfrK2EjicwYfY8XARmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p3t64VCH;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15AD606A323
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 07:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C15AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p3t64VCH
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4919a880834so1461139f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 23:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815451; x=1795420251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBevyYkB+KqpxLupXF92krJAbcbx52iOwb7rRaPzSaU=;
        b=p3t64VCHuH0CfExDvDQNLTUnA8yJcL7hr2Su/honJPU3WAwc0Il6KYqHeHKAC6yBMU
         KfyzitKrykfz2YNIXm77E/vj8iJ9e3AEEzgCStiYMfxV5tBBEh3XmE3CmTDH6jjgO9lx
         1hHbHiKFJy8D+Zxa7X1X1RuYdYxDepNMWieAQAjYLv5cV4RtzpxvY/DLauQvOSKiOfZb
         Tnky9PKiBOJccIsSjDsdtIQNWpo8BHyjw96wlDYE71UV+gCtACUwnhhnYUfsRjBhr2SD
         YuX2Wt6A6tU+9PphYPz2oqzM7jGNZMvGCDMLTnlACJZsCruFSlim6C4qwpuGUYn6dinT
         9vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815451; x=1795420251;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBevyYkB+KqpxLupXF92krJAbcbx52iOwb7rRaPzSaU=;
        b=dkW0OeNvM938LE72H09kTbjLgwl97qO6zl9IKQoTDb+z7I7cdJOl2aGnRiBljKmC2P
         B0OBPVQHSsJdvouqu28HLYWgUhYRJlpHG13V3r2wuk7JYl4hlEBVAhMQHD7cf5Gj71ob
         jaX7iTC9L8+fkRF2xzoW0/cNTB/HKM9Ty2d54MLYiKEy6h11FxKVrYn05dBcuKiviPcq
         SQU7VYArkSHqQuowMJMDLih1lyP6krG29XLdAQdyiezFU2/2GskIV72IYKUkMguJ56QD
         OqF7ag76JNERbzhV2s+KvxdDxTfo5ppX+JoYL6NaD3h9b+GPUkaBTFOQhK0FWPs09MBF
         ttrg==
X-Forwarded-Encrypted: i=1; AL+hErG5QfLh0y4IvcDUmecV2rcwGqKsWFol+cOVt9dCyyTgYve6AIiwkA+2YRHkf1e9Nxu1m61Iw+8JAq5E@vger.kernel.org
X-Gm-Message-State: APuU4Z/SbM1aI9iYj+G5NX/ZEFcIcYXekL61a31iU4GuB7EsKtJOmzKe
	mc74oG9M5mBgWIMq3uUi02t88PcbUPHe8z5hutHMta+GcBxZ6QaL8MBR0aN37bJ1Mfg=
X-Gm-Gg: AYBFou27iCWuJSCvkszkKZO8k/+o65xQHuxefSKhkLhbEV1DEEuamJA0pT0fNNsYrH9
	tBwUin3TAYhIgHmVziT7pLD2oCCVlxC0VyQSs2nOISipgmni/lN2kJu5YCVMH1Eqxeggj9jd6vh
	qAqUw3VLQWg1y1axn5Dx7RUupx5yhd3PRtDSHs9Q5aK2DmpjGEYh09UX2nT4qWV2qYisP0KcUr3
	cMxwyrZD6uHV+lYfX97guRTuTTEncnku5rwx7Z+PtvXLzn/1hWv/QapA0X41Fra7+O7XlubTosG
	4BRfcYpV9QoVzVsL/Rhkd6VkGwwIU5vkdkqREF9M7wg01uphRt66lBneLjbmT7pQ7tXWC/sqIN1
	erovlWWiGlD9v9f2m7ajMUu92UjzQcdjT3rvTksL2TwwPqXWEi4LUplZ/o0daKVNTtVV+wBI8Yu
	h8bm3BmPziS46ZalbVlXI89tIJUeJi7wbm7XzKgCRElvvYbRI0bM8o4NetwBll3azEgdq6xyIuC
	HLjNl16R+dvCgj0ZH5gmbaIiSiOcLxz0hOXuafGA+loU4OcOyI1zkjzxgbukwYNMRg/XDY2E8j6
	OTR7WQ972Qw2sRkstuRzOYrbMwWpJgID3fhycVIybk0Av10nogkxIkiBmMOVw8nVleMnSlWEgtS
	LAKyJ54ml
X-Received: by 2002:a05:6000:4582:b0:48e:44c7:bf0f with SMTP id ffacd0b85a97d-49c714a352fmr16250325f8f.25.1794815450969;
        Sun, 15 Nov 2026 23:50:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm22775989f8f.11.2026.11.15.23.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:50:50 -0800 (PST)
Message-ID: <402595f8-0aec-405d-bcce-eb54981fcbb9@linaro.org>
Date: Mon, 16 Nov 2026 08:50:50 +0100
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
Subject: Re: [PATCH RFC 10/23] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-10-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213505@kernel.org>
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
In-Reply-To: <sashiko-outbox-213505@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: qcom: missing WSA_TX4 case in
>    __lpass_get_codec_dma_intf_type()
> - [Medium] ASoC: qcom: unchecked clk_prepare_enable() in
>    lpass_cdc_dma_daiops_startup()
> --
> 
> commit fe9e37da583fba7a4cfa98118783d3ccffae7524
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA
> 
> This commit adds WSA codec DMA interface plumbing and clock handling to
> the LPASS codec DMA driver.
> 
>> diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
>> index 2dc8c75c4bf08..903055e3188d8 100644
>> --- a/sound/soc/qcom/lpass-cdc-dma.c
>> +++ b/sound/soc/qcom/lpass-cdc-dma.c
> 
> [ ... ]
> 
>> @@ -68,49 +76,67 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
>>   	case LPASS_CDC_DMA_RX0:
>>   	case LPASS_CDC_DMA_TX0:
>>   	case LPASS_CDC_DMA_VA_TX0:
>> +	case LPASS_CDC_DMA_WSA_TX0:
>> +	case LPASS_CDC_DMA_WSA_RX0:
>>   		ret = LPASS_CDC_DMA_INTERFACE1;
>>   		break;
>>   	case LPASS_CDC_DMA_RX1:
>>   	case LPASS_CDC_DMA_TX1:
>>   	case LPASS_CDC_DMA_VA_TX1:
>> +	case LPASS_CDC_DMA_WSA_RX1:
>> +	case LPASS_CDC_DMA_WSA_TX1:
>>   		ret = LPASS_CDC_DMA_INTERFACE2;
>>   		break;
>>   	case LPASS_CDC_DMA_RX2:
>>   	case LPASS_CDC_DMA_TX2:
>>   	case LPASS_CDC_DMA_VA_TX2:
>> +	case LPASS_CDC_DMA_WSA_RX2:
>> +	case LPASS_CDC_DMA_WSA_TX2:
>>   		ret = LPASS_CDC_DMA_INTERFACE3;
>>   		break;
>>   	case LPASS_CDC_DMA_RX3:
>>   	case LPASS_CDC_DMA_TX3:
>>   	case LPASS_CDC_DMA_VA_TX3:
>> +	case LPASS_CDC_DMA_WSA_RX3:
>> +	case LPASS_CDC_DMA_WSA_TX3:
>>   		ret = LPASS_CDC_DMA_INTERFACE4;
>>   		break;
>>   	case LPASS_CDC_DMA_RX4:
>>   	case LPASS_CDC_DMA_TX4:
>>   	case LPASS_CDC_DMA_VA_TX4:
>> +	case LPASS_CDC_DMA_WSA_RX4:
>>   		ret = LPASS_CDC_DMA_INTERFACE5;
>>   		break;
> 
> [Severity: Medium]
> Should LPASS_CDC_DMA_WSA_TX4 also be included in the
> LPASS_CDC_DMA_INTERFACE5 case?
> 
> __lpass_get_dmactl_handle(), lpass_cdc_dma_daiops_startup(), and
> lpass_cdc_dma_daiops_shutdown() all handle the full
> LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8 range, but omitting
> LPASS_CDC_DMA_WSA_TX4 here causes __lpass_get_codec_dma_intf_type() to
> return -EINVAL and __lpass_platform_codec_intf_init() to abort without
> configuring or enabling the DMA interface.

Typo, will fix

> 
> [ ... ]
> 
>> @@ -184,6 +210,17 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
>>   		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
>>   		clk_prepare_enable(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);	//??
>> +		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);	//??
>> +		clk_set_rate(drvdata->codec_mem2, CODEC_MEM_HZ_NORMAL);	//??
>> +		clk_set_rate(drvdata->codec_mem3, CODEC_MEM_HZ_NORMAL);	//??
>> +		clk_prepare_enable(drvdata->codec_mem0);		//??
>> +		clk_prepare_enable(drvdata->codec_mem1);		//??
>> +		clk_prepare_enable(drvdata->codec_mem2);		//??
>> +		clk_prepare_enable(drvdata->codec_mem3);		//??
>> +		break;
>>   	default:
>>   		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
>>   		break;
>> @@ -205,6 +242,13 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
>>   	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
>>   		clk_disable_unprepare(drvdata->va_mem0);
>>   		break;
>> +	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
>> +	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
>> +		clk_disable_unprepare(drvdata->codec_mem3);
>> +		clk_disable_unprepare(drvdata->codec_mem2);
>> +		clk_disable_unprepare(drvdata->codec_mem1);
>> +		clk_disable_unprepare(drvdata->codec_mem0);
>> +		break;
> 
> [Severity: Medium]
> What happens if clk_set_rate() or clk_prepare_enable() fails in
> lpass_cdc_dma_daiops_startup()?
> 
> Ignoring errors here lets the stream proceed with unclocked LPM memory,
> leaves any earlier codec_mem clocks enabled on partial failure, and
> causes lpass_cdc_dma_daiops_shutdown() to call clk_disable_unprepare()
> on clocks whose enable failed.  Later commit "ASoC: qcom: lpass: enable
> the right codec_mem clock when usin LPM memory" removes the "//??"
> comments and selects a single clock via lpass_cdc_dma_mem_clk(), but
> still leaves clk_set_rate() and clk_prepare_enable() unchecked.
> 

Will fix the comments, the code uses the same schema as RXTX and VA, not checking
the ret. If the clcok set fail, audio won't output but it wont cause any crashes.

Neil
