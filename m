Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B773A9615
	for <linux-gpio@vger.kernel.org>; Sun,  9 Aug 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786264145; cv=none; b=XZU6ov1/puyIWgrfTIFOJDdB4dM7/BkEGR7TziKeG15pSUDmRbmyfL5ij9IruG/up6xHfM8HSG1PFeIDfsugH2C4cU6yirIWTSY0RVQdKo/R9TKIOLYWfKlrHFT/P+p/btEsIQjU5p93La594LaJS+ibX8z/BwMx+0nDcm28iM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786264145; c=relaxed/simple;
	bh=DjBhbqW14d9nmpPCYYk6v+xFyikmQDSHMu3Aajds3Lg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 References:In-Reply-To; b=Mtu522CDhfpWcvs2r/1yt5Cz0Zn8OnkfMGWJRIZTm7+2RsH2pDEvoMAx5uPb5duY0ITExMW+Oe2sRlk55LCk73t4dQ8qUYchq9UThA0Nwyzk97PFmXcNL6RQ8Kuk4fzqNkZtyUA9Y6J5H7aEclDZueaWycWM+Nzj4lWAHyf0gzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzovIO6f; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzovIO6f"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso548775e0c.0
        for <linux-gpio@vger.kernel.org>; Sun, 09 Aug 2026 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786264143; x=1786868943; darn=vger.kernel.org;
        h=in-reply-to:references:mime-version:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rqHnH3bazfPo8L9yN8K7qxpi9gCCvgA/6bCTLUUeJSw=;
        b=FzovIO6fwwTaNTJKTj37e3TwV5BuW0iQUg6l0854Vs5HEsKCCWWWf+M0KB0Wmi3xcG
         CQTAuxwWYxDdqx6urzDylQ5vQjti48MHkE1D2bWIjSjuJW80uHKjYTsvcSv6Jjm9AY1q
         nNCCBFwTPfBUjaVr4fbduGGy/zUVo9PH58K1kefbxDvUS+oH3Tc+uoAH8WbS4Gpu0MqD
         8QK/HxvOmP7WsdxDprU0bUy2q2kF4w6KjI6o2IbhvpI5jLXPcuurapSBWfWW3MihFkAi
         uzffmWwO/o+eJGfQIJUWZx93nrpROhJo6P6tOjpUrRqqYxgWmEVG5t5TwNR6v/CGXAe5
         LqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786264143; x=1786868943;
        h=in-reply-to:references:mime-version:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rqHnH3bazfPo8L9yN8K7qxpi9gCCvgA/6bCTLUUeJSw=;
        b=aJRYiJSPxq9QIR0ggfveWE2dL0xIldsjCJKaTRnyoWB9DxdpyCUvyRNjCg0M/scAei
         PJuwr6P41/d2vtMoO2auAdk+cF6+enE8HMEx1sURzFFxbO7Xha5J4rqzYkVjmf6GRUKg
         yyRRDO5eJbQM09gF5R21HzFlD5x7HXDDQwAItdDIzwAEOi8qcOkb51/BIlLxN2WRXHql
         UozE+10L7/x0iEAWXcmALfy2id3acs0ko6OVBFPQnfX1Jgrn8Rt7WZw9oCqSkSdqRgQu
         v/6EPwzEJNulMXGz7lz6f30RGdtSyxk2Zpfv38a7pAczEoCUKNeRGeizfup4SsF3CVj5
         GIew==
X-Forwarded-Encrypted: i=1; AHgh+RpVqTul80OP/+0us8BoCSoYURsImnbOeMiLr+aIAMbipi98M0XDvXQYCv4NiBd2oopMdxGpNBZeG0O7@vger.kernel.org
X-Gm-Message-State: AOJu0YxmUcexaDWM9RMiKXcqn9VQDXya5+PpVmHz9c4qH5am696lmSB9
	RNqM++7jRSF/qcemR4fECtNCim+Hpyhzb0thp6FXYtuK1gub21LFtG0C
X-Gm-Gg: AR+sD12+mulr2zRy50W9HIAM7jqOl6/yoML9HLyq3HdtsK1YI5d+VW6DCUAruLKIhdT
	Rj2z+gdF/Y9pIWG033vjDaSOVfsOZ00il5U8Iv985qE6gmxWtGd+D/fBHQw3bV2fCp3KgAp2++o
	u0ucpgXpTE8bSs4WyC9PXwll2ygUvCpMEyDH5q+o+rhPgPEuUlLDN4Z7CWkV28o7IraAEdJlBM0
	ZE529mo+QlreHYeArwBmbrBUCxsue3zjvd+IpmriSpbiPnD801vr5UOUVJmLuDOKs5fZNqMQy7e
	w2ceoGjg0BWFndgqqKcr2X7/AQu2NizNBXDC0cta4S24Nt6xScVEuUUPhnCfwpn0bjg/2rgwYi2
	EB1I+bb+w/+t9IJhgwZCUEFzimdNEuBxp6bY1/uCQ11srGuvW3ntMzG3OMwfHHF3t08z0JrCzvV
	FTLNp99xzf7pG0wCC/4d8CQz5KIaSJlcSHzDof5kG1mrU45NL2oUbapF6o7LKJwMY=
X-Received: by 2002:a05:6122:ca2:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5c411331e5amr1700380e0c.4.1786264142723;
        Sun, 09 Aug 2026 01:29:02 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c4130b358csm2114122e0c.14.2026.08.09.01.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 01:29:02 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 03:28:55 -0500
Message-Id: <DKK9SFCQK0Y8.3Q7SZMMPRYE9Q@gmail.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 8/9] iio: adc: ti-ads1262: support REFOUT and VBIAS
 regulators
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-8-f89925d72792@gmail.com>
 <9f0779e5-3139-4c49-96b7-330f70b523a9@baylibre.com>
In-Reply-To: <9f0779e5-3139-4c49-96b7-330f70b523a9@baylibre.com>

On Sat Aug 8, 2026 at 1:40 PM -05, David Lechner wrote:
> On 8/7/26 10:58 PM, Kurt Borja wrote:
>> Register the "refout" and "vbias" regulators to be able to use them as
>> common mode supplies.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/iio/adc/Kconfig      |  1 +
>>  drivers/iio/adc/ti-ads1262.c | 90 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 91 insertions(+)

[...]

>> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
>> index 24a7ecb9fbd4..533574169b04 100644
>> --- a/drivers/iio/adc/ti-ads1262.c
>> +++ b/drivers/iio/adc/ti-ads1262.c

[...]

>> +static const struct regulator_ops ads1262_vbias_regulator_ops =3D {
>> +	.enable =3D ads1262_regulator_enable,
>> +	.disable =3D ads1262_regulator_disable,
>> +	.is_enabled =3D ads1262_regulator_is_enabled,
>
> This should also have a get_voltage() op that returns
> (VAVDD + VAVSS) / 2. Otherwise it won't be usable as a
> common mode voltage.

I'll add this.

>
>> +};
>> +
>> +static const struct regulator_ops ads1262_refout_regulator_ops =3D { };
>> +
>> +static const struct regulator_desc ads1262_vbias_regulator_desc =3D {
>> +	.name =3D "vbias",
>> +	.of_match =3D "vbias",
>> +	.regulators_node =3D "regulators",
>> +	.supply_name =3D "avdd",
>
> What does supply_name do? Make "avdd-supply" the parent supply?

I haven't looked at the code, but it seems like it (sysfs verfies it).
I'll check how is supply_name handled before the next version.

--=20
Thanks,
 ~ Kurt
