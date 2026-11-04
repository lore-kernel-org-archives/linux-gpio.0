Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785095;
	b=HUOAOpjsc8jMj/odvf3DkoaRK6pOsaeJj/AsGfMnvIru4WefFQbYP5N9DsX4BwqQRSF4
	 JgvtwhPwKLpjiKeI1NfaKb4ghhAIfZCMjgcxEGMnr07iNCKSJuACk76S5iNEaDIcGwNKJ
	 zrj0Dgu89gbprqlt8jO9ItNts4h7s5ur2DCk4sRnCmnEO8AypVKPjQdL1GuBK70F/E7mQ
	 5Jx/uZxGxP6B5luVkuu+E5kfYNJ9lcniLUmjvC7NUHjn6uFr4p4FXdZD7u6idq+D81aOv
	 +NVyf68Dx1XIyzDYb5XMCDewi26DCcjUgNvrCaImAnV2TVxKt55l5C7DeFxiA0a1Hlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=;
	b=MaOYQgfExeYb8Nh+mHDPCRBW4V4Y1DCmfBXVOjcSkgCup8izxmMhhW2im6tdC4t9rqxv
	 43UwjGp8/dlH1CHTSU9I24DqN0FBWE5TlTRBIaRAuNMqJqGELxJZdr2zdoqWV7BVApfei
	 pCVCD1zcy5vjKEs4BNMMGfH8GO60LTj4OyJoa0IT2zUtg0trdBnlGa+hoyvWPrtgLkODM
	 tRcbZedJCKZB9AePNjZlF4BgZ6SMEIHMHMQFE2WvMMxTGMkm5hsv+9t/37Zi1rBGWe9bN
	 sj1fDRK3sH8bO32RwkS3eexgk2mcew8hS4ZC1VZm957AOgdwXQfPDSRbc28eGG6frGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LsupHlXT;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233BF606A330
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 09:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233BF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LsupHlXT
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490a0e72588so35503f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 01:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793785092; x=1794389892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=;
        b=LsupHlXTtGcKDNw9zSXJpA+vfbnvd3q6bZoMx7nn6XJC3K1Vfp+0hYDZIqgzbN89wf
         UcKeVwht2tgk+HpNys0OZena6mwqJVR2PJn6q8BPz3ddfJjEuBLzJ9O2ZKw7MYsQ8xA4
         JWeNv/xbjrzvLNS/8t7rXcvjKLf7mYtYaPk+CCyKVDwCTomhlSgyO7i/6CqZfnQR0xSS
         KbAgPvGUHQeYjiaR5vfm/jXhOOIuCi+GLkG3ntMQ4/0eFvtmCOqf881nMAC9KPkvmA9y
         W1vE62+rz3RR+vn8biM7w+7kWnsUO6V4OjAxXh86+flowxxCXRtmeOF/tBP3giMCiMZa
         PbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785092; x=1794389892;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgGmwBv2YCkVrgEaoOotmd+kkUUxKWgTOQh7djT+JIo=;
        b=eoh665cKMaoIrrD8dpfrtrW4x9xF+ZEALPH+okZDQY9TNNYxuyM92hHEuuQoPg/hb3
         Hn41NW7WLRjEwoKpdWUt3od4bfqTZtRoPmGH2pmdKN/aiBd34yZQL8NO175863eRkrdf
         meYElXdcCavSnYEY0Ri9qxWkjQG3C2K8bLf0mRbOC78DDYHjGoslfJ9UKdh7fhNWHp7H
         A+OxBAmad+xbaGvMptTyqZlLU58at6lNN8NVuNfv1lGUCkLPDS+bRp0MqYbroKnC1Nl8
         nAK/zGaGuRJ9EGkYdjbF0w1qJNzjBsTonboxNoRBslvWv/cMUBzA90c1fiDesm7pouoZ
         Tnew==
X-Forwarded-Encrypted: i=1; AKwUvBxxV2TdQKA2kbb0jUnv0UNcBpTTbtxqXeXOst6dNgojT5R8EfOPFJgp2GbgwHRarFj0uyskF1SpQBXx@vger.kernel.org
X-Gm-Message-State: APuU4Z85n0eHP4tHG27FvRFEH3kzPtvXxxFQKxTx1y3iFBTHzyOgHHAm
	m20aEZ833R/z0mBxVkyw00jXWG+SXmoTvwSg9uObWddq4wE7PBvphHvyyyx5l7NltfZUkZEURS3
	MvVOs
X-Gm-Gg: AYBFou009lFZtyYJC57aBDyC2k1Ll3rjOHq1ETp+4gh/Y13Cm7xLobrDiIulOaNC/vj
	rQGf7nmDY9RVSyz2hbmFr0pFyBNxLn8k5shCPJRmgCtRNZnOHMnQfnjOrT0yhomnul+mzu6gryM
	G6Fye1m009PIumFtSVGA0Lk//GfpehWchVjUqXDqnB8l6aubsjsLL1kdndAUsQkA+cF4tBYhJsL
	uaOugUqO72tWrTFIjT/SAuSOzRzQrQqytOVGq4vQK16s7En9SYuNYZoI5vDHSmwm3yLMQg2WaAY
	SqQ7ICfDp+sDlBZ+RHOExqB5orZqcfI5fpjAeY0AIOmiMxY0XZP3/tZIvbGzlMsPqyMQI9gGiRM
	9BVKcUxAyWUKg4N3VLzO+Eb9ZlVCiOOiKU8pCmyd84HXR5yy8O3JKPvXwBgdTvoM+y9K/OaAJb8
	CjWG7Ix3GRywTMa9V2zd/ulj4u54yCbBPDZxMEMIIhZH82ZxlT2EL03Utt+KSy35JDqIBfLubJO
	63VfvPCDyhDm8Brs5vE9A/RQMusJpDnxPfUCvSaju8aRD7yVmaYe8F0QOFTWZwV5JIuIGWEqWyY
	RmDGnLqYzQUGgcu+LcNxcX09t5565k0K9aAtU8BHpeag3m9rxSvRBHPj
X-Received: by 2002:a05:6000:46c6:b0:487:40d:af33 with SMTP id ffacd0b85a97d-48e6e2fa518mr22336653f8f.13.1793785092319;
        Wed, 04 Nov 2026 01:38:12 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm2605410f8f.58.2026.11.04.01.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:38:11 -0800 (PST)
Message-ID: <73888927-18ec-44b1-bb14-72e72860bfc2@baylibre.com>
Date: Wed, 4 Nov 2026 10:38:11 +0100
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
Subject: Re: [PATCH 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
 Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-11-52d92843ad97@baylibre.com>
 <aunIVW4JeM_P2WOa@ashevche-desk.local>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <aunIVW4JeM_P2WOa@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 11/3/26 12:41 PM, Andy Shevchenko wrote:
> On Fri, Oct 30, 2026 at 04:58:42PM +0100, Clément Le Goffic wrote:
>> On a GPIO request, select the GPIO function of the pin, on the pin for a
>> pin-only function or on its single-pin group. Without a GPIO function the
>> mux is left as it is.
> 
> ...
> 
>> +static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
>> +{
>> +	const unsigned int *elems, *pins;
>> +	unsigned int nr_elems, nr_pins, i;
>> +	bool pin_only, gpio;
>> +	int nr_functions, func, ret;
>> +
>> +	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> 
> Is nr_functions signed for a purpose? Can it hold an error code?

No indeed, will fix in v2.

> 
>> +	for (func = 0; func < nr_functions; func++) {
> 
> 	for (int func = 0; func < nr_functions; func++) {
> 
>> +		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only,
>> +						      &gpio);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (!gpio)
>> +			continue;
>> +
>> +		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems,
>> +						       &elems);
>> +		if (ret)
>> +			return ret;
> 
>> +		for (i = 0; i < nr_elems; i++) {
> 
> 		for (unsigned int i = 0; i < nr_elems; i++) {

Ack

> 
>> +			if (pin_only) {
>> +				if (elems[i] != pin)
>> +					continue;
>> +
>> +				return pinctrl_ops->pin_mux_set(pmx->ph, func,
>> +								pin);
>> +			}
>> +
>> +			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i],
>> +							  &pins, &nr_pins);
>> +			if (ret)
>> +				return ret;
>> +
>> +			if (nr_pins == 1 && pins[0] == pin)
>> +				return pinctrl_ops->mux_set(pmx->ph, func,
>> +							    elems[i]);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
> 

Best regards,
Clément
