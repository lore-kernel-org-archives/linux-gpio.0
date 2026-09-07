Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4664734CC
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780361; cv=none; b=Pf8NAuRcn5DJ8PitGgljY3A9GHusVFgAFcpRP3Mc3a2ZWua6V6L4Ra2PwjYVEMn36CSO+qYo9kr4oP6Oyn6LNAPK6K+4xd3vSSyBDxsSpusSlDN87kyWDumums4JQaOL6uYCiKRXEkjVFpPwxbvPlr+1V6mj36K7qmsOzd974OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780361; c=relaxed/simple;
	bh=r5w4vZHxYOow+S9w69v8p+rm/PS+NwfbtQJFBtx0rXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cr83Q6CrpkPqeP9YhN6GU2O3ZECd/2N5H+xGCx21eogN4UgsUke82OSiALqVuF9KSEM05HOBaQZ7EcUMRYtCOtd4Kz51Vj4ddDGem+KKoMhlI8+lBDCL2SMrj5prDjWw3uW9sLLdVFG0mYuZm0r4ECX73bAP0El6MTdE/PkMBdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGXRbyn6; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGXRbyn6"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c252e703fa3so517828066b.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 04:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780357; x=1789385157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rw9wEnmmRS9YsDudq+DNMbA6mN+2z8x1quln5q6huH8=;
        b=dGXRbyn6bnkA35cdpQzhxPErEc3K4NGPNckPg7j2FBrvwy6fFBJ4tGfINGBW/DQk+y
         m+mpZcUcjmljLaE5bE7Uocnedi5OAH3lFTLVNR9cMh6+YPxbzgY3enEf8exdmgph2x6P
         S+Oqkakqu68hqPvr54vifo0fXXK8mU3V/lfo34me9DWhDhyc83LRyzJSYI6vf2oEmDlj
         YR3USw0lYPv/4YprQkyCA9ulGEUzD650UO23aKhrQsM4ZJ/qLme8QdjyU7mzgNooFWDG
         FeqIxUF7xrmlLDSZ+7eqK6M06m+RVmPYUTuz1DuWQuWLKv2gZuF8U2+C7sDUdtybH1iH
         lM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780357; x=1789385157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rw9wEnmmRS9YsDudq+DNMbA6mN+2z8x1quln5q6huH8=;
        b=GGcqQsfLaRdj3gQtJn1tueLVvY4i92NwVDBHiZ4h18iK3hHdsUaAf8av1nTBwmS0DC
         9I0ryXMNsMJ/xIeu3+ObY2y8Xwn5Kiyh58tT0Qw1TKztoENfRYN0bcwmvsRPG5JQBDUw
         GePzcV8lllpGElIdev6xoeH8iaS7LGLIDFYiu0X44c3CtxCIDYG4NSOE6tOAO2G2nEG1
         csQAJC05QZj7IM6azMzmE0HE4lya/kawy5dz9uGONJ6qikKgnMt9Uca4Ed64GQFWSBiW
         4s0pAiFYWxG2DBhOTC/e1tdZFFmEm2/pufGQRXuY4gxmmKszaK/Klx2odNL57lFvZw1k
         w+mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEFq0Hz/QrQ3TL0K4AmBZe5psJWrwWiXBY9kTiLAYOrHM8Ubh2Hri6warqIpIxZiwMreVEp/EuORsq@vger.kernel.org
X-Gm-Message-State: AFuF++n3pugkXUFoV7AzGyey6phiayvIQvA0o4S2w7fwUjnVS+1Qgku5
	l9ObnQDujdk5BsSVh8ABgJjURujCCPUl1gB/ADFQc1QPYOxh/XLMSS0n
X-Gm-Gg: AYBFou0htCme3GpqtDnlz3M1fflqLnvOgVLrmNylOG3We/ovQ+r+83+LRPlm1XnngKV
	CmH1yo0q5EHHb1OewRrkgEpaiJI+4XoymoGYkiVATImcrJEWyWJfuDkvqkOL8XUWm2z9wDhgFpm
	fIJgtcyNu3SnL0I0uqpgun2sDExxagjoJuDHmM9JORc4d/aSJMZ9nXcda1TkC7ENyJpjPPFHSqF
	G7HEzroiyeQ3hsnBZT0CHqkbqe5iXJp3Wt2Y5IVdq00sjYAMSHxR98Qw+S1KcWtLmTFfPqqN0jI
	6MaICQu7r0Ut+VmP93un8W1Aq5k53iISivzgdH77rdd92UXcP1c96P7C5qLJsiRq33LGsa8/5G5
	d+aO9Izfwin9uGT0oAdBdUd8FrmdJkhncwlrDE5VScR/sljnP7Y9mLAPGAHWFn6TPg3FxayG2pc
	4j7YUtNbyZ4k4Ze4WnJ4hvR9RMZIvw0ZJ2/D3Bvbv7T02iyVUZ5rArCS+AySdc0gmgxsfDB13Q
X-Received: by 2002:a17:907:9622:b0:c21:34a3:4df9 with SMTP id a640c23a62f3a-c260c69a59cmr891010466b.3.1788780357031;
        Mon, 07 Sep 2026 04:25:57 -0700 (PDT)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262f97f1a3sm285317866b.19.2026.09.07.04.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 04:25:56 -0700 (PDT)
Message-ID: <21704002-3bc7-474a-9e27-dd9b7f01a4bb@gmail.com>
Date: Mon, 7 Sep 2026 13:25:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/17] iio: adc: Add AD7768 and AD7768-4 core support
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux@analog.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260904-ad7768-driver-v6-0-e4378f946bfb@analog.com>
 <20260904-ad7768-driver-v6-5-e4378f946bfb@analog.com>
 <178866660277.3402141.13365217395986099796.b4-review@b4>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <178866660277.3402141.13365217395986099796.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/6/26 05:50, Jonathan Cameron wrote:
>> Add core support for the AD7768 and AD7768-4 simultaneous sampling ADCs.
>> Configure supplies, clock and reset, use a custom regmap bus for the SPI
>> protocol, and parse the enabled channels and input buffer settings from
>> devicetree.
>>
>> Connect the converter to an IIO backend for buffered capture with CRC,
>> provide a fixed safe wideband sampling configuration and add runtime
>> power management.
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ...
>
>> +
>> +static int ad7768_get_enable_vref(struct device *dev, unsigned int index)
>> +{
>> +	const char * const *supply = ad7768_vref_supply_names[index];
>> +	int refp_uV;
>> +	int refn_uV;
>> +
>> +	refp_uV = devm_regulator_get_enable_read_voltage(dev, supply[0]);
>> +	if (refp_uV < 0)
>> +		return dev_err_probe(dev, refp_uV,
>> +				     "Failed to get %s supply voltage\n", supply[0]);
>> +
>> +	refn_uV = devm_regulator_get_enable_read_voltage(dev, supply[1]);
>> +	if (refn_uV == -ENODEV)
>> +		refn_uV = 0;
>> +	else if (refn_uV < 0)
>> +		return dev_err_probe(dev, refn_uV,
>> +				     "Failed to get %s supply voltage\n", supply[1]);
>> +
>> +	if (refp_uV <= refn_uV)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "Invalid reference %u voltage\n", index + 1);
>> +
>> +	return refp_uV - refn_uV;
> Do we never care about the offset inherent in where the negative sits?

The absolute REFx- voltage does not introduce an offset into the ADC transfer function. The datasheet defines VREF as REFx+ - REFx- and the LSB size as (2 * VREF)/2^24. Zero code remains at AINx+ - AINx- = 0.

Regards,
Jan

