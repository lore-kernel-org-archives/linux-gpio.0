Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B173B3115BC
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480133; cv=none; b=pH7kew7O426rDINfCSbZ89aky2+fAD5EPsaKY1yopi1pAo23Tij45J3nhQ9zWgAgqyzgN75kuNI0ihCdcNSRyc0E4QxRIPUJV/p/jmf7oJe1sS7YnBYXKWANXK/mmQap6mYC34koAS++DUoOmXm6rWi2QBb4CnvigkKvLQLRevk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480133; c=relaxed/simple;
	bh=lI2QGJvbe3CjRmuPMTU8qeofdrk0TWrINJP2FGbyrLw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=WlMoyNqe0sYA0mC5naOURwD5NV0CbgQM+S6V1kM7tAzOWbgkA2j8m4ReXFH7W+ki5Dp5JS25G8KNE9GQNkN7fXuLV0lxAnkBUN+cA3GLYOm8XGuUnwvbr4dEQcO13GnUca5CG1x/lYYzkhRvmYX6Urt/zOHiR3dcfDUAldRW554=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxx6G3L8; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxx6G3L8"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so45127241.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 13:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786480130; x=1787084930; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TMimpYcHZOGUhj+cUm9F57rlFMmPijLi6RHPAwT1cVs=;
        b=mxx6G3L8jbZOTpMoLcQEuiD6D/TxC7AWlFnsVjWgeIYXQlmyPkm0+Wze8E4e14y+U5
         ISUhpbjN4CTtLiM/FA3rC0GkdKcPtZnGoGeHn1z1kBDiZWeif9pwWqtoZFIDpoZWa9kb
         Qgrq1F2rU9IvMZvYhjxpLA7eB46X0Zy79uq/g1ESpKkG/OUWt0M66IPsw4zYc/dO4vdz
         zL6NZPEXcRGHxRUf2+dCIO2kuI3TxIGdzgy1jqTZsSJWerATYf5sZiEqR5GjqLARkhHB
         mRdtyAmYbmDFP1hfcSctDCLyL8FUKMK4FQgSCOdvzXSbO0hBN1vQoRT+h3zXZFcAPyof
         radA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786480130; x=1787084930;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMimpYcHZOGUhj+cUm9F57rlFMmPijLi6RHPAwT1cVs=;
        b=miwxcZHNTnAizIq47hUjDgdRoA4BHbIAXO+2aFz3vTIHLjCbj0oGcBxEFmWOHxxIdp
         QtmlU2Ms9RtIR8cA9bE6Rr/0d8HwnW1R15YlYKITj4Sm8dDTgNJEWmF3LSXIL4jkaW0w
         ZBz6qcAGiTNQmOqPwy9Y5MfGR2HISdjODHgdRu0tu6Wq8zqTCFabroFvsOl1ArKLv1Vd
         VgeY70/dGwHqBmnX9sung73C7bFC+8OhUhDywA0xQdgeBaSJgIHojkdFTpDtiM0gdhdS
         DMiX8du0DCr4e938Yw4mCz2vK794VFktWnwWzrt/QQI9RZIVmKeR48uQdw7pc4yGZHlz
         UFEA==
X-Forwarded-Encrypted: i=1; AHgh+RrWxNPIK/XUNbwO1goRlWi/TcMy9I+QqNlTWfSwewNNS+FyYNp9xJ15AU0GvfzsOSNrRXpZyNIdjFF7@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwi+Pa81EfuLi915rJFEhA3XPajpG5fAkwWuqBFCQ8c1oqYsM
	L0Xw05b5Eliz2Y27N3nQMegXao1SrCOn3xjV8e6kfiRBUJ4BAzf32exw
X-Gm-Gg: AR+sD12daro/AOpstGE8TV5T5UboYy/pC0GFrpeM1MEU93qqU+4bCT1TuV72+MtPtip
	+D/7XB9SA6uiUjgkBzlYlCc+f3PgNhC5/kmHLS87d6clOAP1BMH1RBRNpB/m3qGAvqzSiI6uzaa
	PtpsNYeN+2qmwrGa7Msz+SknofKfVBy7uQ4xo1/iiv47Fq01dCRqLVmCc2R+JcZu7vWG2vYM1B4
	ubdJyZUUJYIQi8quvfun4GQF/iuBUPLKGxms74C/uqfN+Zyon/zEO6/v+B+lv1zcbfoGF0f1wfY
	sYiV3nPSs0Oh7NFaBchLfyuHBqsgeZVj6FRxVxdeeALypW+2YNujM5fx9d94GakpmUoNWYMWpfG
	liG8m6jJ3ebmtYugidFjqTASdQpGTEjyaW36FwAR9hf+lOQqq1+fzQoT+vCbNTEMic97IeqED8U
	9TN5PZYdqguRTYVw0StuRhPiqZDJgOgkooj0tiwQrXymi+lqf7ofK+
X-Received: by 2002:a05:6102:4426:b0:726:8813:2085 with SMTP id ada2fe7eead31-76c0c4ec337mr934146137.13.1786480130595;
        Tue, 11 Aug 2026 13:28:50 -0700 (PDT)
Received: from localhost ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c16f5bbsm593975241.5.2026.08.11.13.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 13:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 15:28:47 -0500
Message-Id: <DKMECOTJYOZE.3AEGK7RWPH7FW@gmail.com>
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com>
 <ad95afb4-e667-4290-8878-fdd7067f20fe@baylibre.com>
 <DKK9QWYHOBOT.2VD8XMZTE65H4@gmail.com>
 <7a42a318-780d-4bd0-baf1-55d030b39233@baylibre.com>
In-Reply-To: <7a42a318-780d-4bd0-baf1-55d030b39233@baylibre.com>

On Mon Aug 10, 2026 at 11:42 AM -05, David Lechner wrote:
> On 8/9/26 3:26 AM, Kurt Borja wrote:
>> On Sat Aug 8, 2026 at 1:39 PM -05, David Lechner wrote:
>>> On 8/7/26 10:58 PM, Kurt Borja wrote:
>>>> Add the ti-ads1262 driver with initial support for the primary ADC
>>>> (ADC1). The ADS1263 auxiliary ADC (ADC2) is handled by a separate driv=
er
>>>> and interoperability considerations were taken into account.
>>>
>
> ...
>
>>>> +static int ads1262_dev_reset(struct ads1262 *st)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	if (st->reset_gpiod) {
>>>> +		ret =3D gpiod_set_value_cansleep(st->reset_gpiod, 1);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		/*
>>>> +		 * The RESET pulse timing requirement is 4 clock cycles, at the
>>>> +		 * minimum clock rate this is 4 microseconds.
>>>> +		 */
>>>> +		fsleep(4);
>>>
>>> How long do we have to hold reset before the chip powers down?
>>=20
>> For power down 65536 clk cycles. Less than that is simple reset.
>
> How long is 65536 clk cycles in microseconds at the fasted clock rate?
> Hopefully won't accidentally shut down the chip here even if fsleep()
> goes significantly longer than requested.

That would be 8192 microseconds. Do you think there is a risk we end up
turning off the device?

>
>>=20
>> [...]
>>=20
>>>> +static int ads1262_wait_for_conversion(struct ads1262 *st)
>>>> +{
>>>> +	u64 max_lat_ms;
>>>> +	long ret;
>>>> +
>>>> +	/*
>>>> +	 * The first conversion latency is affected by the channel's data ra=
te,
>>>> +	 * filter, the configurable conversion delay and whether chop mode
>>>> +	 * and/or IDAC rotation mode are enabled.
>>>> +	 *
>>>> +	 * The worst possible latency is calculated by taking the lowest dat=
a
>>>> +	 * rate (2.5 SPS) and the sinc4 filter. This gives a latency of 1600=
 ms
>>>> +	 * (Table 9-13). Then we scale it by the actual clock rate and multi=
ply
>>>> +	 * by 4 to account for chop and IDAC rotation modes (Equation 20).
>>>> +	 */
>>>> +	max_lat_ms =3D 4 * div_u64(mul_u32_u32(1600, 7372800), st->clk_rate)=
;
>>>
>>> These are constant values, so don't need mul_u32_u32(). Also, given the=
 wide
>>> range of possible sampling rates, I would include the current sampling =
rate
>>> in the calculation. No need to wate 1.6 seconds for something that shou=
ld
>>> take a few 10s of microseconds.
>>=20
>> Can we leave it like this until I implement the settlingtime? That way I
>> can calculate the actual first conversion latency.
>>=20
> Sure. Just maybe mention it below the --- in the comment message on the
> next revision to remind us.

Sure!

--=20
Thanks,
 ~ Kurt
