Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816252;
	b=fpKMnzo3Ag0va0l1Yp8D4biemIQpe9jXKKy9i0Dt/wxjo8kmc9CHwtviUGVBFk0TBrnW
	 qrdBCFj9Frfwr146QCBr+0qZbV2otcTKT7MpQh1vwAhg2ezeGPeyCT3veG9KgruRosxAI
	 l6bUaOM7Uh1kwlgg9vgUXshx4XQ9yFZvoxr30QMH0vecfZzojyNqhLP24JeLsZ1jqh/OX
	 +Vnpw1OaLYY88JWv9yDKlb0qtDFuJaHgBawBPt+lFAkfOLhL+072FGqy46cKwy33+ORX/
	 IQW0XYIKAgsc/WECmJZ4HbN+9YLBeyxesEHfozQj0cuJeCsgB7gCPd949Tn6ZNTjnXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6jY49psiB3PmDwv6JClsZ3y00dtoVgDtQ7FZWnd6meM=;
	b=yC1V05Nj1wTnwZitfCrAcUQHC4EUoDmOUk7Dc7Xs6RIY0aJzNb96zGcoTjSzGU2IQRJB
	 nGxt6kK/kynCnbp8BwrAbLXBvnDQzV1Ls46Iwyf18sto4PypwSLUnlLjvKcK511Bz3HT/
	 8jPdkZg1uO2PGwhKudiPWdlzWBSQpiisODVwQKi4/VE2U8IzinIAa00TpsbCvN/jrKSrH
	 MAIhlFHb8WNE3a6FyC4HEHorb5UeSG0nMPRlqg/7h0ViQOjrR7xbqAlkRneVvX9hXB0BX
	 RtILwB4HNdkua/AJVeYW6XFrM485N/S449gis9d7ngC7AJHk3NKDRdDkXdQe3XTrC9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pzts7zlg;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42B7606A32F
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 08:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D42B7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pzts7zlg
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso32944205e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 00:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816250; x=1795421050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6jY49psiB3PmDwv6JClsZ3y00dtoVgDtQ7FZWnd6meM=;
        b=Pzts7zlgDfj56w9EG4lfMKSxrp3tfwQ7m7kwVQvJI0cZfqjDvzRN30tpfOOrTo74UP
         8c7l5Ny+3LUIvLLEl1e4zelshUy8mWazRgVtLDaFs+yAeuhttAsAG2rwXHYHgnbzI7wG
         ypsY94ptJCyC3t8XcqxGcGDB9zFWAgVFecW3YORK8mkO+c6orulzAAU/pGovglCU/d2j
         5qf/fE62fDAJSCCE5u+Usd3diUtmcBOSQjaxzfzhyYX+zbAPQjxUpN9W4cYw422tHOYn
         f3BssU0f1L9RmDV0qIjwabZJXsSAmCqGOr3NlUOlgwf8/VLDBFsYXgj6Aa11VytoaIp7
         CIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816250; x=1795421050;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jY49psiB3PmDwv6JClsZ3y00dtoVgDtQ7FZWnd6meM=;
        b=EGd41S9pxhKDeTNpfioaqDmES/B2I4UlSVKH8xQkYeka77WOs6Kgll0jZt/KLFoDF0
         r3Tfc1FgJB7mtLPqAAL0RbLyS7EE4PA91gFNRGUc3zUCUAg2Uthagvn59M+aNm6ygV7M
         ZyhO1n77vzBbBYhR0EYuYwiK306LcgpheOASZWoH8mMKFZNqkR5faewCcjoiRfiQ6M1d
         QxCvEmtTlxpdzDAEY1cJWlv3YwV7Pq9JhVzanxlKlCW9O4dJW/Gq4++41qI9Im0B42mL
         sz/EIcjZugcJYHEUJzaTZNuOD4wVWb++1zMjlxJuGbLfM45gSs6E+nHhmuALsx63L55+
         j0ng==
X-Forwarded-Encrypted: i=1; AL+hErEMVb+sEg9bj902fqZRtfMiJHmb1uLSxfhhh+6dj9LnJqnbbh7+VEWPNKuDTGLLddHQYQCwb0Tgg0td@vger.kernel.org
X-Gm-Message-State: APuU4Z8PJ/WhGVaIEsf8zDZhXL26kGoQY+8PWyTeKi7JY4vSbSF4K6MG
	9oYEONw1iXo+HyzFSQWPCWvUqNHV8iGIEgjoJWZGWsMI8aY0TWa6qSztnlwqefFcTY0=
X-Gm-Gg: AYBFou35OB3uAJuUyYthkGSZM9CxF2bFhFh9zjaPHtN2V4UhPdAvIU9NdHENHE+O65D
	mSmG+VAjn6i68uPsPijsS1678zFINQSoeIHMfFlAESVfxPy8gCc0kjtr083MIMDedS/UAkRTh9J
	I9ODlLsp8FfKGgycT+hbfJtDIxsKGEvGw+tFP4jfY2Mnr8lvGpqcqilSjw2cIJjrlYUGIC5hZFQ
	vI4s0LgOXJI58XXg2rVvgQ7TdSq6Adi6cJU6qrSQ9/6Wo+1AlUdVPeTIC5SaaVZRNe07aRu5pZP
	Zsj4FGlA7lruMP1xlDXq+4OhfUKanXQO4VdC/l1pr58VbpVdD96aoFxggIVecG9Dre1FxOtV75R
	WWtaKjHQFNKvkEOFf5b7ScF1HAb+P25TcXIzpGCI6E9+pqLOs+vU9VV8RL3jAdTmrSZ+G692VPN
	1g+JVNFaur/q0aA3AB5vNByOwSgM9buPAYfdnJtDSEfrst3Zpc0IQMs0Vq9OxfG4eWI5m84GPlm
	6y+IR3EVa3SODwmmN7d8HDknN2uVU27F9A0rQTXr9sx2dRVn62QRqzrKCs/pWUYpUOAeJShuI6Z
	fzsVvkUkeE1JESRQr/azYY8M0Kqn6OY8P/uPlHfXFOU6mjEWCvyTkP1fAzScmc/iJ8KJXVfJbyw
	rhxRGz3nA
X-Received: by 2002:a05:600c:1f96:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb55a4d990mr217913585e9.12.1794816249974;
        Mon, 16 Nov 2026 00:04:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8e794sm19919314f8f.59.2026.11.16.00.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:04:09 -0800 (PST)
Message-ID: <8a4f5390-951e-4718-9aa4-91dba93958b3@linaro.org>
Date: Mon, 16 Nov 2026 09:04:09 +0100
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
Subject: Re: [PATCH RFC 21/23] arm64: dts: qcom: add SM8650 LPASS CPU dtsi
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-21-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213539@kernel.org>
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
In-Reply-To: <sashiko-outbox-213539@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:18, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: unsupported power-domains on WSA macros in
>    sm8650-lpass-cpu
> - [Medium] arm64: dts: qcom: unattached multiple power-domains on
>    lpass_tlmm
> - [Medium] arm64: dts: qcom: lpass_core clock count mismatches
>    lpasscorecc-sm8650 driver
> - [Low] arm64: dts: qcom: node and property ordering in
>    sm8650-lpass-cpu.dtsi
> --
> 
> commit 1f3d7332ea1210e666215d104062d22d42ebae2c
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: add SM8650 LPASS CPU dtsi
> 
> This commit adds sm8650-lpass-cpu.dtsi with the LPASS clock controllers,
> lpass-cpu node, LPASS macro clocks, and I2S2 pinctrl state for SM8650
> boards booting at EL2 without ADSP audio firmware.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi
>> new file mode 100644
>> index 0000000000000..43d0d8daa4fe2
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi
> 
> [ ... ]
> 
>> +&lpass_tlmm {
>> +	clocks = <&lpass_core LPASS_CORE_CC_CORE_CLK>;
>> +	clock-names = "core";
>> +
>> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
>> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +	power-domain-names = "core",
>> +			     "audio";
>> +
>> +	status = "okay";
>> +};
> 
> [Severity: Medium]
> Does specifying two entries in power-domains leave both GDSCs unattached on
> lpass_tlmm?
> 
> genpd_dev_pm_attach() returns early without attaching any domain when a node
> lists more than one power domain, and lpi_pinctrl_probe() only sets up PM
> clocks without calling devm_pm_domain_attach_list() or
> dev_pm_domain_attach_by_name().  As a result, runtime PM resume of
> lpass_tlmm will not power on LPASS_AON_CC_LPASS_AUDIO_HM_GDSC before
> accessing LPI TLMM registers.

Good catch will investigate

> 
> [ ... ]
> 
>> +&lpass_wsa2macro {
>> +	clocks = <&lpass_audiocc LPASS_AUDIO_CC_WSA2_MCLK_CLK>,
>> +		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK>,
>> +		 <&lpass_vamacro>;
>> +	clock-names = "mclk",
>> +		      "macro",
>> +		      "fsgen";
>> +
>> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
>> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +	power-domain-names = "macro",
>> +			     "dcodec";
>> +};
>> +
>> +&lpass_wsamacro {
>> +	clocks = <&lpass_audiocc LPASS_AUDIO_CC_WSA_MCLK_CLK>,
>> +		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA_CLK>,
>> +		 <&lpass_vamacro>;
>> +	clock-names = "mclk",
>> +		      "macro",
>> +		      "fsgen";
>> +
>> +	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
>> +			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +	power-domain-names = "macro",
>> +			     "dcodec";
>> +};
> 
> [Severity: Medium]
> Are power-domains and power-domain-names supported on lpass_wsa2macro and
> lpass_wsamacro?
> 
> Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml does not
> define power-domains or power-domain-names and sets unevaluatedProperties:
> false, so dtbs_check fails when sm8650-lpass-cpu.dtsi is included.  In
> addition, unlike the rx, tx, and va macro drivers, wsa_macro_probe() never
> calls lpass_macro_pds_init(), while genpd_dev_pm_attach() skips automatic
> attachment when more than one domain is listed, leaving both GDSCs
> unattached during register access.

Good catch, will add

> 
>> +
>> +&soc {
>> +	lpass_audiocc: clock-controller@6bc0000 {
>> +		reg = <0 0x06bc0000 0 0x38000>;
>> +		compatible = "qcom,sm8650-lpassaudiocc";
>> +
>> +		clocks = <&bi_tcxo_div2>,
>> +			 <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
>> +		clock-names = "bi_tcxo",
>> +			      "iface";
>> +
>> +		power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
>> +
>> +		#clock-cells = <1>;
>> +	};
>> +
>> +	lpass_aon: clock-controller@6e00000 {
>> +		reg = <0 0x06e00000 0 0x30000>;
>> +		compatible = "qcom,sm8650-lpassaoncc";
>> +
>> +		clocks = <&bi_tcxo_div2>,
>> +			 <&lpass_core LPASS_CORE_CC_CORE_CLK>;
>> +		clock-names = "bi_tcxo",
>> +			      "iface";
>> +
>> +		#clock-cells = <1>;
>> +		#power-domain-cells = <1>;
>> +	};
>> +
>> +	lpass_core: clock-controller@7b00000 {
>> +		compatible = "qcom,sm8650-lpasscorecc";
>> +		reg = <0 0x07b00000 0 0x58000>;
>> +
>> +		clocks = <&bi_tcxo_div2>;
>> +		clock-names = "bi_tcxo";
>> +
>> +		power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
>> +
>> +		#clock-cells = <1>;
>> +	};
> 
> [Severity: Medium]
> Does providing only a single clock at index 0 on lpass_core leave the
> P_BI_TCXO parent of lpass_core_cc_core_clk_src unresolved?
> 
> In drivers/clk/qcom/lpasscorecc-sm8650.c, lpass_core_cc_parent_data_ao_2
> looks up DT clock index 1 for P_BI_TCXO:
> 
> drivers/clk/qcom/lpasscorecc-sm8650.c:
> static const struct clk_parent_data lpass_core_cc_parent_data_ao_2[] = {
> 	{ .index = 1 },
> 	{ .hw = &lpass_core_cc_dig_pll.clkr.hw },
> 	{ .hw = &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
> };
> 
> Because lpass_core only provides index 0, of_parse_clkspec() fails with
> -ENOENT for index 1, leaving lpass_core_cc_core_clk_src and its child
> branch clocks (such as LPASS_CORE_CC_CORE_CLK and
> LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK) without their safe XO parent when
> clk_rcg2_shared_init() parks the RCG.

Will fix the clk driver

> 
>> +
>> +	lpass_hm: clock-controller@7e00000 {
>> +		compatible = "qcom,sm8650-lpasshm";
>> +		reg = <0 0x07e00000 0 0xa000>;
>> +
>> +		clocks = <&bi_tcxo_div2>;
>> +		clock-names = "bi_tcxo";
>> +
>> +		power-domains = <&rpmhpd RPMHPD_LCX>;
>> +
>> +		required-opps = <&rpmhpd_opp_nom>;
>> +
>> +		#clock-cells = <1>;
>> +		#power-domain-cells = <1>;
>> +	};
>> +
>> +	lpass_cpu: audio@7b87000 {
>> +		compatible = "qcom,sm8650-lpass-cpu";
> 
> [Severity: Low]
> This isn't a bug, but audio@7b87000 is placed after
> clock-controller@7e00000 instead of in unit-address order, and compatible
> is placed after reg in clock-controller@6bc0000 and
> clock-controller@6e00000 above.
> 

Will reorder
