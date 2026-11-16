Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816004;
	b=L0GGwmnXRdOdICvKxM6adzNUkwge2Q9+2IO6QG60He10i78xogO8UpLVEvF57gI4MhDI
	 hGy7ZVNCOM2REKhHU9ySrJYL37jyFMCNuBhOqHxAvrft5CWx0LDHndzRml86G3nape+on
	 Dmu73phfaT6LjaRCAVEyO+68B1QRrmN0dhZiHfzKFqWgIu+seXBDXNVgLHnE97xNzshvR
	 aFCBt12oNi+J4kFO0ExGwt+u0zbqe2g3REO+wn6ycLBYI62++pYt1jYfwBWRObNsAb1/d
	 QxMBk5/kjGb5OW10eDYR2QgtssyfZRhVPJ6aCgMB+olfL9L1dN70ZXumjnoEguKPUxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8hZ6vhqouVFsnxOc8QRDh5YUzqwcZIN12aUhWdhK9B4=;
	b=ECEyv0jh0lyEMReDQr11s5u7MULM/mIFJHr9Xfn+k7F26fCi38tmMFbCbSrEoxYqQj+8
	 YpcFfQ0hD1oIgGouUGn1Pk++VWpuuGTKeiM4UDXtsdVJkxYnmM7ONXGjenq+snsfEL9Cg
	 x01z7EywuXYUO6k8eIkQWLFY8mLycIc50QWp5te0Q+HL/b77zUuYdq96uyQpjSBx6ztdd
	 35l9wcXNqcDrP7eQmwBKDwLATutu8KTe6BCSj91Grwz1d60xMg4ld70UUt9cA1FvpxWH9
	 IIxFZT/BJyfeaRMnMq17KFnoKLUmSg0tSawAojWHH9iGvocvnxdpPbelPXoV58fPbug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XpKfSvEh;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F90606A31C
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 08:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XpKfSvEh
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14e307f29so3630676e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 00:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816002; x=1795420802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hZ6vhqouVFsnxOc8QRDh5YUzqwcZIN12aUhWdhK9B4=;
        b=XpKfSvEhkpRgnN+HCf1ZvQFqezkMpg96TBYEVcftT9gQa2keahsO6RrbWe3SPb3YWy
         SbaN49MzlUmwYVnTTd84D41QtD5GKuUlZ8T79Maw3AeGqFDzeAconG7dF+ZDyWX717vq
         yOuhxXO09Gg0XGzSTZFhfUseFAJm7WAu4miVXjoGGsaPlKO6LEU1icc0q9DQIuDPBoae
         /Cc807xtYMZfC3wr2S57AXSGBT4PUiIQYr6zx1foRbaK+QWtNkn87GDQ0+SgQLhTKfgk
         JmrOTDEYnC26xR4ZmrxFlaGc6uWZ0t8sCDB5S7C5nCPfixiCT6RYx84wr5aw4Zq7TCtn
         vZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816002; x=1795420802;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hZ6vhqouVFsnxOc8QRDh5YUzqwcZIN12aUhWdhK9B4=;
        b=2IbTmwwskEBlQi93zI86B7YKnF+8LBrNKlJX6q9xPVn8uTBcJtnQNPv0IHQrydS4zG
         8zaMQtXEf4zYJMeGi9OwAvJlM1bcULmvo6DlOG2zpO1anH895nqfnhT07pX26g0LasWc
         m5+af7Cis6N0eMuQ+kaGIECXyvIAvxJxnBoSOgIJ+oVNefekNE1KRhCUG+9IeC69xEfV
         Y5KP5fGEc3qWUrXJB5E4bb+gZb8fTDLKmy4v0PqD+6heEHaOhHM9RHipz4Rbs+QOyHWV
         5hbUVHcgqVzswf2vN6pXjG1WAgej0cGJYAp3mUpBoPKpdNwvPM4C1uo/9z0OJ2zRqKe5
         AAKw==
X-Forwarded-Encrypted: i=1; AL+hErF4E9aoFrd+HHGwqNpZvy5EGLcoaLY+ScNq3sQ7yTXdOkQKSdShWYCZ0Jngu6S3XvNbdFOBT8UatuTK@vger.kernel.org
X-Gm-Message-State: APuU4Z+OgZEWD6YvtCtNfjjijAXsqV9BbvAXEZ5Li2ONa/4t3xOb1gjC
	hNf5WcV7ArjmSymqNcckW+3AaWjHxjCRmxXkTvmOq2T56OJbN8zKFuAorn23KElSq900YxOBC+o
	B0A8qu9k=
X-Gm-Gg: AYBFou1LkeFc1HA0h6REX3ccj8l/myFs5od2yqPGGfVA6HttS9Y/KJUF+0WSdOE88Xz
	YwKCqqT3KdBjUWAtbKmkeRV12zLFQfir37yUaq2yVqapWjSiXXhLdl01ycWoPhxbHWbpuOPChUT
	ho8M2YRKeWK3KDCztg8+SEOu+9b+CJn8+RQWYCJ09pJ+ogLRSh6RUp4TIebJvw3iDq00qzCd7IK
	s7ytREdVGq0o2+NkVn+XMlv4ceFFbBj4wkXTy2D6/kIrTVyZqPjkJ6uRALE5v7JGFG72YflNG1P
	NzFejHyhscryNFuW0Fy7XiTOPMlx0BHS2jbaCuPPaGrV3g92Leh0gEyYKqp+uV68RB0sttTx1fe
	9nrcnZQfHfH5hg2PncjlOz5IpsDBePhV/ZPpbgEz504Oi6+OFEWaZPIDu3BfVAgp7+wzIb5iP1z
	L5//bik5UxiaX4R1rMMFNXPcnGZPwNUE0BXyJ1xdIaaOavZXxf31HQLadn6waIKmFcmkJ03c/Df
	femx+V2pVNNitirdmIr1r51/NqRdgh22ItWICjNhvlUfDVnGsoHHdUxjRjPHj5CHO41RB886dxo
	5G10JtsZGMeFLYDMytml1li6n1YC0+VVnL8dgYZ8NBevdCMWuHa8dRxE/XfQy+9Djv3cxCN+piv
	/l1+R/9EC
X-Received: by 2002:a05:600c:3b93:b0:4bb:6f67:ca0b with SMTP id 5b1f17b1804b1-4bb6f67caf0mr75284045e9.29.1794815510779;
        Sun, 15 Nov 2026 23:51:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb732a2a9csm36296965e9.3.2026.11.15.23.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:51:50 -0800 (PST)
Message-ID: <56275bdd-e71a-4f59-8933-6a0752268fef@linaro.org>
Date: Mon, 16 Nov 2026 08:51:49 +0100
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
Subject: Re: [PATCH RFC 13/23] ASoC: qcom: lpass: support mapping I2S ports to
 multiple LPAIFs
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-13-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213497@kernel.org>
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
In-Reply-To: <sashiko-outbox-213497@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] ASoC: qcom: lpass: NULL deref in lpass_cpu_daiops_probe() on
>    unprobed LPAIF
> --
> 
> commit 4c412765d7dfc4828c0e1ec1c2ada16e697ee595
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> ASoC: qcom: lpass: support mapping I2S ports to multiple LPAIFs
> 
> This commit adds an optional lpaif_mi2s_desc descriptor to struct
> lpass_variant so MI2S ports can be mapped to and probed across multiple
> LPAIF instances.
> 
>> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
>> index f8b9b2ec90553..411eecd9cbb93 100644
>> --- a/sound/soc/qcom/lpass-cpu.c
>> +++ b/sound/soc/qcom/lpass-cpu.c
>> @@ -1079,6 +1079,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>>   			data->mi2s_capture_sd_mode[port_id] =
>>   				of_lpass_cpu_parse_sd_lines(dev, node,
>>   						    "qcom,capture-sd-lines");
>> +
>> +			set_bit(port_id, &data->lpaif_port_enable);
>>   		} else {
>>   			dev_err(dev, "invalid dai id: %d\n", id);
>>   			continue;
>> @@ -1121,12 +1123,33 @@ static int lpass_cpu_init_lpaif(struct platform_device *pdev, int idx,
>>   	struct regmap_config cfg = lpass_cpu_regmap_config;
>>   	struct device *dev = &pdev->dev;
>>   	void __iomem *base;
>> -	int ret;
>> +	int ret, i;
>> +
>> +	/* Only probe an LPAIF if one of the port is described in DT */
>> +	if (v->mi2s_desc) {
>> +		const struct lpaif_mi2s_desc *desc = &v->mi2s_desc[idx];
>> +		bool enabled = false;
>> +
>> +		for (i = 0; i < desc->port_desc_count; ++i) {
>> +			unsigned int port_id = mi2s_port_id(desc->port_desc[i].id);
>> +
>> +			if (test_bit(port_id, &drvdata->lpaif_port_enable)) {
>> +				enabled = true;
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!enabled)
>> +			return 0;
>> +	}
> 
> [ ... ]
> 
>> @@ -1283,8 +1320,30 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>>   
>>   		port_id = mi2s_port_id(variant->dai_driver[i].id);
>>   
>> -		drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
>> -		drvdata->mi2s_intf[port_id] = port_id;
>> +		if (variant->mi2s_desc) {
>> +			unsigned int lpaif_idx, lpaif_port;
>> +			const struct lpaif_mi2s_desc *desc;
>> +
>> +			for (lpaif_idx = 0; lpaif_idx < variant->num_mi2s_desc; ++lpaif_idx) {
>> +				desc = &variant->mi2s_desc[lpaif_idx];
>> +
>> +				for (lpaif_port = 0;
>> +				     lpaif_port < desc->port_desc_count;
>> +				     ++lpaif_port) {
>> +					if (desc->port_desc[lpaif_port].id !=
>> +							variant->dai_driver[i].id)
>> +						continue;
>> +
>> +					drvdata->mi2s_lpaif[port_id] =
>> +						&drvdata->lpaif[lpaif_idx];
>> +					drvdata->mi2s_intf[port_id] =
>> +						desc->port_desc[lpaif_port].intf;
>> +				}
>> +			}
>> +		} else {
>> +			drvdata->mi2s_lpaif[port_id] = &drvdata->lpaif[0];
>> +			drvdata->mi2s_intf[port_id] = port_id;
>> +		}
> 
> [Severity: Medium]
> Can this cause a NULL pointer dereference in lpass_cpu_daiops_probe() when
> a sound card links to an MI2S DAI whose LPAIF was skipped by
> lpass_cpu_init_lpaif()?
> 
> of_lpass_cpu_parse_dai_data() only sets lpaif_port_enable for MI2S ports
> that have an explicit child node under the lpass-cpu DT node, while
> leaving child nodes optional when using the default 8-channel SD line
> configuration.  When lpass_cpu_init_lpaif() returns 0 early because
> lpaif_port_enable is not set for any port on that LPAIF, lpaif->drvdata,
> lpaif->map and lpaif->i2sctl remain NULL, and lpass_platform_init_lpaif()
> likewise skips initializing lpaif->rd_dmactl and lpaif->wr_dmactl.
> 
> However, asoc_qcom_lpass_cpu_platform_probe() still points
> drvdata->mi2s_lpaif[port_id] at &drvdata->lpaif[lpaif_idx] (or leaves it
> NULL if the DAI is not listed in variant->mi2s_desc) and registers all
> variant->dai_driver DAIs.  Unlike the platform suspend/resume paths,
> lpass_cpu_daiops_probe() and lpass_platform_pcmops_open() do not check
> whether the LPAIF was initialized before dereferencing lpaif and passing
> lpaif->map to regmap_write():
> 
> sound/soc/qcom/lpass-cpu.c:lpass_cpu_daiops_probe() {
> 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> 	unsigned int port_id = mi2s_port_id(dai->driver->id);
> 	struct lpass_lpaif *lpaif = drvdata->mi2s_lpaif[port_id];
> 	int ret;
> 
> 	/* ensure audio hardware is disabled */
> 	ret = regmap_write(lpaif->map,
> 			LPAIF_I2SCTL_REG(drvdata->variant, drvdata->mi2s_intf[port_id]), 0);
>      ...
> }
> 
> Checking !lpaif || !lpaif->drvdata in lpass_cpu_daiops_probe() and
> returning -ENODEV would prevent probing an uninitialized LPAIF.
> 

Will add the checks
