Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4D528427
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069282; cv=none; b=PpWITnRdao94CeDBWJmF9fvadOAGTBIlHcV1LEx7pmmlSuIR9i68US/mD0iBicsiVitlLL54z4rx+VXqiklwXuBLJmIJ2k2waU0bt8zS977/ixjW1YagR2KAPl/BVMPkOyNuc1dz7S84U/g1cb6eQiLO6Q22+4m6cH4+wB/flZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069282; c=relaxed/simple;
	bh=M00L0DQuv05+wzHwVamvXqjP2sz1GvUfTGsI+8cDoWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzLe4JBxGs4hvWMDL8GvLBQDJDSEeQdX2RU38gke3kbIvFvNgB9AJyMMBlj9lYU0SOCE7U4DKBEXt5MX1S4WtZ55DlCs0Y6XGyk1kXyzTvT4zHBEzC2RgF5z+gHBh2ED7S1/tPqeP5dvlPEH6TIzJHWeZg7FBPb3aFFX+w2noLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MDe+XW3s; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MDe+XW3s"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f84a55cc06so3322807a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792069279; x=1792674079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjFxj3bFbYPisDR6RrznzneRHAUvWft2WkzURGoz+vk=;
        b=MDe+XW3sZGIKUEnYlfRZINRq8F9iFr7onbzNEHeWmvCuwXJaqwkGKfQ9gFok5rB8Id
         IaJAjtROcVBzCDsrrDR69dw49e3I5biC8O2qfPa3WkToEm+M3D3LvUFNbnGyedARiCtk
         cNZtA9RnUSfGGYHtfOcSZRqahDFL6o4H7lgUWZUr2DDzs0IzALO1ecLg7sWiv+lRCKvf
         5XjUjwtQq5pw5W7ZOKOapISX4hwDWYsyK8+tAfyvkAEoBSgrY5CncfdpHFa5L0owkHYQ
         TUTamUfG19ipMTGB++x8MWjdt8HWuPUcUIAQCQobn7hdzkM+MnCt+QPNSuXhetr+IvwI
         oUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069279; x=1792674079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjFxj3bFbYPisDR6RrznzneRHAUvWft2WkzURGoz+vk=;
        b=WiSMEwqNz5D/4nYukuiBVqsndZA4dMGObzB/qw5oy8eQlp0a5pWJR6izU4KIyvbwDd
         JZYvyz4F4Xl9CGNI1zCjO9L5wDIwkCSihyiLOGQudGj3j4QaWESkWZYoy+W7hIqnSO/Z
         3INfv50oc1K9O7yqy4denGcElDINwVmxviaGfbcTyXYSpLZxOqhXLeyTiTr0cKHc2qZG
         /ZwWhInIq9wCQrNJPM2zbV7uwU87Zu/fB+TjNqcm/egPi1K+bdzs7M/ur+TtpUxNPTDZ
         nNtflqGcOl0wCorZWAn8t0af6lLq7lYYirXVMHabu+IqOsoP2bOHk6s+8E2uU95Emgqk
         W/WA==
X-Forwarded-Encrypted: i=1; AKwUvBxZMFXZCytkiKBiWJDVybykVsJ1oYaFfAbnlId13vjXPMw4bw4Gv7Vyfyz9lk2ynA8BUmTzcZnxW4qM@vger.kernel.org
X-Gm-Message-State: AFq9FYLe1WQsUKDdQBKAlaWhn3tVypUTu5+O3+jjkR0mPh86Izjzoeu4
	CnRymEO6eivac7nzS4lLT8wpHGfjaqL6xA7DInLpJEfeIewueY+QxGqntjxcUUVEnP4=
X-Gm-Gg: AYBFou1uykpJBBau/uSF2txL9NXGqdy+muxIhNpUb0xahPwFjIIFtHxNqSy2X2gsjIv
	FLNbW16gadVsI8767c+jj39ZIVK8T6nkH063/q2IDGc2Wz4n6LWFFTitjsUNU5zcOAV+O+ttFa5
	qYxohTTgTL2wJHIItDWj78J6FsZJm7Qlc+VnJkA7FpyfBoi6o3+yY4rvbbHKEqU/aj8IbeJsuQ4
	B/sYiZz21h9D1ONtxWEplltArSgLyNkFriznnc63UPlELeag8S68qtJtkzHUKumNv+UVCjLCvR9
	miFx40Xhp0eIXkT4WEMBL2JHAmayEUg5myx9AkGt6biuxEgM0gzjBfD3t2Sc8SdRn3oQl3h6BOg
	ay6fiODV69w5U+RUMDnIPPuvmRPmTagVp6hmM/i/R+//dyaggUfgR+qGHMZWX8hrCG/wHI4T9WE
	cMHJ1WdNneTxQWMEplqMFSVMxRDUxvrzJtWOUl2wDbFZJxC8zTWEXYKdLeyLCY4dD2Tj+XQwCkL
	xOtNj34urqWGXx9pWij8Otm5x9nuGlMtVv3SCQDmv1U/IS5w7zYVorHzAY=
X-Received: by 2002:a05:6808:1387:b0:4f6:6041:f0a2 with SMTP id 5614622812f47-50c5482ee7amr19056488b6e.27.1792069279336;
        Thu, 15 Oct 2026 06:01:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:7a64:39ea:e5ac:f974? ([2600:8803:e7e4:500:7a64:39ea:e5ac:f974])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1674ddf8sm18952180b6e.4.2026.10.15.06.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:01:16 -0700 (PDT)
Message-ID: <ca27a15c-5b21-4381-a82f-e80bb0ae488a@baylibre.com>
Date: Thu, 15 Oct 2026 08:01:14 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c14: add gpio support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>,
 Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>
References: <20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com>
 <20261009-iio-adc-ti-ads112c14-gpio-v2-2-3231a795fa63@baylibre.com>
 <CAMRc=Mfn7+uQYvLjGLxU9wMOnRwx5pyPgaLp6oNx+ZcFXyXL=A@mail.gmail.com>
 <cde9d00a-bfe4-4093-b03d-f76a122e4ded@baylibre.com>
 <as46xFp-3fXvWPlm@ashevche-desk.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <as46xFp-3fXvWPlm@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 9:05 AM, Andy Shevchenko wrote:
> On Sat, Oct 10, 2026 at 08:46:30AM -0500, David Lechner wrote:
>> On 10/10/26 4:00 AM, Bartosz Golaszewski wrote:
>>> On Sat, 10 Oct 2026 01:25:52 +0200, "David Lechner (TI)"
>>> <dlechner@baylibre.com> said:
> 
> ...
> 
>>>> +	if (device_property_read_bool(dev, "gpio-controller")) {
>>>
>>> I think the right one to use is device_property_present().
>>
>> I thought this was the one case where device_property_read_bool() is
>> actually correct because gpio-controller property is a
>> /schemas/types.yaml#/definitions/flag.
>>
>> Otherwise, we should just remove device_property_read_bool() from the tree
>> because there would never be a reason to use it.
>>
>> My understanding is we should use device_property_present() for non-boolean
>> properties when we want to know if it is present or not before reading the
>> value of it.
> 
> That's not true. The _property_present() checks any type of property, while
> _property_read_bool() returns an actual value of the flag, while they might
> overlap in the behaviour, they are semantically completely different.
> 

That is exactly what I said.
