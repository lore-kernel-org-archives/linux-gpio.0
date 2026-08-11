Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1513BB11A
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483800; cv=none; b=d/qYDhqioMMeu1NfmBv61ikblBc3Wx23DnFwFvpDI7iQoKR23iXCyZgkTyMhJQw8gfhRy2JMDv2Jpoxmkuy2fEcv/tavkReZ34RhSaDRnm4Fj9rpt50awocfHACCslmJOJvxeDJJMlW89LaAN3VUMB2n+JJg2kneb13TO6P6so8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483800; c=relaxed/simple;
	bh=HtViY9Wu7iXmFgYNEtxZ70DL5CR7SJwt2n8TIpoymA4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Pd0pAYbSHaobj1ox+MxXeSqgZgzxZejnhpxTTSLXTd3Oka6eXESMvs9vK5mrge3DRk5ddFlHh6/GbOdvAKfWvwmXdCGwfOUSpL91iEqD7pnk9UhtwRn7Qf1B11KouEHKTaUjpC82NAXLwk/+JnCYZEy86O+CNvfbjADp7TkMey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWCxW0S0; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWCxW0S0"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c3163a88a1so99243e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786483797; x=1787088597; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Z0LPzjSkEFAa4Rs2HSCwHSd8eZwKugfFLQ5+qI5zho=;
        b=KWCxW0S0B5phcBhE5ZazdNXpb3iMFGs1IVNA7IaXS4qN6DHn1i/ibCMiMiof+BB201
         AYccAXkFAFptbLbyH8XaxjU+pV/tEMv2G9LUf42caZO6lt1TtNeh6rCmiFH8cjwPyANj
         UPbkjxO781Kv/FzftDyFyPtDNQGghL47Ou89WubnLOheyQ4Rc3eO2K0QAEs01HCf+mEL
         rYCEWiOQbfQ9ez7itsihuRzBt65N6ssp3r52tig+RjGEVYYuxH1yB5r6cIaOPWj/JZG8
         4z0Jwxkkb2hu4z6E9fzfeRlcXYbubScBxHuACWJrmPUf/vgGyK7yqHibR9LftD04rD3K
         EkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483797; x=1787088597;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Z0LPzjSkEFAa4Rs2HSCwHSd8eZwKugfFLQ5+qI5zho=;
        b=FvBGsUvCCvn7Tu+dQwbc+0hKpA773zfoXQHzY7nCMzc5nXliemqyR6/rLQHWjEUrWF
         toY26GvjUxlNlnxjp42x7JgFGbbP7TvEt3z/9b3DhHbOoeEbQDyzkFUmxlxORJgwzshY
         KjGCERVRvtWBWTSQ1v31Ah1IGFi/WSFW8M/ldlvJzxErQXsRu1P4qG8oP6lqR5TKfLe1
         Jt7y1DJJr/reYy5KTt/FBVrB9HtPnHfC/W3fVxRA4M3d6ArFFZ7DoHQuwHKpLqzSuwaJ
         hthBkJieOU5+1adJiZVFsI3Nxu4zXwokNLq5k7vv4g/st6GvB0QT1zriptZ5bi6j+yPa
         MdXA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0A5cfxyZq1h0exhTkx76gBfQLc7TxgATD3C1A9OKSUG1L4h89JkO+C3Kef527xbtoeYA7EWgr5wmG@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFiaFE8HrDURXOiGt0lXjUIT0D5lu/41aTKi+2nr3B0HeNeou
	SXvTQSNBnhm31tckIE/S+XmSCZBOuf1j1PqIFiXk2Vb3BnZ+IXzFc6ol
X-Gm-Gg: AR+sD10yiqYidf+XeI6mTyioeSvvNr8PzotqQgs813vUMAY3eIDTQD7R2kOugSOSKo7
	UYln/+WVqPjXmykwVkqMJOn9KJbuhZ6SYXQQ61gzLv7c8TcbYYjo1uwFbEvx1H6CClbRERXDfRc
	70ttw1HDNvoO05cIL+6xoNAfcNWHyC8CfavT5lGGRRkW+hJQUiLcLR3LxOJOGEbnqVFjXKE5KLL
	GnpoIIBQA0+PEspU3ruejYzqV6d+VkkRkDTvh1jk1f9HeU5X0L2CtWDz69hPPZXorDrm9A2/fE3
	dSg43WnZOq+3uOXxPRZp6uSw8gwA0pa3pu4tBAkSNmh9zeV13Tqw3dI5W8IkwOIlINWnwQeWgNy
	HaKZZR3DlGV1cY2v3DM826HxvarzOaWZUuEN23KS+mfd3L0isanQasi8dYozD3D3m4kBbbs0fOB
	MPIaNgjskgKaE/QDGweIsIGVAnM64VKFbYx3vMk7w/PLgKUWT9S+9O
X-Received: by 2002:a05:6122:134a:b0:5ab:26f:49e3 with SMTP id 71dfb90a1353d-5c501f4f871mr4423e0c.3.1786483796965;
        Tue, 11 Aug 2026 14:29:56 -0700 (PDT)
Received: from localhost ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c45b74e7ebsm520373e0c.14.2026.08.11.14.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 14:29:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 16:29:53 -0500
Message-Id: <DKMFNGU0U0GN.2D5Q6K2XV8VJ5@gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: support the TI ADS126x
 ADC family
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Bartosz Golaszewski" <brgl@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Jonathan Cameron" <jic23@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-1-f89925d72792@gmail.com>
 <CAMRc=Mf9Z5UMyt9bZP5b86mK0cWnbO=oxoR4iu+0f_YwZ-2CyA@mail.gmail.com>
In-Reply-To: <CAMRc=Mf9Z5UMyt9bZP5b86mK0cWnbO=oxoR4iu+0f_YwZ-2CyA@mail.gmail.com>

On Mon Aug 10, 2026 at 3:46 AM -05, Bartosz Golaszewski wrote:
> On Sat, 8 Aug 2026 05:58:23 +0200, Kurt Borja <kuurtb@gmail.com> said:
>> The ADS1262 and ADS1263 are 32-bit, 38.4-kSPS delta-sigma ADCs with an
>> integrated PGA, internal reference, excitation and burn-out current
>> sources for sensor biasing and diagnostics. The ADS1263 adds a second,
>> 24-bit delta-sigma ADC (ADC2) for background measurements.
>>
>> Each can configure its own voltage reference source, the two excitation
>> current sources (IDAC), plus input and excitation channels rotation for
>> offset and IDAC mismatch cancellation. This lets the device drive and
>> ratiometrically measure RTDs and other resistive sensors.
>>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>
> ...
>
>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +  gpio-controller: true
>> +
>
> Where is the gpio-controller functionality in this series? I don't see th=
e
> driver providing any GPIO chip.
>
> Bart

Hi Bart,

The chip does have GPIO controller capabilities that are not yet
implemented in the driver. I'll go for it after this series. I don't
know why b4's --auto-to-cc is picking up the GPIO list. I'll drop it
until I actually implement the feature.

This chip is compatible with gpio_regmap but it would need (*request)
and (*free) callbacks for it to work properly, as this chip doesn't have
pinctrl. My plan was to extend these callbacks to gpio_regmap_config.
What do you think of this?

--=20
Thanks,
 ~ Kurt
