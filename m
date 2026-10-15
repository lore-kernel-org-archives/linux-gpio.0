Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5B4FECE2
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069209; cv=none; b=SJFOH6ZNDr04OBK5c2sy7pigPdwQUm0YWjpvjKrVG8Y+V+f5hLtSk6NBhvTLHHog2UuPWqZiPVqOkacEwEqfB3eNS+aEopo8+Rv4Y/n+EJd7ZzUC0cg4ocw8XB+AqWxxcCKE852CNddAOMKNiepmpEf9e3oRM9K8ClpandpKASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069209; c=relaxed/simple;
	bh=16EuTssqwYcY7F70h/BUM8kp38l/Q6N8yPmq7gB2Px0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZrlY1r3O1f2nU9UqVf7Z3SOzueeR1q50BAd4WvEON/WDdpEk/fSFKta/2Ygd9olc/NyYVPy05K3N3QyEvhQAjbtkouO0R+dVx8OWfdtk0QeeFyZ1gzPceWbBRPjK6AjtyhbaPSM62Pt+Ra6It2uQ3wA8Y6J+XNe5/PcTUJTA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TvO/4yHX; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TvO/4yHX"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso3846796eaf.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792069206; x=1792674006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bRJz94p2M/MzIGOAR59y6E7XPhv7pLCszJw1BEP/IR8=;
        b=TvO/4yHXA4OYdh5SQcaK6R5Bn9Qi9vl2PjcTbl6wQvPmV/PSRkz7MjIThjaCn7ol9T
         zlj7R82L5SpHI3EdrqgdWeL8CI0gAF/6T6ZGyelr9euzBwuTrg2BIPmVRobgNNB9APiC
         rl8OCnvLpTWblzG7Bk9GP1ABjPPq/Oo1tjigrnQ997aO4wSwNWHI+SKiTeg5t8DlN5hD
         uNQQmHVkpmPATcZ9dpe5LB+1p2OgNaP4XOS5E3rFGNjdQt/R7PLX3k6EBDVRb9NQYKzm
         RL8E4u84xry9F1drlBGRrqIMuaFyx96myNbz2Eitosb/hA9mkK0L/5+6Cb37J3aIfwEY
         QK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069206; x=1792674006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRJz94p2M/MzIGOAR59y6E7XPhv7pLCszJw1BEP/IR8=;
        b=KRoUD4zSpiZyd5lMqclJsRnuTUv/CK+1+gDFbOBTiANIpCyDsIilyuU+vLZHIsvGAL
         acKXL2pJHtCNyjRIkeaZ9dogvoZIypCq+iDTL5fhPT5MMonqoNafMJL8gQjv0Kk/7H7k
         8WRzN7kE+8ATOkQSdiUi45BLcOF1eqNwUg0mo6KolIKvbJ9EMT51NEuEqwpIT8Nqb2cA
         tVokMv+4Few0rOEYUvngZ+VQJb5zpMlYxJhFBcSu6geNrw1gFxDSPemnc9i2TOwFiEZn
         BD0yz8VLDrHBs+0/7lVoGz3kqa2bKb+4j+UAiv2m/7CrTvxXnMolqEie1NnJfwd455sm
         2g4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwdIi8Iz8yPG2hAlLFYmVk80BEybVirD92tcfKQCQj6zXyC465yOpJB4Zje0SpbDjkXUlqzaVtEsdml@vger.kernel.org
X-Gm-Message-State: AFq9FYKg+Youan/I01PwSOzfAoM90B8IBkJDG9FGXaSArlX4eztgL2Lt
	hXkQyhjI7Y2Y5GOMDN3juOetNS+zqumhmg6ceOh4cQU5JOgb6/m4hgUVX/u3lbvDAko=
X-Gm-Gg: AYBFou39bEYrAQpK9//HpdLrPd6v/j1HfbxDUjOlmovT+1yJaCxr0pprch20BXDL8qA
	qLXSkAj5YpEivseNBMccXmjJNyJODuh4RYl8MIVBqcqhf5GzEYhwmis1hSjbhoncw5L1xfpxjPg
	rrpd7t74noXkiNzMOaZtRF39Tw7beJ8+Qe3ZGSS08CyQTCQK4HTZ89FoIQxC9U+ZVYwFHhKDFf3
	WX85sbWhzTVD38er/XSrFuGAwlj5SjfDTlFb/1zXa4povd6VHrZpo4RmlM3WUKJLJ8Avh2/re8q
	l5zlvZ9UH3phF+efQ4vDvAghFJoiFeZwoVAZ28oHQKU8o+SSlNcq5OEOeCQR6ZxNPaGCPZG26h/
	ErH8OhwR5qpUL7E6KPkd/ucUTUVrSMvq1MePHt1e6gMeMD51e1jSUVWB1KWa+Z0BQnrbNUgaLyI
	1PEkpzeQu0kMyJ2s9LA2tRy4xro3BdbpUCzKKlA+4CLvEpuUgq8ZwsJRxIPBl9jDHjgI72hWlpu
	ZYKgsMIeIr/HxdD9YtgmL/m/zbrV0woFG3rAmL8LTNsZ6A=
X-Received: by 2002:a05:6820:1791:b0:6dc:5ccd:a0bd with SMTP id 006d021491bc7-6ef0dcff9dcmr15609717eaf.33.1792069206163;
        Thu, 15 Oct 2026 06:00:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7a64:39ea:e5ac:f974? ([2600:8803:e7e4:500:7a64:39ea:e5ac:f974])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6f4a1303572sm10651029eaf.12.2026.10.15.06.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:00:05 -0700 (PDT)
Message-ID: <f8b97c1c-7dae-4eea-9d64-c2c81ab4ef49@baylibre.com>
Date: Thu, 15 Oct 2026 08:00:04 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ti-ads112c14: add gpio support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>,
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>
References: <20260925-iio-adc-ti-ads112c14-gpio-v1-1-2a2b218ebf3a@baylibre.com>
 <arom9T0azKX9jV5m@ashevche-desk.local>
 <f4ddbc02-1fdd-4205-b511-fb39329fa5f3@baylibre.com>
 <as46JtMAij8yqcVQ@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <as46JtMAij8yqcVQ@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 9:03 AM, Andy Shevchenko wrote:
> On Fri, Oct 09, 2026 at 06:04:21PM -0500, David Lechner wrote:
>> On 9/28/26 3:36 AM, Andy Shevchenko wrote:
>>> On Fri, Sep 25, 2026 at 04:50:47PM -0500, David Lechner (TI) wrote:
> 
> ...
> 
>>>> +static int ads112c14_gpio_init(struct iio_dev *indio_dev)
>>>> +{
>>>> +	struct ads112c14_data *data = iio_priv(indio_dev);
>>>> +	struct device *dev = indio_dev->dev.parent;
>>>> +
>>>> +	for (unsigned int i = 0; i < ADS112C14_NUM_GPIO; i++) {
>>>> +		data->gpio_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s:GPIO%u",
>>>> +						     dev_name(&indio_dev->dev), i);
>>>> +		if (!data->gpio_names[i])
>>>> +			return -ENOMEM;
>>>
>>> Wondering if you can utilise devm_kasprintf_strarray().
>>>
>> That uses "%s-%zu" internally, so would add a "-" where I don't want it.
> 
> What's the problem with a dash?
> 

I want to match the datasheet pin name.
