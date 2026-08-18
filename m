Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E0F41F7D8
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041652; cv=none; b=h505MOdZ1+bf1Zx/0m+Blw675ST9UpJxyehqa5jY8BAVu9Um6gyI+0Fs3xanacYyM33IUEjJXf7pbyKo172wbfc75ZV6ChdF4OSBsF6Ibs80pmopgYN2NVpEUPgcs6h0//EN0cZvrze92ptNwWDMs2YvorGtT5Ht/rJ2o57YsB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041652; c=relaxed/simple;
	bh=JDzjZcLP71KCvagkMKD84MYXhOgKomjguCW9GMyB0bI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pw7XyV1cluhPVDCbJL5JDbXb8uFiDQLvJXoWkuh6VHpG1tMq93yFCik5a0MQjAB2fV4hANi4Iqwx/d7lcEPgYg1VPcyBTZ3Blj114OCxVfCoY6EfixL7BlcUlwHx6vydpWulPdP4iU7N70V8DIEh6ogHwJQJafkQ7o2YqnjILJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjz7IUyF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjz7IUyF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so4363923f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 01:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787041649; x=1787646449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuK5mDxMiFBjBjKQm/Fiu5kzFGUEM5srIwSUyEqNmyc=;
        b=rjz7IUyFe10YkUwvNbaJibLuM/n/edgAhlGlK7mAklD2GLJyMyksM0Rl8ZatP4sJCM
         fbOXoj1hyejD7L+u9KX9607IO5foOZ4+1/rGIuv9pDmNG7dL0XvYBgBFsq1AGJ3DE+VA
         e3i+Cc3EybrdP4wcrbb1ck1h998kyNxCyPtUn97XIhXiDDUM3CuoI7wCennaDu2IveTU
         KBbf5025J+uU8aRH8EiWLlJB1mMdODlwwVxcGA0lLChDGdxhblYbfOYBKJ1Xhg2iLS8Y
         6cw+kfgSRKMumnbm6BkxOJG+YtSKJzE9IuXwABB6syRr9cPIPsozu/9ii3aphEa7QRtu
         17aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041649; x=1787646449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuK5mDxMiFBjBjKQm/Fiu5kzFGUEM5srIwSUyEqNmyc=;
        b=AWbMusBPRIdhwSdvwmtbnKUIXQSgGdMOjuFF2ajR4EQ5nfcLokxdEquAFimt34x93d
         HB53u+HohPsLkWPPEmD8Eac5o2lUzBmkRqhfScZI1G3S5tinItpiDtt063LIaFzpYz0T
         rsEtlpeGU6PqdcBrlsCR/YmNQIHqy3BleoyNaJyTWwW5SZCooaWOgVumEF5OqW8dD1dT
         8PYLorlsn0QjLPtZQrdyLsuaxwmAXBEAYAHaJ4XzL5EGehfn/8WqyxqS7V9RT1/Vlz+v
         GbKV8l8uN5mda8vLp7saYEPzdqKzOtMFZWTW/dJlTrB38RJyPTDmxLgyweGsJj8DuCqP
         fQxg==
X-Forwarded-Encrypted: i=1; AHgh+RqLGxKicZT2N0mrGW2o/EngYx7braqSzheYy+A2+wWttD9M9+HmNav8enz3d1phbzi0BU5AQgyh53wP@vger.kernel.org
X-Gm-Message-State: AOJu0YzvuX2Mk3wzMemTZv1f9/wdki9EXB42K5EmEvnPKhigfHcImYJ+
	+9wyMUD/w7W17YJ1OtG0RFT7XWVAtXZWPkmSvIjvi1MoT+upu/Iv9X+rE/K+1fCG
X-Gm-Gg: AR+sD13RRZaqB3iaW/o+tNGXs/lip6ItsJ9o9nXu+f0V+1TkKKUynJQ/3yJsEOVu6k7
	riSf7DTei9M8fuuyuWTNHw6Ldk+G/KTnAp4RjbfxZEMHwO+yqQdj1i2LVj0ubgNWvyKFgRmo4IN
	jQI6Ln7pyioTCqw8drYd+CrsTrikg8/pcZTCo/KY99NJezuGQaE1a9fKbHyFTmvR6EAlqbEa3VS
	BzdzqoNPm5+zo7bq2XfbDgYXK6kiWqiz5iTmWs9tJ3mFkGlxE96kAj4eP+A0scuJjlk0DG/0gPO
	0XoguwPvJkRWBQTfaSlpEQBvTjqDPYPjEMd1wibXY9SbGY/rlT6ze45i6DCCnjCSVf7uHOjjdjm
	uVi++SGxgqzF0SylyDpUdhw4kpbKN+/smaCbcJcojGu0bpvoPwCUXpCA6PSHGHrsTyCIGAu/5bH
	IBE1FF+IGItjIug50NL/iXU/dnnJ7Q8CIuZ7Yz7zASUg0PNy85hz8+yDL3nJ75A3W9orWcwXuDq
	KiKM5XHT/M94JW7Nc4pJmZnpDT2PXFA01lfx5uwHTb6/6bJ6GeWxANcZDCUrR96otI=
X-Received: by 2002:a5d:5e85:0:b0:47f:91eb:342 with SMTP id ffacd0b85a97d-4816071addfmr48543973f8f.13.1787041648823;
        Tue, 18 Aug 2026 01:27:28 -0700 (PDT)
Received: from [172.24.138.145] (ipservice-092-208-247-184.092.208.pools.vodafone-ip.de. [92.208.247.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b51asm10172929f8f.11.2026.08.18.01.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 01:27:28 -0700 (PDT)
Message-ID: <6f2b715e-f62b-4b6e-9605-23d6978b6cbb@gmail.com>
Date: Tue, 18 Aug 2026 10:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] dt-bindings: iio: adc: Add AD7768
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
 linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20260813-ad7768-driver-v3-0-cb554399ad26@analog.com>
 <20260813-ad7768-driver-v3-1-cb554399ad26@analog.com>
 <20260816192409.145df670@jic23-huawei>
Content-Language: en-US
From: Janani Sunil <jananisunil.dev@gmail.com>
In-Reply-To: <20260816192409.145df670@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/16/26 20:24, Jonathan Cameron wrote:
> On Thu, 13 Aug 2026 15:56:54 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>> Devicetree Bindings for AD7768-4 (4 channel) and AD7768 (8 channel)
>> simultaneous sampling ADCs.
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
>>   .../devicetree/bindings/iio/adc/adi,ad7768.yaml    | 338 +++++++++++++++++++++
>>   MAINTAINERS                                        |   7 +
>>   2 files changed, 345 insertions(+)
>>
...
>> +  adi,data-lines-number:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 4, 8]
>> +    description:
>> +      Number of DOUTx lines used for the high-speed data output interface
>> +      (distinct from the SPI control interface). AD7768 supports 1, 2, or 8
>> +      lines; AD7768-4 supports 1 or 4 lines. Defaults to the maximum number
>> +      of lines for the selected variant if omitted.
> The default statement is a bit hidden and I'm not sure useful as it's not
> an obvious default.  Maybe drop that and make this a required property?

This property was required in v1. It was changed to optional in v2 following a suggestion to use the highest number of data lines as the default.

