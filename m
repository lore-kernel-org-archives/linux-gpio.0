Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815087;
	b=fEZNiAS6gU8/cAdqMGlyVNuQP+D5H1qkKJ5LZu1Hl9RSY45AG5n5NWyZCx63yMGOLTc1
	 bqkeSxqp69xeYOlptpo356MlmdeM3BjDvG/mhaJpN2kWjPFNNEjRjSuLdp5KKDVAPy0D0
	 8M8Ucj8xraozhXzwuMpjmhkR5UT9rbQqoYrHYKfhIztrbAnxRfi5Vb0CHEzvbBoGKhAVV
	 yXlpgnnZJ98HhwxAafsVghRT4ZC6Rp9JlwfC459tqmfWkWyCH3x7hejfywMsQcAUGZjKb
	 x8yM/G4hs9d2xLZ/LdGIKREJk1O4478R7J3BQEP2oJBvlzGB1JM9EorlIIRGikjjzZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=koh32cUIrtew3rQaspH6qQBq7QxbIkEWNYbNzJo79jE=;
	b=FGXvKv7Kdm3XferpDT4HiQC8dShtCvUenqe51Ta2aNQC0buEcXy8PBCUs/TQ1K+m49ui
	 5DB9C/HKU+ortzsADPvysaanMm4gGItFMoHYpm37oGTz2LxozTheS7SYPDPQhiCB/B7WS
	 XyBQtyISct/kpgLfeUWVJfqo5YwFqgJ8CpWwX+edoOsJELqS4aISSYXwEUnCOmQuxuMzU
	 h7ityHHu2T/sy64tyoRYi15nE2FsppNIjURcDBv8+Tst+aqaigIM8VozRneO+M7JoDVJ+
	 mmdLPSh97C4cwYFa2Esg7BtmczTStnf3Cv3nEaCixn6Qj4KXjCBYYz7pfm36RnNFKYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bt1i5pzI;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D1606A32C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 07:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD2D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bt1i5pzI
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3364378f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815085; x=1795419885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koh32cUIrtew3rQaspH6qQBq7QxbIkEWNYbNzJo79jE=;
        b=Bt1i5pzINhDkBuOc7F4P+/bv8w65pEMO+kByL8f+l9sIqK+zjkDTlYHK2dLWXQNsER
         YicPzGglqWPB7yjtwDzbviIr8FmCPLA2P1dgw0WaGQd1A3QH7Wt+JuLvlIr5IXUwfMCs
         47jptj4udH4A7i7OSTKkODZ/nS9tUK6hGIxpfVwpWX90XXbYbO7LPSra/HulJ896X8TM
         Chs2NUN/aiGZqpqXX01iTMDN7SqBIO5NJ0M07fj1XEJATX3/8T6lrnJT64Jc3705083s
         rfGeYN/gbEbxPGnTY4ZHLPoPrR+R14f6sZ+3tlZS6JP07JGF013gdUGMGeGphRXcLiHJ
         IHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815085; x=1795419885;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=koh32cUIrtew3rQaspH6qQBq7QxbIkEWNYbNzJo79jE=;
        b=h9dFt/T0YCSP8rpnLH1FHVB+h/PWs8I8Y0MIJzInm3HfIq8vyF3+ue+JMrypcq2fCp
         CXJ3Jh3n/QRvSXQHA2mY1eeyGJCI6GBOWI2v267ccnbuMIS9fREAueCENPI1IL6iVArk
         b7eMn/dvUwSgtg++lU25buTTgI4PmHWU0URTB7m2YrkaMB+CtMK9X1wEM/YSK14No5X9
         o+vRfF/tU7QidZAYPhLiqvanJhGJlVPVKRbisaDm/BA/0zMkHSKcVak7i6tk2UIwRJzw
         mvn6XaIrnBH5LDpeN/PvEsOK4HagV8lVqOJlasguDcgCl7N2KyiWjTycECn2ntFp3HTY
         iIyQ==
X-Forwarded-Encrypted: i=1; AL+hErHOiE8GfvMxmyREJduKdCU03xMIOF585f5jAr8cbtwR9Q0DKMGYvUBoautWUPR9DyvtiWFX7W+4dQ9b@vger.kernel.org
X-Gm-Message-State: APuU4Z/2tMoKjxsOEy4RJTdTbVuJ0H3WSnyRe4zndUB7JNSKgfHq5Euo
	+emuf9HFL6GEtz0fCbZL+vH5rHlfYsAgguhix0hX9j0aPYU7Wkyb8giEePGjgFiXWLA=
X-Gm-Gg: AYBFou0b/P1TV6bvQ85lahCfSz2tOsoe8y63b+LQgxx9x7yRmAVKRIehI0gKUtoQGBt
	PvvoBK0j5FMFaSDyFbhDRblanMjhhpA4OHPUbIxS4Er0N4C7fb7Eucwv3BMkWWO8olDYt+l8MKU
	ymZcTaosHdYkB7J0xG0eqQniBU/p4M+p7y8cWM2tyGsLlyNjJe1Vu+/erDJRAtyPBhIRuAW7PCz
	xedzEN/Tvid4YuHdzUcvcnHgeOzcP1JbeDmFlKhUO9yT2nO497hucAwiH7heWoBPxrKEyljFLhi
	LZNggCuKJMLMTAyfx0AakqCPmNaeibS7EUXrYD53gZZ/7dvF/82D2eYU/oIxwL4rTDx+oeySkRl
	h2GkYUWXHH9P0Vai7EXERH086yhss7D5y+MtOO0tsO34+p/WbR+TmROLcBg9H9zHDHVCT+TlD1o
	2CyuXc2zKASAODdjy+0F3i6KesxRxwO/cKw/fTEoHU7VAzCP0zcMItxhavvltTpCXfVO/Iu2Faw
	gnEGIIuaYcn8VoMqqMBg3DVYKdLutvwSyT+SvqZA/RHRxBZsOT6X+uhfazafT6uF9LSHMkp+sxb
	2xP2qxms66NeDdCPoiqp3GquACGr4XEjUJxK7cdWYS5LTfDrFfWF1Yxjd1W4ZngmL2VUb4c7hGA
	c1cWdqUMvbw==
X-Received: by 2002:a05:6000:470b:b0:492:8dd4:baf8 with SMTP id ffacd0b85a97d-49c6d453907mr20718771f8f.6.1794815084882;
        Sun, 15 Nov 2026 23:44:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5fe370f8sm18538106f8f.27.2026.11.15.23.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:44:44 -0800 (PST)
Message-ID: <708d758b-14ee-4a00-a9c6-6bd8bae8063f@linaro.org>
Date: Mon, 16 Nov 2026 08:44:44 +0100
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
Subject: Re: [PATCH RFC 02/23] clk: qcom: add SM8650 LPASS core & audio clock
 controllers
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-2-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213528@kernel.org>
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
In-Reply-To: <sashiko-outbox-213528@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [High] clk: qcom: missing pm_clk setup for iface clock in
>    lpass_hm_core_probe()
> - [High] clk: qcom: wrong DT clock index for BI_TCXO in
>    lpass_core_cc_parent_data_ao_2
> - [Medium] clk: qcom: missing driver unregister on error in SM8650 LPASS
>    init functions
> - [Medium] clk: qcom: wrong postdiv clk_ops and user_ctl_val for
>    lpass_core_cc_dig_pll
> - [Low] clk: qcom: dead code, unused declaration, and unwrapped pm_ops
>    in SM8650 LPASS
> --
> 
> commit b45bde29cb5ec941ad6de37d77c22a656fbda080
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> clk: qcom: add SM8650 LPASS core & audio clock controllers
> 
> This commit adds clock and power domain controller drivers for the SM8650
> LPASS HM, core, audio, and AON blocks when running without ADSP firmware.
> 
>> diff --git a/drivers/clk/qcom/lpassaudiocc-sm8650.c b/drivers/clk/qcom/lpassaudiocc-sm8650.c
>> new file mode 100644
>> index 0000000000000..636ce9a1b3451
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpassaudiocc-sm8650.c
> [ ... ]
>> +static struct clk_rcg2 lpass_aon_cc_ext_if1_clk_src = {
>> +	.cmd_rcgr = 0xb004,
>> +	.mnd_width = 16,
>> +	.hid_width = 5,
>> +	.parent_map = lpass_audio_cc_parent_map_0,
>> +	.freq_tbl = ftbl_lpass_cc_ext_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data){
>> +		.name = "lpass_aon_cc_ext_if1_clk_src",
>> +		.parent_data = lpass_aon_cc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
> [ ... ]
>> +static struct clk_rcg2 lpass_aon_cc_tx_mclk_clk_src = {
>> +	.cmd_rcgr = 0x1b004,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = lpass_aon_cc_parent_map_0,
>> +	.freq_tbl = ftbl_lpass_mclk_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data){
>> +		.name = "lpass_aon_cc_tx_mclk_clk_src",
>> +		.parent_data = lpass_aon_cc_parent_data_0,
>> +		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
>> +		//.flags = CLK_OPS_PARENT_ENABLE,
>> +		.ops = &clk_rcg2_ops,
>> +	},
>> +};
> [ ... ]
>> +static struct clk_branch lpass_aon_cc_tx_mclk_clk;
> [ ... ]
>> +static const struct dev_pm_ops lpass_audio_cc_sm8650_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
>> +
>> +static struct platform_driver lpass_audio_cc_sm8650_driver = {
>> +	.probe = lpass_audio_cc_sm8650_probe,
>> +	.driver = {
>> +		.name = "lpass_audio_cc-sm8650",
>> +		.of_match_table = lpass_audio_cc_sm8650_match_table,
>> +		.pm = &lpass_audio_cc_sm8650_pm_ops,
>> +	},
>> +};
> 
> [Severity: Low]
> This isn't a bug, but the `.pm` assignments in `lpass_audio_cc_sm8650_driver`,
> `lpass_aon_cc_sm8650_driver`, and `lpass_hm_sm8650_driver` do not use
> `pm_ptr()` (with `RUNTIME_PM_OPS()`), so the `dev_pm_ops` structures are not
> dropped when PM is disabled.

Will fix

> 
> Also, `lpass_aon_cc_tx_mclk_clk_src` has a commented-out `.flags` line, the
> forward declaration of `lpass_aon_cc_tx_mclk_clk` is unused because the
> following clocks reference `lpass_aon_cc_tx_mclk_clk_src`,
> `lpass_aon_cc_ext_if1_clk_src` uses `lpass_audio_cc_parent_map_0` instead of
> `lpass_aon_cc_parent_map_0`, and `lpass_audio_cc_sm8650_probe()` and
> `lpass_aon_cc_sm8650_probe()` duplicate the same `pm_clk` setup.

Will fix

> 
> [ ... ]
>> +static int __init lpass_audio_cc_sm8650_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = platform_driver_register(&lpass_aon_cc_sm8650_driver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return platform_driver_register(&lpass_audio_cc_sm8650_driver);
>> +}
>> +subsys_initcall(lpass_audio_cc_sm8650_init);
> 
> [Severity: Medium]
> Does `lpass_audio_cc_sm8650_init()` leave `lpass_aon_cc_sm8650_driver`
> registered if registering `lpass_audio_cc_sm8650_driver` fails?  When built as
> a module, failing module init without calling
> `platform_driver_unregister(&lpass_aon_cc_sm8650_driver)` leaves a freed
> `platform_driver` structure linked on the platform bus list, causing a
> use-after-free.  `lpass_core_cc_sm8650_init()` in `lpasscorecc-sm8650.c` has
> the same issue with `lpass_hm_sm8650_driver`.

Will fix

> 
>> diff --git a/drivers/clk/qcom/lpasscorecc-sm8650.c b/drivers/clk/qcom/lpasscorecc-sm8650.c
>> new file mode 100644
>> index 0000000000000..4f91ab0d772ec
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpasscorecc-sm8650.c
>> @@ -0,0 +1,509 @@
> [ ... ]
>> +static const struct alpha_pll_config lpass_core_cc_dig_pll_config = {
>> +	/* 614.4 MHz */
>> +	.l = 0x20,
>> +	.alpha = 0x0,
>> +	.config_ctl_val = 0x20485699,
>> +	.config_ctl_hi_val = 0x00182261,
>> +	.config_ctl_hi1_val = 0x82aa299c,
>> +	.test_ctl_val = 0x00000000,
>> +	.test_ctl_hi_val = 0x00000003,
>> +	.test_ctl_hi1_val = 0x00009000,
>> +	.test_ctl_hi2_val = 0x00000034,
>> +	.user_ctl_val = 0x00000000,
>> +	.user_ctl_hi_val = 0x00000005,
>> +};
> [ ... ]
>> +static struct clk_alpha_pll_postdiv lpass_core_cc_dig_pll_out_odd = {
>> +	.offset = 0x0,
>> +	.post_div_shift = 14,
>> +	.post_div_table = post_div_table_lpass_core_cc_dig_pll_out_odd,
>> +	.num_post_div = ARRAY_SIZE(post_div_table_lpass_core_cc_dig_pll_out_odd),
>> +	.width = 4,
>> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
>> +	.clkr.hw.init = &(struct clk_init_data){
>> +		.name = "lpass_core_cc_dig_pll_out_odd",
>> +		.parent_hws = (const struct clk_hw*[]){
>> +			&lpass_core_cc_dig_pll.clkr.hw,
>> +		},
>> +		.num_parents = 1,
>> +		.flags = CLK_SET_RATE_PARENT,
>> +		.ops = &clk_alpha_pll_postdiv_lucid_ops,
>> +	},
>> +};
> 
> [Severity: Medium]
> Should `lpass_core_cc_dig_pll_out_odd` use `clk_alpha_pll_postdiv_lucid_ole_ops`
> instead of `clk_alpha_pll_postdiv_lucid_ops`?
> 
> `lpass_core_cc_dig_pll` is a Lucid OLE PLL, where the FSM vote bit lives at
> bit 25 of `user_ctl` (`clk_lucid_evo_pll_postdiv_set_rate()`), whereas
> `clk_alpha_pll_postdiv_lucid_ops` checks bit 20 of `mode`
> (`clk_alpha_pll_postdiv_fabia_set_rate()`).  In addition,
> `lpass_core_cc_dig_pll_config` sets `.user_ctl_val = 0x00000000`, so
> `clk_alpha_pll_write_config()` skips writing `user_ctl` and never programs the
> odd post-divider or output enable bits during PLL configuration.

Will fix

> 
> [ ... ]
>> +static const struct parent_map lpass_core_cc_parent_map_2[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 1 },
>> +	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 2 },
>> +};
>> +
>> +static const struct clk_parent_data lpass_core_cc_parent_data_ao_2[] = {
>> +	{ .index = 1 },
>> +	{ .hw = &lpass_core_cc_dig_pll.clkr.hw },
>> +	{ .hw = &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
>> +};
>> +
>> +static const struct freq_tbl ftbl_lpass_core_cc_core_clk_src[] = {
>> +	F(19200000, P_BI_TCXO, 1, 0, 0),
>> +	F(51200000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 6, 0, 0),
>> +	F(102400000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 3, 0, 0),
>> +	F(204800000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 3, 0, 0),
>> +	{ }
>> +};
>> +
>> +static struct clk_rcg2 lpass_core_cc_core_clk_src = {
>> +	.cmd_rcgr = 0x25000,
>> +	.mnd_width = 8,
>> +	.hid_width = 5,
>> +	.parent_map = lpass_core_cc_parent_map_2,
>> +	.freq_tbl = ftbl_lpass_core_cc_core_clk_src,
>> +	.clkr.hw.init = &(const struct clk_init_data){
>> +		.name = "lpass_core_cc_core_clk_src",
>> +		.parent_data = lpass_core_cc_parent_data_ao_2,
>> +		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_ao_2),
>> +		.ops = &clk_rcg2_shared_ops,
>> +	},
>> +};
> 
> [Severity: High]
> Should `lpass_core_cc_parent_data_ao_2[0]` use `.index = 0` instead of
> `.index = 1`?
> 
> `qcom,sm8650-lpasscorecc` only has a single DT input clock (`bi_tcxo` at index
> 0), as used by `lpass_core_cc_dig_pll` and `lpass_core_cc_parent_data_0`.
> With `.index = 1`, parent 0 of `lpass_core_cc_core_clk_src` cannot be
> resolved, so `lpass_core_cc_core_clk_src` and its child branches report rate 0
> when parked on `bi_tcxo` via `clk_rcg2_shared_ops`, and requesting 19.2 MHz
> fails with `-EINVAL` in `_freq_tbl_determine_rate()`.

Will fix

> 
> [ ... ]
>> +static int lpass_hm_core_probe(struct platform_device *pdev)
>> +{
>> +	return qcom_cc_probe(pdev, &lpass_core_hm_sm8650_desc);
>> +}
>> +
>> +static const struct dev_pm_ops lpass_hm_sm8650_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
>> +};
> 
> [Severity: High]
> Does `lpass_hm_core_probe()` need to set up `pm_clk` and add the `"iface"`
> clock before calling `qcom_cc_probe()`, like `lpass_audio_cc_sm8650_probe()`
> and `lpass_aon_cc_sm8650_probe()` do?
> 
> `qcom_cc_really_probe()` with `.use_rpm = true` only calls
> `devm_pm_runtime_enable()` and `pm_runtime_resume_and_get()`; it does not call
> `devm_pm_clk_create()` or `pm_clk_add(&pdev->dev, "iface")`.  Without that
> setup, `pm_clk_resume()` and `pm_clk_suspend()` in `lpass_hm_sm8650_pm_ops` do
> nothing, leaving the LPASS HM interface clock unacquired and potentially gated
> when `qcom_cc_really_probe()` and `gdsc_register()` access the HM registers.
> 

Will drop PM


