Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814913;
	b=NKwz8GqhNII3eSdBb1kOqSdAKV7pPl+5R8N10ImvwUlCWIaD4/KLSZ0tsl0GznsTyGlk
	 0VKhBPqOYOpaPeUFAzQNGHywCNWSQROljki2Jp5Ea1aLyAB9z1NECQLkBS5P3/rdqFEzd
	 q7Q7xad4vc5BMsPv3DCNhkGdWf7ZI3vnp+27xbhdi1ujdi0jFcm4mTaGJ9LFd7PHsD/fw
	 +gOL+BSdJfZY5zEa1GpHKYY9S08LJCuTE7I69A308I3yjHio9M9mnYJRWFBNGKVRX3Ycn
	 duXFvcZH9RRC30xfiSfZMIOiRs/Sn7tOs0FzGV69JaIORARZwLKQHHFeQqAUtIej/sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
	b=o9XfKQLfobJZ1Y80qF4ezshnodKK+CO9zQDRCiqSXlFOblW0Zgpma0Xl+5nJzKKqtbxf
	 PR9eKbuBT1QenL3q6G7D/u2n9Rid4+SG0PIV/MXv7ehEU/oaPLmRpXpWRoPhs7MtZqd7w
	 Vh3KhHQN/vHrSXLTH+bQh4FvQffxVmDTWTaaehE4ahQ9KRcFC9FL2NyOZyXO3lOKgQsIM
	 FwJZtF0vugCbfiRxnp1kaTCgoACmU+d85nfcsiH3zmCVrVFRqymtIQ0DkvH71IswiYzbZ
	 Nu2mJ8Ho8Bl4kxpQpYOqOkvPyHUwr1VU+5k/cMZ3wcem3Gkc+OlFC7Gx/LDGeROFf5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M99kwfSi;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB3606A339
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 07:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEDB3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M99kwfSi
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49a92144733so1159144f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 23:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794814911; x=1795419711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
        b=M99kwfSiXYDaGIx7uF1XdR0bpmzIP9dhr2OliLAvg9RQc8PuyY2Bts5/uH4nMTRT0+
         j16CcAbMKX1tIbkgJWXQeHbvhOySs6po/B94UgKNoNcfQ3agpxYR6US8qeZnChZxD4NJ
         /5AU6V09vUbja8Ef60rghEo0KEYNIlki6r1q+gI2tYhsuprdkIx/QRxx1DooNAJ+YlG9
         +hCPKzWjzkbkbNH/GU7DFzfeQU4fhpPiT4IeWvO34Js6tkhcGnwk2Ye5UnLQjlznuhH5
         k/Loq0ZsaGWTniOTCenzy6or1D25MMpz2kXidKF/e7vYDuzyiGILbZUkWelIsp/Xz6VN
         4h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814911; x=1795419711;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQ3RFqnPd9mQAA3jgNlgrAZqkBDxvjolcqnYLHrt9V0=;
        b=BhCJG7+oJvnHnz9Begt0zCBwEJKGn9yVXRcsLqWJXDSoXxBdxYKEE6SJ/ucqMlyiR8
         Ih0ID5JLSOFLw1gp8K4RN4K6cmxQR412CUh/fEjTVwvK0rTEHA0yu/Gc50Y0LYzVdHJM
         wDAfGAUKaFWLjjcIwXji+BxD+ApVtrWrObrxrvm6JhvZZqWLU7GP/yO0SvFjuNRK0TD7
         ip6hwyZ+lhHFWgKSQNe+dssIjBQfQjcmXpEld9lGoWD7Vl6p3CtBonJ+6tnbrf8djEtQ
         p8mXNI7DO4p8pB1uF0XGveve3NlrunLqRA3oo/gCBhDE9fbxyMogbj8TN6128fcTITNy
         FwZg==
X-Forwarded-Encrypted: i=1; AL+hErHrxCRzN+ppB1/N2IEiv1E2Nb/HDdTqrkkl4s6IJjhJHjo2S+i701HbKumi00s/8qc7zY9WplRVjveY@vger.kernel.org
X-Gm-Message-State: APuU4Z+EITf5d5TuqUI9xO2cqumB4BBn8FohFcPoGwuvLO4Hh8+cdf0s
	6Zy+z4yFvyU7meR8sVHV8gGSKSrO7tSlP6kxGAX33yhf9HgdsPAi+/gIvALyuO4Vuso=
X-Gm-Gg: AYBFou0fgSi5I6P7UrJqaLRg9B7pGrwHJqsUgc+rABBugR4S/pGU6Dev5ILXYnixNAq
	b8iwgvEa0OrC3IGnAtcszDciBkYMTgxGUDXtpfpUM9xbDgRbRW+831EoBVCLZZLEPcmk9OeN3P6
	1BFQJKCGg+FKXRwFjlyo+7i75zoMg7Zysc8KQFAfmybMZvR6P63n/N2Ypmp6hcr+dtWaeSy/WES
	B7eeonTPbB66GxFW238OxXd5shivoFAs3daAl9hba+4B8/X0n7OpggrHBENrijkay6cH4sPD/u8
	p82Ot0B2RHGDfeZMJAbCfNu++dNuFMSoUAz+poADcFanRawxy6ihZXtVECzgGzYvN8l1Wtg3GhO
	PoegK0VmJUq4iTSg+PufXAw0u9nAdcYhra3WWJapbIG2gl/vtw09Y4o3HyZzGu6rtIUQhcSjoSP
	DTTRpyYHMl4NnaLhULz+C3n7K2W3T4GT6a/eAEgZg7qSgf/Wzf8jA23WFfO2V/78GDFnVs8ChCA
	cFX32Nk4MfnAQj/qMUFuZiGfZ9NxtpfDWpiJiqTC2eNRWNlXMYttO1YG6udo5sCE+cvryiRn2jc
	jeiKADzKHsF8BGk1yMh3uxUqXAg/7e40QVJEv/K1HA/D6bjT6bKUN3Vmc5+YtiC3O68gpouNkWT
	Eiaj3rwp2ww==
X-Received: by 2002:a05:6000:4714:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-49c71785315mr20347442f8f.24.1794814911273;
        Sun, 15 Nov 2026 23:41:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm20939365f8f.5.2026.11.15.23.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:41:50 -0800 (PST)
Message-ID: <81f79143-7b30-4b65-8d57-84444aa8a111@linaro.org>
Date: Mon, 16 Nov 2026 08:41:50 +0100
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
Subject: Re: [PATCH RFC 01/23] dt-bindings: clock: qcom: add SM8650 LPASS core
 & audio clock controllers
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-1-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213487@kernel.org>
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
In-Reply-To: <sashiko-outbox-213487@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 19:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] dt-bindings: clock: qcom: broken examples in
>    qcom,sm8650-lpasscorecc.yaml
> - [Low] dt-bindings: clock: qcom: unwieldy per-compatible conditionals
>    in schema
> --
> 
> commit 822c52dcc683f4949600245b7d9f62d13802e752
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: clock: qcom: add SM8650 LPASS core & audio clock controllers
> 
> This commit adds the Device Tree binding schema and header definitions for
> the SM8650 LPASS HM, core, audio, and AON clock controllers.
> 
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
>> new file mode 100644
>> index 0000000000000..9c5207ee02f15
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-lpasscorecc.yaml
> 
> [ ... ]
> 
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpasshm
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +      required:
>> +        - power-domains
>> +        - '#power-domain-cells'
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpasscorecc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +        required-opps: false
>> +      required:
>> +        - power-domains
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpassaoncc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +            - description: LPASS_CORE_CC_CORE_CLK
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +            - const: iface
>> +        power-domains: false
>> +        required-opps: false
>> +      required:
>> +        - '#power-domain-cells'
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8650-lpassaudiocc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +            - description: LPASS_AON_CC_MAIN_RCG_CLK_SRC
>> +        clock-names:
>> +          items:
>> +            - const: bi_tcxo
>> +            - const: iface
>> +        required-opps: false
>> +      required:
>> +        - power-domains
> 
> [Severity: Low]
> Each of the four compatibles requires its own if-then block to override
> clocks, clock-names, power-domains, required-opps, and
> #power-domain-cells (which also leaves #power-domain-cells unconstrained
> on qcom,sm8650-lpasscorecc and qcom,sm8650-lpassaudiocc).  Would it be
> cleaner to split these variants into separate binding schema files instead
> of using per-compatible conditionals for every entry?

Both are feasible, I'll follow the maintainers preference here.

> 
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
>> +    #include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
>> +    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    clock-controller@6bc0000 {
>> +        compatible = "qcom,sm8650-lpassaudiocc";
>> +        reg = <0x06bc0000 0x38000>;
>> +        clocks = <&bi_tcxo_div2>;
>> +        clock-names = "bi_tcxo";
>> +        power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +        #clock-cells = <1>;
>> +    };
>> +
>> +    lpass_aon: clock-controller@6e00000 {
>> +        compatible = "qcom,sm8650-lpassaoncc";
>> +        reg = <0x06e00000 0x30000>;
>> +        clocks = <&bi_tcxo_div2>, <&lpass_core LPASS_CORE_CC_CORE_CLK>;
>> +        clock-names = "bi_tcxo", "iface";
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
>> +
>> +    lpass_core: clock-controller@7b00000 {
>> +        compatible = "qcom,sm8650-lpasscorecc";
>> +        reg = <0x07b00000 0x58000>;
>> +        clocks = <&bi_tcxo_div2>;
>> +        clock-names = "bi_tcxo";
>> +        power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
>> +        #clock-cells = <1>;
>> +    };
>> +
>> +    lpass_hm: clock-controller@7e00000 {
>> +        compatible = "qcom,sm8650-lpasshm";
>> +        reg = <0x07e00000 0xa000>;
>> +        clocks = <&bi_tcxo_div2>, <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
>> +        clock-names = "bi_tcxo", "iface";
>> +        power-domains = <&rpmhpd RPMHPD_LCX>;
>> +        required-opps = <&rpmhpd_opp_nom>;
>> +        #clock-cells = <1>;
>> +        #power-domain-cells = <1>;
>> +    };
> 
> [Severity: Medium]
> Does this example pass make dt_binding_check?
> 
> In lpass_hm, GCC_LPASS_CFG_NOC_SWAY_CLK is not defined in
> include/dt-bindings/clock/qcom,sm8650-gcc.h, causing dtc to fail with a
> syntax error.  In addition, lpass_hm specifies two clocks ("bi_tcxo" and
> "iface") while the qcom,sm8650-lpasshm conditional schema only allows
> "bi_tcxo", and clock-controller@6bc0000 (qcom,sm8650-lpassaudiocc) only
> provides "bi_tcxo" while its conditional schema requires both "bi_tcxo"
> and "iface".
> 

Last-time edit mistake, will fix.

Neil

