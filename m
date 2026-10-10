Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFAD372EEE
	for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 13:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639999; cv=none; b=RDen4rdmu9ymkQWMmPycl8Tnq8NSMbgem/M/IhKzmy3C28unTtdJ8u5dD9Vzw/qrn/o3yZIT1u9G5nT++kfVMMheBVQRXKA3V9xz9eowSzjvLEMfvLasOMPNP+hpp0RiTirAjOT3ALRl8WRhzclgpJ8EBMamEvpBE1c+3r6JSyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639999; c=relaxed/simple;
	bh=7hRVs3BYbYMUWytBwA6CmbA7QnVq714J9oYUdi/KtgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEZ6VxNqyuXDvC7t3Qxf91CxxrAdP96MUykae4xXwlTnvmpU9KJo3xAFBa9QfctT8TE55dsLoedCmUFMvYGhXMhSsD+0aoV4p6+DZIChRnWnSBJ4l6rLVaUzlQLG/YRKp7gmFRljpe6LtSom+FEBC4bKq06pGZ0s7p7+0OgG/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PBwgq+q+; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PBwgq+q+"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4f58dce2ad9so520922b6e.1
        for <linux-gpio@vger.kernel.org>; Sat, 10 Oct 2026 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791639994; x=1792244794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAKMj+KBQiZwjesAoVsZB7P+pgbWuimzGqrZ8oXnW4s=;
        b=PBwgq+q+VXb1e2UWSFncuuXX8zVzNA/LEnkjvGi2ozydiaSkf0Ea3M6MVyQ1gPHB2O
         eo0yJv5+UfD/xpLQ+rklosCEUCCTnEjBgLYQu4fRh4jHYDtwtXmjlsWyFIyq1XPyzdwB
         178+X2cIrbX1t42m6gqR9ttKhToEfj9BPqcCJredL2eZlSQFKK8x2bv1kmS6NxGmUaPU
         TnADhNLy4zBl9aDZKIGpoN5FYVz5Ijol0W0MqQ+T8Tq6LmpJry9KYbt22Xe6BJ9ZNTbb
         AkF31lkBzhrRAIFx7e0q/JFry5XT0Yhx1A9FUANilRyNCkyjNB9+O+mrwS1YHxRa6fTc
         KWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791639994; x=1792244794;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAKMj+KBQiZwjesAoVsZB7P+pgbWuimzGqrZ8oXnW4s=;
        b=pg20KzhYsSCcVZUuT1zlr+5m/Livag7vRWsYsIc5NRW9fVmJxs4FxFZruK8qSNkx18
         st8BY3ujzz2z8PuRMn4HDmKpufVFRvtAZ9IJ5y8oiECOc58rVRA07AnZb3iDe729+364
         J/+rt0mH8Rei9B9FLDXyYPaferw4MvYdpNGz8+M3eOUgQpIITfyjQgEUUyLnW8YAvBhW
         g8sgQtEtmnOu99/6xhaa0N46CJWE2Z6ttxJ5nn2s0L3+hi2sH9knoNhEbHhJu2kd9siy
         Oqr1+XPSskUG0RirA78HD3+uE9hVL88harDlRQUSjd9hLZ6VCm59KT2u5xr+L2C5FBvJ
         auEw==
X-Forwarded-Encrypted: i=1; AKwUvBw6dX8HLRaTD8WeFWhkLocLw7JozmWexlnlufyFMtUlFkm/xEnKu/gcn30/gQKUIallBTu0dcPq8oql@vger.kernel.org
X-Gm-Message-State: AFq9FYIA8Rm4w5CK/UhWEOw5eVB0KQ0oKOaWQE3u7TEHAI8bNshbyYAa
	OlHnEQxrEfnOn8XkfCT67MDwXL+vx+iU+ZZKfZsupX3t0EINcHb9aQQDn3ifKYn5D7A=
X-Gm-Gg: AYBFou2r3KY4BriFx6qZkDHb0uB0bY2OCtjSFzPSG/57QZl6+vmfuErP1WEpPwtg929
	Xt0tqPYUtU9u7vvsLaLGCznesoRDNb42lqrGRYS+k9YK4gjfEZ5+3JzEKEhHJmt8kiCBziBpieo
	C/k4J7AbznVHCUo52FvqOX6OGdnYeRveTN7Y1Rquk2G0/JbcIHdcz0FTNnswHsxIE6HagZQfVrA
	YUbrB3+ypsNdabeSqb4DOlDY+Yw7PDS9sYBwO8THlAt5VQkddcZkx/T3bcRkTzM5tGlTi2p/f9+
	S77xePv/kg7ygg0nH4KetdqXlS1MYbHOTy5e2k7C+EqHxaU8qSgfyVAvY2AMIyMNgQHcShx31yD
	G54W0ftZ/hQvorS1Uhbm7CU0t6b8GzpdjrvBVc17xkbHTs7DK5Zy9LH9cgxTgEtYoow2QfaTPMl
	3kacwUCmPv4Z/IaNans1iDN1JWFM28mJZzX3edLH44rjK6277SqTRu4FlBGz/rOOx07/iJnJY4q
	aYKOm8SHQ2GrhYs/vLhdkYKxd58/Zcomob4dxoRqaasYU7Q
X-Received: by 2002:a05:6808:4fde:b0:4f3:e98f:fa26 with SMTP id 5614622812f47-50c56deebe6mr4606369b6e.58.1791639994282;
        Sat, 10 Oct 2026 06:46:34 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3b8a:e2db:776f:80fd? ([2600:8803:e7e4:500:3b8a:e2db:776f:80fd])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1c120ae6sm4982338b6e.17.2026.10.10.06.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 06:46:32 -0700 (PDT)
Message-ID: <cde9d00a-bfe4-4093-b03d-f76a122e4ded@baylibre.com>
Date: Sat, 10 Oct 2026 08:46:30 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c14: add gpio support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
 <20261009-iio-adc-ti-ads112c14-gpio-v2-2-3231a795fa63@baylibre.com>
 <CAMRc=Mfn7+uQYvLjGLxU9wMOnRwx5pyPgaLp6oNx+ZcFXyXL=A@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAMRc=Mfn7+uQYvLjGLxU9wMOnRwx5pyPgaLp6oNx+ZcFXyXL=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/26 4:00 AM, Bartosz Golaszewski wrote:
> On Sat, 10 Oct 2026 01:25:52 +0200, "David Lechner (TI)"
> <dlechner@baylibre.com> said:
>> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
>> the gpio-controller property is present.
>>

...

>> @@ -2574,6 +2726,12 @@ static int ads112c14_probe(struct i2c_client *client)
>>  	if (ret)
>>  		return ret;
>>
>> +	if (device_property_read_bool(dev, "gpio-controller")) {
> 
> I think the right one to use is device_property_present().

I thought this was the one case where device_property_read_bool() is
actually correct because gpio-controller property is a
/schemas/types.yaml#/definitions/flag.

Otherwise, we should just remove device_property_read_bool() from the tree
because there would never be a reason to use it.

My understanding is we should use device_property_present() for non-boolean
properties when we want to know if it is present or not before reading the
value of it.

> 
>> +		ret = ads112c14_gpio_init(indio_dev);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	return devm_iio_device_register(dev, indio_dev);
>>  }
>>
>>
>> --
>> 2.53.0
>>
>>
> 
> Bart

