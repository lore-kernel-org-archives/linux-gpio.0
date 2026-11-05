Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851646;
	b=43JsK8Bw7yw+v+wyBzxj2BcqKup4tLTPSVYKkX1h/XE1YRvVzDv3Qz5GTtXRC+ZllaRQ
	 Oy+3wbYaUUPtHZWlLhR5+dwindwPJSZbg02vq+/jRd17iWgj5aVL0oHbmO1OoyKbqFmU8
	 uVNIaHUTcLE62aH1e0LGpFplX9e7nqDr3Ysqwi+5AutW8zc04h++g0mdHDKU2hbx48K5n
	 f0vbpi1WVRxLWMKVN6usycjxU7Wlrk8BaJwb9GtVsMLwORuXcX4pn1N2OW9/HEzPZHIV1
	 uMcACsn4sZ7OoNu4zJGkpWto89u5Xuhr083F10sP2jnlZKfrkTcVo2bunqv7Ps5dsew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851646;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=MpIp8Zah5MXOx4qyc7jCpEQJEl1kkDfMFRqTzDwX50Y=;
	b=K0I+o5CEuhO4uj1Hnje2C5vlAXv0bNm2awNusGKn/S9hVtTa7C9OBiQMa9H0xJdPLDIF
	 d7zormKMZcyJ+v97K+pc52C1akLbyrAvdx9Uf2rhOCYbogqKTyh6rljaNY4LaVEVXun8w
	 MQGhO0CdMUX7FX3w1bJNGZIE9DSDbbyfA6pceWdA+PytZnDajW/hG4xZD6+vhJ3MwhxAD
	 a0DRR+sDgxVAirojDPgp7qikXuenP+vqNygEFwPufNSkgcOZptavXFgNmm2BfPnvojk85
	 vKzxb+RHkWYhXX+IyPDLx5fYT0CRjL5ksarSmJuAqJHeLydlWP+V9QvHCzSC1d4DplA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=F1UWj9XD;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B9606A32C
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 04:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F07B9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=F1UWj9XD
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id Oi7SxtvH6yb4YOol3xEeuZ; Thu, 05 Nov 2026 04:07:25 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Ool2xhZgcVqSeOol2x52dp; Thu, 05 Nov 2026 04:07:25 +0000
X-Authority-Analysis: v=2.4 cv=eLETjGp1 c=1 sm=1 tr=0 ts=6aec00fd
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=AALQnO7P1EdZy74KjyYA:9 a=QEXdDO2ut3YA:10 a=l0tvQkQj361Lz_hSoyVA:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=MpIp8Zah5MXOx4qyc7jCpEQJEl1kkDfMFRqTzDwX50Y=; b=F1UWj9XD8eug
	xwOentwnKxX+e2IDfRphbN886I5f5SnX1SSPCUMewVjVKh9VVoP2/CEPhfWtpTHkbcKYvWlQ1sox9
	V+EhcF/y7jhjrwm1FF3wUc4TxFLmZntTzfMrI1vDYFrooEQZALv/uS90R/Zsdr9aliZfQfwkJlOFV
	OopDuUAOmSL/KFeMxrvvbAnFV68Ics7Wr+/iV9ZpTcz6h+no3AbxjLCPLNz9mBm8d5Jsv16DZDJMY
	qRfsnKfO9E8ENPXwpvEISoahezApmwH597xHbE7+t044iHeBu+nUrQUja7CesU28mj+ihJBNL+cc9
	h6TipPdp/zBd3hdbKfYMJw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54720)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOol2-000000049JK-1dTq;
	Thu, 05 Nov 2026 09:37:24 +0530
Message-ID: <33b55f47-c679-4592-b4e9-a14fb77b7236@roeck-us.net>
Date: Wed, 4 Nov 2026 20:06:59 -0800
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
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
To: "Torreno, Alexis Czezar" <alexisczezar.torreno@analog.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
 <20261104-staging-ltc4284-v1-1-49fce67ebc48@analog.com>
 <sashiko-outbox-196618@kernel.org>
 <PH0PR03MB63510EDCF229B247474764C8F1682@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB63510EDCF229B247474764C8F1682@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOol2-000000049JK-1dTq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54720
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfF8bIISFTCqDoiJXKaIi3Uzi3Vf3DcduG5XreJX5h05MTlII4J6hV55XSlA7AZj2Vq86eylAdiJDRj5ScGxHElvf5aQ1I8f0IOaJi7Nshhd7QryXC9bz
 T05jo2P30v6F2bfMqkfA/vqazscbOZHWEXHeSiPSpYMHqqdwRXBiVQyDOhpBCBzE3Fm3Ov87uyct9TA1CkV3E8VR3B3LXXzOyoi/IN3FQosPzNVPD3yC6NO5

On 11/3/26 20:06, Torreno, Alexis Czezar wrote:
>> [External]
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to
>> consider:
>> - [Medium] dt-bindings: hwmon: ltc4283: requiring rsense2 breaks single-driver
>> mode
>> - [Low] dt-bindings: hwmon: ltc4283: ltc4284 example sense resistors below min
>> 50000
>> --
>>
>> commit 9676b294cf2ad1168e5ce0d8de5c0cd58e68d9ed
>> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>
>> dt-bindings: hwmon: ltc4283: add ltc4284
>>
>> This commit adds device tree binding support for the Analog Devices LTC4284
>> negative voltage hot swap controller to the adi,ltc4283 schema, including new
>> properties for its second sense resistor and ADC resistance.
>>
> 
> ...
> 
>>> +
>>> +  adi,rsense2-nano-ohms:
>>> +    description:
>>> +      Value of the SENSE2 current sense resistor. This resistor is connected
>>> +      between SENSE2+ and SENSE2- pins.
>>> +
> 
> ...
> 
>>>   allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: adi,ltc4284
>>> +    then:
>>> +      required:
>>> +        - adi,rsense2-nano-ohms
>>> +        - adi,radc-nano-ohms
>>> +    else:
>>> +      properties:
>>> +        adi,rsense2-nano-ohms: false
>>> +        adi,radc-nano-ohms: false
>>
>> [Severity: Medium]
>> As noted in the binding description above, the LTC4284 supports four hardware
>> operating modes configured via the MODE pin, including single driver mode.
>>
>> In single driver mode, only the first MOSFET path (GATE1 and SENSE1+/SENSE1-
>> ) is used, and no second sense resistor is populated between SENSE2+ and
>> SENSE2-.
>>
>> If adi,rsense2-nano-ohms is unconditionally required in the allOf block for
>> adi,ltc4284, wouldn't boards wired in single driver mode fail schema validation
>> unless they specify a nonexistent adi,rsense2-nano-ohms property?
>>
> 
> I suppose I can make rsense2 optional (+ corresponding driver code change)?
> Or can it be kept as is?
> 

I'd suggest to change it. I do not see the point of making it mandatory
if it isn't.

>>> @@ -269,4 +303,19 @@ examples:
>>>               #gpio-cells = <2>;
>>>           };
>>>       };
>>> +
>>> +  - |
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        swap-controller@20 {
>>> +            compatible = "adi,ltc4284";
>>> +            reg = <0x20>;
>>> +
>>> +            adi,rsense-nano-ohms = <1000>;
>>> +            adi,rsense2-nano-ohms = <1000>;
>>> +            adi,radc-nano-ohms = <500>;
>>> +        };
>>
>> [Severity: Low]
>> In drivers/hwmon/ltc4283.c, ltc4283_setup() validates the sense resistor
>> properties against [LTC4283_MIN_RSENSE, LTC4283_MAX_RSENSE], where
>> LTC4283_MIN_RSENSE is 50000 nano-ohms (50 micro-ohms) and
>> LTC4283_MAX_RSENSE is 1677721599 nano-ohms:
>>
>>      if (st->rsense < LTC4283_MIN_RSENSE || st->rsense > LTC4283_MAX_RSENSE)
>>          return dev_err_probe(dev, -EINVAL,
>>                               "adi,rsense-nano-ohms(%u) too small or too large [%u %u]\n",
>>                               st->rsense, LTC4283_MIN_RSENSE, LTC4283_MAX_RSENSE);
>>
>> The example above sets adi,rsense-nano-ohms = <1000>, adi,rsense2-nano-
>> ohms = <1000>, and adi,radc-nano-ohms = <500> (1 micro-ohm and 0.5 micro-
>> ohm), which will cause ltc4283_setup() to fail probe with -EINVAL.
>>
> 
> This was just random numbers to show the example. I can change the values
> to a more realistic sample if preferred.

Random number or not, they should at least be valid.

Note that the existing example for ltc4283 also lists 500 nano-ohm and
is just as bad.

Thanks,
Guenter

