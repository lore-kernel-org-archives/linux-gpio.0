Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AAB3F3296
	for <linux-gpio@vger.kernel.org>; Fri,  9 Oct 2026 23:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587646; cv=none; b=W0mXYKKWeIOvVM8YuPG+USt9STnv4ddqI5YLnP43L+RjFM+nuQROPGJItgY4stGwZwmfEpHVgQzgd0l+3+x6ol7Q0RFVINDjbY6j/1vSf5LM+iXesNGGKsK2bUv6NPoF7XC6XzxRIjWMCHirnZwVH6Wzob5FVe0ihk2YsYCMT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587646; c=relaxed/simple;
	bh=3ZSLLTasKr76GEJrzVSyl+Bcz5oJzIQqfkWykCzS+oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddLV9R89eZUkwxUZYLFLXECFz4RU+HysD4mNRzvlEumE7HAt0NVR1PBctWzae2X4QMA5mmuWESsSTxguRCRBp1HvCTJvMFHFXE1gMvvVKmvI9KE/fvUmd5BaLKe4gCSVuTvrqWXpzlIIy78BvoSzNU5hBNNb2kJTgHMQ5WPk97c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KW2B4n4B; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KW2B4n4B"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-499f20c7054so213088fac.0
        for <linux-gpio@vger.kernel.org>; Fri, 09 Oct 2026 16:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791587643; x=1792192443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEvNFYjzpJm+hMocPX+GyMaf5UQXS7PHxcnAyw39Bg4=;
        b=KW2B4n4BDcBYuF1mXpP0ncaOy9a8vjalps7Gm52gK1XwhuSSqRn2K/dHZzTOogsNTW
         8wY9tsSBNKpM4/PyH3nGXJD1uxHWjQbN6VjwgbX8D3CntW+S+u+rdseAz9dV1FEhErHi
         MYgTa0/cBBPIT7FtAmZkoHKJM0LdooJTT/shmanq93u378fXytodA0MIaXkD6zmElZNB
         f6QN7e5HTIk2R3F+sVljUTyYY7O+ac2BB2O/ePpiKPv7QsDyh1IGXB7rVgY7lpJRlv4C
         FtKmvOBhtwhzVzIbjobxi7KnGr5NTOSuELsvJK+6tfzBxT2qzoI9rbVntnW4xtbgEGI7
         N8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587643; x=1792192443;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEvNFYjzpJm+hMocPX+GyMaf5UQXS7PHxcnAyw39Bg4=;
        b=T+DkIctR6vNEPWRlMN7AMavQEZeEn1RxoYAHNnsZIdEaXSig0+84JWEtmqRXxp+NAV
         l2/RgCgQyC3wUKnFQ3wRvWUDgAguAFqFATU2L9ppb6kCtRaoPI5Bw7XcmX4SLYl4d5m2
         kkUQW7+E9OpdHpEYA32oc9z+BqiX+8eRapU99+01XqUzlzEqb1gndTUrwfRx9WglC/Pt
         qa5FD4IWwKqVODINdOaFhvLoqUY6k9ESwE9CJPtBCCVB3sucroLVPh0me8B9j6H19fIw
         TBKRJw3QKGA5sUGQz+jd37NdwFAvN9C5g+9SXTxBITeUUR2slahPSGFxCICLQVbokXoh
         JVXA==
X-Forwarded-Encrypted: i=1; AKwUvBy8GY8BDKgHotLreNkG46JydsbXppg2FoztnFSfjYJ9WW7VcD+FfW8k/ohaw+gBnb8HXiyFS45EiStD@vger.kernel.org
X-Gm-Message-State: AFq9FYJGL0k/0D0IFYuggCnJi45uorxd3bTtYdJLtv6Qc5XfgigWdXGW
	6jf7ArliT+ObWs9kdwkWPHFctS/upXfsOQG4fLiXbrzeUC2i29iYlMFlcHvq6wkpwXw=
X-Gm-Gg: AYBFou08TDLhwPB0f6eeb7ahNKMWRaC9Sg9ln+PReYykjEZJUWILPXP8P9sgtb/CKw5
	yUJF/KL8ypCdj2nNcjYP5APZniKq4/P/2zilfvAQWbfLMGOfHMrq+B6om9SGCiZmG3Z/jJGRoZz
	KPPY2wrWRgswo1HzcAKXzsJlwbztpTBKbViayl3DmUd0jfXEdnTP9enFWcLFJh7LrVFlY6iuJcc
	33fjGCYNk74ItGWflqcntW9AAueFNs6Ungl6thCkmLeqZr/cN/upsIaClR/nGFJ659qFT8G/bo0
	cdnWS84HzwbsX5e+yKXkG8Q+8AHBIxYn6tnJWi/qg0bUb7/+5RVBPmsWOYJS9s9R98iopnzIvPn
	rwBLA7GNhe/De4Pa+1vG+M1cotnKOX479DUf0Yh3ZgWjwRAOBRIatllafllQ6wWVa2Rf7sUemrQ
	6zUYtBTj//8XD6/pKP2bOqbmKpqP1nOYdY21bb9IYv7N4z1mcZUKIUxrfCANfLIK17iKiBaTwFN
	N1HjQtoCCBUhBIoEWo+/RK+IVYtfINS4vdbVUPYL0H/BnwX
X-Received: by 2002:a05:6870:6586:b0:49e:16bf:1f87 with SMTP id 586e51a60fabf-4a2a8a7ad2cmr2643174fac.38.1791587643522;
        Fri, 09 Oct 2026 16:14:03 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:29bd:56f6:5ae7:35d2? ([2600:8803:e7e4:500:29bd:56f6:5ae7:35d2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a2a8592e2dsm2982529fac.13.2026.10.09.16.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 16:14:02 -0700 (PDT)
Message-ID: <7d542de9-0c87-4a1f-9d9a-48af8431cba1@baylibre.com>
Date: Fri, 9 Oct 2026 18:14:00 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ti-ads112c14: add gpio support
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chris Hall <c-hall@ti.com>, Patrick Edwards <pedwards@ti.com>,
 Kurt Borja <kuurtb@gmail.com>
References: <20260925-iio-adc-ti-ads112c14-gpio-v1-1-2a2b218ebf3a@baylibre.com>
 <20260926014620.3b07660f@jic23-hlaptop>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260926014620.3b07660f@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/26 7:46 PM, Jonathan Cameron wrote:
> On Fri, 25 Sep 2026 16:50:47 -0500
> "David Lechner (TI)" <dlechner@baylibre.com> wrote:
> 
>> Add support for using the AIN4/GPIO0 to AIN7/GPIO3 pins as GPIOs when
>> the gpio-controller property is present.
>>


> Even better if we give that helper and the mask shorter names.  resv probably enough for
> reserve for instance.
> 
> 
>> +				ads112c14_reserve_gpio_for_ain(gpio_reserved_mask, pair[1]);
>> +
> 

I tried the shorter name, but didn't like the way it looked (abbreviations
didn't seem immediately clear what they meant to me). It only saved two line
wraps anyway, so I kept reserve(d) spelled out everywhere.

