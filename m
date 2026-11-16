Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815152;
	b=WgqvLp5PV9PpK9vTNntt+fe2RwKCOCig4KtAnzWtYlWLuUkprtm4aH295T/6AyWEejIU
	 M4HTR1xE/wF19oP+tOrruzgktXyG8wsZCka1ESvkd9YWIKV+iEpIQvNdifSPT4CWOFp9j
	 j3bAmHKyDtDs7tM2dhgAYt2mKh+tJYTrj85jFyEBlfMzrcBIY5RHHH0fZ52XZvGZJoKCF
	 g6VBL04lg7ORpEO7mXR0xKYc051kEjhb0dno5KirFsT28IMuEhx8+2abL7y4bY4zFQ7S/
	 P17yiNxwtTuGKb5Mv52lIQHn10n9T4YjrY0nFbh2v/3yXLQ9wDQ9WTner+z3qf4qMgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
	b=GYXD1xkAEfyQ/dp2aH3mz5OPRmqqrCT2krxOmPBbFGgKAs9WGYB7GT3koIDMy5BYlwUt
	 bujMXWcu76F775xqva7GPIG0Qj1aSHS1IpQ27sF1YimOuz+dZXsmAbj2qWPW4dFgydMEH
	 6qKnYhOqdDmkRVhVMHhBVns7vCvbd+ftZhkjoebzIiDzgM4IDqTPFd144mbUG4r6OjboY
	 ulSEd4PHq8QQNtekpdfbH3CNDnm6XBcg2THs0925XUrzRpF3iwoZTmhwIKKy/bxDTVSMe
	 rkNkQO73/N0TzcZ7jhq7VTUsQouwNosurr2BeFmthKqGrpvEY6RzoKsn90WKTTqZHqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uH1UHW+6;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BAA606A8AB
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 07:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99BAA606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uH1UHW+6
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so6842015e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 23:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815150; x=1795419950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
        b=uH1UHW+6Nv9uV3veKzI/XGJ8jLiL8Cjag2K34dTGu0nQzmp/7Tfwie3Z5uy93db4ql
         aL7ODeEcFcKSaY7mUckXRxrYTz9Q7ockBjR4Xr/YUESryIkW0xzPnxrwrtpaI1WwVqrl
         We9+87Ls8rHaXCmS0eC+84jNWIc+0TqoR5QTGeU+wGEm2cGpyHYZ1UghzAJeQen4SNSy
         3r+K1LmY9dED9KAu30Dc71UyUP6ehlBI0Ayz+AzvRRlTqhnAPY60UldSazttB2LsyNuc
         Amor4HzjPqZd2IJX8lnXoCaGga2B8E6JyUfwEBka+NJ2yXdl/nZbOM8xzxOz9iPRVUFo
         RoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815150; x=1795419950;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnB58VtwIqHbFAiwQpoPWYvPypnxq/uodwoMm6+SFKg=;
        b=YltGM1yTfGEN3nocK4UsPW1hM8aOnG/2rCM0wcKYquMlE4gAo997IAWoMrlYGrxMf2
         V6hgbyY8HsjtyCNaCUJRHSgDYTXTduouflBxBHINqCa0lZI3Kh0OmHa2KPPdEn9nYzeb
         cd9XlKciN8+2CfCdXlC81D7ptHOYEg+ANZ1E2Jypx8CXZxfb3MeKlnIQUKi1M8/7H59G
         zG4sWe4CjeSXkAyoxtULjOumHOxXjfW95a3NbWBNalFNbcBxLY9D8h/apmagvZLkK97V
         JAo+9yTtIotT46EAXWztcR8NwN8LStSMYXIxLmsR8nW01BmFU9RyaJ2puuf0W62jnF+5
         a5bA==
X-Forwarded-Encrypted: i=1; AL+hErHGwS2L26aQN9zbrgZcWiQv9vTTmaI04VLKxVWGgy0QQGimxFy0psWnnxlcps1qRtxjD2aBm68qOreo@vger.kernel.org
X-Gm-Message-State: APuU4Z8rD+vCq0Owcw88nZM2d7XSw/OVhU/nLHYo7MWk7zC7oLzyNdlK
	z5SkbDIIxv+erI6AL/sY6LOdByJdnuobBdYM/q3w83nMssY0kpAptV3kZwrN5uYjQjU=
X-Gm-Gg: AYBFou15K/cAban1mETMRptcy1mnLG9chdskPYdjKfHDNriiLJ99gMjv/2PWAVZFj0K
	VkQ2DmGjyF39HXTh5RYtaMgal13LX44Wp1zTXuHyckr0hUJrhBkT0kIx/8XzhpjiVY1lpPFu5Vp
	zjUBEV6yu9eH6IAaRVSiGexu+mek9oE5zM/H4VjfPPkrtscZgVgcddgn3e0ZMs2WNfGQQOQqzac
	g0IsUHZM5qiWWlKlyMR5Lvx4OEdTC0+sXvli5nVZSzsvOvJa+jt3oiYicc95n+ajec3GmBHg+Mj
	TuvFuwGjHQc+W93ZKOW+GeH7ATi6S3eSeHsci9FB50Lg0M2vsH8vMcM49VazR95N2xDkhW0hSwh
	A9mjHbFiAuHEchfro5EXeSfc+v0nspPI0vpwtgdtKH7J5aanCP1YYpVYm5iKGQFLaARO6IvxfEa
	AFVxa57vjKlZDcfh7S6wooIcaMa7gNcQIOeRzu2IpaU2rQWFL1XGWeE/qcG7WcgemohPoElOgM/
	SYQURnOJGk5PQ8Eagrr8sYW3RTrmMC4unnmPo/Rxbu0KToFvkOYegQuyBnTf7pHM+9x6HBD9XUd
	m+3os5aN/TiFAC6KmEyCZGCSvh3oBX8ygKzuiv32n8TahsaoLvd4VqBEFBJIFT3GYDSoSNd4boJ
	7z0KrldCWIg==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr214478045e9.11.1794815149872;
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm89916945e9.2.2026.11.15.23.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:45:49 -0800 (PST)
Message-ID: <04b0fbb4-6083-4321-a907-f3b23a4c90f1@linaro.org>
Date: Mon, 16 Nov 2026 08:45:49 +0100
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
Subject: Re: [PATCH RFC 07/23] ASoC: dt-bindings: qcom,lpass-cpu: document the
 SM8650 LPASS
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-7-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213486@kernel.org>
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
In-Reply-To: <sashiko-outbox-213486@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 19:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] ASoC: dt-bindings: qcom,lpass-cpu: split unwieldy per-compatible
>    schema
> --
> 
> commit f17c7c8f20845c2d15f821f60a13b5f93656ae8d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: dt-bindings: qcom,lpass-cpu: document the SM8650 LPASS
> 
> This commit adds the qcom,sm8650-lpass-cpu compatible string and its
> register, clock, and interrupt definitions to the qcom,lpass-cpu binding
> schema.
> 
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> index 3a559bd07a79b..f431173a0e880 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>> @@ -23,32 +23,33 @@ properties:
>>         - qcom,apq8016-lpass-cpu
>>         - qcom,sc7180-lpass-cpu
>>         - qcom,sc7280-lpass-cpu
>> +      - qcom,sm8650-lpass-cpu
>>   
>>     reg:
>>       minItems: 1
>> -    maxItems: 6
>> +    maxItems: 8
>>       description: LPAIF core registers
>>   
>>     reg-names:
>>       minItems: 1
>> -    maxItems: 6
>> +    maxItems: 8
>>   
>>     clocks:
>>       minItems: 3
>> -    maxItems: 10
>> +    maxItems: 16
>>   
>>     clock-names:
>>       minItems: 1
>> -    maxItems: 10
>> +    maxItems: 16
>>   
>>     interrupts:
>>       minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>       description: LPAIF DMA buffer interrupt
>>   
>>     interrupt-names:
>>       minItems: 1
>> -    maxItems: 4
>> +    maxItems: 6
>>   
>>     qcom,adsp:
>>       $ref: /schemas/types.yaml#/definitions/phandle
>> @@ -59,6 +60,8 @@ properties:
>>       maxItems: 3
>>       description: Phandle to apps_smmu node with sid mask
>>   
>> +  dma-coherent: true
>> +
>>     power-domains:
>>       maxItems: 1
>>   
>> @@ -241,6 +244,65 @@ allOf:
>>           - iommus
>>           - power-domains
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpass-cpu
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 16
>> +          maxItems: 16
> 
> [Severity: Low]
> Should this binding be split into separate schema files (sharing common DAI
> definitions via a common schema ref if needed) instead of adding another
> large per-compatible if-then block to qcom,lpass-cpu.yaml?
> 
> Each SoC variant here has substantially different reg, clock, and interrupt
> counts and names.  Fitting qcom,sm8650-lpass-cpu into the same schema also
> widens the top-level maxItems limits and enables dma-coherent at the top
> level, which relaxes validation for older compatibles like qcom,lpass-cpu
> and qcom,apq8016-lpass-cpu whose if-then blocks only constrain clocks and
> clock-names.
> 

Will follow maintainers preference here
