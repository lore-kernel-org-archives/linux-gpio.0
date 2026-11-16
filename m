Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822877;
	b=EGe7HdbV9zVPEGJuE+XmCGssBwSmvGuYTDvP4WsxksuV5KnFELsl2zRzGQS57Z2siQAx
	 Of6mi7jB6UovIXVBB1/GtnW564c5kC+efw0ij3de6n5dbjRVGBVuVM+Cvkcs+iaJehHj4
	 RQODy6B0NRrbIXqLwF6b8cRpko9Fp+Fyo1owToSdteC5rq777nrd8RO1X9Iae7r+V13Gk
	 ++z76lSLR6N9+bEE8cMh0oB433XChDMTkxu6wMjuSHrDvlAQbcBhUQqRiWuRjjOpg+ZWT
	 jwPhGtzN7MAB1wgmnYHN71TODEm/zmqLtosOkOJIL2rBPC1fsU+SyPmApJYUg0Pmhww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
	b=aYLMEIwmduN0RKjWZnSm7+GSkHX1YYefadhl4ijKX4gpabKcbCk/PCWW0gwoHsFtsh2g
	 ZCNQmQ2BKAenlrOnrYgRtZ2XS/wOfpalYkS+5HQqp6qzOJ9aLNyMpmgvXzlveI2I5SETk
	 dcIT2YzCkolbEGR1fOlGSfUmV0r0tx0+lMABpmr+T6O97YV8TA6b4W6CDXmLA3eY79wzd
	 2nqPmAmkQ7O04Y8RUGMAazpaUw52SIp3t1G7i53lueXNRNqWwgQU7nSNI3Foi23LHYJJG
	 MiKA8fqcknF+hnPweapJFaB3J77hRo+RZ8jEgg5Qmvgw/sfPcXb78brbFUzWb9YCOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A+gXvdVN;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DA1606A329
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 09:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A+gXvdVN
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49134c8509fso3202247f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 01:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794822875; x=1795427675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
        b=A+gXvdVNQlbxG2OJnAkc2HMODjS+HFKCxCKLgWQ2hNlh6Q8ymOmuCTAdP3I0G7qB4W
         gCju/pgfiUSBdT19UcVuubc4AgJ4fMArXELSOS1Tr3c1TwIWRywBg2PRnwA82mDURSb3
         2gdHWuPSij3722hWFVQX+SP2XLyjnunn8ktK2h+9AtjI4MfIbzo7NuBK3VnBWDmy/6xL
         1KRV5zu7EEqGX5gkN14RmrYr7jX/UEBzDGXe+Xa/8Ulrn9w5lpKd6BUgEBfiWKXVTgdg
         WKbUBmm+W+T+V/IqsbpBTNHVd6HZguYLhq54kjjvrh5AbrcIeZfB6b87vgFiZ1MaCq3/
         2jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822875; x=1795427675;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7A/7r4PaZj0TpdOqDl6awwgwuxZUBMXAvOcGR8Mu0U=;
        b=OhjxtkRs118VZiAxoU0YyaMCkaMDGCUlP+e179VN4vhBOifCH66rCSzaIXKMCzj1zN
         XperyixJ+rPgmouWvqoLlE9nvGE99A3sPZ0HW8PK4G5IX1zrVSANiT7Dn758xNX5cdO1
         JcSAPydPG5YQof9PwmJGm+qHnWisanXROopR5ydsCuYDYAAxnPiwQS4JMqeV9zBSjq2i
         gNGvhAtwuBgTVr7gR49p2ZKT6iaMK5Kx9rZblPHAUNh/SI1DuILjYOXsIbMjviGN0ALf
         0PXdG+hAy9xijln6+e+SiiHDljQ2dlcaVellDmbdbs9xN4iEHgvVpNfy46GWjI2ClMs5
         Lxfw==
X-Forwarded-Encrypted: i=1; AL+hErF56S7orHyF4F14Wt86X2vtLZEieHxz263HTpt218uzHtjc0TjB42IYs3a2tnU+gIbYFvshZgojRp5M@vger.kernel.org
X-Gm-Message-State: APuU4Z8YPy2OOTLx1wM6ALnbChigDHgqHeylV+c73PdUkZ8hKfK/5weo
	G3VaNl8AukJA3k1Yr3E/a5wV4HZRjphQdVhiQFcPCe/V1YZEI+gGDExxOdNxGI/731T1RiqVH2h
	8le+Ubbk=
X-Gm-Gg: AZFdTZe8JZZolEhwN9y93co1G7Woja/RHZuhpTJ6UQNDEiHADU/M7jyhGBobB1m8BXQ
	NbsO4jNzlOrZ8UZQAfxLFT+mrvkcMNheMDnS3ul/3pvlWI0DAi9LIvL813pU2CzrtoSwcd9mNsm
	TyW0T7iQXZEhOXcLpZ5U3LGQevqWdGwlXLL1Wz9dYxxfU2ACYbi+Gon2WopFv6fOXTF9ek+S6/1
	Wk95IK1IDN9N09rhfOZdoeDgxCRRLbZeq7effLUINRhHnnBY+yzgtyRT5e1YhVrND+sk7pdOPof
	HbRD+9W8fb6jOxbSUW2pC3+jA3oDJCZ4PYBA77Y7oyYOxKPanzdqMZTzKLQyTAuirEYumITaUhS
	ikOYM3NmMVDFr4ehvk1rHJiUns2zj6o2+0QnZyMAxGA8TeIKmC3tj6Du0pWWph/lZQ94PmagWkM
	z4tjViI3yDKdAFDhb22MBZKY1vS97tQsm+xWLE9Jnfqssswfg0/eje7Kv0pho06vA+IL9ImYFlX
	h+IRE/wc0PlzrWKF1734Kg7yGIZcww6ZbcV//nbtmqVo1aEC9JHeW6DEcuh4fHe+CrdXbVnmyJ1
	8XxNdbiFEdWLG/IOLo+uikGGvLfuWjDwd+3EDvoCkwl37XkOI0afJjIgT9sf1G89dWo6v0SK3P6
	vmuYyABIOXA==
X-Received: by 2002:a05:6000:4688:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-49c714a2a99mr14346569f8f.24.1794822874794;
        Mon, 16 Nov 2026 01:54:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c604ecda5sm20221619f8f.37.2026.11.16.01.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:54:34 -0800 (PST)
Message-ID: <93587a88-7b6d-4fd7-95d0-f958fc3ce1e8@linaro.org>
Date: Mon, 16 Nov 2026 10:54:33 +0100
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
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linusw@kernel.org, linux-amlogic@lists.infradead.org,
 linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 23:41, Martin Blumenstingl wrote:
> The I2S pin groups are registered without the _pins suffix, but the
> i2s_groups array still references them with the _pins suffix.
> Update the group names so that the I2S pin groups can be referenced.
> 
> Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and SPDIF pins")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson8.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
> index 3da7f3799c3f..1f58752637a3 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
> @@ -923,9 +923,9 @@ static const char * const i2c_b_groups[] = {
>   };
>   
>   static const char * const i2s_groups[] = {
> -	"i2s_out_ch45", "i2s_out_ch23_pins", "i2s_out_ch01_pins",
> -	"i2s_in_ch01_pins", "i2s_lr_clk_in_pins", "i2s_ao_clk_in_pins",
> -	"i2s_am_clk_pins", "i2s_out_ch78_pins"
> +	"i2s_out_ch45", "i2s_out_ch23", "i2s_out_ch01",
> +	"i2s_in_ch01", "i2s_lr_clk_in", "i2s_ao_clk_in",
> +	"i2s_am_clk", "i2s_out_ch78"
>   };
>   
>   static const char * const sd_c_groups[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
