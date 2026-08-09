Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE63AAF56
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786264050; cv=none; b=dt/+mN2Ux4aAYs17dOf4lf29Gy3QmBZNIcRw8ewipzfnjfp1R/GwfVvv3yDJCQCTJj81EpIdOCo3zgvtTeDz2S01nMR7C30rFDdN6yHqPsUNmcNFHbEJmChjZ3CA1U6IcB2CMaqk7CXBns4UxvNkJBKGR2g37dxZ4ItUtx0ZldI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786264050; c=relaxed/simple;
	bh=e3/UIPNP7gbjC9nV94BA6p8px1oacssjGqeAyE4CWBo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=rJeck5QF/791cdbUq+9y5X14MtBs1MRptK+cFNNrZBGn4YWevfTlDIDzhuvuxtLoWKDwoaxUWHHzdFk0rJt2FNplW1XX6cBxuUpRhpK9qiRuRkpwO0QAqYk4NrIJ+r50snqCBtfO9Jk2M/ihtJOwVtN9XVSq+xoeqelRj/Fr96g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnXXJPJK; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnXXJPJK"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so908995e0c.0
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 01:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786264046; x=1786868846; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yZylItRT990VNAVCf8aOnmfkHepq1DiwSn9nE0fJj70=;
        b=YnXXJPJK0tPU41UJgRV9b3X1S5PjbmAfP56ewMlHP6jr/JBWXVG+57udhZZBZfHKjw
         3HC0sMm4j9U1wva1+lX4OO3qZLEv+dX/hAkKjcte/gd4yGFInL9rk+MC+op2EbYGeG16
         /dus1L2gKoaGhRwmMYjD0pcCiDxqO6RrD9BZ+opOzrtL8SiCjGQdytGHmVEHeChmu0QT
         RrjArxo9LQC9suFK0tyEFIgAcX7Pz7+wNezW0rZaE/R8EteQOngKVVgBUHPKgfdPaFe/
         geIqpopAVoVp+KGskmIAu+0yQpAJkmb+xjkl0lpF9qyHEqCPgcAqbZMfVK2tlU/jfdv3
         zKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786264046; x=1786868846;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yZylItRT990VNAVCf8aOnmfkHepq1DiwSn9nE0fJj70=;
        b=qaV+xZm/XJX/pm2/L6QA6appE4Mu+euwpJOWPuMbYTRTp6hLTUCEOEm+hIiQYkgxhK
         ucZubu92fXN81UDpJct/bGWUE1uVqVIidYoLcg7+pXlXireFeD1vHGBlyIk2CJWC4FaC
         C53VvmS5DOv7/4TF1J/t54g/MMrEXIpPVOwF3k6DfZ8hICI7gbqHWxXdydcBzbSzzcTL
         1vNlRndduoPwH3WjPGKGd9X+tmYVWp/ejMBOeHv+k/+ThFpMvyxNxModFUI2LGZgfdw1
         wIzYWLrR9f6wVy7EvPndyhmuSfJ+Jp9ycqE/AqQS/75Q3kUnkhJgl9Ze7eWWy6kJp9Mm
         m1lg==
X-Forwarded-Encrypted: i=1; AHgh+RrWM4egPGDEoAyepki6m3fevPCQxAmat6tnjlktw8NlyPJHHZ51qS1zOFlj5SEvEb3W+EKMwg6SCFND@vger.kernel.org
X-Gm-Message-State: AOJu0YxqRH7ZRvi2BpjM63GHzjym/Sxai7Zw+67nJDCqg1V5XJxFDRIZ
	Xa/luCOjmDfkOKggWqSw7e7f+7Y672hFFyc2eVVGCto2wQgpNNTH2jVT
X-Gm-Gg: AR+sD11sBCbWdWhpdvQfm8bIr0OTMqmMU/spTdNd4+nZa8CvTzfuP0J+uWUaYzsDKIO
	nAgtekiZpawkACLsFO6G+kizC92/mf2W6BNsS25N6Vc2eQQDVejEMDGYdKCxEwwYSkMY+7fxrGT
	VnLknNpcKvYFx9acIRkd0lDHWR9r8DzcaZ0D4j49xpqWHmy/KdC5JfXD8qBP4tV4LPyaEJ8WeWR
	n0/xyoCKA6GF/n5UNh694sPEPx9ROH8hwDqTbFO49QuB0zZydwpCxSDCKKleDuvL0x5AVBKyUVC
	IH5YprGk0BXMZZDUHMYSAqP1/RBDXMd6ru49cBIpow21KOCmUNe3VYb9kwvR5KfT6Zk4DhKAIio
	NmWsPqSM1sMMIIGMsN+bURHDQK3ywS363rOljoel37K+Xv9Y/kYLa9YhEEFwstVIwY43uzI6fVC
	WPwg5Q+WrJiIYFeqc04Emrf9wd6iFWCBqoLI1MChAABpIppZ8e6uo=
X-Received: by 2002:a05:6122:5102:b0:5c4:1e3:5eb2 with SMTP id 71dfb90a1353d-5c41543034emr902542e0c.10.1786264046317;
        Sun, 09 Aug 2026 01:27:26 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1db997sm2753075e0c.13.2026.08.09.01.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 01:27:25 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 03:27:23 -0500
Message-Id: <DKK9R9BGWNUT.314LHBLU3R8LO@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 3/9] iio: adc: ti-ads1262: support per-channel
 sampling frequency
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-3-f89925d72792@gmail.com>
 <6f403c9b-e6b4-4144-b78b-844d0cc02b1d@baylibre.com>
In-Reply-To: <6f403c9b-e6b4-4144-b78b-844d0cc02b1d@baylibre.com>

On Sat Aug 8, 2026 at 1:39 PM -05, David Lechner wrote:
> On 8/7/26 10:58 PM, Kurt Borja wrote:
>> Add per-channel sampling frequency support. The "available" attribute is
>> assigned per-channel too, in order to eventually support per-filter
>> availability.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/iio/adc/ti-ads1262.c | 159 ++++++++++++++++++++++++++++++++++++=
++++++-
>>  1 file changed, 158 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
>> index d78e5e3ae13e..b3b7b1249102 100644
>> --- a/drivers/iio/adc/ti-ads1262.c
>> +++ b/drivers/iio/adc/ti-ads1262.c

[...]

>> @@ -148,6 +149,7 @@ enum {
>>  	ADS1262_DR_14400_SPS,
>>  	ADS1262_DR_19200_SPS,
>>  	ADS1262_DR_38400_SPS,
>> +	ADS1262_DR_COUNT,
>>  };
>> =20
>
> /* FIR filter has limited data rate range. */
> #define ADS1262_DR_COUNT_FIR_FILTER (ADS1262_DR_20_SPS + 1)
>
> So we can properly restrict the rate when the FIR filter
> is selected.

There's also a hole in between. The 16.6 SPS data rate doesn't support
the FIR filter. Maybe I'll need one array specifically for the FIR
filter.

[...]

>> +static void ads1262_populate_samp_freqs(struct ads1262 *st,
>> +					struct ads1262_channel *chan)
>> +{
>> +	int freq_Hz, freq_rem;
>
> Shouldn't these be u64 and u32?

I would have to cast them to int either way. Also I think it shouldn't
be a problem within the recommended clock rate.

[...]

--=20
Thanks,
 ~ Kurt
