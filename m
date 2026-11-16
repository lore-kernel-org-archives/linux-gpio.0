Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815886;
	b=yAbueJim63oKUJQvNEmywiSovWqXfg+lEZ5O8cRdh7BAhN0m4kNMQarXXc68DzFwTxcl
	 0b9DjE1rQatwGCNSwXwmxFAsFv9+VwlHgqdEc/adHh6pxUhDmYvom4CqraoVa54iXUh0D
	 FdYXlNVsyh+MHMoPD5L3QwSEMKrUDSKcuifC//TOeu9rTdNlS0Zi+CSkLeXndnFJfl5yU
	 l9xvwzZ/wazcyTvNuXuBx8TtXUFAX2l0SwXvbvnRIYhgQLJBnEWRYE45gBdsp3lSKHDnk
	 uxaDsKkWpbluVAqQIqueyQjlIneQ3P7rOdM7OCG6/ekIHgcC1mXI98a96aVVkpG9iFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
	b=oMNJSYxBaDOt24tX/JKGezKiyuvfsBKeoQM7eXnLOAvG+UKaRcGf+NusaIv5V/NjAoBa
	 E4faPLubcNjF4u8VYO+sLjU2rqxPoN/YO+1QNnE7/Wh+rYAWURTxzfgDv7oVeJevy9G9Q
	 1TNu4yx+loSl2DLKTAuea6lwW5rj4rPZvkUpD0d/EbaijWU9FZT7ZHa3lmmRPA82QedKP
	 wb1OjdCK89Dsl/M283dxar4TGw7QD3ZDztUkRlqMUcEMRYo0diWsmbi6M/ZkzDNnQhdR9
	 oPzmuC/gLrlQhwZJzWk8SZtWjNwkW4bsB0pW7XL+JaU3xSTuxYACmOP+3EboWk/Ny0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npM0ztI0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4124D606A31C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 07:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4124D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=npM0ztI0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so24697165e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 23:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815885; x=1795420685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
        b=npM0ztI0LtVYqRZr0DvMeWHn12SVbpxpx0lBhJuPYVwoOtOUleaIirc27/saVpl7Pk
         5P6PuQiAYXxwv9IRM14RmMKA3MG626vssgDaUod24rvIWt7sFN4DfreQmPamluL9YUHo
         NVIkyNOkYCTlknxGWHKdZNwHfGr/ktvnhRPVqu6GYc6TIIxHHqS6y+gFnCx6QTpXsADi
         yQ3Dx1Ke+gI2gpCaW8Q6i5l0yU7wX0kl3JEcUVYxH3kcsmH6erRbxCRU1NdnNdrHmSak
         RJrvIVD73aBFAaet1WSVN/miz6hjkeY41MEvh+yyS6ssJi/enN7RbzvbBE6GzYRrc9Pn
         vI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815885; x=1795420685;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDKWR0Bggbyju/TIs5Ee13LupgHgIQxhXl50fDo0WC4=;
        b=Dhzjc9eZ2mn5ktjDt+8O3wfnUa5n6jQvSZg4tDNjShKn7dc7bHdHa+P6MH6VKbu1QM
         4Ue8VLMVHXnCxfZSaZc9lSSyhKmOIysXtn+2BKn3WrkU9w+B49bLsQ4P14T8pE3agMA1
         2uxDeU1ykr0EYAO4s7KyYFXQ7iAKGC4h1UZShOP2ObWuWQ3Bc+VPecKmecrDhnm92g2a
         rZrpx0e+5SxDfjEaAxyJVhg8cP3Na4m7kDqZMhrAlca9p6TOg0FZGBsiv4v/ZaboQ+ve
         4x9z4L7wWsg6bERTT1Wq+GA9t3iz4WC2UvJFNFOXghlVPjNmtppP8keDx1aTgGmJvzjA
         z6UA==
X-Forwarded-Encrypted: i=1; AL+hErGkmijSBOaT5t+iyaTLQUcekoFDvC61y3G7iYXRwExahYXl5MRN4UCXu0ocY9z/5Lx15kjTHC29eZk0@vger.kernel.org
X-Gm-Message-State: APuU4Z9sbM89/aYCP5H4F/H6v3uIQB/m8XaswAqMTNWWnLMR6sDN1cYW
	gziHNPpZtp3w+McJhXtgpkGBn65YZCUP5LzyQD94Jvw6OHN5UWsCIcZNIfF6CWezew8=
X-Gm-Gg: AYBFou0cV8C22epYHi6V6r1doTYsCqzYicujkxLgwX/z/SB4ldFilHlfE/nzsY3JdQb
	sMftJKW2b2GJjpeN9rZqKsnyw6CauhWFZl8tLOawFJkBuo3JdMQ8MkBy3fq9hv/YKLPjc3+71sk
	6SzUR3PVv4NpdrQ7U4SKG/bfd0cM/sgl5ciH1/ir1nTMh1WXxSf6mQrw4fp5wlwubHydd82LFhn
	0Jp4BKDQY+UGKYgohS5L636FD+wenOsFsPw+mSxA6lpBRXwVZ2tTKDQV4++qsKwHEfLjun4fLtb
	KD66Q9XHU/f6zC4+Ot7o4ujSaB2ujsSe/uuGrR+0ZdAodnXtmBK0+4EN8qsFrG1YCS6obpbbeBo
	OPIRtWcDkptj4mVlT3bC+EmwDfs7R0FzTy8Jj1seYIKxfLjoAmfneGjW8X3O++duI0rKgGX2gsY
	VBgKLDCPQalgGb0/k5z2Vhl1H0Gol3lCwsAHPgd5XUyLYoDamBKl/MZ2ZN1D3N+gduJ8Yt4eSG3
	YA9PCgLGJhN2LHnAROOQvt9w5bL84CSKotYUSgMfo8WWIe2yMXKoyJtyTPSaMwlhvFQalGIhkf0
	/PDeV2Oe5FmVGR0rRSKfE/JAOC/t+ivJLXhsfFTdLafRgXK4oHL9yKxfMXcD3VyNk8vuV5BTmye
	i9DXY4U9/
X-Received: by 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr197195635e9.15.1794815884566;
        Sun, 15 Nov 2026 23:58:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm19888971f8f.59.2026.11.15.23.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:58:04 -0800 (PST)
Message-ID: <2cda0533-111f-41dc-aed4-7e2b72b0b927@linaro.org>
Date: Mon, 16 Nov 2026 08:58:03 +0100
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
Subject: Re: [PATCH RFC 16/23] ASoC: qcom: lpass: enable the right codec_mem
 clock when usin LPM memory
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-16-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213502@kernel.org>
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
In-Reply-To: <sashiko-outbox-213502@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] ASoC: qcom: lpass: LPM clocks not parsed when only
>    mi2s_lpm_enable is set
> - [Medium] ASoC: qcom: lpass: unchecked mem_clk enable and leak in
>    startup()
> --
> 
> commit 6968d3f5a8288f5418d4e48725abed1263de22d5
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: enable the right codec_mem clock when usin LPM memory
> 
> This commit adds a helper to select the codec_mem clock matching a given LPM
> buffer offset and enables the corresponding LPM memory clock during DAI
> startup and shutdown for Codec DMA and LPM-backed MI2S ports.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index 4bbcd59ebd602..302c31b23090f 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -89,6 +89,17 @@ static int lpass_cpu_daiops_startup(struct snd_pcm_substream *substream,
>>   	unsigned int port_id = mi2s_port_id(dai->driver->id);
>>   	int ret;
>>   
>> +	if (is_lpm_mi2s_port(drvdata, dai->driver->id)) {
>> +		struct clk *mem_clk = drvdata->va_mem0;
>> +
>> +		if (drvdata->mi2s_lpm[port_id] == LPASS_RXTX_CDC_LPM)
>> +			mem_clk = lpass_cdc_dma_mem_clk(drvdata,
>> +							drvdata->mi2s_lpm_offset[port_id]);
> 
> [Severity: Medium]
> Can mem_clk be NULL here when a board enables LPM-backed MI2S ports without
> any Codec DMA DAIs?
> 
> In asoc_qcom_lpass_cpu_platform_probe(), of_lpass_cdc_dma_clks_parse() is only
> called when drvdata->codec_dma_enable is set, whereas the LPM memory resources
> are fetched when either codec_dma_enable or mi2s_lpm_enable is set:
> 
> sound/soc/qcom/lpass-cpu.c:asoc_qcom_lpass_cpu_platform_probe() {
>      ...
> 		ret = of_lpass_cdc_dma_clks_parse(dev, drvdata);
> 		if (ret) {
> 			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
> 			return ret;
> 		}
> 	}
>      ...
> 	if (drvdata->codec_dma_enable || drvdata->mi2s_lpm_enable) {
> 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
>      ...
> }
> 
> When only drvdata->mi2s_lpm_enable is set, drvdata->va_mem0 and
> drvdata->codec_mem0..3 are never populated and remain NULL.  Passing NULL to
> clk_set_rate() and clk_prepare_enable() is a no-op, leaving the LPM SRAM
> unclocked when the stream accesses the LPM buffer.  Calling
> of_lpass_cdc_dma_clks_parse() under the codec_dma_enable || mi2s_lpm_enable
> check would ensure the clocks are acquired.

Yes since it's a no-op, it's fine getting NULL

> 
>> +
>> +		clk_set_rate(mem_clk, LPASS_CODEC_MEM_HZ_NORMAL);
>> +		clk_prepare_enable(mem_clk);
>> +	}
>> +
>>   	ret = clk_prepare_enable(drvdata->mi2s_osr_clk[port_id]);
>>   	if (ret) {
>>   		dev_err(dai->dev, "error in enabling mi2s osr clk: %d\n", ret);
> 
> [Severity: Medium]
> Does this leak the prepare and enable references on mem_clk if enabling
> mi2s_osr_clk or preparing mi2s_bit_clk fails?
> 
> Whendai->driver->ops->startup() returns an error, snd_soc_dai_startup() does
> not mark the DAI as active, so snd_soc_dai_shutdown() will not call
> lpass_cpu_daiops_shutdown() to release mem_clk.  In addition, neither
> lpass_cpu_daiops_startup() nor lpass_cdc_dma_daiops_startup() checks the
> return values of clk_set_rate() and clk_prepare_enable() on mem_clk, which can
> leave LPM memory unclocked and cause an unbalanced clk_disable_unprepare() on
> shutdown.
> 

It _could_ happen, I copied the cdc-dma scheme, but since it's ina new file
I'll add the checks to avoid that

