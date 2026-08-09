Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569333AC0D7
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786264170; cv=none; b=IbkjdBO/FQsAEh0WLXOHMZBw9RGQCBFBV+dIXUGgGroiljfRKX5VYZy6AHl1jmCTSy2clQETr9ELpKcGSujLKRcOHKcfnxadcWmZuDYs3RragrYXlT/Gn48Je5KIwQlLdnQaynS5OjLZvCFlbbpJXuf7MqXud2y1rRNUKqZM4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786264170; c=relaxed/simple;
	bh=EBuidInqLSxAdzSs+bLYDtRsXG0JLW7LAHbGM2gja1s=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:Mime-Version:
	 References:In-Reply-To; b=qgYwYoyORtyuAll1XoIW3RnIcV/5TrM+QrlBlqD54FGjgA5DBjF8N6Ot//TrBBWLH9jXXaQXAnK7xY/puQdFQEb3giFmYZMIH9Bf2Bx2yVmRGo47VM5a+FpRE9BVRKdU1Xy+iV6jCC/cl76bMj15uizhWNTIq3MbU30/U77BIf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGX/JI32; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGX/JI32"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c27e38ee18so490076e0c.1
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 01:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786264168; x=1786868968; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2d9hycM5USzc32zfTtkd5yElWmTjF3/U684OFwwThv4=;
        b=mGX/JI32tx5o9SLZcsgEX6nBCQZ2ZVJCaw3hwQOk3d8PrW7Wfj7zsFqNGg6Zs0TpV2
         f3tIdFup3Ows24tBcKqizbkPZ9R6BNonaTyt/V+PJYxTgKWacUPatSlr0bCb3FUlWPjY
         D5oBuhQXFV9mA5JigJttqKrIXbB2LaLG2Kd+FqgL0fU2qKuN8QSojX+9P4nAmH+rg0V3
         hl75q23rjbGIXORMSgnk9KuloZ8E7xEeaAdK5NTih0Ta6DwWu2gHVoUKo3HlAU8vpLBQ
         vrab7JPStAGpyc5QEeGNuz/JLekY52HoZihMxJKavZFvfDnETQwki9Ati8L218VfO7Rr
         Schg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786264168; x=1786868968;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d9hycM5USzc32zfTtkd5yElWmTjF3/U684OFwwThv4=;
        b=kquEzW3xt4ymrLfyZe0iIHtkAMkzcyppUSSC3SDm55yGaL+JKZaNNIMAqr6illQ/gN
         8a8cRfRabEGo9xLMYZaO1y1SC5dxegAiaSvjCrZOOl+NYCeiA1ANExobV2p75E35uCrm
         eLptj9xmWq3BmNGpCGj9cS2d2nl+ihE2umPKQAHM2zIslSyMnebanDgmmiYugLJ3eGik
         Yg2C6fxCrHnJSD7eS6cOfpQek765dD5SDNLm3GrMqIamajyk8gK8TsO6TW2ROkVAYqnO
         ufotiHnCsgO3TuGsyWWdDsqV96W1UsVmPWM4pZdEeY20BOy4kT0Y/58t37mLtLPAv4fn
         CIWA==
X-Forwarded-Encrypted: i=1; AHgh+RoN8+el+J9Jle8b9+oTwyHkA96an+kmKYKuFXIT69MRVHtGJzIqLMgTEvQ51LlYlG3fjmqu8TgizYFY@vger.kernel.org
X-Gm-Message-State: AOJu0YyuA5b3zL4jEXj3D8y42iTY5cTa5vkk4kQ0cCrw9dmKqr0i2aPm
	pd3C2Mya9JqrEb/qlhP/dwT3hMd88q1CmGWupzzTKN8qT/aZ6E7MWxl/
X-Gm-Gg: AR+sD133PwH2rJfoJuAusrJXWNv9FjSFc6sy/rbNaMrT6I1X8hEnxL41J/1NwQmLh0W
	KWDIKbC9XZvSQMRbMS2D2jM5RO567/2A9+V19CZiZSaXGMzo9R0CYCntC34cI5KpqNSvvnT+CcR
	d53l9WAef6EMFTNKDdKRfxg34wzwHOWYPta4YIlR37B1uLm33Mp1UvbjcfjuBPSgD0mQ//B3wqF
	aDpD9fAHMhM+cZHOgqpP57vF6ks5gTIDibY6GXyWdwf37bY3d3NzWC7bDErctJ0P7cWkddoRrM+
	3FtE5Q9j35QIDCX9/1o/arhY0g6Vx5hc9Ge+M40YaREnFsEO45+9wG1U0aHVLAaMuJoD4GET8dN
	BNIhnPEFrV4aCDjf9Qk2uSRWEqroiuoFJNcdFP0GQqMPlG1jxoA0Ua302HK6VjnQX9QM6V8zDVi
	0reSIII5q1YSWVJ0opmUz5rGbNp0G1R4O8Oi0lJh/9LF3oHoJjMqs=
X-Received: by 2002:a05:6122:4884:b0:5c1:31ed:157 with SMTP id 71dfb90a1353d-5c3d9259f67mr5068345e0c.13.1786264168276;
        Sun, 09 Aug 2026 01:29:28 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40ae6a78esm2856941e0c.4.2026.08.09.01.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 01:29:27 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 03:29:20 -0500
Message-Id: <DKK9SR2E6KW6.2BS7C3ZY2MBC1@gmail.com>
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
Subject: Re: [PATCH v3 9/9] iio: adc: ti-ads1262: support common mode
 supplies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-9-f89925d72792@gmail.com>
 <b760633d-a9af-4dc1-be6d-496b7a19e847@baylibre.com>
In-Reply-To: <b760633d-a9af-4dc1-be6d-496b7a19e847@baylibre.com>

On Sat Aug 8, 2026 at 1:40 PM -05, David Lechner wrote:
> On 8/7/26 10:58 PM, Kurt Borja wrote:
>> Enable common mode regulators. The usual configuration is to have our
>> own 'vbias' regulator connected internally as common mode voltage on the
>> AINCOM pin.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/iio/adc/ti-ads1262.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>=20
>> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
>> index 533574169b04..238d803abc50 100644
>> --- a/drivers/iio/adc/ti-ads1262.c
>> +++ b/drivers/iio/adc/ti-ads1262.c
>> @@ -962,6 +962,27 @@ static irqreturn_t ads1262_irq_handler(int irq, voi=
d *dev_id)
>>  	return IRQ_HANDLED;
>>  }
>> =20
>> +static int ads1262_common_mode_setup(struct ads1262 *st)
>> +{
>> +	struct device *dev =3D &st->spi->dev;
>> +	char name[sizeof("aincom")];
>> +	int ret;
>> +
>> +	for (unsigned int i =3D 0; i <=3D ADS1262_INPMUX_AINCOM; i++) {
>> +		if (i < ADS1262_INPMUX_AINCOM)
>> +			scnprintf(name, sizeof(name), "ain%u", i);
>> +		else
>> +			scnprintf(name, sizeof(name), "aincom");
>> +
>> +		ret =3D devm_regulator_get_enable_optional(dev, name);
>
> We need to get the voltage which is then used to provide an offset
> (IIO_CHAN_INFO_OFFSET) for the channel.

Sure! I didn't think it was necessary but I can definitely add it.

--=20
Thanks,
 ~ Kurt
