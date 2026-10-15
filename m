Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAEB3CFF6F
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069368; cv=none; b=biyVEi0UFrjCiLbbmDyWca5pGO8G9UbD2kzKxCfQjb8LCT4yQmnnc9bRDlD9FNZRmffPx1uQF+RewcKK91OlQ3h2dmxoomxwIALRAyz9Iat+WwKWblT9k72KSevB78ABT31YRBmG9ethhU/5FGmp07iOstH8akBb4ZgL7nUj0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069368; c=relaxed/simple;
	bh=sNHkM2NSJVz1FH0SzB8TgpwxSIcu6W92qD2xJF5gKMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8yorY2Cn5ooub0pp+ciJiGvWquw5aJ3+xXynmtvCMaIrY58vdgkZJ9XapGr3Yj5pzHEISWzBUwz/rwQ6Q8aqrnva9h7b9fFX+2ed5CN8hA/rPngZMqJxj7CHGICDObJTz2LNeMbj2loRooH+yck46iI1JmHZTlTikO4k3Nsy90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pvlGVDHB; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pvlGVDHB"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4f58dce2ad9so3842591b6e.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 06:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792069366; x=1792674166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=at9NDBQGEaYtN0ifydUv/WOhJYVf5LHHhPf50pPTXz8=;
        b=pvlGVDHBZX0vieQEbBCSmfO+0tX7LhcWO1Ck/yHebhBhSLj+M1w/MYwdCZYaZTw1dY
         F+L4U+qA7O5uRbSeXSPof15nopieIrkDdSwjLA3NwyiYLPceH0Xwrke72Muue2rfnNnB
         flggkYggYa8tZqFFXL6atV4qYewvDqRCX13mDfFRMdYoWsZA+tXY6J9egHEfnq7zSkvV
         0G3uGCNC3hHZGisB7ApD7ax37NgJJ9oeLZOtVSRhZW2Qn1eG6ZAwsls0O4bT3RC3sOE4
         8dOjaibkNGBUEZ9p4fkegE4aqLzdhuU1nTxP1ZbUiG7F9Bd7eDgkvV1xT1ysJywP/DK4
         qHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069366; x=1792674166;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=at9NDBQGEaYtN0ifydUv/WOhJYVf5LHHhPf50pPTXz8=;
        b=Znf1qjANsFSiNuIsSRZqGMmPrGKeCPOG0/NCCleYx6FDAticJ8fqzcJrByf+qH9jSC
         JXy2IsbhohYptFvN+H5n4XsvRE04KJQRc+9WLlcda0DXZ0NhHITE9RPcI0rQuTOr31If
         nga1VjKzpv2HSP7hpr6ug0nZJ9yH6xg1nrNrnpUuamUV5+z1gyScnvDhwT/gKbuW0/qw
         xDVqDfaqJuLd56fjX/V5W6bGV9Z7roOONePSxvBDvTE6O7liQ5IRL4irFkEQ51eQEKRy
         XnbGwoD1N236H6zeSSDC/azjDhRkO+nOgDAVP/TSgacEpg9MFuAY1zijELxoniQHWmpt
         56ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwp6rbkOLBwf5Z4SUnN922hpagTGahYUPSL24/eZZP8zGLAkFMYfmWXr7X2Hc7VrTVFOteDcrpSeIsh@vger.kernel.org
X-Gm-Message-State: AFq9FYK3cBfk81ZKEPxXMcPkwkIrfy2UOUuAesOKnt2IO0OmcFBqcDLr
	Ki1IuwENsQUqmqk8WOd7YktRj253bjnaGNy1+qiiN6zu55uzWcMliUfnapQ5UcAWaX0=
X-Gm-Gg: AYBFou3RzZ3SPjxAP1jQlyRcnZrwZn51Wv6efmYI/KNiteAVsMeaLFNFDwQb1Dnle5H
	fBIkp6JqybRus24Bqm6ptl+bo2NFx+ekNUGFxxnC6Si/j7Kz6UrurGTI1jSfrDdVenmqKwmyrpp
	wGof8aWfEdinvwQtKLkVkZuCLaFBbsCU32IEsWNt0kKN6rqGLsyAEVdnVeUKZwMCwMVFxfcMoX7
	2qlZ5HVw8OwEZjGOOshb3zRuitDL4y7DOWUbE+ZXtVF4xEptA/fSaeJcMvWGbZXWKgjz+jZ7J0t
	rQQWVze4p0DcCrS/AGwY4eOWQ0SsUp/WMoGihAYXo6qMA7M99A3h7ue9AaUsjgpNEqpdUwqU27l
	y8p+krXTe8lE989afRwnS3HHb8gYuuQ/pUnKFmRgcZ+htr1rXOYnfDzv7b7QprwU+BX+mbf8Ci3
	ZjqsKLjLIy3g8ZgJyRuVmqp5p+EtROn93BIBZCDhQ7x2aQnhv6He/4JEYFogO06+1jhfGKM7rKQ
	j1PDeKr/E6jdOJkesGOcP45Ueg9nRWIKFY4XOKbl6lAvPXK
X-Received: by 2002:a05:6808:15a9:b0:4f1:7cd5:8e0b with SMTP id 5614622812f47-50c4dfb9a1cmr17338045b6e.22.1792069366316;
        Thu, 15 Oct 2026 06:02:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7a64:39ea:e5ac:f974? ([2600:8803:e7e4:500:7a64:39ea:e5ac:f974])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1a325a38sm19891522b6e.12.2026.10.15.06.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:02:44 -0700 (PDT)
Message-ID: <92a8384e-17d1-47e6-bebd-406941f349f1@baylibre.com>
Date: Thu, 15 Oct 2026 08:02:42 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c14: add gpio support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
 <20261009-iio-adc-ti-ads112c14-gpio-v2-2-3231a795fa63@baylibre.com>
 <as47IMM9rtBCAH0-@ashevche-desk.local>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <as47IMM9rtBCAH0-@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 9:07 AM, Andy Shevchenko wrote:
> On Fri, Oct 09, 2026 at 06:25:52PM -0500, David Lechner (TI) wrote:
>> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
>> the gpio-controller property is present.
>>
>> Pins that are already used for something else according to the
>> devicetree are excluded from the valid GPIO mask. This includes analog
>> inputs and excitation current outputs used by channels, REFP/REFN when
>> an external reference is used, the /FAULT and /DRDY interrupts and the
>> external clock input.
> 
> ...
> 
>> +	for (unsigned int i = 0; i < ADS112C14_NUM_GPIO; i++) {
>> +		data->gpio_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s:GPIO%u",
>> +						     dev_name(&indio_dev->dev), i);
>> +		if (!data->gpio_names[i])
>> +			return -ENOMEM;
>> +	}
> 
> I am sorry, I still didn't get what's wrong with the dash (technically
> speaking)? So, this may use devm_kasprintf_strarray().
> 

Nothing technical per say. I just want it to match the datasheet pin name
without the extra character in the middle of it.
