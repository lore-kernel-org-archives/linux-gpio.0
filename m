Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747756E05C
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 17:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098449; cv=none; b=Uw5K60Y8uXK9QICAw1Yz/5DCDgpRXZqhY0782gSp7oPoaOxDSEhaqF59KpSI1Gt/3QVtbqhJT0TS6gIJBHJBmdnRpEo7ON3eWVZvK7DPkrnMEAS1jFb3NCHPiKjbYiv8UFqz91F1IClW4ucRWcSH9TfcTeEHOOZuYVX7H9DD0VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098449; c=relaxed/simple;
	bh=k62lXyffQpfvoXLrJkljRwAuyGHOT0TxBUmsYyaQxeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVGUGe2Gx155P+vRdq7BSoDsAu5tbmBl5QggApXxcW6nAH9eW/4PV7PLb6vKBMiOC8/NsLtXdcKdGwsseQJcyfINFGvdbvGkgxy4wVan2zbVERIPu8ZpeheHkV4c4SMmktHzC6+IZZEHLFhKgB6Cuu3pUvvd7lVdJmQgykU0aLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+qbLcma; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+qbLcma"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so4579759e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 10:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790098444; x=1790703244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuuzD7pETxcjGtdgpLYjcgyqt6WFmTw9RRQGOf5Uv14=;
        b=F+qbLcmaca+A7AyWZWOQhPVmars/c7oXhjRoRSh3f6XJiaHgyYayW1M5gB7JLqxQO3
         FOi08tQR4/bFXkcFOtYmcNWxHlTlATsXQvqk73/17WNRlK5Ix1ar4kL8uOPJDcltRRO+
         C6iYgA2Nwkme39zmExsY/8+CFOSAuYGgQp7gs0C32f634ByBEXEG98E4ZTvxnmjDofE2
         93ot/k8pK1oTcAWOpUBZDvStgL/UWssKK89wlvBiz1N226zZiCec77wldh5syBlIrq8/
         Rk9oK+MdMv5fWT5fYqDxFgG8UP/Muz7AjPnDWaQr+pzb/IHFLKu48BYEcCror0pxUdog
         S3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098444; x=1790703244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuuzD7pETxcjGtdgpLYjcgyqt6WFmTw9RRQGOf5Uv14=;
        b=Z1YmCzOSYjtWQ4+ZCD5wHprYnyK66VkK0Eo9XMzDRu1mQadEu7+yLWk17bELvIubiO
         c4+cOXtc3ZfxhqMCorL03jxUoLj+grwtgEdMWLjrtv9dEycqbezvrwwdMkhIuiJKpxpG
         VlRMI3txxVGlV6KTA1I9kEySFCb4SS09BnMoNExl2KbIZizZygvRVbxfU5AQcOfU49Oh
         Vi1+wr8ILFYcEd5x1IYIKzBwimST8nAzTzaQe3u+52nGwTMw3c8F9wPFbSj/AJaGI93C
         jtOk5pDwoZYp2Qp4QGfdLDK8OjudmlHe5/2u0kl1d1DpSlmQWY7FHsspk79XSJCmtq+T
         f9+g==
X-Forwarded-Encrypted: i=1; AKwUvByxX4KNZiRWsepp1hUJlrsdI2+gAp+v4ZlJGSmGKFCl0GCor8AhgL81I1lEGubrpAgo53a2LvRq2d4Z@vger.kernel.org
X-Gm-Message-State: AFuF++n/hXocby0BCPTzTB/2l/NShZ0kjwFoFMbvYd36p33DFO5VI7TG
	Za4dc9/eaTjT5DXcEPkakU8GFhrgkYy4yxofwAFpGp30HgqeOIIAgig0
X-Gm-Gg: AYBFou3Wto/8NM98787Auk32R3zGWm9KpSOy6DtuP0RC3OutSUMI1CmwOk/kDBgnVgD
	jumPYVgifTkCYB26v20oOiFokhYpjXYHgdnMQ/KCuzIhkTDnMXzeoYlJ2G333FzuTqUiNPwsbvd
	khaBaUn+35wi0Zh23dgk7jWC1Imoot1igz3KjYFv6acArtK9Nq4kNOP5wKcvQRFnJtLf8JG28Xz
	5vVR/BVnQYEAo2NtFeU4SvjkKUHGlfeAZY+v1MrqRxmLMO17Dcq3cLREQwkGHqse7X0wam/dcC1
	65OXxapnuWYedCWH19q9HHudVimkSb5BzQlSXJBJSRpQ8wv4pn7lU6Dtq5/C3MAxXoKoN5hFmyi
	BUnJs55L9laiyAG1dHILwaCAaV3GDFRiN8wtNnmTKNb8cndAFfrheWTAC2L1Jjnb6Ybez9QmgGj
	WDLTC4Nl8pQs4xtndiuSlhe15B41o8aVNg8Vjdgwkbpzao6IKcheRlsnteLHqdcFqAvxQB2c2Pw
	wxIglza7h4jIE7CyZtcPKhkD6MC0+uC/t0fycA0tIOedApzR9P/a/c=
X-Received: by 2002:a05:6512:6881:10b0:5b8:9963:12df with SMTP id 2adb3069b0e04-5b8d8960c1bmr764e87.9.1790098444004;
        Tue, 22 Sep 2026 10:34:04 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d858f129sm41541e87.63.2026.09.22.10.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:34:01 -0700 (PDT)
Message-ID: <df84b2b6-e4a4-4751-9923-6001f78db0a2@gmail.com>
Date: Tue, 22 Sep 2026 20:34:00 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] mfd: Support for ROHM BD73800 PMIC core
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, Sverdlin@mva-rohm,
 Alexander <alexander.sverdlin@siemens.com>
References: <cover.1789538455.git.mazziesaccount@gmail.com>
 <3e3a25abe337e3f68cde585674019dca439ac897.1789538455.git.mazziesaccount@gmail.com>
 <20260922154543.GA3438784@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260922154543.GA3438784@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2026 18:45, Lee Jones wrote:
> On Wed, 16 Sep 2026, Matti Vaittinen wrote:
> 
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The BD73800 integrates regulators, ADC (intended for accumulating current /
>> voltage / power values), a real-time clock (RTC), clock gate and GPIOs.
>>
>> Add core support for ROHM BD73800 Power Management IC.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>> Acked-by: Lee Jones <lee@kernel.org>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>
>> ---
>> Revision history:
>>   v3 => v4:
>>    - Removed extra whitespace from the end of a file.
>>   v2 => v3:
>>    - Translated this:
>>      https://lore.kernel.org/all/20260813105955.GA1820248@google.com/
>>      to an ack. Please, let me know if this isn't ok.
>>   v1 => v2:
>>    - styling
>>    - update copyright years
>> ---
>>   drivers/mfd/Kconfig              |  15 +-
>>   drivers/mfd/rohm-bd71828.c       | 147 ++++++++++++++-
>>   include/linux/mfd/rohm-bd73800.h | 306 +++++++++++++++++++++++++++++++
>>   include/linux/mfd/rohm-generic.h |   1 +
>>   4 files changed, 461 insertions(+), 8 deletions(-)
>>   create mode 100644 include/linux/mfd/rohm-bd73800.h
> 
> Looks okay.
> 
> Let me know when you have all of the Acks and we'll merge it via MFD.

Thanks Lee,

I think all of the patches had relevant ACKs/RBs already in the previous 
revision. Eg, AFAICS this is good to go.

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
