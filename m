Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F8423A85
	for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665864; cv=none; b=sXZ0CwrIyb4mL2WfcXlBcYF5GB2uMgX37t02drT8Ely+P4RoUY9nnrxNfVrpdP9My38HOgBfIeRpAX6F635u8texIv1ebdjcT6LSpSIzm0Lpq5/Z7e97bSTkMfe+ebsPYJIeEpW7TR4l1OZwlFqsOuE0/fmVYW5W6e6cHLmFW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665864; c=relaxed/simple;
	bh=q4fmKfhNvE2e6sble7TF9RAgMQFsrD3C7OFXvi8DTWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVjlU57mxn978F2Z8Uz8rQhnTTPJm1EoJ/DXgoFc9TE7UxM3jQDxGYL9VSfACFEluUHilPd8LpLoq9YlLwsJRCS0NyddZknYDXaaou4mqbZWM9ybXjoII9AY1XJ9gD+tOekIZ/wf+S46Bj8EQv5La+FcniTvIsvd6iA07g4SI6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJnLlB1i; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJnLlB1i"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2074710751so869891566b.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Aug 2026 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787665861; x=1788270661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHnWeKaj8W4Oq7BCPbYGJwG4B0bt+vGlTEM1FKI9IJg=;
        b=QJnLlB1iyIxaXFJxASiPFKMBPGuWUVwXOZ+rqJF4VuRsxRxiVKV60LASPJLcNG4T3V
         ezvoma0Z2DS8Sz+V8XCZ3058pmAtfhJg4g00TzajkwAcRfk/9fjJ+sqTuruMaQyH8RDj
         /cHRjwTOVooAFLw2U8KcNr3pZEmXSx/gwz3a2nIUpDVmU4YMQTjiK1JaUT+TBsaZg9Qj
         LaW+zC0XlAt2unj2qRnjLZZY9wU/oR70MmCIE/syTlrqK1uhrBOnULonJPaGpT8qDA/z
         2keXIKK95fIp8Ubla02kGxrvE0QCNK33tioNVGmuquo8OiToWjzaRQXqw1IcPBj4oHPH
         lokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665861; x=1788270661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHnWeKaj8W4Oq7BCPbYGJwG4B0bt+vGlTEM1FKI9IJg=;
        b=AUu9V9ogx0zDoqlKvos/hGggzXQf55p162JPcWj8kJxDugT62AmSe6YtZp3fCHkwOy
         ri6mRorR+Pk3kVNjTZv8DCk4EN/YNFG1v1Y8O9s5iUHRjbpDtAmoA/E35WiBM5EbBThA
         kBF4h/9wLXojyRJkG/jGoo4FjtNTbHmKLu2hYWt3aFsVZTFmDED0DewA1kthjyvH86nv
         /2Rs/ItHHjxd/vduPRgeSsxYssXM+07CJBGdGd2CXB9uytj4KWMbDdwRDgHrwOtwF9sX
         TnKsA4whKh+JaTcIVqwR+EH8QAnpORqNyJMe0X0CU56BaPXM0ckneGqqi/aZzIVH8yxc
         Os1g==
X-Forwarded-Encrypted: i=1; AHgh+Rpa5XTea7CqPLHTmp8qoWv10+BaMTdsWoWHP792rYD/sFe1DIixYcjG1jsPYoFdeyeOKfCTbgPWlCPU@vger.kernel.org
X-Gm-Message-State: AFuF++lb3OpjSGtK5hc8+w10/wkNBS2/3EtIKGlEYjTr6WQRS85l6y84
	yF+PX2liZrsXkS+q8Eynw0GxWnfyGIofqNLesygVpQo60UwKw3kx3Nkh
X-Gm-Gg: AR+sD13MgngcUiY8N1RkOuUcx7gSqbif5VfDhIDiwMmUYc+QDhZ1XLTjIRE5z2+JGHD
	9SNVIp+A+a/bhacts0uRzl/Dsb4LdqLc+Cxr1PBXMUmXMvA0c5zVQ56HCD4eWUJOTL7f23REett
	5FKYp6phuOm7HvEhj+ZZXwrwHgsQ8n8mjdAHhY+tIzVBmsx/zxGr7d7ZIxxZT7Mzz9BCrWSKsqq
	laMh09ckHcF1MXz5EvYNw78tDxw0BrudPjKywYmJqjP6eDokbgx0p2gXRmSsPw5y25n2/MJgwfz
	0XBxncvVbBokpNeWR1xu4Urh+ZQWVAe83+V55M2feB1ItHBD7i3pYxV7XX+8prxuh2PmyTvpylf
	y86+g0CJvX28ypJnRcgBaa3qfd2ktmHtlxw9neXLhQrTEUy0HSu6giiBWdwYwt0+8Xl5Ov5g0g+
	GvOObc1KqBrRVoCewp9knra7bZUKWXKEi5bP+aqqrrPecKrv0WhuPMrfqaOF6Zgb8bgEX4Jj+Ot
	IBHO5kgW5cOykK4rQZbBzAyw97xz3u4TawRwNjAH6clC7ZAbv/j930qW5X7uWkTfw/QlMBWVv2/
	LRo=
X-Received: by 2002:a17:907:1c90:b0:c20:edda:ef5b with SMTP id a640c23a62f3a-c2491e839abmr2663366466b.14.1787665860484;
        Tue, 25 Aug 2026 06:51:00 -0700 (PDT)
Received: from [172.24.138.145] (dynamic-176-007-058-112.176.7.pool.telefonica.de. [176.7.58.112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496734bfcsm1958495166b.43.2026.08.25.06.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:51:00 -0700 (PDT)
Message-ID: <77daa3ee-e5cd-4be9-8110-6f31c90f76d6@gmail.com>
Date: Tue, 25 Aug 2026 15:50:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/14] gpio: regmap: Add optional runtime PM support
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>,
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260821-ad7768-driver-v4-0-bb8fbd06d4eb@analog.com>
 <20260821-ad7768-driver-v4-12-bb8fbd06d4eb@analog.com>
 <aov7QpTVLDZ9PEkw@ashevche-desk.local>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <aov7QpTVLDZ9PEkw@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/26 10:05, Andy Shevchenko wrote:
> On Fri, Aug 21, 2026 at 04:07:05PM +0200, Janani Sunil wrote:
>> Some gpio-regmap consumers share their regmap with a parent device that
>> may be runtime suspended. GPIO register accesses must resume that device
>> first.
>>
>> Add an optional pm_dev field and acquire it before register translation
>> or access. Release it using runtime autosuspend after each operation.
>> Keep the device active across the complete direction-output sequence and
>> propagate failure when setting the initial output value.
>> +DEFINE_GUARD(gpio_regmap_runtime, struct gpio_regmap *,
>> +	     gpio_regmap_runtime_get(_T), gpio_regmap_runtime_put(_T))
> This is not used, it's for guard()() case.
>
DEFINED_GUARD() was added because DEFINE_GUARD_COND() extends that class and reuses its type, destructor and error helpers.

Regards,
Jan

