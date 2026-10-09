Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4C26738D
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 23:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587068; cv=none; b=XO7rmFCxkJ09HlbVbZaufjnoDdznx72x3I6VXe3NcM9cWOZPiN8OSKdf8HeqscZlSzHB/CFRVG2OVeOkkOry6Z6n8N+OY4M7w9usiaj8DaDgPn9qmFXN5ZjyVGvqX4G16C5NjaM3RRF0Lh+nBRgz2ggXSqodU/mmmRFML7ztTjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587068; c=relaxed/simple;
	bh=A1bnVPrO1LobryWZt/XSqr54LwFNVj9TQ6RlEKGXcHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A45AJmA9D7q0I6XD+KOXdwVA6NMSjP6+AUpbvqrS9zK8zvEA/kYw/oBuVQArG7jGVpobcT3BMnqWxPEmwOZQKZTfkbah9KGvpMLdBNdXIPOCFkdB4cUyudqxIhMtVlFu+Ur6YI6OGCsy49gNcgxwmipVAe9M5QA9sxZFCFAzMKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FiIFvUXu; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FiIFvUXu"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-499f20c7054so209506fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791587065; x=1792191865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XrFhk/iW0YvLVnmZlrjKuBDyhEpQEu44sD2YgKjqq4=;
        b=FiIFvUXuUYuNT9wRiU6KHmKsErg4aP+r8uqGMD+hf/B7LKij/Geritg3YjohkvDyN/
         E9V64qmhGyr0+GCjfdEtRvQEI/M3t/Xg2mRldp2JJ7KKWPN/Z0seYWcfD3r57cDKMDMV
         YNOVxWOrg+TFmXXEpbL4dI6a21skHNl+nGfAZT0+4eEIS+gjsyobHoM3T9jEDDRlpBYi
         dgQXe0VKCuDTvF1HxMZ9P8hK5b2FPnvn9gNIKQb8zTL608NqsVXtF3FMLe1y7F5VvzB8
         yvScKfGfGk6T6rWB1yBR4wJmLwxvVksmVEFFIOzp2lmLw0FA4irB1cT0e5UTJsgm5pfD
         wj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587065; x=1792191865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XrFhk/iW0YvLVnmZlrjKuBDyhEpQEu44sD2YgKjqq4=;
        b=ZAvLyXYfxKaBuqKov/sDw4VdP4nXvD8lMIvAS9XISzyu74h6Clsz37Qj1y4Q4jJI1n
         bxiStwJN+zLJoOhNNkTDkqii/cxZJnEFuJyNrtHAxdRUm/xUKjHOjJMDTuAiq8h28HQk
         mPYfilk2pvKya2jA8zsWxfe1mh7gbiaSUKHjLJqjqYsm+fCwbK3Dw6Dnj+wy/uRHYEfh
         0pnARyYiisyCqPuNFLcGO59N0zOQ2xkeqLe13crO/NrB+edoTcTthLoTxmgEKiAEOOgM
         iQoOO+gBD0PEZIyVTiCpZlCLRvdrXebSQKx076vtXY967Ir7qFYaD9SrTWGRu8rufL8p
         olgQ==
X-Forwarded-Encrypted: i=1; AKwUvBznYG838WZAv0IgY53QLf7vyzs/ljzq7NsKZ5hvrBHLybbMe7SeK3FoXs57zm9JrU8B92AOhh/Gnynf@vger.kernel.org
X-Gm-Message-State: AFuF++kETa2gHXYNEd/8+dKgqMBJ91jpDbFOPNKDqxMPabjo8C4yHy6a
	TZPHWjHQl9483kV1Duf+mXRWW4LnMIKDTXXeuY7FS2Z+1XQiHsY1EGXgibmDBxWWW7A=
X-Gm-Gg: AYBFou2/11/l+/N31FD+wgb4odPXAWl7RliFD2K5/9nq76/hEo197D6QVCn8mrFxyPu
	2JrMTLlnNqL3OEixEfc2Z8Li2ta/szr54/CKNw2z2c+h9Oh9WKQCtc7G1NCSF+FAbQv2OsSz+28
	9PBbWkkE+kQheL0aLrlNFm0U7aMvCJyweFZkCB1717KvY+i/y+8zRI422trqH3Ce468WPSsbNwT
	S/CKXEqM1cX8+rBqmlwopnS/gPPA6Nfocmr36a0LMq41ls3tCTJ5MjJWJJ4ZSzKPUwnNzCWnOYr
	iaB0s/F2/twp4QE+DuvRGut3yKcW/6reAXK3BSQ9D3+2t0DYQ/vP8qd9/u83OgM0ot5Bpzlq+lT
	7FM0Uj4t80JuZoj2RWCMQJMoR+yHXfVAaXd5Y3cdDD0mBYjnwiNybdr/KW4lXGDxlZY4ANbjRv5
	vHbgUoCvwuNn6LFtbf0x0pMHILDPftt1/4s5Ro4wMLSOlwpc5zugOjxzFAA3d82HiwkwePQt4lM
	L+Vehub6Dpkr+TFUCxz73h6pia3CcK4dRXy1s00rMmxJ/Mp
X-Received: by 2002:a05:6808:1183:b0:4f7:d324:bc36 with SMTP id 5614622812f47-50c574a3113mr2833212b6e.43.1791587064925;
        Fri, 09 Oct 2026 16:04:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:29bd:56f6:5ae7:35d2? ([2600:8803:e7e4:500:29bd:56f6:5ae7:35d2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1815e5aasm3402365b6e.8.2026.10.09.16.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 16:04:23 -0700 (PDT)
Message-ID: <f4ddbc02-1fdd-4205-b511-fb39329fa5f3@baylibre.com>
Date: Fri, 9 Oct 2026 18:04:21 -0500
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
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <arom9T0azKX9jV5m@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 3:36 AM, Andy Shevchenko wrote:
> On Fri, Sep 25, 2026 at 04:50:47PM -0500, David Lechner (TI) wrote:
>> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
>> the gpio-controller property is present.
>>
>> Pins that are already used for something else according to the
>> devicetree are excluded from the valid GPIO mask. This includes analog
>> inputs and excitation current outputs used by channels, REFP/REFN when
>> an external reference is used, the /FAULT and /DRDY interrupts and the
>> external clock input.
>>
>> The per-pin register field macros are replaced with parameterized ones
>> so that they can be used with the GPIO offset.
> 
> ...
> 
>> +	DECLARE_BITMAP(gpio_reserved_mask, ADS112C14_NUM_GPIO);
> 
> Why not use valid_mask in GPIO chip directly?

Because gc.valid_mask doesn't exist until gpiochip_add_data(). So we would
need to track other things longer or read the firmware properties twice. I
went with Jonathan's suggestion to do it where the pins are parsed instead.


>> +static int ads112c14_gpio_init(struct iio_dev *indio_dev)
>> +{
>> +	struct ads112c14_data *data = iio_priv(indio_dev);
>> +	struct device *dev = indio_dev->dev.parent;
>> +
>> +	for (unsigned int i = 0; i < ADS112C14_NUM_GPIO; i++) {
>> +		data->gpio_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s:GPIO%u",
>> +						     dev_name(&indio_dev->dev), i);
>> +		if (!data->gpio_names[i])
>> +			return -ENOMEM;
> 
> Wondering if you can utilise devm_kasprintf_strarray().
> 
That uses "%s-%zu" internally, so would add a "-" where I don't want it.
