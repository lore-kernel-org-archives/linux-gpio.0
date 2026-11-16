Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815121;
	b=07jg1G/5k25LJYOtqjsSNehJ57NTrXhDkGF+frBJYtlP6EZnL5qis2ohzKZ8GDl+Bpfe
	 WmPA41lm5NEqec5yc2hw8tjiZU3N+9KcTRGE+cOEN0dmU61LoxIuLMweafr9qvsHEw0ib
	 OkRD+VJTVtH+G/qDTd9Tsn77QodnMhwOv2qckejw0CQEfJYt70WGCcttAiK+JY4WBjrJH
	 TDacTfS+5nc8WZZhszdCTcvJg0niwCHlxwRQL0gts85mcQPv4Vbpr1VboCUw2/j/hssG4
	 lGH3gD5tG/XwuuLj2f8/hUz95LTeoKIcnNek4ZVurwqzEY0qPmmVfIBMDYB416pFWQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
	b=gFKqY+mkqoDzjMY5I0TJakxwu7Fe2xRPsgWlee5HWfTShpT51HjpFQYMq+g83/aNcT/e
	 9ftd8lVYik6bmcuEBQZZ8YRfoGz2WDk0G9ZW5a5HKfzFTvhC1GTMlnoMXfxVHIQxl2Vw0
	 Po2NYtZgoKD1CHWoiRteN9RBE5VvjBXBk2DBDb9k2izCO8IvVnDKZJxs9Z32wRzmmhf7t
	 N3ftAF2RyXykZNyMQA9iAsYq+XiSH71ZK6vpO+y9FU9thdEJZgEvEdTh9HI3DtNUL3klE
	 PwVMezlCTLgLrDeUf6LCMx2zojDJU/ad2HGpHqRFlMd3rMN8b163sJVvahQHJP615yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWs6vy6T;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79598606A88C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 07:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79598606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWs6vy6T
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1902842f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815120; x=1795419920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
        b=JWs6vy6TMMIsDRVSnv3QauUtvNIGyUnrJHjyD00p4NY8uCkqSIoqzJZIUkMBFUogNo
         u+Zs1/CnTQRGeFMiW7bmLvY3N6yo13drRKvXNnl6WcfWk7yoeko+TefFLGrNvxO+BaZ+
         XIihgGquU/ejG+wq5fKaH2uokS9qRmEWoM/YMcFoRKlay2hZiSl314PzNVa1xZFl5CFn
         KS+HO26bDwjcatUMnaF/8r0cevjW2bSrdwnT+0ki9PdoKsbbm2t/e4WAQKO7PxLZsuml
         qdx3TmnmaMjvWzRtuGdhQDKznd7JSXldhwavrB3Th2J21PyMbmikrn5fM7fHbiXGXZEV
         Pj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815120; x=1795419920;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
        b=gCj2UCOx2Mwba4mDIe2s7DfnYYphPTf6smnq9sN0a6sgeDNQuZMgJUgh4vvBiqCf1N
         bsmWWhRVgn5DzX8p4TjKlOSI8qGnFM4jcJAahb9/BXMcC2MAhntbrfi3JWrZeyK9PSdr
         PxJs9udfnPLaz8r2n9NctZrEvguG3iBvjO+rJPqvN9d+Y7yUZk3cIcbUBZ/ltkcvA2Me
         vwIyW9tjvXy2Qyb2RO7RGkstR16Nas7ETR/vrAtc5ScRMKIXgPJf4dUbgqK+CDEXRj46
         5kSYfKAijlRgjRpR2fCi3cp1Nxk2H6FUaM5e+IRLw5DfmnzhCCPjusi7SXoi0pGL/kTB
         ovNg==
X-Forwarded-Encrypted: i=1; AL+hErFCZ4fe5hwcUt2B8IDnN3yv0gcVPXFfNta+WTbVVO/dimNfz2BaVWvgsL5eWDFYYDB7RLIQPBRMoW6u@vger.kernel.org
X-Gm-Message-State: APuU4Z8ggYFjMTQShN1aYXmW1SKvvqPQc5CF2zlVhNaLUlFmscJpWxtr
	0PcbrlU3IsI+5rmqIOpBwX5J7eXbClf9cWzpyNyg0ZDIas5gZh5eVsvc+mV90uADwCQ=
X-Gm-Gg: AYBFou3Rwp87zt2774p4lTcAu+gx+CFPFZ1WxwTc/jqKXXeEJUevwEsxsDhNMAIRImt
	TSHdeT4TmKpVvOnaF7DNfiwQHTUX7MepgROQa+l4qlmviu5tacw+atQRNQ9ybG5oLMWuMBs8ozU
	EZAtGuWBA8mRoWzhhxCutkrsyx7GXd9RY4gdF0755fr9DO+QsgLUDSPo+DjwtY1KVh2m+FZPIaD
	JAOh2M8i0d7B0xrZSQl9dqbFlnnnTpiIHF54qsAYderxTSBwu23/Wrbiux+nb9R0/5oQ3HQFNrw
	pclQhk86JGud8ajY4BfZklaPbJZe5QUtFJ1zApv7M4VYq44Ll6GYIvzirgHVhGlaxm3dBlTqS6f
	fTApv8PwOYkyN9Ddr7Fy+OIUAGsDOUZujBIn+2CjAINoFD7c1vKRdb8hzbbID7JfL/Zv2X8kESv
	1Q/M7v1mIYrdGc4CIcbG9S22oXiHb0KCMs/LGInuco3rhYj+YoHeYGdVvQS3E3/jdFAkEoRt3Kw
	QfZOBAj9L7U6k+Pk6c3WYUFuPWZGr6qtdjkLrenwM4LSEaE5AXtvUziO626M1uIpJ6GG/7n5IbC
	Yr0586oUm+El3WG4VT8OAbadvjfewaoBZVrnB8yuIOQZV76o0G/hzuj2e1R3GjeWIwvnnZ4dw1w
	iO3XLMqHI
X-Received: by 2002:a05:6000:2407:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-49c73351512mr19406434f8f.56.1794815119670;
        Sun, 15 Nov 2026 23:45:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm21048578f8f.56.2026.11.15.23.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:45:19 -0800 (PST)
Message-ID: <d27f1aa7-9765-4a22-ac78-e6dfc0c97556@linaro.org>
Date: Mon, 16 Nov 2026 08:45:18 +0100
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
Subject: Re: [PATCH RFC 03/23] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP
 is not used
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213493@kernel.org>
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
In-Reply-To: <sashiko-outbox-213493@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: redundant
>    oneOf in clocks
> --
> 
> commit d8422bb265d6e088cce5d6024805eb9ced00d38a
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
> 
> This commit updates the SM8650 LPASS LPI pinctrl DT binding schema to
> allow a single core clock and add power-domains properties for platforms
> where the ADSP is bypassed.
> 
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> index 1bf08860a4baf..4c54f873199cc 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> @@ -29,11 +29,25 @@ properties:
>>         - description: LPASS LPI TLMM Control and Status registers
>>   
>>     clocks:
>> -    items:
>> -      - description: LPASS Core voting clock
>> -      - description: LPASS Audio voting clock
>> +    oneOf:
>> +      - items:   # for ADSP based platforms
>> +          - description: LPASS Core voting clock
>> +          - description: LPASS Audio voting clock
>> +      - items:   # for ADSP bypass based platforms
>> +          - description: LPASS Core voting clock
>>   
>>     clock-names:
>> +    oneOf:
>> +      - items:   # for ADSP based platforms
>> +          - const: core
>> +          - const: audio
>> +      - items:   # for ADSP bypass based platforms
>> +          - const: core
> 
> [Severity: Low]
> Could clocks and clock-names set minItems: 1 alongside the two-entry
> items list instead of using oneOf?  Because the single-entry ADSP bypass
> list is a strict prefix of the two-entry list, minItems: 1 avoids
> duplicating the first item in both properties.
> 

Will switch to that
